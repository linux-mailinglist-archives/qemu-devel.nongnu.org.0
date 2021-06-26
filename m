Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86733B4B6B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 02:02:18 +0200 (CEST)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwvm6-0004QZ-0v
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 20:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lwvkx-0002s5-Fa
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 20:01:07 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:37404 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lwvku-0005T3-1i
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 20:01:07 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 4D6DB6031112D; Fri, 25 Jun 2021 20:01:03 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v1 openspdm on QEMU CXL/PCIe Device 1/2] build: gcc to CC in
 GNUMakefile
Date: Fri, 25 Jun 2021 20:01:01 -0400
Message-Id: <1624665661-4903-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624665280-3595-1-git-send-email-cbrowy@avery-design.com>
References: <1624665280-3595-1-git-send-email-cbrowy@avery-design.com>
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.399,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com,
 Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, hchkuo@avery-design.com.tw,
 tyshao@avery-design.com.tw, jonathan.cameron@huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: hchkuo <hchkuo@avery-design.com.tw>

Modified gcc to CC in GNUMakefile, so that we can specify the gcc version

Signed-off-by: Chris Browy <cbrowy@avery-design.com>
---
 GNUmakefile.Flags | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/GNUmakefile.Flags b/GNUmakefile.Flags
index 3586284..33baceb 100644
--- a/GNUmakefile.Flags
+++ b/GNUmakefile.Flags
@@ -114,9 +114,9 @@ else ifeq ("$(TOOLCHAIN)","GCC")
     CMOCKA_FLAGS = -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong
     CC_FLAGS += --coverage -fprofile-arcs -ftest-coverage
 
-    SLINK = gcc-ar
+    SLINK = $(CC)-ar
 
-    DLINK = gcc
+    DLINK = $(CC)
     DLINK_OBJECT_FILES = -Wl,--start-group,@$(OUTPUT_DIR)/tmp.list,--end-group
     DLINK_FLAGS = -o $(BIN_DIR)/$(BASE_NAME) -flto -L/usr/X11R6/lib
     DLINK_FLAGS2 = -Wno-error -no-pie
-- 
1.8.3.1


