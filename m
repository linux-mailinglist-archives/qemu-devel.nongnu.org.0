Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D538B2BA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:13:04 +0200 (CEST)
Received: from localhost ([::1]:50266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkMB-0000eo-Dh
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damtev@yandex-team.ru>)
 id 1ljiqw-0002XO-Um; Thu, 20 May 2021 09:36:42 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:36956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damtev@yandex-team.ru>)
 id 1ljiqv-0001zR-2t; Thu, 20 May 2021 09:36:42 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 8F29A2E1597;
 Thu, 20 May 2021 16:36:37 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 b7HOHOB4dj-ab1O2HwP; Thu, 20 May 2021 16:36:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1621517797; bh=v8gTLIvHv7P3vksqbzku4JkPeoMPilQNdyNuC0rkmb8=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=NtHmYZcm1rruTiyJKnZfDsGrOjOxOMttTOM4Jfk+GBezSFPPpu9pd4IIK/yrlr9pd
 hXySURNZlY1+W3mXytwHom/J3VUDg1P0BzBFQ/8SsH8NcEULLZ7VpCk1Ent5nrb4Rn
 QkPGkRB06/2r5v2PF+kJLZKPtUITg7umVDM2vOH0=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from 172.31.109.104-vpn.dhcp.yndx.net
 (172.31.109.104-vpn.dhcp.yndx.net [172.31.109.104])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 5DcqKhAZFA-aapSASOX; Thu, 20 May 2021 16:36:36 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
From: Yury Kamenev <damtev@yandex-team.ru>
To: mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/1] virtio: disable partitions scanning for no partitions
 block
Date: Thu, 20 May 2021 16:36:07 +0300
Message-Id: <20210520133608.98785-1-damtev@yandex-team.ru>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163; envelope-from=damtev@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 May 2021 11:10:43 -0400
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
Cc: Yury Kamenev <damtev@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some virtio blocks definitely have no partitions and should not be scanned.

Yury Kamenev (1):
  virtio: disable partitions scanning for no partitions block

 hw/block/virtio-blk.c                       | 4 ++++
 include/hw/virtio/virtio-blk.h              | 1 +
 include/standard-headers/linux/virtio_blk.h | 1 +
 3 files changed, 6 insertions(+)

-- 
2.24.3 (Apple Git-128)


