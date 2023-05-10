Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22976FD92D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:24:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwf6R-0005t0-AP; Wed, 10 May 2023 04:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwf6O-0005rZ-5L
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:23:12 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwf6K-0007gH-Dg
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:23:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230510082300euoutp010c57a38b1aca2fd39c807ddf09a908f8~dupQUbGi62212822128euoutp01G
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:23:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230510082300euoutp010c57a38b1aca2fd39c807ddf09a908f8~dupQUbGi62212822128euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683706980;
 bh=SVX8ngCEcNPs5ogdwt64IlHmxZoFqrLbBG6+wRE04Ss=;
 h=From:To:Cc:Subject:Date:References:From;
 b=oVuVGwUP+E/aEPOQsfbjqUFKi6KohozqnbDbs69bAaGdzha+FLU42SuO8l90zSmdb
 eyrygCzmEBPA+deXEK0jkFT5Iet2x5ITUuiw3mtIObkYsm+xztb5vc0Hi/aGizS+SN
 zyRGJN7jMVeqZUP1+XmKgeOCTV05kG4J0tXaIvN8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230510082300eucas1p1432f14b13737b7ef4847c14d787cb1a1~dupQHkJyT0602506025eucas1p1c;
 Wed, 10 May 2023 08:23:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B7.B3.42423.4645B546; Wed, 10
 May 2023 09:23:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230510082300eucas1p1070e0f1f5ed3620a9b67b2eb482e4422~dupPuKpy10873608736eucas1p1C;
 Wed, 10 May 2023 08:23:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230510082300eusmtrp1feaa712b5660f4abf6664eb57f920e96~dupPtg2ZT0702607026eusmtrp1T;
 Wed, 10 May 2023 08:23:00 +0000 (GMT)
X-AuditID: cbfec7f2-25927a800002a5b7-53-645b5464f770
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1A.01.10549.4645B546; Wed, 10
 May 2023 09:23:00 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230510082259eusmtip192a041ebe777c961122c19bcb710e3d1~dupPKUNp02104721047eusmtip1A;
 Wed, 10 May 2023 08:22:59 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v5 0/6] igb: packet-split descriptors support
