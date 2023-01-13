Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C714669E48
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:37:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMoo-0006nA-54; Fri, 13 Jan 2023 11:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMom-0006gz-64
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMok-0005n2-Jv
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673626929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWtr3IkFkZPanTUxj9VN9+uXxoW9kIuEKYwCuuJuEQI=;
 b=HsSNOo5RivpyT5ZhbjddVy/BY7SVTlfLrPt6lK10b2fsd23WJLdpHiJi+OGkqmkPH+ypjS
 SjucIb8EhlBTrQ+jevJgaUXyiJ9JjBX3oQ6kq9GCOrRKJtuleJIOQM1kyAMwFAY1Xy2XrJ
 cjNlEFt/deWlsGGf0Z8r/zJEfAAg5A8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-xcD7qVLjPzC4fMH2km8Zaw-1; Fri, 13 Jan 2023 11:22:05 -0500
X-MC-Unique: xcD7qVLjPzC4fMH2km8Zaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE05E3C0D872;
 Fri, 13 Jan 2023 16:22:04 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59E5240C200A;
 Fri, 13 Jan 2023 16:22:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 7/9] ui/vnc: don't accept VNC_ENCODING_AUDIO without audiodev
Date: Fri, 13 Jan 2023 11:21:58 -0500
Message-Id: <20230113162200.3010804-8-berrange@redhat.com>
In-Reply-To: <20230113162200.3010804-1-berrange@redhat.com>
References: <20230113162200.3010804-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

If we have no audio state configured, then we don't want to
advertize the VNC_ENCODING_AUDIO feature. If a client attempts
to use it despite being disabled, we should also reject it.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/about/deprecated.rst       |  6 ------
 docs/about/removed-features.rst |  6 ++++++
 ui/vnc.c                        | 10 +++++++++-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index f8b4e19a4c..09269f55e6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -37,12 +37,6 @@ Creating sound card devices without ``audiodev=`` property (since 4.2)
 When not using the deprecated legacy audio config, each sound card
 should specify an ``audiodev=`` property.
 
-Supporting audio transfer over vnc without ``audiodev=`` property (since 4.2)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-When using vnc, you should specify an ``audiodev=`` property if you
-intend to allow clients to request audio transfer through the VNC protocol.
-
 Short-form boolean options (since 6.0)
 ''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c918cabd1a..8a8e0faff0 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -422,6 +422,12 @@ the value is hexadecimal.  That is, '0x20M' should be written either as
 ``tty`` and ``parport`` used to be aliases for ``serial`` and ``parallel``
 respectively. The actual backend names should be used instead.
 
+Supporting audio transfer over vnc without ``audiodev=`` property (removed in 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+When using vnc, you should specify an ``audiodev=`` property if you
+intend to allow clients to request audio transfer through the VNC protocol.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/ui/vnc.c b/ui/vnc.c
index d9eacad759..6b3cbf365e 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2199,7 +2199,9 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             send_ext_key_event_ack(vs);
             break;
         case VNC_ENCODING_AUDIO:
-            send_ext_audio_ack(vs);
+            if (vs->vd->audio_state != NULL) {
+                send_ext_audio_ack(vs);
+            }
             break;
         case VNC_ENCODING_WMVi:
             vs->features |= VNC_FEATURE_WMVI_MASK;
@@ -2506,6 +2508,12 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
                           read_u32(data, 4), read_u32(data, 8));
             break;
         case VNC_MSG_CLIENT_QEMU_AUDIO:
+            if (vs->vd->audio_state == NULL) {
+                error_report("vnc: QEMU audio client message while disabled");
+                vnc_client_error(vs);
+                break;
+            }
+
             if (len == 2)
                 return 4;
 
-- 
2.38.1


