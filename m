Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931EF2516E8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 12:53:38 +0200 (CEST)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAWa9-0003cF-Jm
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 06:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWZH-0002mr-Cn
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 06:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWZF-0000z9-Qm
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 06:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598352761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p3YqKvyaiSRHGj+SmYkoSjOJVT4VM/33GQvflFqSsPU=;
 b=XlWs3GxpzR6/F3YuUlevT3owh/GweZgOaM1iA+3wtpEBpjuNra2GfPd4Z8VPkz0mp8Phr+
 GUH4Y7v0TpcWW994Wn7eXELSJyu9Fh2LgdZxPPOlGEhyotBtKfyLu7DfnIfJsDi0cYY1us
 BRrnJzypg1ehAP2Qm4WzPKfKlTDPc3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-0c_pH-DNNZu-s7on6jEYDw-1; Tue, 25 Aug 2020 06:52:39 -0400
X-MC-Unique: 0c_pH-DNNZu-s7on6jEYDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B71801AE6;
 Tue, 25 Aug 2020 10:52:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 099446198D;
 Tue, 25 Aug 2020 10:52:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] tests: fix a memory in test_socket_unix_abstract_good
Date: Tue, 25 Aug 2020 11:52:34 +0100
Message-Id: <20200825105234.634767-2-berrange@redhat.com>
In-Reply-To: <20200825105234.634767-1-berrange@redhat.com>
References: <20200825105234.634767-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 06:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Qiang <liq3ea@163.com>

After build qemu with '-fsanitize=address' extra-cflags,
'make check' show following leak:

=================================================================
==44580==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 2500 byte(s) in 1 object(s) allocated from:
    #0 0x7f1b5a8b8d28 in __interceptor_calloc (/usr/lib/x86_64-linux-gnu/libasan.so.4+0xded28)
    #1 0x7f1b5a514b10 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x51b10)
    #2 0xd79ea4e4c0ad31c3  (<unknown module>)

SUMMARY: AddressSanitizer: 2500 byte(s) leaked in 1 allocation(s).

Call 'g_rand_free' in the end of function to avoid this.

Fixes: 4d3a329af59("tests/util-sockets: add abstract unix socket cases")
Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by:  xiaoqiang zhao <zxq_yx_007@163.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/test-util-sockets.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index 261dc48c03..af9f5c0c70 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -313,6 +313,7 @@ static void test_socket_unix_abstract_good(void)
     g_thread_join(serv);
 
     g_free(abstract_sock_name);
+    g_rand_free(r);
 }
 #endif
 
-- 
2.26.2


