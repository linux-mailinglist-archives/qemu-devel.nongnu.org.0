Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692476C8249
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 17:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfkAM-0006mX-EO; Fri, 24 Mar 2023 12:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1pfkAG-0006P8-LJ
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 12:21:17 -0400
Received: from mailout2.samsung.com ([203.254.224.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1pfkAE-0002Bq-Bz
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 12:21:16 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230324083537epoutp02ee5845301486cf974b5a721ab06176c9~PTf2ttiZX1160111601epoutp02H
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 08:35:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230324083537epoutp02ee5845301486cf974b5a721ab06176c9~PTf2ttiZX1160111601epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679646938;
 bh=Sq2JZy2YRQJkEfHMq/XSXWbUZoAaF09es+la+JKcsjI=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=YEcOw3a730OTMEgAb2I8g3HATlBHSLsRghyX8ywUGSKXB1NkVe4f8VvSWhk88GNRP
 NWP0t+6i0nk9XTvl1pS9wxtDSISXq6Wrum82ZtBWo5ZwzPQ0DVb3ygy1xCVHJLlzbU
 V2XBca2S+JH+tUFjrIl/WBbXKV0yYfJYjoxTUwHk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230324083537epcas2p1fe64c45d05231127ffe6514832db52df~PTf2cHS7E2536225362epcas2p1f;
 Fri, 24 Mar 2023 08:35:37 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.68]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4PjbBd29ccz4x9Q5; Fri, 24 Mar
 2023 08:35:37 +0000 (GMT)
X-AuditID: b6c32a48-1f7ff70000021624-21-641d60d9140d
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 1C.84.05668.9D06D146; Fri, 24 Mar 2023 17:35:37 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH 2/2] hw/nvme: check maximum copy length (MCL) for COPY
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
Message-ID: <20230324083536epcms2p2caa983827f96306c1ede1cabc900bfec@epcms2p2>
Date: Fri, 24 Mar 2023 17:35:36 +0900
X-CMS-MailID: 20230324083536epcms2p2caa983827f96306c1ede1cabc900bfec
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKKsWRmVeSWpSXmKPExsWy7bCmqe7NBNkUg7ddAhYnG/ewWjw7fYDZ
 Yta7djaL4707WBxYPJ5c28zk0bdlFWMAU1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGh
 rqGlhbmSQl5ibqqtkotPgK5bZg7QJiWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpO
 gXmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsbPNftYC87xVDy8vIStgXECZxcjJ4eEgInE+0Ud
 TF2MXBxCAjsYJVZ3X2fvYuTg4BUQlPi7QxikRljATWL5hpVgYSEBeYkfrwwgwpoS73afYQWx
 2QTUJRqmvmIBsUUE0iRa9r0DizMLhElsPnOGHWIVr8SM9qcsELa0xPblWxkhbA2JH8t6mSFs
 UYmbq9+yw9jvj82HqhGRaL13FqpGUOLBz91QcSmJ/fPnQtnVEg3HnzFB2BUSv94/gKo3l/h9
 fzfYPbwCvhL3F05iBnmFRUBV4nJfGESJi8S+018YIU6Wl9j+dg5YCTPQi+t36YOYEgLKEkdu
 sUBU8El0HP4L99SOeU+glipLfDx0CGqppMTyS6/ZIFo9JO4+iAEJCwkESsz7+45pAqPCLEQg
 z0KydhbC2gWMzKsYxVILinPTU4uNCkzg8Zqcn7uJEZzetDx2MM5++0HvECMTB+MhRgkOZiUR
 3nchsilCvCmJlVWpRfnxRaU5qcWHGE2B/p3ILCWanA9MsHkl8YYmlgYmZmaG5kamBuZK4rzS
 tieThQTSE0tSs1NTC1KLYPqYODilGpgUl3KE5L6pKL34LZZpmTtzdc9fF7cTjW9P/gx6Jf/J
 wGwff5vzYe9pjE/SQ9ab1/E3bTVS+rLjiP0PrwV88/+KCm+8yhIsc+TxpgmHMlrqXX9ONJ64
 XuHjm7l7ZffUZl9ZduicSurxZVdnWNnG3Xl2zCSxUSptk+a+c9Yhh1sWTJvxKBqo7EPWZin5
 1yGbzC/f3+zsmv7wmHVhv+v294wd6ilL3uYGNQZu5JjU1DNTxVBN6anACZN64Ya+zX+7+vOT
 lrsnN73x2Hmcm8nCgtv77Y7EvyvSTzueF+nbeu223YYZH2z/rNSyzk5hPfxIqk//wuTm+Q/F
 73UeEd9WcEfLfPIGlinr/+m9Xfx8f64SS3FGoqEWc1FxIgBkEve6+AMAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230324083536epcms2p2caa983827f96306c1ede1cabc900bfec
References: <CGME20230324083536epcms2p2caa983827f96306c1ede1cabc900bfec@epcms2p2>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=minwoo.im@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-To: minwoo.im@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

MCL(Maximum Copy Length) in the Identify Namespace data structure limits
the number of LBAs to be copied inside of the controller.  We've not
checked it at all, so added the check with returning the proper error
status.

Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fef5079a71..b490bf4d3e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2845,6 +2845,25 @@ static void nvme_copy_source_range_parse(void *ranges, int idx, uint8_t format,
     }
 }
 
+static inline uint16_t nvme_check_copy_mcl(NvmeNamespace *ns,
+                                           NvmeCopyAIOCB *iocb, uint16_t nr)
+{
+    uint32_t copy_len = 0;
+
+    for (int idx = 0; idx < nr; idx++) {
+        uint32_t nlb;
+        nvme_copy_source_range_parse(iocb->ranges, idx, iocb->format, NULL,
+                                     &nlb, NULL, NULL, NULL);
+        copy_len += nlb + 1;
+    }
+
+    if (copy_len > ns->id_ns.mcl) {
+        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static void nvme_copy_out_completed_cb(void *opaque, int ret)
 {
     NvmeCopyAIOCB *iocb = opaque;
@@ -3157,6 +3176,11 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
+    status = nvme_check_copy_mcl(ns, iocb, nr);
+    if (status) {
+        goto invalid;
+    }
+
     iocb->req = req;
     iocb->ret = 0;
     iocb->nr = nr;
-- 
2.34.1

