Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA4E3829D3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:31:06 +0200 (CEST)
Received: from localhost ([::1]:40080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaWf-0004aR-Gv
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1liaMh-0005Ct-3D
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:20:47 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:64575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1liaMY-0002Y5-Pl
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:20:46 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210517102035epoutp03e071d4edd8f02852d1618135ee612426~-02goRLTp0325803258epoutp033
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:20:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210517102035epoutp03e071d4edd8f02852d1618135ee612426~-02goRLTp0325803258epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621246835;
 bh=mmPNMtosMlqHOcGPy+EMsw6g+h2BdQdzBs7LQahXA6s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=El+S8JZBjsby59zAVMkXNE2R3W6CcrP2BUn6Y+8jbjMbP61Za0e57TeJS3Dyh579x
 rZY6tgOjqPK7mMbNYwXcpoCtkZr8tOm9AlbfjydtcrJfCMlP6AU7Qj9terx3o16XXz
 0dPEUnrBsuvtCK8YE39Zkw+FE13F+vzXy0CIeowM=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210517102034epcas5p416733568a3ba1c184afec61391083cc8~-02f_DVEb2116821168epcas5p4e;
 Mon, 17 May 2021 10:20:34 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 07.0E.09606.27342A06; Mon, 17 May 2021 19:20:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210517101212epcas5p356060d787b2a70309436bf3ecdf1e17c~-0vM21D681076210762epcas5p3N;
 Mon, 17 May 2021 10:12:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210517101212epsmtrp208a21969821e7e98073a0e4a7b6b4d0e~-0vM2BXtO2103521035epsmtrp2a;
 Mon, 17 May 2021 10:12:12 +0000 (GMT)
X-AuditID: b6c32a49-bdbff70000002586-cf-60a243726671
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 21.E5.08163.C7142A06; Mon, 17 May 2021 19:12:12 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210517101211epsmtip193e006f985b4f081c9171692969dc204~-0vLWd8421149511495epsmtip1B;
 Mon, 17 May 2021 10:12:11 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/nvme/ctrl: fix endian conversion for nsid in ctrl list
Date: Mon, 17 May 2021 15:37:35 +0530
Message-Id: <20210517100736.17063-3-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517100736.17063-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsWy7bCmhm6R86IEg3NbJS1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErowV+xpYCmbyVNyd2cPUwPiCo4uRk0NC
 wERi/+ffTF2MXBxCArsZJSa0b2SEcD4xSpw928UEUiUk8JlRYtM5W5iOzpZ7LBDxXYwS56cG
 QTR0MklcP/+LESTBJmAkMfvtGzBbREBS4nfXaWYQmxlkxbe5OiC2sECAxMz5K8FqWARUJdon
 7AIbyitgK7FsyzM2iGXyEqs3HADr5RSwk9i0+iAryDIJgVvsEqs2vGWEKHKR+HRgKhOELSzx
 6vgWdghbSuLzu71Ag9iB7GqJw0UQrR2MEscub4Caby/x79k0oDEcQLdpSqzfpQ8RlpWYemod
 E8TJfBK9v59ATeeV2DEPxlaTWHDrO9QmGYmZf26zQtgeEo3XD7NDwmcio8SDLXkTGOVmIWxY
 wMi4ilEytaA4Nz212LTAMC+1XK84Mbe4NC9dLzk/dxMjOFFoee5gvPvgg94hRiYOxkOMEhzM
 SiK8n8LmJwjxpiRWVqUW5ccXleakFh9ilOZgURLnXfFwcoKQQHpiSWp2ampBahFMlomDU6qB
 Scvw4qV+tapZG+Q2pexiX7uS73putk+wWYy67LWt53jTFU+WBz9t0bWcxzQrUS1PvvH4sV+z
 awpLld4silVduWq2odPfrY9rLpVzfVP7mvluWfChlh+uctNKq/Y923/e8ExjnU/OgXCDVYel
 9P7O/vfYOEPEsHenwpujDp7qTy7sdXy1pLR4y4KdlvwLzHQ8L8qXvNmtrvdWhbNRVdFoWnHi
 d9MPf3cXXAleuTY6KDKvp0Vhj/k5w6/cQTcn//Nsm/372LZlXjbMzB9NlaZfmx/9t974dNvc
 MkfBlX4Bj+40fz7yTuh6ZtWhnf8rnrSaWx8Om+9+OVH0lU5I5u1XArxTk35xXz87e6OuS/37
 90osxRmJhlrMRcWJADUBYXqDAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsWy7bCSnG6N46IEg7bfOhavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8aKfQ0sBTN5Ku7O7GFqYHzB0cXIySEh
 YCLR2XKPpYuRi0NIYAejxLMNWxghEjISv05NZYawhSVW/nvODlHUziRx6ON5sASbgJHE7Ldv
 wBpEBCQlfnedZgYpYhY4yihxuX0yC0hCWMBPYv+uXrAGFgFVifYJu8DivAK2Esu2PGOD2CAv
 sXrDAbAaTgE7iU2rD7KC2EJANf979rNPYORbwMiwilEytaA4Nz232LDAKC+1XK84Mbe4NC9d
 Lzk/dxMjOCi1tHYw7ln1Qe8QIxMH4yFGCQ5mJRHeT2HzE4R4UxIrq1KL8uOLSnNSiw8xSnOw
 KInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpg4qk4rTLv7SuNQ+lsFmoTZ0odUYu9E9+6xZ0n
 wLP/yeoZDF8O/c/YleglUn9hq9tjl8taFz89W31PJTap1n5BuTOL5oOy5lv965k2zY3z6Z84
 tTPV2FRc91OK8Jl063zp82sKMh9NZXyjtjbhc06liKxZd2c8f5S9/TyhIk6T73bySczx0kpp
 YfmzUtkf3llqc69T7ceali0lW+SaZCuszj+fr/lIONPgQRTf8s7y1r+5EbKuArHX/6nevco3
 K7jmXvCEOsnVS5hVZvj3Tljj+zX3+YrN3UZz87fH77XRv/Fsxs8YlmOf7T+eWMl7P/Zqb/SO
 F73Mygvk14fLux8T7+CZW6ySMrezV0P7x0YlluKMREMt5qLiRABhCbLduQIAAA==
X-CMS-MailID: 20210517101212epcas5p356060d787b2a70309436bf3ecdf1e17c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210517101212epcas5p356060d787b2a70309436bf3ecdf1e17c
References: <20210517100736.17063-1-anaidu.gollu@samsung.com>
 <CGME20210517101212epcas5p356060d787b2a70309436bf3ecdf1e17c@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

In Identify Ctrl List of the CNS 0x12 and 0x13 no endian conversion
for the nsid field.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/nvme/ctrl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index d08a3350e2..813a72c655 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4255,6 +4255,7 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
                                         bool attached)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
+    uint32_t nsid = le32_to_cpu(c->nsid);
     uint16_t min_id = le16_to_cpu(c->ctrlid);
     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
     uint16_t *ids = &list[1];
@@ -4265,11 +4266,11 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
     trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
 
     if (attached) {
-        if (c->nsid == NVME_NSID_BROADCAST) {
+        if (nsid == NVME_NSID_BROADCAST) {
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        ns = nvme_subsys_ns(n->subsys, c->nsid);
+        ns = nvme_subsys_ns(n->subsys, nsid);
         if (!ns) {
             return NVME_INVALID_FIELD | NVME_DNR;
         }
@@ -4281,7 +4282,7 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
             continue;
         }
 
-        if (attached && !nvme_ns(ctrl, c->nsid)) {
+        if (attached && !nvme_ns(ctrl, nsid)) {
             continue;
         }
 
-- 
2.17.1


