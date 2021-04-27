Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E063436C009
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 09:24:00 +0200 (CEST)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbI4e-0002Bp-1A
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 03:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lbI3U-0001gL-Lh
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:22:48 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:19554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lbI3R-0002mW-FO
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:22:48 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210427072236epoutp03fca31ce0bc60356c699dd505fefc8886~5phaQoIns1169811698epoutp03E
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:22:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210427072236epoutp03fca31ce0bc60356c699dd505fefc8886~5phaQoIns1169811698epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1619508156;
 bh=1CJZK826RmW2Fc+5wxQzCQgMDVCJC214XX0W5TIFP4g=;
 h=From:To:Cc:Subject:Date:References:From;
 b=ITUfRAe77zWTReBQ/pjMN3AN9rq0kjxodRqAILRtw4wYNRY19VT4LwB7ivpy2oCTa
 5yHc10mEt7km1FiL6xgL5/FJNJF6xD4iHfnKuIqpMIdTD+t4pf+7NUHaZee7DT3KfP
 3vVvVRHgDNcmy6OUuCnBw7/lJDELgWstL2C60RqU=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210427072236epcas5p1b04080359cfac8ddbc0f0e91287115e5~5phZghpjj0581805818epcas5p1w;
 Tue, 27 Apr 2021 07:22:36 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 70.3B.09606.BBBB7806; Tue, 27 Apr 2021 16:22:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210427063530epcas5p4c260382227175e68d29da6d10957ad95~5o4SJWTQz2969329693epcas5p4J;
 Tue, 27 Apr 2021 06:35:30 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210427063530epsmtrp16d39e41e4a4270b1092a34f3e4b5efea~5o4SIkgZF0086500865epsmtrp1I;
 Tue, 27 Apr 2021 06:35:30 +0000 (GMT)
X-AuditID: b6c32a49-bdbff70000002586-7f-6087bbbb3126
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 BB.6C.08163.2B0B7806; Tue, 27 Apr 2021 15:35:30 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210427063529epsmtip2a032c0759ce924d01fdc6caeb6b95eb0~5o4Qw16Fp0450104501epsmtip2G;
 Tue, 27 Apr 2021 06:35:29 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/nvme/ctrl: fix csi field for cns 0x00 and 0x11