Date: Wed, 10 May 2023 10:22:48 +0200
Message-Id: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+917t12t2XUJO1qgrCw106yoQVkWKivprURGj+Uuas0pm2YF
 5fsVGpb02GpqQWUTKTSnaUWNajnRbPmqiUvzGYhNhzl6Ou8k//v+Pud7zvke+JE4r5DlQcbL
 kmm5TCwVsJ0J7Vtb6xpJ5BHJ2sHr3sJJQxVHeN84iQkzym6zhLUd0xyhvqieEBZVj2AhbNG7
 sVcsUVt/Ky4a6KzBROMvOtiiy080aB8r2nmLhJbGn6HlgVtPOMdlGYpQ0nPO2Ruvs7F0NMW6
 hJxIoDZAb2XXjHYmeVQFgh5lAZt5WBHk1xc5KpMITO/G0FyLqeAThyk8QGB+/cvhysNg/OUw
 YXexqY3Qby2dKZCkG7UeLHl8O8YpGt78ejVrWUIFQ9PfHLZdE5Q3mHLqZjmX2gGaQQuHWeYJ
 SuMPDsNdoUk5QDBzPCGr9hZu3wvUNRJqSm870oWC9u00m9FL4Jv+iWPQMmguKSQYnQq2Fi2H
 ac5G8OxaicO0GYy1ttnQOOULjxoCGbwdzMPVhB0D5QLdY65MBhe4qr2BM5gL+bk8xu0PU9VK
 NoM94E73RQaL4M7f3Nk9POoovMz8iIqRl2reYap5h6n+RyhHuAbx6RRFQiytCJLRqQEKcYIi
 RRYbEJOYUI1mPkzzH/1EPVJ/swToEEYiHQISF7hxI6KiJTyuRHzuPC1PPC5PkdIKHVpKEgI+
 d3VwUwyPihUn06dpOomWz1Ux0skjHVtBtXeuutno0+fnMlHWs65p5RCdEYI/Lnc6QadNtmx5
 KuxQe430Pmwo5OuPT7zZYzy8e29WVWi2dmixm+XCiJXl5qq6WxF1ZZHZUmOK+02ql3U1tPTG
 C2SqoTYpttH9fLAm7ItNJyD3Jxw2TI2Hj0bswaQG4wHdpg+JW23f972wWU/KwgO8damVqG9c
 WmlOXv016DlsvuWvds9vlVLm933tdTf5dQf6w/zTNMcaP6+KGk1XPrbg8kPbqvQe0ztNPdEn
 rbKlMXiSddhQ3+jbdg9fyIloCVefUg983OWnxyLzO12LXbiC9oNXfPxsPzOjl6cpvUdHYxd0
 vP9SGvddQCjixEF+uFwh/gc3WSAGnwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsVy+t/xu7opIdEpBmeWc1h8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1ig9
 m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jOZTvYwF
 e9krph9pYWpg/MbaxcjJISFgInG78yZ7FyMXh5DAUkaJ53e62SESUhL7ev5D2cISf651sUEU
 tTJJdC9fwAKSYBMwk3j0ZR7QJA4OEQFTiWd7JUHCzAKZEqdf7WMDsYUFbCVO/m8Fs1kEVCVu
 t24Ha+UVcJJY9fQj1Hx5iZmXvrNDxAUlTs58wgIxR16ieets5gmMfLOQpGYhSS1gZFrFKJJa
 WpybnltsqFecmFtcmpeul5yfu4kRGNrbjv3cvINx3quPeocYmTgYDzFKcDArifB6h0alCPGm
 JFZWpRblxxeV5qQWH2I0BbpvIrOUaHI+MLrySuINzQxMDU3MLA1MLc2MlcR5PQs6EoUE0hNL
 UrNTUwtSi2D6mDg4pRqYzLqqzzczeWzZVGq1+e20S0a/2t0lXCa8Mw/iXeC5w1vL9vYUkwMh
 M6dd0CjdsneX/qf1ri9nVnb73r+8O5xh9x7u86eCfS9ET59xQWXG/NOTKt3SNbZ/MnlwnfHA
 tr0u0RWutm0nfh65tTb00qcig++VJ+9vcfnOIrb3vKV+5sU1xVlOKlmLOyKe//mfkT37hdXf
 XXFH5JyTFDunNjN8dDD98MzHKTGkM+7ot1iDQr65B9YH9D0/uH6Dw3mOxf7vpV2DhT/28lT/
 YKkqf6HTcrRN/O+hc37ZC+x8K6ds5bSwP9G8/7vevx7lj1ISUvk6zIcOa8Y84RBp3rPjo5DS
 uch73kfXxsexVTit/jDzlRJLcUaioRZzUXEiAJ5HOpn2AgAA
X-CMS-MailID: 20230510082300eucas1p1070e0f1f5ed3620a9b67b2eb482e4422
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230510082300eucas1p1070e0f1f5ed3620a9b67b2eb482e4422
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230510082300eucas1p1070e0f1f5ed3620a9b67b2eb482e4422
References: <CGME20230510082300eucas1p1070e0f1f5ed3620a9b67b2eb482e4422@eucas1p1.samsung.com>
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

Tomasz Dzieciol (6):
  igb: remove TCP ACK detection
  igb: rename E1000E_RingInfo_st
  igb: RX descriptors guest writting refactoring
  igb: RX payload guest writting refactoring
  igb: add IPv6 extended headers traffic detection
  igb: packet-split descriptors support

 hw/net/e1000e_core.c     |  60 +--
 hw/net/igb_core.c        | 794 +++++++++++++++++++++++++++++----------
 hw/net/igb_regs.h        |  18 +-
 hw/net/trace-events      |   6 +-
 tests/qtest/libqos/igb.c |   5 +
 5 files changed, 639 insertions(+), 244 deletions(-)

-- 
2.25.1


