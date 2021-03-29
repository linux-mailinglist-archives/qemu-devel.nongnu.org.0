Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F7F34CFA0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 14:02:12 +0200 (CEST)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQqaw-0004KM-RG
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 08:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lQqYE-0003cH-IB
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:59:22 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:19241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lQqYA-0003Yh-UH
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:59:22 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210329115903epoutp04f23e57d590180d0e60765e7d18dda05d~wzlf7_x4Z1373213732epoutp04v
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 11:59:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210329115903epoutp04f23e57d590180d0e60765e7d18dda05d~wzlf7_x4Z1373213732epoutp04v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617019143;
 bh=bgTpmRQ+hZgMrEl8CaIQOuTImTkXDnsVsPH835P2SNs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Un4cWJzojPU1Alcp5ZRYVVr1J1UktUXfcKXCgK9+TD/4E4+7YUS1vOcgvYOvtYAqd
 C/MfpbTSZz2alY7W4lAVeE0MGcjse2zs7CncB8he84jGRuWg1LT8681FJJ4Pu4r5nP
 PDIlwkC9/vwYkocC5DBZRoWFpgpt9iiyriOINlFY=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210329115902epcas5p4c61e73fbbf48170d8a88052b37056dd1~wzlfcm2RI2505525055epcas5p4g;
 Mon, 29 Mar 2021 11:59:02 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 82.19.41008.601C1606; Mon, 29 Mar 2021 20:59:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210329112015epcas5p4dc86c66a4f27d13d3689923d381c5fa6~wzDnXEGjr0313403134epcas5p4m;
 Mon, 29 Mar 2021 11:20:15 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210329112015epsmtrp1ee1c05cc1859f9c4f9ae664b77b8c8c3~wzDnWVBKo0073900739epsmtrp1Y;
 Mon, 29 Mar 2021 11:20:15 +0000 (GMT)
X-AuditID: b6c32a4b-661ff7000001a030-60-6061c106ed27
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AB.B5.33967.EE7B1606; Mon, 29 Mar 2021 20:20:14 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210329112013epsmtip2691d04008c393170f33374ce0a5abecc~wzDmNZGHG1012710127epsmtip2d;
 Mon, 29 Mar 2021 11:20:13 +0000 (GMT)
