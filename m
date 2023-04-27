Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CDB6F0471
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:48:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przAL-0004T6-8f; Thu, 27 Apr 2023 06:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1przAJ-0004Sk-OP
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:47:55 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1przAH-00030D-3t
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:47:55 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230427104750euoutp02ae79a727e783af8dee73c7f91dee04fc~ZxO-ddiKK3090930909euoutp02j
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 10:47:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230427104750euoutp02ae79a727e783af8dee73c7f91dee04fc~ZxO-ddiKK3090930909euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682592470;
 bh=suwrbQ2kznGTM7pmsVke26HsW9G8MBGkDUn64kv5MG0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=C5SPuYX6fPSeKo39TGTpxYDcTQfKgd/QyPq/0UlNfB+fOHB8WuV0wHaNPQS3/hXDo
 NWFWqguxpXyAfIp9+FcT4b/9FVriPDi7ijgQZMHVARG8YcY5quDIRIaAkSTFMFE/1W
 f5UmXmjMU1FYlcKIcolNBQVOAfcWcY/zSfUjrfwo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230427104750eucas1p21e48c1d58b920dea03d9d038064e8652~ZxO-Q9imc3016130161eucas1p2P;
 Thu, 27 Apr 2023 10:47:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E5.B8.35386.5D25A446; Thu, 27
 Apr 2023 11:47:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230427104749eucas1p19480869211eed34117a518f3c3800946~ZxO_-_U810468804688eucas1p1p;
 Thu, 27 Apr 2023 10:47:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230427104749eusmtrp19020c7bdb6056a6171d8c5e1a0f1f5b3~ZxO_-ZBcU1565915659eusmtrp1I;
 Thu, 27 Apr 2023 10:47:49 +0000 (GMT)
X-AuditID: cbfec7f4-cdfff70000028a3a-f3-644a52d5e17d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D3.FF.14344.5D25A446; Thu, 27
 Apr 2023 11:47:49 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230427104749eusmtip14f616f74df0b954878afeff14689c517~ZxO_fX6jS2649026490eusmtip1m;
 Thu, 27 Apr 2023 10:47:49 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v3 0/2] igb: packet-split descriptors support
