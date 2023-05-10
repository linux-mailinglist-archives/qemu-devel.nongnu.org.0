Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344856FD92A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:24:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwf6Q-0005rJ-0S; Wed, 10 May 2023 04:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwf6M-0005qz-QM
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:23:10 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwf6J-0007gI-Ll
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:23:10 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230510082301euoutp01bce6543df3469359bd29f16b68a9d81f~dupQ-mukl2212822128euoutp01H
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:23:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230510082301euoutp01bce6543df3469359bd29f16b68a9d81f~dupQ-mukl2212822128euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683706981;
 bh=RAdTRgkb5cVy6FP5ribk2kxIlvYd4xCVAvY0Bobfcq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sGoryFFxJCxRsS5ynLiSS5kPuO5gmzqEfG1o/VAEFrfV8ebO7vuKTpjJA5tyMu3qO
 QXhv0qDv+NGFbjLGVZaETPyfFILNLlJ9DLmqcjvDSfxwHRiXJRDwoaPVF5baDiWRls
 ew5uZh1SOacO8HnmybO3IRfW+MpR1ZRB8lwNmJhU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230510082301eucas1p239e59ce8266b620e5f1477651ea7c95b~dupQnH2AE2230922309eucas1p2i;
 Wed, 10 May 2023 08:23:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AE.F5.37758.5645B546; Wed, 10
 May 2023 09:23:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230510082300eucas1p2638a9dadc30c51f749fee6edf2377302~dupQMFC921626316263eucas1p2N;
 Wed, 10 May 2023 08:23:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230510082300eusmtrp26224d6aa76923f6c19534a8351d92bed~dupQLKKj61369213692eusmtrp2T;
 Wed, 10 May 2023 08:23:00 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-0e-645b5465dda3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 57.B3.14344.4645B546; Wed, 10
 May 2023 09:23:00 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230510082300eusmtip1d839c289fb50ee3caa6f296cbb6381d3~dupPrqVtG2198721987eusmtip11;
 Wed, 10 May 2023 08:23:00 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v5 1/6] igb: remove TCP ACK detection
