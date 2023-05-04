Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A316F7144
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:41:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoG-0006qh-R8; Thu, 04 May 2023 13:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYjt-0003pW-7s
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:17 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYjn-0002u3-45
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:16 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230504131105euoutp02bdfcf5d634167f545c07ddb53b573627~b8tErDGvR2076320763euoutp02V
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 13:11:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230504131105euoutp02bdfcf5d634167f545c07ddb53b573627~b8tErDGvR2076320763euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683205865;
 bh=NU1S8yAH0VHriTxkk8YKUi9BcpVXbgt9qIYFwdYuFkQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vDya2nJkUrgPqplYpMyWKuGHLh44o1oQk0Na9uZz+3w0u028rwSXWnKirgApACZWM
 cp6wFvHZPrCUfyj1NXsr6m4IauYEpOt9DQPkYadjNG3CcbF4BQxeFidcsyBss/JKnK
 K/wfEPUoeiK9bPvOI3T67H/bJH/4IJS9KNUhPRVk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230504131105eucas1p25cccd0b59e23775e95de1154c575b1c4~b8tEcNMvF1552215522eucas1p23;
 Thu,  4 May 2023 13:11:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 04.24.42423.9EEA3546; Thu,  4
 May 2023 14:11:05 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230504131105eucas1p1cc725f17aa42262be597f5ee81aca037~b8tEJYMKK0729907299eucas1p1t;
 Thu,  4 May 2023 13:11:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230504131105eusmtrp125d2ab34c9ba6edb1578edcbf11c1dbb~b8tEI0nVk2656226562eusmtrp1V;
 Thu,  4 May 2023 13:11:05 +0000 (GMT)
X-AuditID: cbfec7f2-25927a800002a5b7-a5-6453aee97e75
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8D.0E.14344.9EEA3546; Thu,  4
 May 2023 14:11:05 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230504131104eusmtip1516d695ac1383589b08a650e1dfeb74a~b8tDkH9UJ1907819078eusmtip1D;
 Thu,  4 May 2023 13:11:04 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v4 0/5] igb: packet-split descriptors support
