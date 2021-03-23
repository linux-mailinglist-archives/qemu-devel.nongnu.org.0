Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD384346167
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:24:21 +0100 (CET)
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhxE-0003uj-W9
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <silvano.cirujano-cuesta@siemens.com>)
 id 1lOgKR-0001MK-6m; Tue, 23 Mar 2021 08:40:11 -0400
Received: from gecko.sbs.de ([194.138.37.40]:38520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <silvano.cirujano-cuesta@siemens.com>)
 id 1lOgKO-0004Qc-9u; Tue, 23 Mar 2021 08:40:10 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NCe26d007304
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 13:40:03 +0100
Received: from md1sf36c.ad001.siemens.net ([167.87.44.205])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12NCYvuc019365;
 Tue, 23 Mar 2021 13:34:57 +0100
From: Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] scripts: fix generation update-binfmts templates
Date: Tue, 23 Mar 2021 13:34:57 +0100
Message-Id: <20210323123457.23747-1-silvano.cirujano-cuesta@siemens.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=194.138.37.40;
 envelope-from=silvano.cirujano-cuesta@siemens.com; helo=gecko.sbs.de
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 23 Mar 2021 10:23:20 -0400
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes the update-binfmts templates being used in the script
scripts/qemu-binfmt-conf.sh when the option --debian is used.

Fixed issues are:
- Typo in flag 'credentials' (previously 'credential').
- Missing flags 'preserve' and 'fix_binary'.

Reference: https://manpages.debian.org/buster/binfmt-support/update-binfmts.8.en.html#FORMAT_FILES

Signed-off-by: Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>
---
 scripts/qemu-binfmt-conf.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 573b5dc6ac..7de996d536 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -294,7 +294,9 @@ package qemu-$cpu
 interpreter $qemu
 magic $magic
 mask $mask
-credential $CREDENTIAL
+credentials $CREDENTIAL
+preserve $PRESERVE_ARG0
+fix_binary $PERSISTENT
 EOF
 }
 
-- 
2.30.2


