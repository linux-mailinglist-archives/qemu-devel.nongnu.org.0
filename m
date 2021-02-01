Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA3330AB8B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:36:20 +0100 (CET)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bFT-0004ac-4C
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6bBY-0001QL-9Z
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:32:16 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6bBW-00005g-Gb
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:32:15 -0500
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DTsGj1rgwz67jjw;
 Mon,  1 Feb 2021 23:26:05 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 16:32:12 +0100
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 15:32:12 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 3/3] hw/cxl/cxl-device-utils: Allow incorrect read lengths
Date: Mon, 1 Feb 2021 23:26:55 +0800
Message-ID: <20210201152655.31027-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20210201152655.31027-1-Jonathan.Cameron@huawei.com>
References: <20210201152655.31027-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Vishal
 Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, f4bug@amsat.org, linuxarm@openeuler.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is currently needed to avoid an issue in the Linux RFC
in which a read is issued that is not a multiple of DW.
On arm64 that results in byte reads being issued and a bus
error returned.

It is not yet obvious at what level this should be fixed,
so paper over it to get things working.

Not-signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-device-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index d0d0a47122..52dd03384a 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -181,11 +181,11 @@ static const MemoryRegionOps mailbox_ops = {
     .write = mailbox_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
-        .min_access_size = 4,
+        .min_access_size = 1,
         .max_access_size = 8,
     },
     .impl = {
-        .min_access_size = 4,
+        .min_access_size = 1,
         .max_access_size = 8,
     },
 };
-- 
2.19.1


