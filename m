Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D703F4C49
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:24:15 +0200 (CEST)
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAs2-0004Ov-2P
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <naveen.n1@samsung.com>)
 id 1mIAnp-00065o-Lq
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:19:53 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:26960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <naveen.n1@samsung.com>)
 id 1mIAnm-0002gC-Td
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:19:53 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210823141940epoutp03c0849f760a228ead0eb67d624f98df61~d9VPey9YY2009020090epoutp03g
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 14:19:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210823141940epoutp03c0849f760a228ead0eb67d624f98df61~d9VPey9YY2009020090epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629728380;
 bh=QAHVTLZ8g8KvXznLSvN7uHM8n49XD+k22bv7xuekTkw=;
 h=From:To:Cc:Subject:Date:References:From;
 b=abkUopyIOjPD2aD8Dw1lFbmVYv2YyMvlM9r7nuG0NcgQtR9yfF3cK2Q0qCiSvOVQB
 keA9rfgC2uW1/pvpJlSXJtV+yqBFaA6usZpDJfEDGrz759FVTREKH7L5/QR5p4KQRS
 L6p08xxtWO2tlF6AQgwhQposCyV/r90fwKIDKF74=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210823141939epcas5p267fd55256cbf94755b7e4c8e542df95d~d9VN6hau51518415184epcas5p2R;
 Mon, 23 Aug 2021 14:19:39 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4GtZBH11wYz4x9Pv; Mon, 23 Aug
 2021 14:19:35 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BD.10.09778.67EA3216; Mon, 23 Aug 2021 23:19:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210823114601epcas5p17b488aeeae3dd41d32ab3df4fd235256~d7PFpX-Aj0870508705epcas5p1l;
 Mon, 23 Aug 2021 11:46:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210823114601epsmtrp124bc09c3ecbf36247017cbe5705ee0e1~d7PFoH7wH0414804148epsmtrp1_;
 Mon, 23 Aug 2021 11:46:01 +0000 (GMT)
X-AuditID: b6c32a4b-395ff70000002632-bc-6123ae768a85
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 2E.5E.08750.97A83216; Mon, 23 Aug 2021 20:46:01 +0900 (KST)
Received: from test.sa.corp.samsungelectronics.net (unknown [107.108.56.58])
 by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210823114559epsmtip2b89ae1ed17fc58a588fe024fef5ec691~d7PDYYGZ61421314213epsmtip2M;
 Mon, 23 Aug 2021 11:45:59 +0000 (GMT)
From: Naveen <naveen.n1@samsung.com>
To: qemu-devel@nongnu.org
Subject: hw/nvme: fix verification of select field in namespace attachment
Date: Mon, 23 Aug 2021 16:33:33 +0530
Message-Id: <1629716613-26819-1-git-send-email-naveen.n1@samsung.com>
X-Mailer: git-send-email 1.8.3.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdlhTQ7d8nXKiwd0fjBYf/55ltHj79QGb
 xZX95xkt9h/8xmqxdL6+xcnGPawWkw5dY7RYcjHV4lcnt8W8W8oWjU92s1tcmbKI2WLWu3Y2
 i+O9O1gs9nzZyGrxetJ/VgcBjx/n2tk8ds66y+5xbsd5do9NqzrZPJ5c28zk8X7fVTaPvi2r
 GAPYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0yc4BO
 V1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBToFSfmFpfmpevlpZZYGRoYGJkC
 FSZkZ1xuci+YLlIxe8c+1gbGm3xdjJwcEgImEgt3HWXpYuTiEBLYzSjx58kFZgjnE6PEmuVT
 oDKfGSU2Tz7DAtNyavEqNojELkaJ9dP2MkI4jUwSFw/OZQWpYhNQkZi+9wQbiC0iICnxu+s0
 2FxmgcdMEvfaJzGBJIQFvCR2HzsP1sAioCqx4cAasBW8Aq4Sr5vfskOsU5CY8vA9WLOEwE92
 ibeHP0Hd4SLxZt8nNghbWOLV8S1QDVISL/vboOxiiQu9/SwQzQ2MEo++bYBqtpe4uOcv0BUc
 QCdpSqzfpQ8RlpWYemod2HHMAnwSvb+fMEHEeSV2zHsCVi4hoCxxfjU3hCkpcW56MkSFh8T7
 eTeYQWwhgViJKSvOsExglJ2FMH8BI+MqRsnUguLc9NRi0wLjvNRyeEQl5+duYgSnSC3vHYyP
 HnzQO8TIxMF4iFGCg1lJhPcvk3KiEG9KYmVValF+fFFpTmrxIUZTYJBNZJYSTc4HJum8knhD
 E0sDEzMzMxNLYzNDJXFe3VcyiUIC6YklqdmpqQWpRTB9TBycUg1MsiIaU17IzVu/Zdu2R/+8
 rl+PlW84uzdz23v1RedtXzBt+HzxnN0jTX9li98x1hIVWdsMxZR1lz0IuimqbvR3VkMJv9HV
 1SXv6pZOKWyVvtmZL1UtryFtea5gDq+c7qGbtlvedksmBDdVpfA7zOSZU3jLdvda9eMNvSfv
 /Gp82zE5VfyyVpLly3kB2vw6e+dq2pjc/HnEuuSaVce1c3aH/AX7TXf2hRs+NTxlxhifLb9C
 4Nahmt2eYnn+bCcv3deasUgveV1ZxOonv2Ju7O2613Rany/Afhbjh6UNTcs/KhUseqy1P2fP
 kgNzeKrPsbzUSugskppsuU6ggTM/n8lggYP2Fp9Jx5sCVCaJuGsrsRRnJBpqMRcVJwIAFq/a
 HRoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsWy7bCSvG5ll3KiwdFWTYuPf88yWrz9+oDN
 4sr+84wW+w9+Y7VYOl/f4mTjHlaLSYeuMVosuZhq8auT22LeLWWLxie72S2uTFnEbDHrXTub
 xfHeHSwWe75sZLV4Pek/q4OAx49z7WweO2fdZfc4t+M8u8emVZ1sHk+ubWbyeL/vKptH35ZV
 jAHsUVw2Kak5mWWpRfp2CVwZl5vcC6aLVMzesY+1gfEmXxcjJ4eEgInEqcWr2LoYuTiEBHYw
 Slw51coKkZCU2PB3KxOELSyx8t9zdoii/4wSa2adAytiE1CRmL73BBuILQLU8LvrNDNIEbPA
 dyaJrW8egyWEBbwkdh87D9bAIqAqseHAGhYQm1fAVeJ181t2iA0KElMevmeewMizgJFhFaNk
 akFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcLhqae1g3LPqg94hRiYOxkOMEhzMSiK8f5mU
 E4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpgWq558RjL
 /pvJ++5HXt274SlXouOybrFuifj0Nn/28FvG5ouDK+X9uHvyPblbps0IXPl8SvGMPRx7FlV4
 XRW2tonOkBXZvCzvyvq1i9Q/cU/ftHiuVGHUPO0pR667FP/f9vpJ75XmL0//yjrUqs0r99VZ
 9mmmYaP9zQ9uIsGf1n33V2bb+uBistbzlp87trjyHljPLtAQryayk1E6zP1q2+OmC35W39LS
 jmwxufo9Y1VdT6lfjPY6Pdm0XCaGiefmt5dMWJDz9mqdZ6nngyWGzWUmL6fxMHw7t//bxbue
 MyekOxXvSk99pmffHLrrtcuqEK/DhvlnVY7saBeTCuQ5fmv1Ft/iw07GX6rsNDy7lViKMxIN
 tZiLihMBohC1QcYCAAA=
