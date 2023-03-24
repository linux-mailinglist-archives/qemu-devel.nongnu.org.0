Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000DF6C80A1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:02:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfczd-0000xQ-LI; Fri, 24 Mar 2023 04:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1pfczY-0000xA-NV
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:41:44 -0400
Received: from mailout1.samsung.com ([203.254.224.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1pfczJ-0000Nv-SH
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:41:43 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230324083509epoutp0186d40e89e023efe08d43d24c0e416d7e~PTfcMrLNx2951029510epoutp01W
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 08:35:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230324083509epoutp0186d40e89e023efe08d43d24c0e416d7e~PTfcMrLNx2951029510epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679646909;
 bh=+aRIg26OlnH+KFCxWh8KFBYzogllA7U/nt4SKZ6wxIo=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=Mi5UjfjrPNEzrTiN3Al/bMFWHikgDm5c6q/hKrnicYZSYOEPftVYdhUxH/a0/m0z8
 uqVCDHlUHj2KulJThbJBKfgiWocXWc8DhPh+jbBPq47qp/7Kz+NG0jwYEbglaijolb
 Wj33Ym5zas9iMeJ1q28O9TJjAYuH5NxqqtSbU/VA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230324083509epcas2p162360ede3cbfc4dbc939e38f925704cc~PTfbvvcaQ0582305823epcas2p15;
 Fri, 24 Mar 2023 08:35:09 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4PjbB42qY5z4x9Q6; Fri, 24 Mar
 2023 08:35:08 +0000 (GMT)
X-AuditID: b6c32a46-4e1ff70000007a4b-ac-641d60bcb914
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C1.BB.31307.CB06D146; Fri, 24 Mar 2023 17:35:08 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH 1/2] hw/nvme: consider COPY command in nvme_aio_err
From: Minwoo Im <minwoo.im@samsung.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>
CC: Klaus Birkelund Jensen <k.jensen@samsung.com>, Minwoo Im
 <minwoo.im@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230324083507epcms2p3fcf6bed459a8080dc7f179a3506b44ec@epcms2p3>
Date: Fri, 24 Mar 2023 17:35:07 +0900
X-CMS-MailID: 20230324083507epcms2p3fcf6bed459a8080dc7f179a3506b44ec
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKKsWRmVeSWpSXmKPExsWy7bCmue6eBNkUg6v7BC1ONu5htXh2+gCz
 xax37WwWx3t3sDiweDy5tpnJo2/LKsYApqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwND
 XUNLC3MlhbzE3FRbJRefAF23zBygTUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpSc
 AvMCveLE3OLSvHS9vNQSK0MDAyNToMKE7IzbvxpYCq6yV9z+N52xgXEyWxcjJ4eEgInExgcv
 WEFsIYEdjBIz7+t2MXJw8AoISvzdIQwSFhZwluh49oQZJCwkIC/x45UBRFhT4t3uM2CdbALq
 Eg1TX7GA2CICaRIt+96BxZkFwiQ2nznDDrGJV2JG+1MWCFtaYvvyrYwQtobEj2W9zBC2qMTN
 1W/ZYez3x+ZD1YhItN47C1UjKPHg526ouJTE/vlzoexqiYbjz5gg7AqJX+8fQNWbS/y+vxvs
 Hl4BX4nn104wgbzCIqAq8fJMNkSJi8SlA3sYIU6Wl9j+dg7Yt8xAL67fpQ9iSggoSxy5xQJR
 wSfRcfgv3FM75j2BWqos8fHQIailkhLLL72GBrGHxKemXhZIEAdKtO3tZ5vAqDALEcqzkOyd
 hbB3ASPzKkax1ILi3PTUYqMCI3i8JufnbmIEpzcttx2MU95+0DvEyMTBeIhRgoNZSYT3XYhs
 ihBvSmJlVWpRfnxRaU5q8SFGU6CHJzJLiSbnAxNsXkm8oYmlgYmZmaG5kamBuZI4r7TtyWQh
 gfTEktTs1NSC1CKYPiYOTqkGppxrsWsTpI+zvrw805Dp4E7tc1+YNqU7NDCl7tzUc8f9UVue
 UOrMnXtdM/gbnv55ajhzn7zYH6FrxfdbE5cXzHBhDvX7N39PtstfobAQWYaPfVa+TKlm1hc0
 vRxMuF43pt7luRo+iTfj9sZ9u7crztmr3+ftfNqTj63kmn7dnu2/9kjlBV2T/PX9ur3mFRcd
 kRd3Tmw989ZY6yaLem/6uRXqa3641DBzvwvfWfXu3r9UVQalne9yi6+5qP2aZStUHC7WO6Wg
 8IrGa/XnT//Wtles/Cj4NGLtPhv7B1NWJy7KMX90sN95ZfWLGeerVyZNiHR6V5ZhbMXe0Gyo
 c597llSB5Kvbyw+XcDXnHBE6qsRSnJFoqMVcVJwIAPVSebL4AwAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230324083507epcms2p3fcf6bed459a8080dc7f179a3506b44ec
References: <CGME20230324083507epcms2p3fcf6bed459a8080dc7f179a3506b44ec@epcms2p3>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=minwoo.im@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: minwoo.im@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If we don't have NVME_CMD_COPY consideration in the switch statement in
nvme_aio_err(), it will go to have NVME_INTERNAL_DEV_ERROR and
`req->status` will be ovewritten to it.  During the aio context, it
might set the NVMe status field like NVME_CMD_SIZE_LIMIT, but it's
overwritten in the nvme_aio_err().

Add consideration for the NVME_CMD_COPY not to overwrite the status at
the end of the function.

Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 49c1210fce..fef5079a71 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1748,6 +1748,7 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
     case NVME_CMD_WRITE:
     case NVME_CMD_WRITE_ZEROES:
     case NVME_CMD_ZONE_APPEND:
+    case NVME_CMD_COPY:
         status = NVME_WRITE_FAULT;
         break;
     default:
-- 
2.34.1


