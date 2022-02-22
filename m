Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AE94C02C8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 21:05:03 +0100 (CET)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbPC-0005rj-Ck
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 15:05:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1W-0007kG-QV
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1T-00080U-1a
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645558824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdr3m8vr2BowwNpdRup2QQhW01aM6PKIluZz9ta1GnY=;
 b=Auj7jKJLvPBSJ8O0dt9zBas1i9DbnAqyNMM3e2aVkIMtVoBgmuwhUocUXcJihd269Dcrm7
 o4wPqukWSnIBdQwiwlKoA/udpAnovXv2GIQEEaktIYSMXOsoHdIxPjnUiqwevNWndUyXjc
 qse0gb4Mn1OcQkyRphz4vgBHP8U7SfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-UFYesi1FMoev9DScqGBfQA-1; Tue, 22 Feb 2022 14:40:19 -0500
X-MC-Unique: UFYesi1FMoev9DScqGBfQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6416D835DE2;
 Tue, 22 Feb 2022 19:40:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34FD145D6F;
 Tue, 22 Feb 2022 19:40:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] meson: fix generic location of vss headers
Date: Tue, 22 Feb 2022 23:40:01 +0400
Message-Id: <20220222194008.610377-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220222194008.610377-1-marcandre.lureau@redhat.com>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is a left-over, despite requesting the change before the merge.

Fixes: commit 8821a389 ("configure, meson: replace VSS SDK checks and options with --enable-vss-sdk")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4d7..b871098dbba0 100644
--- a/meson.build
+++ b/meson.build
@@ -1936,7 +1936,7 @@ have_vss = false
 if targetos == 'windows' and link_language == 'cpp'
   have_vss = cxx.compiles('''
     #define __MIDL_user_allocate_free_DEFINED__
-    #include <inc/win2003/vss.h>
+    #include <vss.h>
     int main(void) { return VSS_CTX_BACKUP; }''')
 endif
 
-- 
2.35.1.273.ge6ebfd0e8cbb


