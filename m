Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC2DA45
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 02:52:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKuXJ-0001Qc-Ci
	for lists+qemu-devel@lfdr.de; Sun, 28 Apr 2019 20:52:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hKuIi-0007js-BJ
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 20:37:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hKuD7-0001yY-HK
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 20:31:59 -0400
Received: from smtpbgbr2.qq.com ([54.207.22.56]:50330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <driver1998@foxmail.com>)
	id 1hKuD4-0001j8-8I
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 20:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1556497901;
	bh=6oRnU2BcdGDtPE9iy7KsdHPQRg/PEb0sJ/jEVMvHFo0=;
	h=From:To:Subject:Date:Message-Id;
	b=aZIPijFX0X/7CgEsEL90yjccURgwOM/+A1pKpFOr9q319um6UeNaR2VG4TdbWPxw+
	dYERMorMMhBsKk+uElURgIbYk5NAdtZC/DuGSxeI4riCv7uVMtE0dEgords5UTBRwp
	4rGvJPYhaXMttx3hLVOPr04myk0QH+mGYaXAFeME=
X-QQ-mid: esmtp6t1556497899t8yxfv82s
Received: from localhost (unknown [183.63.119.27])
	by esmtp4.qq.com (ESMTP) with 
	id ; Mon, 29 Apr 2019 08:31:39 +0800 (CST)
X-QQ-SSF: B100000000000030F7F00F00000000O
X-QQ-FEAT: WzbxStTePJ13/a+InIYkATG89/rAYwUtroxFcvvVFG3Fyfhd+dJNlSIBtHQV4
	bq/AIZaiNF8g0CUXwhq1Cxg2SAklzBRnAfmoe6lXpa7DhcBpHFZ2G6dez5WkjpwTeo2PBBd
	2Son0pXglRkFQa1NVqIKwXL81JQ6M7La0leU7zKxRVaTmnZQMdauJehF0O0yHGXNP1IC43U
	qMo71gvSkKCjzxE0MHwtmtsJSAkvtkg3EGKs2TxvZOGJpPP9kqxsDoLYTaWSQS6VgO55ECA
	Ir2POVmy7y+ebaso1CrMi4KUp452oD+JO8UohQLcfPptsb
X-QQ-GoodBg: 0
From: driver1998 <driver1998@foxmail.com>
To: samuel.thibault@ens-lyon.org,
	mst@redhat.com
Date: Mon, 29 Apr 2019 00:31:12 +0000
Message-Id: <20190429003112.22808-1-driver1998@foxmail.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:foxmail.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 54.207.22.56
X-Mailman-Approved-At: Sun, 28 Apr 2019 20:49:05 -0400
Subject: [Qemu-devel] [PATCH 1/4] Initial Windows on ARM (AArch64 64-Bit)
 host support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: driver1998 <driver1998@foxmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches is for initial support of Windows 10 on ARM as a QEMU host.
Currently only TCG intepreter is working correctly, it crashes when TCG JIT is enabled.
For now we assume it is built using the clang aarch64-w64-mingw32 toolchain, you can get a prebuilt toolchain at https://github.com/mstorsjo/llvm-mingw.

QEMU_PACKED: Remove gcc_struct attribute in Windows non x86 targets
This attribute is for x86 only, and it generates an warning on ARM64 Clang/MinGW targets.

Signed-off-by: driver1998 <driver1998@foxmail.com>
---
 contrib/libvhost-user/libvhost-user.h | 2 +-
 include/qemu/compiler.h               | 2 +-
 scripts/cocci-macro-file.h            | 7 ++++++-
 slirp/src/util.h                      | 2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.h b/contrib/libvhost-user/libvhost-user.h
index 414ceb0a2f..78b33306e8 100644
--- a/contrib/libvhost-user/libvhost-user.h
+++ b/contrib/libvhost-user/libvhost-user.h
@@ -148,7 +148,7 @@ typedef struct VhostUserInflight {
     uint16_t queue_size;
 } VhostUserInflight;
 
-#if defined(_WIN32)
+#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
 # define VU_PACKED __attribute__((gcc_struct, packed))
 #else
 # define VU_PACKED __attribute__((packed))
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 296b2fd572..09fc44cca4 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -28,7 +28,7 @@
 
 #define QEMU_SENTINEL __attribute__((sentinel))
 
-#if defined(_WIN32)
+#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
 # define QEMU_PACKED __attribute__((gcc_struct, packed))
 #else
 # define QEMU_PACKED __attribute__((packed))
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index e485cdccae..c6bbc05ba3 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -23,7 +23,12 @@
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
 #define QEMU_SENTINEL __attribute__((sentinel))
-#define QEMU_PACKED __attribute__((gcc_struct, packed))
+
+#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
+# define QEMU_PACKED __attribute__((gcc_struct, packed))
+#else
+# define QEMU_PACKED __attribute__((packed))
+#endif
 
 #define cat(x,y) x ## y
 #define cat2(x,y) cat(x,y)
diff --git a/slirp/src/util.h b/slirp/src/util.h
index 01f1e0e068..278828fe3f 100644
--- a/slirp/src/util.h
+++ b/slirp/src/util.h
@@ -43,7 +43,7 @@
 #include <netinet/in.h>
 #endif
 
-#if defined(_WIN32)
+#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
 # define SLIRP_PACKED __attribute__((gcc_struct, packed))
 #else
 # define SLIRP_PACKED __attribute__((packed))
-- 
2.17.1




