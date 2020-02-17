Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8BB1608A9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 04:23:51 +0100 (CET)
Received: from localhost ([::1]:39748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3X0g-0006so-4i
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 22:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46553)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j3Wz9-0005KA-9z
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 22:22:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j3Wz8-0003jW-AN
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 22:22:15 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2788 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j3Wz5-0003WK-Uz; Sun, 16 Feb 2020 22:22:12 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EEF6AA41280FCCC59048;
 Mon, 17 Feb 2020 11:22:02 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Mon, 17 Feb 2020 11:21:55 +0800
From: <pannengyuan@huawei.com>
To: <balrogg@gmail.com>, <peter.maydell@linaro.org>,
 <mav2-rk.cave-ayland@ilande.co.uk>, <david@gibson.dropbear.id.au>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>
Subject: [PATCH v2 0/2] delay timer_new from init to realize to fix memleaks.
Date: Mon, 17 Feb 2020 11:21:25 +0800
Message-ID: <20200217032127.46508-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: zhang.zhanghailiang@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

v1:
   - Delay timer_new() from init() to realize() to fix memleaks.
v2:
   - Similarly to other cleanups, move timer_new into realize in target/s=
390x/cpu.c (Suggested by Philippe Mathieu-Daud=C3=A9).
   - Send these two patches as a series instead of sending each as a sing=
le patch but with wrong subject in v1.

Pan Nengyuan (2):
  s390x: fix memleaks in cpu_finalize
  hw: move timer_new from init() into realize() to avoid memleaks

 hw/arm/pxa2xx.c        | 17 +++++++++++------
 hw/arm/spitz.c         |  8 +++++++-
 hw/arm/strongarm.c     | 18 ++++++++++++------
 hw/misc/mos6522.c      | 14 ++++++++++++--
 hw/timer/cadence_ttc.c | 16 +++++++++++-----
 target/s390x/cpu.c     | 22 ++++++++++++++++++----
 6 files changed, 71 insertions(+), 24 deletions(-)

--=20
2.21.0.windows.1



