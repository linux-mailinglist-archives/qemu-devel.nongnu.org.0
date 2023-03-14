Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17FE6B9B5F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:27:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7TM-0004y1-PG; Tue, 14 Mar 2023 12:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc7TJ-0004wr-VI
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc7TI-0007PS-4U
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678811155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urFW4nSraIsPDPq4iZZOOIlcOzIvdO91+DoMI1iB4bE=;
 b=QIESFnnKJ/6hyxFmw726Vp8KiPqYsft5WVUIDpiUNyEC99nf0cOk3TdUnMTIbcNaPhY/h/
 yI+ztAU1qZkI7msSdkoiVRcI2x7HFMzk68wwiqPE4c3PM4XTyPdLSBZz1a0/zVg9qVW3ZI
 RImSjUK5MeuAzZTp+5Fv5AzpLu9wRkQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-7fVx76jEPnCwVRnutSII5Q-1; Tue, 14 Mar 2023 12:25:52 -0400
X-MC-Unique: 7fVx76jEPnCwVRnutSII5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C48CC803D50;
 Tue, 14 Mar 2023 16:25:50 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A36824042AC2;
 Tue, 14 Mar 2023 16:25:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 3/3] io/channel-tls: plug memory leakage on GSource
Date: Tue, 14 Mar 2023 16:25:40 +0000
Message-Id: <20230314162540.385954-4-berrange@redhat.com>
In-Reply-To: <20230314162540.385954-1-berrange@redhat.com>
References: <20230314162540.385954-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

This leakage can be seen through test-io-channel-tls:

$ ../configure --target-list=aarch64-softmmu --enable-sanitizers
$ make ./tests/unit/test-io-channel-tls
$ ./tests/unit/test-io-channel-tls

Indirect leak of 104 byte(s) in 1 object(s) allocated from:
    #0 0x7f81d1725808 in __interceptor_malloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:144
    #1 0x7f81d135ae98 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57e98)
    #2 0x55616c5d4c1b in object_new_with_propv ../qom/object.c:795
    #3 0x55616c5d4a83 in object_new_with_props ../qom/object.c:768
    #4 0x55616c5c5415 in test_tls_creds_create ../tests/unit/test-io-channel-tls.c:70
    #5 0x55616c5c5a6b in test_io_channel_tls ../tests/unit/test-io-channel-tls.c:158
    #6 0x7f81d137d58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)

Indirect leak of 32 byte(s) in 1 object(s) allocated from:
    #0 0x7f81d1725a06 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:153
    #1 0x7f81d1472a20 in gnutls_dh_params_init (/lib/x86_64-linux-gnu/libgnutls.so.30+0x46a20)
    #2 0x55616c6485ff in qcrypto_tls_creds_x509_load ../crypto/tlscredsx509.c:634
    #3 0x55616c648ba2 in qcrypto_tls_creds_x509_complete ../crypto/tlscredsx509.c:694
    #4 0x55616c5e1fea in user_creatable_complete ../qom/object_interfaces.c:28
    #5 0x55616c5d4c8c in object_new_with_propv ../qom/object.c:807
    #6 0x55616c5d4a83 in object_new_with_props ../qom/object.c:768
    #7 0x55616c5c5415 in test_tls_creds_create ../tests/unit/test-io-channel-tls.c:70
    #8 0x55616c5c5a6b in test_io_channel_tls ../tests/unit/test-io-channel-tls.c:158
    #9 0x7f81d137d58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)

...

SUMMARY: AddressSanitizer: 49143 byte(s) leaked in 184 allocation(s).

The docs for `g_source_add_child_source(source, child_source)` says
"source will hold a reference on child_source while child_source is
attached to it." Therefore, we should unreference the child source at
`qio_channel_tls_read_watch()` after attaching it to `source`. With this
change, ./tests/unit/test-io-channel-tls shows no leakages.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-tls.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io/channel-tls.c b/io/channel-tls.c
index 8052945ba0..5a7a3d48d6 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -446,6 +446,7 @@ qio_channel_tls_read_watch(QIOChannelTLS *tioc, GSource *source)
     object_ref(OBJECT(tioc));
 
     g_source_add_child_source(source, child);
+    g_source_unref(child);
 }
 
 static GSource *qio_channel_tls_create_watch(QIOChannel *ioc,
-- 
2.39.2


