Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE28938B2D6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:16:39 +0200 (CEST)
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkPe-00084s-HT
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damtev@yandex-team.ru>)
 id 1ljimo-0001GF-7V; Thu, 20 May 2021 09:32:26 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:54872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damtev@yandex-team.ru>)
 id 1ljimj-0007GK-9t; Thu, 20 May 2021 09:32:24 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id BA4832E1BA8;
 Thu, 20 May 2021 16:32:12 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 vWpEfiJQVB-WB1W4dCq; Thu, 20 May 2021 16:32:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1621517532; bh=v8gTLIvHv7P3vksqbzku4JkPeoMPilQNdyNuC0rkmb8=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=E74KXKbINwPkQQ21iDspqsDUg5RI3ABTSD/bIZjE9H0kEa4Pd3WwZdtYcMYVytY8R
 aPNVg768Dwi12QBzvmpP5umBVSRiEBwxc86LuRb6AaNVRPBigf/3sDqZ65syMBidqH
 ztOb7JQfcbwk6Fl3tqxix8m+MituRLqkDOU4aVsE=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from 172.31.109.104-vpn.dhcp.yndx.net
 (172.31.109.104-vpn.dhcp.yndx.net [172.31.109.104])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 s5cJaTq8Fb-WBomdM7K; Thu, 20 May 2021 16:32:11 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
From: Yury Kamenev <damtev@yandex-team.ru>
To: mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/1] virtio: disable partitions scanning for no partitions
 block
Date: Thu, 20 May 2021 16:31:44 +0300
Message-Id: <20210520133145.98702-1-damtev@yandex-team.ru>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=damtev@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 May 2021 11:10:42 -0400
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


