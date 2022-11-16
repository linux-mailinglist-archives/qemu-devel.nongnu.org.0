Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119F62C3AD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovL27-0007g5-EE; Wed, 16 Nov 2022 11:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovL25-0007fZ-Mv
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:13:01 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovL1z-0000dJ-7s
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:13:01 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 061B45FE98;
 Wed, 16 Nov 2022 19:12:45 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8128::1:3])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6qDkL1QYoB-ChO0jE4p; Wed, 16 Nov 2022 19:12:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668615164; bh=3PtZD/5nh0p5vJRpRXrpuNYPHP6B2MLPtrY4wTI6AKU=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=a1CMtIZs4ku8WYLFdroQVx4dudwVuCSfujYVhgrHZHs+vMxN7bgSsG9rVowCukY6D
 EjbQlcbm+8EEP7xl4y5igSiZG6QlA2GBTr00wuzF8RbVohoFVqLXtu4eUcq7JQSQYc
 5UEePE6lqn/MGceaxXz/PbakIQC4Ic4AxGFCBNAQ=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, eblake@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 den-plotnikov@yandex-team.ru, vsementsov@yandex-team.ru
Subject: [PATCH RFC 0/2] add SHPC hotplug event
Date: Wed, 16 Nov 2022 19:12:32 +0300
Message-Id: <20221116161234.44206-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all! Please look at 02 for the details.

Vladimir Sementsov-Ogievskiy (2):
  hw/pci/shpc: introduce FOR_EACH_DEVICE_IN_SLOT
  qapi: introduce DEVICE_POWER_ON for SHPC hotplug

 hw/pci/shpc.c  | 53 +++++++++++++++++++++++++++++++++++++++++---------
 qapi/qdev.json | 23 ++++++++++++++++++++++
 2 files changed, 67 insertions(+), 9 deletions(-)

-- 
2.34.1


