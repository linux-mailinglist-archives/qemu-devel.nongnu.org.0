Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E244D728C0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 09:03:58 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqBJe-0000wr-1v
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 03:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37219)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqBJQ-0000YF-Sx
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 03:03:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqBJO-0007VA-U6
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 03:03:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:64776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hqBJN-0007UQ-03
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 03:03:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 00:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,302,1559545200"; d="scan'208";a="163759304"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga008.jf.intel.com with ESMTP; 24 Jul 2019 00:03:38 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jul 2019 15:03:07 +0800
Message-Id: <20190724070307.12568-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH] docs/nvdimm: add example on persistent backend
 setup
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
Cc: ross.zwisler@linux.intel.com, Wei Yang <richardw.yang@linux.intel.com>,
 xiaoguangrong.eric@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Persistent backend setup requires some knowledge about nvdimm and ndctl
tool. Some users report they may struggle to gather these knowledge and
have difficulty to setup it properly.

Here we provide two examples for persistent backend and gives the link
to ndctl. By doing so, user could try it directly and do more
investigation on persistent backend setup with ndctl.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 docs/nvdimm.txt | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index b531cacd35..baba7a940d 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -171,6 +171,32 @@ guest software that this vNVDIMM device contains a region that cannot
 accept persistent writes. In result, for example, the guest Linux
 NVDIMM driver, marks such vNVDIMM device as read-only.
 
+Backend File Setup Example
+..........................
+
+Here is two examples for how to setup these persistent backend on
+linux, which leverages the tool ndctl [3].
+
+It is easy to setup DAX device backend file.
+
+A. DAX device
+
+    ndctl create-namespace -f -e namespace0.0 -m devdax
+
+The /dev/dax0.0 could be used directly in "mem-path" option.
+
+For DAX file, it is more than creating the proper namespace. The
+block device should be partitioned and mounted (with dax option).
+
+B. DAX file
+
+    ndctl create-namespace -f -e namespace0.0 -m fsdax
+    (partition /dev/pmem0 with name pmem0p1)
+    mount -o dax /dev/pmem0p1 /mnt
+    (dd a file with proper size in /mnt)
+
+Then the new file in /mnt could be used in "mem-path" option.
+
 NVDIMM Persistence
 ------------------
 
@@ -212,3 +238,5 @@ References
     https://www.snia.org/sites/default/files/technical_work/final/NVMProgrammingModel_v1.2.pdf
 [2] Persistent Memory Development Kit (PMDK), formerly known as NVML project, home page:
     http://pmem.io/pmdk/
+[3] ndctl-create-namespace - provision or reconfigure a namespace
+    http://pmem.io/ndctl/ndctl-create-namespace.html
-- 
2.17.1


