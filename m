Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B85359F83
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:06:24 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUqq7-0006AH-K6
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lUqp4-0005W2-H0
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:05:18 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:11818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lUqou-0008Mz-CE
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:05:18 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210409130459epoutp01596206e136d9a30915586bfcba5b32f5~0MlNNbJuQ2215122151epoutp01-
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 13:04:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210409130459epoutp01596206e136d9a30915586bfcba5b32f5~0MlNNbJuQ2215122151epoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617973499;
 bh=Cx+mxVVTF39g+ykJuXI+6S25Mpa8vKLlNKLsIeRAWQc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fT/8X2o7tEayOWan18l+GIqsWKneKLOhZs1kWjvR8QabTwsJjbabIZ7GUy7Ua+IhH
 MjhFousok5FhG03aFlf8KKOOTF7v5CsEzaLtAzBQTMzJe/JYTf3+41pADQZVAfGTye
 4dRv4mmqsRA4/gmDkBPtfcQeZ1+tzgpuq/WhjMJ8=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210409130459epcas5p3ce724aa7fe2af834857b4badf0622dfc~0MlM_OhTH2838628386epcas5p3D;
 Fri,  9 Apr 2021 13:04:59 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3B.B5.41008.BF050706; Fri,  9 Apr 2021 22:04:59 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210409115515epcas5p4104bffd6a4072e61d976387915747182~0LoULhM--2160621606epcas5p4g;
 Fri,  9 Apr 2021 11:55:15 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210409115515epsmtrp133c4a3733501519cfc1e4e34d55523ae~0LoUKqlsO0636506365epsmtrp1b;
 Fri,  9 Apr 2021 11:55:15 +0000 (GMT)
