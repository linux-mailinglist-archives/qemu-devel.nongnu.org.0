Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34351583367
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 21:21:35 +0200 (CEST)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGmb7-0007bu-Fn
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 15:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGmNG-0008D1-Lz; Wed, 27 Jul 2022 15:07:15 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:46338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGmNC-00051q-FX; Wed, 27 Jul 2022 15:07:13 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 9F1DB2E206D;
 Wed, 27 Jul 2022 22:07:00 +0300 (MSK)
Received: from localhost.localdomain (172.31.41.131-vpn.dhcp.yndx.net
 [172.31.41.131])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 lEd3EUqO2s-6wOOts0F; Wed, 27 Jul 2022 22:06:59 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658948819; bh=lwbA1fVen4BaZnWdH6dj3oNIg6PuEtrKfsEn1Lfs3RE=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=uC2K0KG//Y1zyJn3mvQSjVyCPaMfqUIndz5fmuacht3RWopzcKNCToPWWGClTaefY
 9uL1X+Kmo58nwcSVg4YrDnVNqPuydZkJSrElH8TtFWNMunUtgMEhwhCm5hQic0nqVz
 KlszHxZGAy80AoikTuwN9wHeY1NKjZDmnLjTkyc8=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@yandex-team.ru, den@openvz.org,
 stefanha@redhat.com
Subject: [PULL 0/2] block: fix parallels block driver
Date: Wed, 27 Jul 2022 22:06:33 +0300
Message-Id: <20220727190635.1024863-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f6cce6bcb2ef959cdd4da0e368f7c72045f21d6d:

  Merge tag 'pull-target-arm-20220726' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-26 08:32:01 -0700)

are available in the Git repository at:

  https://gitlab.com/vsementsov/qemu.git tags/pull-block-2022-07-27

for you to fetch changes up to 0c2cb3827e46dc30cd41eeb38f8e318eb665e6a4:

  iotests/131: Add parallels regression test (2022-07-26 22:05:20 +0300)

----------------------------------------------------------------
Block: fix parallels block driver

----------------------------------------------------------------

Hanna Reitz (2):
  block/parallels: Fix buffer-based write call
  iotests/131: Add parallels regression test

 block/parallels.c          |  4 ++--
 tests/qemu-iotests/131     | 35 ++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/131.out | 13 +++++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)

-- 
2.25.1