Date: Tue, 27 Apr 2021 12:00:52 +0530
Message-Id: <20210427063052.31078-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsWy7bCmuu7u3e0JBseuW1u83nmc2eLK/vOM
 FvsPfmO1mHToGqPFkoupFvNuKVvMetfOZnG8dweLxetJ/1kdOD1+nGtn8zi34zy7x6ZVnWwe
 T65tZvJ4v+8qm0ffllWMAWxRXDYpqTmZZalF+nYJXBm71wkWXOSv+Dcpu4FxDU8XIyeHhICJ
 xNRfd9m6GLk4hAR2M0oc+fGIFcL5xChx78EMRgjnM6PE3EmvWGBaLp3fB1W1i1Fiy/GzrCAJ
 IYFOJokPn6NBbDYBI4nZb98wgtgiApISv7tOM4PYzCA7vs3VAbGFBVwl3k7eDTaURUBVYvqN
 dqA7ODh4BWwldk23h9glL7F6wwFmkF0SAofYJT6+fcoKkXCRaFlxHuogYYlXx7ewQ9hSEi/7
 24BsdiC7WuJwEURrB6PEscsb2CBK7CX+PZvGCLKKWUBTYv0ufYiwrMTUU+uYIK7kk+j9/YQJ
 Is4rsWMejK0mseDWd6hNMhIz/9yGusZD4vSR82yQUIiVWN1xnW0Co+wshA0LGBlXMUqmFhTn
 pqcWmxYY5qWW6xUn5haX5qXrJefnbmIEJwMtzx2Mdx980DvEyMTBeIhRgoNZSYSXbVdrghBv
 SmJlVWpRfnxRaU5q8SFGaQ4WJXFeQefqBCGB9MSS1OzU1ILUIpgsEwenVAOTtuPxAr4/3y9F
 tr3f2OjU9m9+nvNxm7gbVQbf3SRW3vq+bwMn0/8X0w0nH2X1cjbJv/ru7rMlAtP3B0ovP1Sl
 tnZjPLvJL2+e6xNyi6/dq/5mWrB7SvMFlfJFTGv3NxSsbJ0+b/OWT6qb9ytP2vZ0V/A/Lv59
 LBNyhI5dk/oh93DvvALdWcHN9xPO2z2RC1pmZvPpHUdhnnVGx9Sy20VXF2vLbebaL/761pPA
 rB2TDutrXOyNZff+Ftt7ifn7BAlmn5ev2xTk5D+e/pTKWbzzZJI1M0d4tq1jCZu45S1BplOr
 VkmtCmN75S/cu+3cPIU2gfrF7OeW83CEF6X0BVW7Xdq6at0m6by6gsNbZv1bpcRSnJFoqMVc
 VJwIANOQTad1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmluLIzCtJLcpLzFFi42LZdlhJXnfThvYEg+dH5Sxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErozd6wQLLvJX/JuU3cC4hqeLkZNDQsBE
 4tL5faxdjFwcQgI7GCWuT9/EDJGQkfh1aiqULSyx8t9zdoiidiaJfXeXs4Ek2ASMJGa/fcMI
 YosISEr87jrNDFLELHCUUeJy+2QWkISwgKvE28m7wWwWAVWJ6TfagZo5OHgFbCV2TbeHWCAv
 sXrDAeYJjDwLGBlWMUqmFhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIEh5eW1g7GPas+6B1i
 ZOJgPMQowcGsJMLLtqs1QYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWp
 RTBZJg5OqQYmhmQ7P87krz+Lyn8/6eyWl22ZLMXcKfD3yplJOl6vf84+Nd/ht2/XF6ZO7eum
 8iGr7mtmONWucOF+IL2qXnO+2oFjv6SlfN751EbMszgv5MEl9FVPVzmz1Wzl0b0rmg5+S9t9
 jNP6plbK/bq7ES80S1bcZMtIMDV6tt84/GFNSweTX7VjTUOhD9Ob6KVrDF+++LuJV5SRK7Os
 5wiTvNiRZgntSHUm3u8blqveSRSJTbG6arZzydOP50TmsXvc/9Dbuera/C+P+Q5W/lJnF71j
 sjW3UPVAmWSB5W+L+49mcYm+mX9R6rVGb7N5cpKG+cy5936c2eT55E0j07av0W2lQluf3PZ+
 o7bZRyfyw1olluKMREMt5qLiRAB6WD9sngIAAA==
X-CMS-MailID: 20210427063530epcas5p4c260382227175e68d29da6d10957ad95
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210427063530epcas5p4c260382227175e68d29da6d10957ad95
References: <CGME20210427063530epcas5p4c260382227175e68d29da6d10957ad95@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per the TP 4056d Namespace types CNS 0x00 and CNS 0x11
CSI field shouldn't use but it is being used for these two
Identify command CNS values, fix that.

Remove 'nvme_csi_has_nvm_support()' helper as suggested by
Klaus we can safely assume NVM command set support for all
namespaces.

Suggested-by: Klaus Jensen <its@irrelevant.dk>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
-v2: add sugggestions from Klaus
We can Remove 'nvme_csi_has_nvm_support()' helper, we can
assume NVM command set support for all namespaces.

 hw/nvme/ctrl.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2e7498a73e..7fcd699235 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4178,16 +4178,6 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, id, sizeof(id), req);
 }
 
-static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
-{
-    switch (ns->csi) {
-    case NVME_CSI_NVM:
-    case NVME_CSI_ZONED:
-        return true;
-    }
-    return false;
-}
-
 static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_identify_ctrl();
@@ -4244,7 +4234,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
         }
     }
 
-    if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
+    if (active || ns->csi == NVME_CSI_NVM) {
         return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
     }
 
@@ -4315,7 +4305,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
         }
     }
 
-    if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
+    if (c->csi == NVME_CSI_NVM) {
         return nvme_rpt_empty_id_struct(n, req);
     } else if (c->csi == NVME_CSI_ZONED && ns->csi == NVME_CSI_ZONED) {
         return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
-- 
2.17.1