X-AuditID: b6c32a4b-661ff7000001a030-ed-607050fb3dbe
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B8.C8.08745.2A040706; Fri,  9 Apr 2021 20:55:14 +0900 (KST)
Received: from 2030045822 (unknown [107.99.42.33]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210409115513epsmtip15bdffcaeb871151a5089c06fa3627908~0LoSyNFJL3220432204epsmtip1t;
 Fri,  9 Apr 2021 11:55:13 +0000 (GMT)
Date: Fri, 9 Apr 2021 17:22:17 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/2] hw/block/nvme: drain namespaces on sq deletion
Message-ID: <20210409115217.GA8587@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210408193709.435939-2-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7bCmlu7vgIIEg8WnOSz2H/zGanGycQ+r
 xaRD1xgtllxMtXh2+gCzxbxbyhaz3rWzWRzv3cHiwOFxbsd5do9NqzrZPJ5c28zk8X7fVTaP
 vi2rGANYo7hsUlJzMstSi/TtErgybjdXFJyWqWh5doqxgfGSWBcjJ4eEgIlEx5zDbF2MXBxC
 ArsZJZ4d7mWCcD4xSsxv+AeV+cwo0X63lRGm5djrJlaIxC5Gic41d5khnOeMErcXTQJq4eBg
 EVCRmHkpHKSBTcBIYvbbN2DNIkDhp//2soDUMwvcZZQ4OekOE0hCWMBd4k/XCmYQm1dAT2Ld
 p5nsELagxMmZT1hAbE4BC4kbj1+xgtiiAsoSB7YdB7tVQqCVQ6L37AlWiPNcJB4sWwRlC0u8
 Or6FHcKWknjZ3wZkswPZ1RKHiyBaOxgljl3ewAZRYi/x79k0sEOZBTIkVs88CdUqKzH11Dom
 iDifRO/vJ0wQcV6JHfNgbDWJBbe+Q9XLSMz8c5sVFA4SAh4SG3+zQMJnJ6PEyq1/mScwys9C
 8tosJOsgbCuJzg9NrLOA2pkFpCWW/+OAMDUl1u/SX8DIuopRMrWgODc9tdi0wDgvtVyvODG3
 uDQvXS85P3cTIzgdaXnvYHz04IPeIUYmDsZDjBIczEoivM3N+QlCvCmJlVWpRfnxRaU5qcWH
 GKU5WJTEeXcYPIgXEkhPLEnNTk0tSC2CyTJxcEo1MN1lj4rW/iU5e3b7PuMPK24dYP3c87Ra
 XVZo6q+E41wzn9XOWhV2y05xV2eE5ibu3nXzS65uv/jC/lziWs19LLeqvB+9OGVXtkhK/vqE
 uX3xi3ZIHYle8uv6TdaH6tePKV7wVqyddiXZbWdU3IKVn783X576LDr1SP6GJktloQdmzPJr
 M60XLqjcIrQkbJWUUr55UtLEU4dC9y6/1syoZh+d7W11WepYo9WJQJWVP3TUC+WY/1eH361l
 v//x1QvhTdVSi7dcsfY4ekRz4yc1tfDMpStrCvevz/Ka+rXgxv4z/11W/i0rYJ1+oX7SK83P
 B/v5Zx2wvqjdNmul9+Ypy+rn2/i2zPfbWnq1Q4R/mcAMJZbijERDLeai4kQAZZ+iT7YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSnO4ih4IEg/MNlhb7D35jtTjZuIfV
 YtKha4wWSy6mWjw7fYDZYt4tZYtZ79rZLI737mBx4PA4t+M8u8emVZ1sHk+ubWbyeL/vKptH
 35ZVjAGsUVw2Kak5mWWpRfp2CVwZszrtCv5KVpx7f42xgXGeSBcjJ4eEgInEsddNrF2MXBxC
 AjsYJRY+WckGkZCR+HVqKjOELSyx8t9zdoiip4wSDd+PAhVxcLAIqEjMvBQOUsMmYCQx++0b
 RhBbBCj89N9eFpB6ZoG7jBI3uzeAJYQF3CX+dK0AG8oroCex7tNMdhBbSCBV4mbvP3aIuKDE
 yZlPWEBsZgEziXmbHzKD7GIWkJZY/o8DJMwpYCFx4/ErVhBbVEBZ4sC240wTGAVnIemehaR7
 FkL3AkbmVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwZGgpbWDcc+qD3qHGJk4GA8x
 SnAwK4nwNjfnJwjxpiRWVqUW5ccXleakFh9ilOZgURLnvdB1Ml5IID2xJDU7NbUgtQgmy8TB
 KdXAtKyr6muOpcqWkxcW1Kx41Z1dYe/wxPXliXaFJV6Xpxls6purIS+62Ucz9n6ekcajnb8C
 LsywXdJy0vmpxuc/pSEPP++d05f5/sD53BjtFxGWGX68Ji/y/zK2hm3bwbdu8eOdMn5SP8OW
 VqXsu+R7d+Nu0erL3zf7yVXuPV2p/f/J+7oW6VrP1wyl+5gUG5l5jh01dmS3i4ja0moao2ex
 sav1q+1ixxs3V9RNZd41a83N4vWmRY2pT9SqX7UlX54wZ/KS7/PlzpddPNOQldZsU+vNdESW
 83HMI+YTDc79V7rddpiKcLtZZhl+11ra7HPC/ZeZXOeb7umbPI90zNC8rJxnIz3N3H/9Cvut
 bwKZlViKMxINtZiLihMBspf6CPMCAAA=
X-CMS-MailID: 20210409115515epcas5p4104bffd6a4072e61d976387915747182
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----Q-msIrZUiOdgFIXW25bFqaDApMD6FguveSXWgTQzG2RiKNeM=_667aa_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210409115515epcas5p4104bffd6a4072e61d976387915747182
References: <20210408193709.435939-1-its@irrelevant.dk>
 <20210408193709.435939-2-its@irrelevant.dk>
 <CGME20210409115515epcas5p4104bffd6a4072e61d976387915747182@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------Q-msIrZUiOdgFIXW25bFqaDApMD6FguveSXWgTQzG2RiKNeM=_667aa_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Thu, Apr 08, 2021 at 09:37:09PM +0200, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>For most commands, when issuing an AIO, the BlockAIOCB is stored in the
