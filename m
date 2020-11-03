Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C132A48E4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:04:09 +0100 (CET)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZxqy-0000cg-Ez
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kZxet-0000jY-Hb
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:51:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:42034)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <brogers@suse.com>) id 1kZxen-0003fr-ES
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:51:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1604415089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8arb3cf/Rk9/Fx71ix7s0yNzqG/33vBTfGwQ1KHZtG0=;
 b=GIHxt8B5YU2+iE/ePRHwiqYWvH9nBISP7vdJRzAu3XtWitHJ1mG6WMdYZ75w0M6OaHQh8B
 pX/YB3+UG572v1Ud7cMIVY4b+/NorLZ+inBEHlFo3VEKPZuThCgfihDfexxjlLqq1AVjfK
 6moU97Eb8xLv+olh2DLTl3nfw/IwOI4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87E19AC92;
 Tue,  3 Nov 2020 14:51:29 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: fix gio_libs reference
Date: Tue,  3 Nov 2020 07:51:21 -0700
Message-Id: <20201103145121.668865-1-brogers@suse.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 23:02:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Bruce Rogers <brogers@suse.com>,
 philmd@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gio library detection code no longer works, due to a missing $ in
front of the gio_libs reference. Make the string be $gio_libs.

Fixes: 76346b6264a ("configure: Test that gio libs from pkg-config
work")

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 2c3c69f118..bc06aa81e5 100755
--- a/configure
+++ b/configure
@@ -3499,7 +3499,7 @@ if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
     # with pkg-config --static --libs data for gio-2.0 that is missing
     # -lblkid and will give a link error.
     write_c_skeleton
-    if compile_prog "" "gio_libs" ; then
+    if compile_prog "" "$gio_libs" ; then
         gio=yes
     else
         gio=no
-- 
2.29.0