Date: Thu, 27 Apr 2023 12:47:41 +0200
Message-Id: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduzned1rQV4pBv/amCw+n1rLbrHs0mcm
 i8b5c1gttl79wW5xvHcHi0XvphdMDmweJ94eZPW48Ogcs8eTa5uZPN7vu8rm0bdlFWMAaxSX
 TUpqTmZZapG+XQJXxrmb3SwFv1krlp9rYGtgvMnSxcjJISFgInHx0mSmLkYuDiGBFYwSHfO3
 s0I4XxglNt24zQ7hfGaUODXlPyNMy+EbR5ghEssZJRbcWA7V0s4kcWP/erAqNgEziUdf5gEl
 ODhEBIwlPraLg4SZBVIljv45yAISFhawlVjwPhwkzCKgKrF81Ul2kDCvgJPEp8lBEKvkJWZe
 +s4OYvMKCEqcnPmEBWKKvETz1tlgJ0gIzOWQWP/8O9Q7LhJLtz+DulNY4tXxLewQtozE6ck9
 UDXlEj/PbmOHaG5hlNgzdTJUkbXEpa0/wU5mFtCUWL9LHyLsKPGg5TkTSFhCgE/ixltBiBv4
 JCZtm84MEeaV6GgTgqjWkfi2aSYbRFhKYuGNOoiwh8T9Fd/A9ggJxEpMfjeBZQKjwiwkj81C
 8tgshBMWMDKvYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECEwup/8d/7KDcfmrj3qHGJk4
 GA8xSnAwK4nw8la6pwjxpiRWVqUW5ccXleakFh9ilOZgURLn1bY9mSwkkJ5YkpqdmlqQWgST
 ZeLglGpgSu1JnZV79mPapDS7pwsVd7nFG1jNXiWpL85zmGFKxcdz64SaQ3n6N3S0HFKwuRD4
 8jVPYp3iw/XP9Z9tW1sRWnd0K9vE/XXLxF/FLfI9c3R11RuFTy4JC0R9JvzRyrM0v+ln/qzD
 f9HxU8suVPz/taxDpFjlr5mS4LmnqrmXp+gtWxm/ZtW6tgfLb6sdi9wYtMVXdk7Vgjn15n+T
 Wo9wHoqIc81Ksp3uWvv/atNkHTXfucwF106k3rdaqH90U47qcnv9I/V/Wy/yzkpPlvJxSOHY
 lCmp2bttdfunBcdeXDrzbodg+3neHM/60hkmny7trN/2LfnqseyFtalHp65XP3t6UeHTv995
 DM/aR77czKvEUpyRaKjFXFScCACKdLu/nQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsVy+t/xu7pXg7xSDGZd07X4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GedudrMU
 /GatWH6uga2B8SZLFyMnh4SAicThG0eYuxi5OIQEljJKfP/7nREiISWxr+c/O4QtLPHnWhcb
 RFErk8T1H82sIAk2ATOJR1/mAdkcHCICphLP9kqChJkFMiVOv9rHBhIWFrCVWPA+HCTMIqAq
 sXzVSXaQMK+Ak8SnyUEQ0+UlZl76DraJV0BQ4uTMJywQU+QlmrfOZp7AyDcLSWoWktQCRqZV
 jCKppcW56bnFRnrFibnFpXnpesn5uZsYgWG97djPLTsYV776qHeIkYmD8RCjBAezkggvb6V7
 ihBvSmJlVWpRfnxRaU5q8SFGU6DzJjJLiSbnAyMrryTe0MzA1NDEzNLA1NLMWEmc17OgI1FI
 ID2xJDU7NbUgtQimj4mDU6qBabK0WuC55EMXry1bWr70s11WjvsrjiiJQ+W593zafuhdf89/
 YH1AwsXfx03/urxQOLNOqMd1zqxdj7s5JpUdfaY5Rdj9wuQWBZ3Nu5aXtRrtycuqWu9wwpfL
 8vx39/9BG/X+BUw41XvvlZxfZEj//Uf183Nm8+l2NESUmPhv0Th35/b3Hevcs+J06tz41BTm
 LN//esWyo+8rnm/9Y+Pifn5pyOdcMbF0d9eZR4UZfl4MS1/4KLL59nQzLdO+j6o3T8xxl2n4
 9m0T08rN3Fbz9p1YO7HG8v1E9ZsTD2hwCimX5l/SerYraXG/b7r9j0DuiqXsL8I5VvB3rlSb
 xKs6h315p2TxGqPk9qyZuxrP3VdiKc5INNRiLipOBAAZCGRi9AIAAA==
X-CMS-MailID: 20230427104749eucas1p19480869211eed34117a518f3c3800946
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230427104749eucas1p19480869211eed34117a518f3c3800946
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230427104749eucas1p19480869211eed34117a518f3c3800946
References: <CGME20230427104749eucas1p19480869211eed34117a518f3c3800946@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Based-on: <20230423041833.5302-1-akihiko.odaki@daynix.com>
("[PATCH v3 00/47] igb: Fix for DPDK")

This series of patches introduces packet-split RX descriptors support. This
feature is used by Linux VF driver for MTU values from 2048. First patch makes
RX descriptors handling cleanup. Second patch introduces feature itself.

Tomasz Dzieciol (2):
  igb: RX descriptors handling cleanup
  igb: packet-split descriptors support

 hw/net/e1000e_core.c     |  18 +-
 hw/net/e1000x_regs.h     |   1 +
 hw/net/igb_core.c        | 728 ++++++++++++++++++++++++++++-----------
 hw/net/igb_regs.h        |  18 +-
 hw/net/trace-events      |   6 +-
 tests/qtest/libqos/igb.c |   3 +
 6 files changed, 567 insertions(+), 207 deletions(-)

-- 
2.25.1