>NvmeRequest aiocb pointer when the AIO is issued. The main use of this
>is cancelling AIOs when deleting submission queues (it is currently not
>used for Abort).
>
>However, some commands like Dataset Management Zone Management Send
>(zone reset) may involve more than one AIO and here the AIOs are issued
>without saving a reference to the BlockAIOCB. This is a problem since
>nvme_del_sq() will attempt to cancel outstanding AIOs, potentially with
>an invalid BlockAIOCB since the aiocb pointer is not NULL'ed when the
>request structure is recycled.
>
>Fix this by
>
>  1. making sure the aiocb pointer is NULL'ed when requests are recycled
>  2. only attempt to cancel the AIO if the aiocb is non-NULL
>  3. if any AIOs could not be cancelled, drain all aio as a last resort.
>
>Fixes: dc04d25e2f3f ("hw/block/nvme: add support for the format nvm command")
>Fixes: c94973288cd9 ("hw/block/nvme: add broadcast nsid support flush command")
>Fixes: e4e430b3d6ba ("hw/block/nvme: add simple copy command")
>Fixes: 5f5dc4c6a942 ("hw/block/nvme: zero out zones on reset")
>Fixes: 2605257a26b8 ("hw/block/nvme: add the dataset management command")
>Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>Cc: Minwoo Im <minwoo.im@samsung.com>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme.c | 23 +++++++++++++++++++++--
> 1 file changed, 21 insertions(+), 2 deletions(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 94bc373260be..3c4297e38a52 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -470,6 +470,7 @@ static void nvme_req_clear(NvmeRequest *req)
> {
>     req->ns = NULL;
>     req->opaque = NULL;
>+    req->aiocb = NULL;
>     memset(&req->cqe, 0x0, sizeof(req->cqe));
>     req->status = NVME_SUCCESS;
> }
>@@ -3681,6 +3682,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
>     NvmeSQueue *sq;
>     NvmeCQueue *cq;
>     uint16_t qid = le16_to_cpu(c->qid);
>+    int nsid;
>
>     if (unlikely(!qid || nvme_check_sqid(n, qid))) {
>         trace_pci_nvme_err_invalid_del_sq(qid);
>@@ -3692,9 +3694,26 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
>     sq = n->sq[qid];
>     while (!QTAILQ_EMPTY(&sq->out_req_list)) {
>         r = QTAILQ_FIRST(&sq->out_req_list);
>-        assert(r->aiocb);
>-        blk_aio_cancel(r->aiocb);
>+        if (r->aiocb) {
>+            blk_aio_cancel(r->aiocb);
>+        }
>     }
>+
>+    /*
>+     * Drain all namespaces if there are still outstanding requests that we
>+     * could not cancel explicitly.
>+     */
>+    if (!QTAILQ_EMPTY(&sq->out_req_list)) {
>+        for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
>+            NvmeNamespace *ns = nvme_ns(n, nsid);
>+            if (ns) {
>+                nvme_ns_drain(ns);
>+            }
>+        }
>+    }
>+
>+    assert(QTAILQ_EMPTY(&sq->out_req_list));
>+
>     if (!nvme_check_cqid(n, sq->cqid)) {
>         cq = n->cq[sq->cqid];
>         QTAILQ_REMOVE(&cq->sq_list, sq, entry);
>--

LTM.
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

>2.31.1
>
>

------Q-msIrZUiOdgFIXW25bFqaDApMD6FguveSXWgTQzG2RiKNeM=_667aa_
Content-Type: text/plain; charset="utf-8"


------Q-msIrZUiOdgFIXW25bFqaDApMD6FguveSXWgTQzG2RiKNeM=_667aa_--

