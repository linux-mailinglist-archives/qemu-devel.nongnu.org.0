Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920891BD7C5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 11:00:20 +0200 (CEST)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTiZn-0007EC-Jk
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 05:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jingqi.liu@intel.com>) id 1jTiVb-0000r9-JN
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jingqi.liu@intel.com>) id 1jTiV8-0001BP-Pm
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:55:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:25911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1jTiV8-0000gc-7H
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:55:30 -0400
IronPort-SDR: 2oMX5TntifhWqVnbEk9VVzVb7Aa5gG8P8WCx66ek340dhL71mbMFI7o36u+4o/LV1msX8XLchp
 yunIbaSzIONw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 01:55:29 -0700
IronPort-SDR: ZFkaqk8cmi/LHsjtNeoKiMdBv9VSor/511H/4OSWoscttJ4kJFRBDMEjSxgIgOfKr4PLoeNdHV
 YWpATLIDYJ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,331,1583222400"; d="scan'208";a="459114644"
Received: from dazhang1-mobile.sh.intel.com ([10.239.48.70])
 by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2020 01:55:26 -0700
From: Jingqi Liu <jingqi.liu@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Joao Martins <joao.m.martins@oracle.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v3 2/3] docs/nvdimm: add description of alignment requirement
 of device dax
Date: Wed, 29 Apr 2020 16:50:10 +0800
Message-Id: <20200429085011.63752-3-jingqi.liu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429085011.63752-1-jingqi.liu@intel.com>
References: <20200429085011.63752-1-jingqi.liu@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=jingqi.liu@intel.com;
 helo=mga05.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 04:55:24
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 192.55.52.43
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

Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
---
 docs/nvdimm.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index 362e99109e..c2c6e441b3 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -132,6 +132,16 @@ address to the page size (getpagesize(2)) by default. However, some
 types of backends may require an alignment different than the page
 size. In that case, QEMU v2.12.0 and later provide 'align' option to
 memory-backend-file to allow users to specify the proper alignment.
+For device dax (e.g., /dev/dax0.0), this alignment needs to match the
+alignment requirement of the device dax. The NUM of 'align=NUM' option
+must be larger than or equal to the 'align' of device dax.
+We can use one of the following commands to show the 'align' of device dax.
+
+    ndctl list -X
+    daxctl list -R
+
+In order to get the proper 'align' of device dax, you need to install
+the library 'libdaxctl'.
 
 For example, device dax require the 2 MB alignment, so we can use
 following QEMU command line options to use it (/dev/dax0.0) as the
-- 
2.17.1


