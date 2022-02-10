Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1A94B0CCF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:55:26 +0100 (CET)
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI82n-0006Hh-7Q
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:55:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7uH-0004HV-5G
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:46:37 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:38014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7u9-0007n6-OT
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:46:31 -0500
Received: from vla5-d6ec41cad181.qloud-c.yandex.net
 (vla5-d6ec41cad181.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:348f:0:640:d6ec:41ca])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 2A48E2E1B37
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 14:46:19 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla5-d6ec41cad181.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 XQXufdF6Vk-kJGiftsD; Thu, 10 Feb 2022 14:46:19 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1644493579; bh=4QGChNKGE5ZnDd1Hb/GY2JBNROUOwd7PiMURzDNnW6A=;
 h=References:Date:To:From:Subject:Message-ID:In-Reply-To:Cc;
 b=pADO6FDP4CysCyd3tn2OtrA2a8W5O+gLB6T8ejBt5HnI31Oen96bTQy6Yli7JY7iH
 9Jm2WxK+O2Cj62Omvu9nwcOcj9jFKD19sXAmX18w41qYzE7UE3u4DOXAmqYmBOCY7b
 sjiHgLOAKLzdNB0K1s6mu1b2dWu0N1iYinnkDg4U=
Authentication-Results: vla5-d6ec41cad181.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (dynamic-vpn.dhcp.yndx.net [2a02:6b8:b081:8101::1:28])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 W53zgsKDpQ-kIHuAm3A; Thu, 10 Feb 2022 14:46:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH 2/2] vhost-user-blk: check connection state in
 vhost_user_blk_set_config
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Feb 2022 14:46:18 +0300
Message-ID: <164449357837.2210307.2245637352907327513.stgit@dynamic-vpn.dhcp.yndx.net>
In-Reply-To: <164449357269.2210307.9274525043180414283.stgit@dynamic-vpn.dhcp.yndx.net>
References: <164449357269.2210307.9274525043180414283.stgit@dynamic-vpn.dhcp.yndx.net>
User-Agent: StGit/1.4.dev11+gd5bef96
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fuzzing found that ->set_config() could be called without connection.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/block/vhost-user-blk.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 35ac188ca4..9ac50443bc 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -72,6 +72,10 @@ static void vhost_user_blk_set_config(VirtIODevice *vdev, const uint8_t *config)
     struct virtio_blk_config *blkcfg = (struct virtio_blk_config *)config;
     int ret;
 
+    if (!s->connected) {
+        return;
+    }
+
     if (blkcfg->wce == s->blkcfg.wce) {
         return;
     }


