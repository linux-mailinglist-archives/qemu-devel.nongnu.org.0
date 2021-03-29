Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F334D108
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 15:17:42 +0200 (CEST)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQrm1-0002uV-2U
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 09:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lQrjs-0002HU-Io
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 09:15:28 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:37764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lQrjo-0004VN-VS
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 09:15:28 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210329131515epoutp01fda32ecaae31a10a00a650975562b6ef~w0oCDl5Vx0656606566epoutp01U
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 13:15:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210329131515epoutp01fda32ecaae31a10a00a650975562b6ef~w0oCDl5Vx0656606566epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617023715;
 bh=u15vwhtkE9xFGHDSOSOebm7y2baZZSsyVXaH08r491E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D7ErwR+Nv3LWFC6w8C6+Gage9KpseTm5VVhh5zR0rtJj2m+kDAgCei7UParFMiPrj
 /L+LHHxdabamEeNbs7nOHMQATb2IOvvs+w4pmAoefWQZJPHKk1pQrGBi7JTSQa53P4
 wY5k03c5xhEGht6pe89SsGWh9XEO3nJJDDQh0Yl4=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210329131514epcas5p3d9a9c3324784f8819d434d94998d3046~w0oBUi88R1157811578epcas5p3R;
 Mon, 29 Mar 2021 13:15:14 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E3.BF.41008.2E2D1606; Mon, 29 Mar 2021 22:15:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210329124718epcas5p4781757a155f3fd07f8280c388f6fc073~w0PoJdr9J2365923659epcas5p4c;
 Mon, 29 Mar 2021 12:47:18 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210329124718epsmtrp26a45abc95589cad0965422a9b3784399~w0PoIp-2k2048620486epsmtrp2k;
 Mon, 29 Mar 2021 12:47:18 +0000 (GMT)
X-AuditID: b6c32a4b-661ff7000001a030-3d-6061d2e2a51c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 81.EA.08745.65CC1606; Mon, 29 Mar 2021 21:47:18 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210329124717epsmtip1052ce40d16d86bcb786e9b314623529c~w0PnCzZXr2782827828epsmtip12;
 Mon, 29 Mar 2021 12:47:17 +0000 (GMT)
Date: Mon, 29 Mar 2021 18:14:10 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 2/2] hw/block/nvme: fix ref counting in nvme_format_ns
Message-ID: <20210329124410.GA20319@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210322120944.225643-3-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsWy7bCmlu6jS4kJBsu361nsP/iN1eJk4x5W
 i0mHrjFaLLmYajHvlrLFrHftbBbHe3ewOLB7nNtxnt1j06pONo8n1zYzebzfd5XNo2/LKsYA
 1igum5TUnMyy1CJ9uwSujO+9J9gKrvFXfD97gb2BsYW3i5GTQ0LARGLbqdlMXYxcHEICuxkl
 rr2ZwQ7hfGKUeNPWyAzhfGaUmNh8iwWmpX/BZEaIxC5GiU2fpkL1v2KU+P7nODNIFYuAqkTX
 isdMIDabgJHE7LdvGEFsEQEViaf/9oJNYhbYwSjxahVYXFjAX+L2py6wOK+AvsSkDbvYIGxB
 iZMzn4DFOQUsJB5uvgw2U1RAWeLAtuNMEBf9ZJfYcs4VwnaR+H/jJxuELSzx6vgWdghbSuLz
 u71AcXYgu1ricBHIyRICHYwSxy5vgCq3l/j3bBrQORxAp2VI/D3uDBGWlZh6ah0TxMV8Er2/
 n0Bt5ZXYMQ/GVpNYcOs71CYZiZl/brNC2B4Sk/e8BftQSGAno8Sfm5wTGOVnIXlsFsK2WWAb
 rCQ6PzSxQoSlJZb/44AwNSXW79JfwMi6ilEytaA4Nz212LTAOC+1XK84Mbe4NC9dLzk/dxMj
 OAFpee9gfPTgg94hRiYOxkOMEhzMSiK8wgcSE4R4UxIrq1KL8uOLSnNSiw8xSnOwKInz7jB4
 EC8kkJ5YkpqdmlqQWgSTZeLglGpgkpa3rlkhG5T+7PGnhFwTFudXBV4XJt/pNzeyVNhuyrNz
 6UTJCdc6F8y6eJ2jML/0/45sk7AtC1YE2Ux6I3Am/ijvnc3tPoKsepmth7hWSG/71TD/q/Er
 tRmNL0q+xfpErn364IZrZtin1wfVny6daMTmaBq5NMpPVCjwS+L0tu54/gd7v632Kv72cb7v
 Zu2lizheBmxIs+46P3mJnP++qGMaISI5HE9/XN5QvWnSxcsl/3vswycnf/72jetrTQ6noMiq
 4luH3sdvLDu3yTe+qW7dJnZ1l+RcwTkfJFMtU5Y/2rbxtwPbiqc6bbvZF31nnJJv9DZjxapt
 d7ZZfZLsUSh41RklOCNCUrd5IzODqxJLcUaioRZzUXEiAImWaGyvAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsWy7bCSnG7YmcQEg6ntUhb7D35jtTjZuIfV
 YtKha4wWSy6mWsy7pWwx6107m8Xx3h0sDuwe53acZ/fYtKqTzePJtc1MHu/3XWXz6NuyijGA
 NYrLJiU1J7MstUjfLoEr48nriIIO3opl13vYGhgvcHUxcnJICJhI9C+YzNjFyMUhJLCDUaJv
 7zlmiISMxK9TU6FsYYmV/56zQxS9YJTYtOkoI0iCRUBVomvFYyYQm03ASGL22zdgcREBFYmn
 //aygDQwg0zd2P+YFSQhLOArcelEM5jNK6AvMWnDLjYQW0ggVWLx3C9MEHFBiZMzn7CA2MwC
 ZhLzNj8EuoIDyJaWWP6PAyTMKWAh8XDzZbByUQFliQPbjjNNYBSchaR7FpLuWQjdCxiZVzFK
 phYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBEeAltYOxj2rPugdYmTiYDzEKMHBrCTCK3wg
 MUGINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGpllTfGaV
 qucLLk6VLPIW4E/6npiluFEq4dKj544r4h9JdHbtr3q7ST31xoob6RGzjljxfnyUc1/AZLKK
 ypmyHvuuIjHdR3P7T17+tKjj6Ybr5+PDky7Vi88KfP86mVX7XKcnI3fxygk58U1T+phmLkiZ
 6Gd8LYB/6b/1is2ZTeu9lkoq9Hmo5DS/nRc7Sd2sPseCQ6WA16iCX1MhwOifVQTXrstv56R4
 /TLi3bJj5haXUqEH6/o+phjrCtbmvkiz0JMxrJ+3WWnRuuMGkkUbePe0f/m75oWlk9hiLz2u
 6J5r/EeUi09Eiusck3H05PA2arzwINuxdttbpvX+iS4uK4/fZmj2Fjx+VXt2ZpQSS3FGoqEW
 c1FxIgBfeGPx7wIAAA==