Date: Wed, 10 May 2023 10:22:49 +0200
Message-Id: <20230510082254.1036-2-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduznOd3UkOgUg/YHHBafT61lt1h26TOT
 ReP8OawWW6/+YLc43ruDxaJ30wsmBzaPE28PsnpceHSO2ePJtc1MHu/3XWXz6NuyijGANYrL
 JiU1J7MstUjfLoEr49urTSwFt1kr3l25yNTAuIeli5GTQ0LAROLC/J1MXYxcHEICKxglDi3d
 ygrhfGGUuLd4ARtIlZDAZ0aJq28SYTrWzTrLChFfDlS0zgWioZ1Jon35RHaQBJuAmcSjL/OA
 ijg4RASMJT62i4OEmQVSJY7+OQi2WVjAVGLSzSNgc1gEVCU2zT3JDGLzCjhJTPi/Ceo6eYmZ
 l76DjeQUcJbYO6eVFaJGUOLkzCcsEDPlJZq3zmYGuUFCYC2HxKoHb9ggml0k1l1ZDzVIWOLV
 8S3sELaMxP+d85kg7HKJn2e3sUM0tzBK7Jk6GarIWuLS1p9gDzALaEqs36UPEXaUmL3tJSNI
 WEKAT+LGW0GIG/gkJm2bzgwR5pXoaBOCqNaR+LZpJhtEWEpi4Y06iLAHUHg2+wRGxVlInpmF
 5JlZCGsXMDKvYhRPLS3OTU8tNs5LLdcrTswtLs1L10vOz93ECEwup/8d/7qDccWrj3qHGJk4
 GA8xSnAwK4nweodGpQjxpiRWVqUW5ccXleakFh9ilOZgURLn1bY9mSwkkJ5YkpqdmlqQWgST
 ZeLglGpgSptuWfPrT+KZmeHtvN+Tn157r+4++faTW7Kcpt+VfZ/ImYQtvL/Z7cFKxtjEb2pa
 LOKG0Rsm/Fm2e+meK9uMtySKLo3/FyZu+8W9JXb3fmcO/k8n4uVlH+yaN/UoB4/+ec0JxhmP
 I4sk55zw/j/Rcq6J5NorVyfvZWZfE2X2v2Fm0yvG+v/563YUPtbaqh71WYFl496KO1ef/TcW
 4VFx0UrYtP5ewbQXsnOyZ6x1mBbySHTqHycJ5taS91e/ntzRc+LZ6s5NaWebfOWl/Br+XHhs
 efN51tLp4mxFs4IjlFaaOsebxLLz3Gr667jnzE13nZU5PNefH5QtiN8nu8ns9rYjeYnSd7+u
 KpkR2rjN84YSS3FGoqEWc1FxIgCiLi1rnQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsVy+t/xu7opIdEpBhMuaVp8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1ig9
 m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jG+vNrEU
 3GateHflIlMD4x6WLkZODgkBE4l1s86ydjFycQgJLGWUuH1jGTNEQkpiX89/dghbWOLPtS42
 iKJWJonpW7YxgiTYBMwkHn2ZB9TNwSEiYCrxbK8kSJhZIFPi9Kt9bCC2MFB40s0jrCA2i4Cq
 xKa5J8Hm8wo4SUz4vwnqCHmJmZe+g+3iFHCW2DunFaxeCKhm1oo1UPWCEidnPmGBmC8v0bx1
 NvMERoFZSFKzkKQWMDKtYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIyFbcd+btnBuPLVR71D
 jEwcjIcYJTiYlUR4vUOjUoR4UxIrq1KL8uOLSnNSiw8xmgLdPZFZSjQ5HxiNeSXxhmYGpoYm
 ZpYGppZmxkrivJ4FHYlCAumJJanZqakFqUUwfUwcnFINTA6+hx3fG2jN0xBSCrM7e5Bp6l3h
 jX+dD/V7v9viEr1z5sZc6+KIvdYnFKYXnTou+sr6Zv6kqqV7tu2bcCuwxe7g6cXs8pr3vHPf
 p3Xvq9pXF2kVtUGtyErjUYBmyruzmWet10xtVFj57JWzXeXXSbHKyRXhhX0zdXe+9Nf4Ksjw
 Z+s7zb1tCk45XZXHHh+Q2L9v51fdFS5hbnXcp54UelXzHKj8ECnE1D/LWCMxVe7llRBfTa31
 D8VfCN12E33xqe7tnC2rXvye9nWzFr/nj8nqTE+5bfakWqddbHmYE+b7/2nOmmbZTYtLXnle
 lQkK0XZRX35O6p1y2JUWT9vDHHuZQ+46ClxeZPdOyJQ9UomlOCPRUIu5qDgRAFEAd8oOAwAA
X-CMS-MailID: 20230510082300eucas1p2638a9dadc30c51f749fee6edf2377302
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230510082300eucas1p2638a9dadc30c51f749fee6edf2377302
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230510082300eucas1p2638a9dadc30c51f749fee6edf2377302
References: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
 <CGME20230510082300eucas1p2638a9dadc30c51f749fee6edf2377302@eucas1p2.samsung.com>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

TCP ACK detection is no longer present in igb.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/igb_core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 96b7335b31..012eb1e1b9 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1327,11 +1327,6 @@ igb_build_rx_metadata(IGBCore *core,
             trace_e1000e_rx_metadata_ip_id(*ip_id);
     }
 
-    if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP && net_rx_pkt_is_tcp_ack(pkt)) {
-        *status_flags |= E1000_RXD_STAT_ACK;
-        trace_e1000e_rx_metadata_ack();
-    }
-
     if (pkt_info) {
         *pkt_info = rss_info->enabled ? rss_info->type : 0;
 
-- 
2.25.1