Date: Thu,  4 May 2023 15:10:50 +0200
Message-Id: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduzned2X64JTDPY1q1l8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1igu
 m5TUnMyy1CJ9uwSujBPrlrIXtLBX3L9e1cB4nLWLkZNDQsBEomn2BHYQW0hgBaPE+hfuXYxc
 QPYXRolPs04yQTifGSUutN5ih+n4e/Y4C0RiOaPE/cmP2SCcdiaJL7//MINUsQmYSTz6Mg9o
 BweHiICxxMd2cZAws0CqxNE/B1lAbGEBW4n7F+exgdgsAqoSp/cfAovzCjhL/P3bxwaxTF5i
 5qXv7BBxQYmTM5+wQMyRl2jeOpsZZK+EwEwOiZ1PXjNBNLhITN2+kBnCFpZ4dXwL1NUyEqcn
 97BA2OUSP89uY4dobmGU2DN1MlSRtcSlrT/BjmYW0JRYv0sfIuwoceDMGSaQsIQAn8SNt4IQ
 N/BJTNo2nRkizCvR0SYEUa0j8W3TTDaIsJTEwht1EGEPiR2blrBAAjpWYva+vcwTGBVmIXls
 FpLHZiGcsICReRWjeGppcW56arFhXmq5XnFibnFpXrpecn7uJkZgcjn97/inHYxzX33UO8TI
 xMF4iFGCg1lJhPdDoV+KEG9KYmVValF+fFFpTmrxIUZpDhYlcV5t25PJQgLpiSWp2ampBalF
 MFkmDk6pBqaspad/2s9aUbRno7PS9Utlr8pmNvSxiGco3MuTklw1ocgmx17x3IV2Z3ezwjiN
 ipN2r3M3SQUKL9749Uuzf331x7gHUat/1KbNP3Xtevtp8auXl5gdnr+N+bVkH4OJ/hLnxIPf
 f75oZ7VVrq6+4ijSs63i+3eTDQ8iX/ObB16MuqpcE8D3WSv3rHjy17ajATHaDu6rdIXn3iq9
 sP+T6wmm8Dmv1x/Le3PLX6/Ox8tqk9/RKzN/VKS//qbZUrzg4+eTjiLvm89cv8TJmNb2V4ix
 K81n7b7Zt37bbg+899juZ4n/l8wkxaDUnBOJFaYCb3a/XlWfMCc3o2Lxf8PcKzKFQr59onFB
 9Rpn/2yQnK7EUpyRaKjFXFScCADsn2LwnQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsVy+t/xu7ov1wWnGMxv4bf4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GSfWLWUv
 aGGvuH+9qoHxOGsXIyeHhICJxN+zx1m6GLk4hASWMkq0HdrIBJGQktjX858dwhaW+HOtiw2i
 qJVJ4uHycywgCTYBM4lHX+YBTeLgEBEwlXi2VxIkzCyQKXH61T42EFtYwFbi/sV5YDaLgKrE
 6f2HwFp5BZwl/v7tY4OYLy8x89J3doi4oMTJmU9YIObISzRvnc08gZFvFpLULCSpBYxMqxhF
 UkuLc9Nzi430ihNzi0vz0vWS83M3MQIDe9uxn1t2MK589VHvECMTB+MhRgkOZiUR3g+FfilC
 vCmJlVWpRfnxRaU5qcWHGE2B7pvILCWanA+MrbySeEMzA1NDEzNLA1NLM2MlcV7Pgo5EIYH0
 xJLU7NTUgtQimD4mDk6pBiYf0azZbxLlxf+/yb+/Rdf6dAjvy7Yb1+91SrtMYPFecmVD4AWh
 Be7qhunzAjT2m4atZPi5maf+Y7rTw1imZw5/P50LLb9UY/jaNurN32nhG8oY97FmuguJ/fAp
 FFkyme2HSlborhC9ydzTbp653NIq937WvImyPHK/bvuGHYnvOHVwy4JvbRuvdnapvI9LOD9f
 qCx/2rp9UnWTX9//ZnkvbF1v6yHuIuntx61tL204bcW21/Twjt4ZL/7cmsq81z75mkR3QJ/i
 B4kp6rFyjXfy+lq3XWVY2Vrz5KhshErqYQWN66+sjzz2tLfr7Q14yyE08y17dZ9ttdg1sW1n
 r7R+YP95mN/r+ESrR2W5Kd5KLMUZiYZazEXFiQCq71mr9QIAAA==
X-CMS-MailID: 20230504131105eucas1p1cc725f17aa42262be597f5ee81aca037
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230504131105eucas1p1cc725f17aa42262be597f5ee81aca037
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230504131105eucas1p1cc725f17aa42262be597f5ee81aca037
References: <CGME20230504131105eucas1p1cc725f17aa42262be597f5ee81aca037@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Purposes of this series of patches:
* introduce packet-split RX descriptors support. This feature is used by Linux
  VF driver for MTU values from 2048.
* refactor RX descriptor handling for introduction of packet-split RX
  descriptors support
* fix descriptors flags handling

Tomasz Dzieciol (5):
  igb: remove TCP ACK detection
  igb: rename E1000E_RingInfo_st
  igb: RX descriptors handling cleanup
  igb: add IPv6 extended headers traffic detection
  igb: packet-split descriptors support

 hw/net/e1000e_core.c     |  18 +-
 hw/net/igb_core.c        | 753 ++++++++++++++++++++++++++++-----------
 hw/net/igb_regs.h        |  20 +-
 hw/net/trace-events      |   6 +-
 tests/qtest/libqos/igb.c |   5 +
 5 files changed, 580 insertions(+), 222 deletions(-)

-- 
2.25.1


