Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE1700C2F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:44:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUw6-0005RU-Fs; Fri, 12 May 2023 11:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw3-0005OJ-A4
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:59 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw0-0007jP-8I
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230512154349euoutp0161d783a1554c8b2760f53be81011b297~eb8s5dESL0495704957euoutp01J
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 15:43:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230512154349euoutp0161d783a1554c8b2760f53be81011b297~eb8s5dESL0495704957euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683906229;
 bh=rWASM83Nxneh10aEfsCIlvmBet3Z7/EkoIHFpXw5Cks=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Wg5pZfF47LYyyY20ILlwLdjBHvLGl7wqhpOV7yb4cTAHgykf3Eb+KqMnLHLArq7Pr
 Oac2lFaKGas1TKio3Ymksm57RI9cCHZOXqwwG08zIrX0XFKRzSAR4WPmIP55Urf2t5
 oa3tp79aHhmFVqomWPv4CLtQonyAVw8ud36abJbY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230512154349eucas1p16463833d4c1d3ac0607a615d1652614e~eb8sqUKmh2348523485eucas1p1y;
 Fri, 12 May 2023 15:43:49 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F0.2C.42423.4BE5E546; Fri, 12
 May 2023 16:43:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230512154348eucas1p2f4be787b0ead38c3b49ce054c1bdd04c~eb8sMaY_W2921729217eucas1p2e;
 Fri, 12 May 2023 15:43:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230512154348eusmtrp1a428f94aa3aeb9c0b43bf2a4e38ff965~eb8sL6TGT1998019980eusmtrp1x;
 Fri, 12 May 2023 15:43:48 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-97-645e5eb444e0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 32.B6.14344.4BE5E546; Fri, 12
 May 2023 16:43:48 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230512154348eusmtip13e566d8fa885972d46f3d97cbc4e79d3~eb8rr42AU2547025470eusmtip1O;
 Fri, 12 May 2023 15:43:47 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v6 0/7] igb: packet-split descriptors support
