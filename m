Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E86E7A52
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 15:10:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp7Y6-0002uS-Us; Wed, 19 Apr 2023 09:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pp7Y4-0002u9-QV
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 09:08:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pp7Xy-0001qF-7r
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 09:08:36 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33JBcBT1024238; Wed, 19 Apr 2023 13:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2023-03-30;
 bh=Kq3eytP1WDppmF3UChuGYSSEqPwLsUcAxzRBBNlKIhY=;
 b=fB/3HQh2dOW6mt33NIMk6mPZR1isXXnLwLNbbxsY/fQGQFQsnBOcavzVsH+8lPkHDTt9
 hOzP2A2wrlIIQ+S31q9kKQ+8MDNA+VOPFiQE4QEk7mXbwgnxyoYlWXM5BDhysgbVoCTH
 uq7J6BeY4rFiEHWZPJT1CzoLFRU9QfE/Pe9efFtVGhZHBen5rjl0NjWxwSZdEZDWaCEo
 mbB7TpzJsCTB1KuU6TWmkH/pKjg9xBuHszPQYDwvAXdb/ZeukBRqii6AJNoraaW9PVrL
 SeG3zTPj1y5iyA14an8ZLXF3mJNcGCH/7+ELvRpCz39zRx0eMnTHxBIGWL7v+YvQgfgm Hw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q0768y81c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Apr 2023 13:08:24 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33JCOevQ026361; Wed, 19 Apr 2023 13:08:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjcd6gsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Apr 2023 13:08:23 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33JD8MlX004054;
 Wed, 19 Apr 2023 13:08:22 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with
 ESMTP id 3pyjcd6gqs-1; Wed, 19 Apr 2023 13:08:22 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH] make: clean after distclean deletes source files
Date: Wed, 19 Apr 2023 06:08:20 -0700
Message-Id: <1681909700-94095-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_08,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304190118
X-Proofpoint-ORIG-GUID: tju7_oAbDU53fJGTEH_Yg4JJoOPeu_wO
X-Proofpoint-GUID: tju7_oAbDU53fJGTEH_Yg4JJoOPeu_wO
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Run 'make distclean' in a tree, and GNUmakefile is removed.
But, GNUmakefile is where we change directory to build.
Run 'make distclean' or 'make clean' again, and Makefile applies
the clean actions, such as this one, at the top level of the tree.
For example, it removes the .d source files in 'meson/test cases/d/*/*.d'.

    find . \( -name '*.so' -o -name '*.dll' -o \
          -name '*.[oda]' -o -name '*.gcno' \) -type f \
        ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
        ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
        -exec rm {} +

To fix, remove clean and distclean from UNCHECKED_GOALS, so those targets
are "checked", meaning that configure must be run before make.  However,
the check action does not trigger, because clean does not depend on
config-host.mak, so change the action to simply throw an error.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index e421f8a..30d61f8 100644
--- a/Makefile
+++ b/Makefile
@@ -26,7 +26,7 @@ quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
 quiet-@ = $(if $(V),,@)
 quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
 
-UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
+UNCHECKED_GOALS := TAGS cscope ctags dist \
     help check-help print-% \
     docker docker-% vm-help vm-test vm-build-%
 
@@ -176,10 +176,8 @@ plugins:
 endif # $(CONFIG_PLUGIN)
 
 else # config-host.mak does not exist
-config-host.mak:
 ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
-	@echo "Please call configure before running make!"
-	@exit 1
+$(error Please call configure before running make)
 endif
 endif # config-host.mak does not exist
 
-- 
1.8.3.1


