Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E401D670DC3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:38:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHvW4-0008JZ-DG; Tue, 17 Jan 2023 18:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vapier@gentoo.org>) id 1pHvW1-0008JC-QO
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:37:17 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <vapier@gentoo.org>) id 1pHvW0-0005KP-8J
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:37:17 -0500
Received: by smtp.gentoo.org (Postfix, from userid 559)
 id 1A646340D79; Tue, 17 Jan 2023 23:37:14 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: do not quote $PKG_CONFIG
Date: Tue, 17 Jan 2023 18:37:11 -0500
Message-Id: <20230117233711.17566-1-vapier@gentoo.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=140.211.166.183; envelope-from=vapier@gentoo.org;
 helo=smtp.gentoo.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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

We should not quote the PKG_CONFIG setting as this deviates from the
canonical upstream behavior that gets integrated with all other build
systems, and deviates from how we treat all other toolchain variables
that we get from the environment.

Ultimately, the point is that it breaks passing custom flags directly
to pkg-config via the env var where this normally works elsewhere,
and it used to work in the past.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 9e407ce2e3a9..b5a19d1319a5 100755
--- a/configure
+++ b/configure
@@ -369,7 +369,7 @@ windres="${WINDRES-${cross_prefix}windres}"
 windmc="${WINDMC-${cross_prefix}windmc}"
 pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
 query_pkg_config() {
-    "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
+    ${pkg_config_exe} ${QEMU_PKG_CONFIG_FLAGS} "$@"
 }
 pkg_config=query_pkg_config
 sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
@@ -1430,7 +1430,7 @@ fi
 ##########################################
 # pkg-config probe
 
-if ! has "$pkg_config_exe"; then
+if ! has $pkg_config_exe; then
   error_exit "pkg-config binary '$pkg_config_exe' not found"
 fi
 
-- 
2.39.0