Date: Fri, 12 May 2023 17:43:28 +0200
Message-Id: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduzned0tcXEpBi8uWFp8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1igu
 m5TUnMyy1CJ9uwSujPae+0wFD9grXm0+ytTAOJmti5GTQ0LAROJL5wrWLkYuDiGBFYwSC7Zu
 YoRwvjBKvNl/lwnC+cwoMWvPcWaYlktnO9ghEssZJdbv/M0C4bQzSWy/8QBsMJuAmcSjL/OA
 BnNwiAgYS3xsFwcJMwukShz9c5AFJCwsYCuxebEJSJhFQFWi4cx8JhCbV8BJ4s7D+YwQu+Ql
 Zl76zg4RF5Q4OfMJC8QYeYnmrbOZQdZKCMzkkNhyfT07RIOLxKkNG5kgbGGJV8e3QMVlJE5P
 7mGBsMslfp7dxg7R3MIosWfqZKgia4lLW3+C3cwsoCmxfpc+RNhRouPdHbCwhACfxI23ghA3
 8ElM2jadGSLMK9HRJgRRrSPxbdNMNoiwlMTCG3UQYQ+JqxufgkNQSCBW4tOx9awTGBVmIXls
 FpLHZiGcsICReRWjeGppcW56arFhXmq5XnFibnFpXrpecn7uJkZgejn97/inHYxzX33UO8TI
 xMF4iFGCg1lJhPftkugUId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzatieThQTSE0tSs1NTC1KL
 YLJMHJxSDUwRS3abbObjCbhkknPt+Oc/VxO5Tr7VXSO2aqou20PBKFU3jkXsyZ+P6Pcv3nzv
 /sptKfpv//tVuRitC5RoOrmTaUF62Kxp90tfJDdaqO1Nkk3xemIx9Utr5tNvR7KiIteeipK9
 nPrBNDjJo+Flw4HrSoGvDBUmXTGTmNghVfI5blucrcmfrJUf+67FTD2ynSlzQQoDr1XbjT86
 xdnzXXWlKpp0pn28/HtSTfGOPe+k1U2mcXHum/Zz5qJbO6caf/Yxfr1Z5/uvnLd+CivS8met
 P/o/8M8xQ3mZyHuf31f25Oa2nbx6SOa2+BnJ02+LpyvZrFTdzyk5TUgg9N4SQYVt0+NVU3a+
 bpFt3jN3neIOJZbijERDLeai4kQAGHPP8J4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsVy+t/xu7pb4uJSDFYukbP4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Ge0995kK
 HrBXvNp8lKmBcTJbFyMnh4SAicSlsx3sXYxcHEICSxkljq+5wAyRkJLY1/OfHcIWlvhzrYsN
 oqiVSeLFpHusIAk2ATOJR1/mAdkcHCICphLP9kqChJkFMiVOv9rHBhIWFrCV2LzYBCTMIqAq
 0XBmPhOIzSvgJHHn4XxGiPHyEjMvfWeHiAtKnJz5hAVijLxE89bZzBMY+WYhSc1CklrAyLSK
 USS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMLC3Hfu5ZQfjylcf9Q4xMnEwHmKU4GBWEuF9uyQ6
 RYg3JbGyKrUoP76oNCe1+BCjKdB9E5mlRJPzgbGVVxJvaGZgamhiZmlgamlmrCTO61nQkSgk
 kJ5YkpqdmlqQWgTTx8TBKdXAxOuvwPBs56HG6ev/NEz5PeG3sjG3y/zHAnN0f73hDZscUuHz
 IG1CpKGszNpWxymJVfI63Cd+TNl6ZN5Vvf/y2mqvazt3Su57+SY2sEpPfInRFI2Ly9pFBNJk
 zqmG3L3zqkrI6MVpLhXp5burZX4GsDusM8/81+RV80588pf5O50XOqsrvy86dcxDVPRlm8id
 x48evcre05O8OvSio/wlxf9cres07O01liocXsuwP+2A745zNrO07lS3Lrq5/1QyZ22sunj0
 zM/3OW5WL730meO7bOlV64Ce7DpPK2H+/D1u2y58ab+3KH3VlxfzFK/df/xlXm9HVZDqxbSV
 VZLHFVo5bmt8k2/Im3c9effX5UosxRmJhlrMRcWJAAX3RF31AgAA
X-CMS-MailID: 20230512154348eucas1p2f4be787b0ead38c3b49ce054c1bdd04c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230512154348eucas1p2f4be787b0ead38c3b49ce054c1bdd04c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230512154348eucas1p2f4be787b0ead38c3b49ce054c1bdd04c
References: <CGME20230512154348eucas1p2f4be787b0ead38c3b49ce054c1bdd04c@eucas1p2.samsung.com>
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

Based-on: <20230423041833.5302-1-akihiko.odaki@daynix.com>
("[PATCH v3 00/47] igb: Fix for DPDK")

Purposes of this series of patches:
* introduce packet-split RX descriptors support. This feature is used by Linux
  VF driver for MTU values from 2048.
* refactor RX descriptor handling for introduction of packet-split RX
  descriptors support
* fix descriptors flags handling

Tomasz Dzieciol (7):
  igb: remove TCP ACK detection
  igb: rename E1000E_RingInfo_st
  igb: RX descriptors guest writting refactoring
  igb: RX payload guest writting refactoring
  igb: add IPv6 extended headers traffic detection
  igb: packet-split descriptors support
  e1000e: rename e1000e_ba_state

 hw/net/e1000e_core.c     |  60 ++--
 hw/net/igb_core.c        | 751 ++++++++++++++++++++++++++++-----------
 hw/net/igb_regs.h        |  20 +-
 hw/net/trace-events      |   6 +-
 tests/qtest/libqos/igb.c |   5 +
 5 files changed, 599 insertions(+), 243 deletions(-)

-- 
2.25.1


