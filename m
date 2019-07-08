Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE60461D42
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 12:51:12 +0200 (CEST)
Received: from localhost ([::1]:40344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkREk-0004RV-TS
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 06:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39859)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkRBz-0002o1-MC
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 06:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkRBy-0006Cp-Kf
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 06:48:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkRBu-00069n-Gn; Mon, 08 Jul 2019 06:48:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 099FCC05B038;
 Mon,  8 Jul 2019 10:48:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-112.brq.redhat.com [10.40.204.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B770057986;
 Mon,  8 Jul 2019 10:47:56 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  8 Jul 2019 12:47:47 +0200
Message-Id: <20190708104750.1071-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 08 Jul 2019 10:48:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v5 0/3] hw/ssi/xilinx_spips: Avoid NULL
 dereference and out-of-bound access
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-stable@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01238.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01586.html
v3: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01657.html
v4: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01777.html
v5:
- address Francisco comments from v4

Philippe Mathieu-Daud=C3=A9 (3):
  hw/ssi/xilinx_spips: Convert lqspi_read() to read_with_attrs
  hw/ssi/xilinx_spips: Avoid AXI writes to the LQSPI linear memory
  hw/ssi/xilinx_spips: Avoid out-of-bound access to lqspi_buf[]

 hw/ssi/xilinx_spips.c | 43 +++++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

--=20
2.20.1


