Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB430349550
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:24:12 +0100 (CET)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRqF-0006rK-Uj
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lPRf5-0002pI-Ik; Thu, 25 Mar 2021 11:12:39 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:36734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lPRf2-000233-Ch; Thu, 25 Mar 2021 11:12:39 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 8EE3E2E16BC;
 Thu, 25 Mar 2021 18:12:31 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Pmx4LxF5Hu-CVcGk4DP; Thu, 25 Mar 2021 18:12:31 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1616685151; bh=J40X7fGjL6wxtX5+1zKmuMvVb84EJ3YemoNOHPHEgsg=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=xq3sbP56uQV2uD1/MZX72fEfuw+6g+pouSjWfwM00lRz/NlnLlTzEhIc5KtZvCkKi
 d6XjxaFFGCtgTw9eolpwyKk+aXDXelazp6EA8OmnxEeqlLsUxqHG+ecCv2iJUD89dy
 tPfAWfpb9WMuo0N/UlEIivOb9CU51R/UmLW0KqYc=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8801::1:8])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ejfhBn90eX-CUpGZwl9; Thu, 25 Mar 2021 18:12:30 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] vhost-user-blk: add immediate cleanup on shutdown
Date: Thu, 25 Mar 2021 18:12:17 +0300
Message-Id: <20210325151217.262793-4-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
References: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 raphael.norwitz@nutanix.com, yc-core@yandex-team.ru, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu crashes on shutdown if the chardev used by vhost-user-blk has been
finalized before the vhost-user-blk.

This happens with char-socket chardev operating in the listening mode (server).
The char-socket chardev emits "close" event at the end of finalizing when
its internal data is destroyed. This calls vhost-user-blk event handler
which in turn tries to manipulate with destroyed chardev by setting an empty
event handler for vhost-user-blk cleanup postponing.

This patch separates the shutdown case from the cleanup postponing removing
the need to set an event handler.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 hw/block/vhost-user-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 4e215f71f152..0b5b9d44cdb0 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -411,7 +411,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
          * other code perform its own cleanup sequence using vhost_dev data
          * (e.g. vhost_dev_set_log).
          */
-        if (realized) {
+        if (realized && !runstate_check(RUN_STATE_SHUTDOWN)) {
             /*
              * A close event may happen during a read/write, but vhost
              * code assumes the vhost_dev remains setup, so delay the
-- 
2.25.1