Date: Mon, 29 Mar 2021 16:47:07 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 1/2] hw/block/nvme: fix resource leak in nvme_dif_rw
Message-ID: <20210329111707.GC17390@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210322120944.225643-2-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BMcRTH53f33ru3zXKrpaPQ2MS02MXG3DGGDKYdO6PGeL/qqjuFys6u
 92OmsNWGqJG0qEaE9UpWNmzaXaw1KBLyXCYNW5SGjFfJ3prx3+d8v+fM+f7O/CiBfzERRK1K
 XcdpU9lkKSnCKx3ho8aSNjZu3Cl7BHPD1kkwrvTrBJNnf4KY4w85puh5KGP8nEkyzr0WPFKo
 emCpFaoqTAZS1fTkEqZqq24gVTlmE4ohloimJHDJqzZwWsXUOFFS/Us9qXkq2lRlfYjSUDeV
 jXwooCOgscIpzEYiyp++huBr9iWSLzoQtN1z9DqdCPTlmahvpC33HMYbVgRXHh/r7fIgqDEZ
 egqKwukwcN/27iDpCXD4U6t3WEKPgPddVvwfC2gLAo/JqwfQanhzSO/VxbQCvmRlEjz7gauw
 yav70AzknHkm/McD6VCoqXR6QwCdTsG9qpsEn24mfHv2UcBzAHicZiHPQfBxX0YPC3t4Kzi0
 /GgWgtv15STfMg26mg8iPlsSmF4V47w+FPLvnsd4vT/s/dWE8boYLEV9PBJKnn/vXTUECn+/
 6I2jgp8HzhH8faoQHKprEO5HIcb/3mb8bx/Pk8HQvoMw9pxRQAfDyS6Kx3C4cFVRgggTGsxp
 dCmJnG6iRpnKbZTr2BTd+tREefzalArk/UMytQW9c7fL7QijkB0BJZBKxAE1bJy/OIHdvIXT
 ro3Vrk/mdHYUTOHSQLFlnDvWn05k13FrOE7DaftcjPIJSsPmvVUU4DMCp4/t7AgbtkGiyZmz
 7Jc0flPBn2bRQlJbMOxoWg72WDF/dYJZ07H6x6g1eb7Rd1CWa6RAb50QuWJSNVY7SR1itocq
 JxaTWd/ksqWQMrN7xFNJbP9X+WVuW+3p0J1KmV/eRZkn6sMJ+e/4uZdLM5b5Tr4V5VJ+r1he
 FaKJHhpJZywwcPLhUa1hzn5M4ejB4baV+K6M3WcV7dGNdbmtuZ9LFnb7OfTGM8eMw6nGlgF1
 InVp+fhZeGVB4cCY9MCTrO/7R9Prpn11VA+K+LHx5vaWsjkPLttKfZuj3Ef21AcrXS0Sl7XM
 sC2B2rzo/mvzG/aKZ3bnwTHNixvy1VJcl8SOlwm0OvYvxqIkwbIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsWy7bCSvO677YkJBu1vjS32H/zGanGycQ+r
 xaRD1xgtllxMtZh3S9li1rt2NovjvTtYHNg9zu04z+6xaVUnm8eTa5uZPN7vu8rm0bdlFWMA
 axSXTUpqTmZZapG+XQJXxuQXO9kKOjkqeu7cZGpgPM3WxcjJISFgIvF+4lqmLkYuDiGB3YwS
 U2aeY4dIyEj8OjWVGcIWllj57zk7RNELRomHF9+ydDFycLAIqEo8OMYBUsMmYCQx++0bRhBb
 REBF4um/vSwg9cwCOxglNvY/ZgVJCAt4S9yf0coCYvMK6Et87GgHiwsJpEos+7iJDSIuKHFy
 5hOwGmYBM4l5mx8yg+xiFpCWWP4PbBengIVE3+obYHeKCihLHNh2nGkCo+AsJN2zkHTPQuhe
 wMi8ilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOAK0NHcwbl/1Qe8QIxMH4yFGCQ5m
 JRFe1tOxCUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUw
 rZg+vffIoSfs7qcPrvO71eFpsfOUOvf/Q08cMm1/9FkkBMv0l/6eG71gqlnJXZGrr7IaZltc
 FZcyNT1WsHXb/6/VIdErL4tq8XPnFDmHpyk+9F7DkfD5w/2L6juZq+KVf3v7HH74cbm+Rcat
 nNdlewzM/asbN7ssP1gu+elV3qq/Stmhz9dJJk+dPn9ep82fjsM5ZmcFmEVdXWWtl7SfdhVu
 bi/VVF9/Ljz00PrLZ6quhrBLPvrHyxM899u0vexnvoUebHr/OPw3Z72O4PVLXqHtj9IY3t36
 FarU9J5/I8//rsi53jGblzmL7+6bwKzudNcuwetI4/06hxfh4d0Mvxk/9j8VWKbD31LxLMpY
 iaU4I9FQi7moOBEAIgZx++8CAAA=
X-CMS-MailID: 20210329112015epcas5p4dc86c66a4f27d13d3689923d381c5fa6
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_13db3_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210329112015epcas5p4dc86c66a4f27d13d3689923d381c5fa6
References: <20210322120944.225643-1-its@irrelevant.dk>
 <20210322120944.225643-2-its@irrelevant.dk>
 <CGME20210329112015epcas5p4dc86c66a4f27d13d3689923d381c5fa6@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout4.samsung.com
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

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_13db3_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Mon, Mar 22, 2021 at 01:09:43PM +0100, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>If nvme_map_dptr() fails, nvme_dif_rw() will leak the bounce context.
>Fix this by using the same error handling as everywhere else in the
>function.
>
>Reported-by: Coverity (CID 1451080)
>Fixes: 146f720c5563 ("hw/block/nvme: end-to-end data protection")
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme-dif.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
>index 2038d724bda5..e6f04faafb5f 100644
>--- a/hw/block/nvme-dif.c
>+++ b/hw/block/nvme-dif.c
>@@ -432,7 +432,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
>
>     status = nvme_map_dptr(n, &req->sg, mapped_len, &req->cmd);
>     if (status) {
>-        return status;
>+        goto err;
Looks good to me.
>     }
>
>     ctx->data.bounce = g_malloc(len);
>-- 
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>2.31.0
>
>

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_13db3_
Content-Type: text/plain; charset="utf-8"


------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_13db3_--

