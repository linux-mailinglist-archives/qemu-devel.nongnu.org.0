Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3E5251C0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:01:44 +0200 (CEST)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBG3-0007d9-GD
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1npB41-0005vB-Jy
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1npB3z-00064m-LO
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652370554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5zusl2S8U9GnPIkP9h9D91Un9S6l5mP6CTP5siRzORk=;
 b=SL+0H4aE7/Z22DQQMXGFyl3GX7kD/Yh98usFgVk4LT8c5wVAqvtsZsoGu4CL1adIqHs2m5
 oJkoAcv5kUAgjsyjgdgCmbij1nX1iizQp2m9T9I+OkUMdrArNBtBgO+XN7Nl5ZXNKyfthc
 vo0mV0WcBIdYZaFxtl3tJclDUz6EzkA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-3qrqG8pYPrekbPLtjjZFbg-1; Thu, 12 May 2022 11:49:13 -0400
X-MC-Unique: 3qrqG8pYPrekbPLtjjZFbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8CC685A5BC;
 Thu, 12 May 2022 15:49:12 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACD19112131E;
 Thu, 12 May 2022 15:49:11 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH] qga-vss: Use a proper function for free memory
Date: Thu, 12 May 2022 18:49:09 +0300
Message-Id: <20220512154909.331481-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

volume_name_wchar is allocated by 'void* operator new [](long long unsigned int)

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/vss-win32/requester.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index 4513324dd2..b371affeab 100644
--- a/qga/vss-win32/requester.cpp
+++ b/qga/vss-win32/requester.cpp
@@ -354,12 +354,12 @@ void requester_freeze(int *num_vols, void *mountpoints, ErrorSet *errset)
             if (FAILED(hr)) {
                 err_set(errset, hr, "failed to add %S to snapshot set",
                         volume_name_wchar);
-                delete volume_name_wchar;
+                delete[] volume_name_wchar;
                 goto out;
             }
             num_mount_points++;
 
-            delete volume_name_wchar;
+            delete[] volume_name_wchar;
         }
 
         if (num_mount_points == 0) {
-- 
2.25.1