X-CMS-MailID: 20210823114601epcas5p17b488aeeae3dd41d32ab3df4fd235256
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210823114601epcas5p17b488aeeae3dd41d32ab3df4fd235256
References: <CGME20210823114601epcas5p17b488aeeae3dd41d32ab3df4fd235256@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=naveen.n1@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, anuj.singh@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 Naveen <naveen.n1@samsung.com>, d.palani@samsung.com, mreitz@redhat.com,
 its@irrelevant.dk, Minwoo Im <minwoo.im.dev@gmail.com>, stefanha@redhat.com,
 kbusch@kernel.org, prakash.v@samsung.com, raphel.david@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix is added to check for reserved value in select field for 
namespace attachment

Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
cc: Minwoo Im <minwoo.im.dev@gmail.com>

---
 hw/nvme/ctrl.c       | 13 +++++++++----
 include/block/nvme.h |  5 +++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6baf9e0..2c59c74 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5191,7 +5191,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
     uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
-    bool attach = !(dw10 & 0xf);
+    uint8_t sel = dw10 & 0xf;
     uint16_t *nr_ids = &list[0];
     uint16_t *ids = &list[1];
     uint16_t ret;
@@ -5224,7 +5224,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
         }
 
-        if (attach) {
+        switch (sel) {
+        case NVME_NS_ATTACHMENT_ATTACH:
             if (nvme_ns(ctrl, nsid)) {
                 return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
             }
@@ -5235,7 +5236,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 
             nvme_attach_ns(ctrl, ns);
             nvme_select_iocs_ns(ctrl, ns);
-        } else {
+            break;
+        case NVME_NS_ATTACHMENT_DETACH:
             if (!nvme_ns(ctrl, nsid)) {
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
@@ -5244,8 +5246,11 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             ns->attached--;
 
             nvme_update_dmrsl(ctrl);
+            break;
+        default:
+            return NVME_INVALID_FIELD | NVME_DNR;
         }
-
+        
         /*
          * Add namespace id to the changed namespace id list for event clearing
          * via Get Log Page command.
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 77aae01..e3bd47b 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1154,6 +1154,11 @@ enum NvmeIdCtrlCmic {
     NVME_CMIC_MULTI_CTRL    = 1 << 1,
 };
 
+enum NvmeNsAttachmentOperation {
+    NVME_NS_ATTACHMENT_ATTACH = 0x0,
+    NVME_NS_ATTACHMENT_DETACH = 0x1,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
-- 
1.8.3.1