X-CMS-MailID: 20210329124718epcas5p4781757a155f3fd07f8280c388f6fc073
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----zZPrerBOfMdOy95ifUdkAfrdA0Rx2S3BRU02kBSzk4lUdqbu=_141d5_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210329124718epcas5p4781757a155f3fd07f8280c388f6fc073
References: <20210322120944.225643-1-its@irrelevant.dk>
 <20210322120944.225643-3-its@irrelevant.dk>
 <CGME20210329124718epcas5p4781757a155f3fd07f8280c388f6fc073@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------zZPrerBOfMdOy95ifUdkAfrdA0Rx2S3BRU02kBSzk4lUdqbu=_141d5_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Mon, Mar 22, 2021 at 01:09:44PM +0100, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Max noticed that since blk_aio_pwrite_zeroes() may invoke the callback
>before returning, the callbacks will never see *count == 0 and thus
>never free the count variable or decrement num_formats causing a CQE to
>never be posted.
>
>Coverity (CID 1451082) also picked up on the fact that count would not
>be free'ed if the namespace was of zero size.
>
>Fix both of these issues by explicitly checking *count and finalize for
>the given namespace if --(*count) is zero. Enqueing a CQE if there are
>no AIOs outstanding after this case is already handled by nvme_format()
>by inspecting *num_formats.
>
>Reported-by: Max Reitz <mreitz@redhat.com>
>Reported-by: Coverity (CID 1451082)
>Fixes: dc04d25e2f3f ("hw/block/nvme: add support for the format nvm command")
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme.c | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 6842b01ab58b..c54ec3c9523c 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -5009,9 +5009,15 @@ static uint16_t nvme_format_ns(NvmeCtrl *n, NvmeNamespace *ns, uint8_t lbaf,
>
>     }
>
>-    (*count)--;
>+    if (--(*count)) {
>+        return NVME_NO_COMPLETE;
>+    }
>
>-    return NVME_NO_COMPLETE;
>+    g_free(count);
>+    ns->status = 0x0;
>+    (*num_formats)--;
>+
>+    return NVME_SUCCESS;
> }
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>
> static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
>-- 
>2.31.0
>
>

------zZPrerBOfMdOy95ifUdkAfrdA0Rx2S3BRU02kBSzk4lUdqbu=_141d5_
Content-Type: text/plain; charset="utf-8"


------zZPrerBOfMdOy95ifUdkAfrdA0Rx2S3BRU02kBSzk4lUdqbu=_141d5_--

