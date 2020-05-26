Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C521A91A9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 05:42:31 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOYwY-0005H3-Kb
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 23:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jingqi.liu@intel.com>) id 1jOYuW-000295-1p
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 23:40:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jingqi.liu@intel.com>) id 1jOYuU-0000kj-G0
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 23:40:23 -0400
Received: from mga01.intel.com ([192.55.52.88]:4323)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jingqi.liu@intel.com>)
 id 1jOYuU-0000jA-0X
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 23:40:22 -0400
IronPort-SDR: VJhoo/Om8EEMi09m5tPil2QmzCj2Su/N4SrlkJnER8OzsECB3iInjD8slfWWX5KFS+lKUo1AQI
 t3KUDeD9RtTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 20:40:17 -0700
IronPort-SDR: stj/CEM85xbeawe0j05JhvWneRlBBntwJhlPCiM/DboGrfuPlM92I5bx6LcL1KGpwKZ9rIFJt0
 dLTdzhtsSxDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; d="scan'208";a="256729963"
Received: from dazhang1-mobile.sh.intel.com ([10.239.48.70])
 by orsmga006.jf.intel.com with ESMTP; 14 Apr 2020 20:40:15 -0700
From: Jingqi Liu <jingqi.liu@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v2 2/3] docs/nvdimm: add description of alignment requirement
 of device dax
Date: Wed, 15 Apr 2020 11:35:37 +0800
Message-Id: <20200415033538.43329-3-jingqi.liu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415033538.43329-1-jingqi.liu@intel.com>
References: <20200415033538.43329-1-jingqi.liu@intel.com>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.88
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
Cc: Jingqi Liu <jingqi.liu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For device dax (e.g., /dev/dax0.0), the NUM of 'align=NUM' option
needs to match the alignment requirement of the device dax.
It must be larger than or equal to the 'align' of device dax.

Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
---
 docs/nvdimm.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index 362e99109e..3c7b6dab5f 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -132,6 +132,15 @@ address to the page size (getpagesize(2)) by default. However, some
 types of backends may require an alignment different than the page
 size. In that case, QEMU v2.12.0 and later provide 'align' option to
 memory-backend-file to allow users to specify the proper alignment.
+For device dax (e.g., /dev/dax0.0), this alignment needs to match the
+alignment requirement of the device dax. The NUM of 'align=NUM' option
+must be larger than or equal to the 'align' of device dax.
+We can use the following command to show the 'align' of device dax.
+
+    ndctl list -X
+
+In order to get the proper 'align' of device dax, you need to install
+the library 'libdaxctl'.
 
 For example, device dax require the 2 MB alignment, so we can use
 following QEMU command line options to use it (/dev/dax0.0) as the
-- 
2.17.1


