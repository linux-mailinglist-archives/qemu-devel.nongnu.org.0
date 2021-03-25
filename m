Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0CB349517
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:15:00 +0100 (CET)
Received: from localhost ([::1]:49464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRhL-0004yL-Tp
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lPRf5-0002oX-Do; Thu, 25 Mar 2021 11:12:39 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:42596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lPRf1-00022O-Oy; Thu, 25 Mar 2021 11:12:37 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 189C22E1EDD;
 Thu, 25 Mar 2021 18:12:30 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 0qPe26HcVC-CTcek9RU; Thu, 25 Mar 2021 18:12:30 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1616685150; bh=itg4Ry9/PNT5O6A6BfVOofOV+P9ACZcn+TZbuL6Y4k4=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=R8drwq+09d+a0wDnywT/hVck/sC47Kwc/4Myr6d+Ov6JKCbqLzH7FFi7PfvfRYYWj
 dsXN6Gx+f09JRO+jdGQ54LGOgMXrPbJIXyZtwr0lNx2C8TzVYTghy5CDzpQdhGcOQS
 4BZXFzZcew5VikGg6b8kmJokSny+ul3Q6BacEgM0=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8801::1:8])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ejfhBn90eX-CTpGLOE0; Thu, 25 Mar 2021 18:12:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] vhost-user-blk: perform immediate cleanup if
 disconnect on initialization
Date: Thu, 25 Mar 2021 18:12:16 +0300
Message-Id: <20210325151217.262793-3-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
References: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

Commit 4bcad76f4c39 ("vhost-user-blk: delay vhost_user_blk_disconnect")
introduced postponing vhost_dev cleanup aiming to eliminate qemu aborts
because of connection problems with vhost-blk daemon.

However, it introdues a new problem. Now, any communication errors
during execution of vhost_dev_init() called by vhost_user_blk_device_realize()
lead to qemu abort on assert in vhost_dev_get_config().

This happens because vhost_user_blk_disconnect() is postponed but
it should have dropped s->connected flag by the time
vhost_user_blk_device_realize() performs a new connection opening.
On the connection opening, vhost_dev initialization in
vhost_user_blk_connect() relies on s->connection flag and
if it's not dropped, it skips vhost_dev initialization and returns
with success. Then, vhost_user_blk_device_realize()'s execution flow
goes to vhost_dev_get_config() where it's aborted on the assert.

To fix the problem this patch adds immediate cleanup on device
initialization(in vhost_user_blk_device_realize()) using different
event handlers for initialization and operation introduced in the
previous patch.
On initialization (in vhost_user_blk_device_realize()) we fully
control the initialization process. At that point, nobody can use the
device since it isn't initialized and we don't need to postpone any
cleanups, so we can do cleaup right away when there is a communication
problem with the vhost-blk daemon.
On operation we leave it as is, since the disconnect may happen when
the device is in use, so the device users may want to use vhost_dev's data
to do rollback before vhost_dev is re-initialized (e.g. in vhost_dev_set_log()).

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 48 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1af95ec6aae7..4e215f71f152 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -402,38 +402,38 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
         break;
     case CHR_EVENT_CLOSED:
         /*
-         * A close event may happen during a read/write, but vhost
-         * code assumes the vhost_dev remains setup, so delay the
-         * stop & clear. There are two possible paths to hit this
-         * disconnect event:
-         * 1. When VM is in the RUN_STATE_PRELAUNCH state. The
-         * vhost_user_blk_device_realize() is a caller.
-         * 2. In tha main loop phase after VM start.
-         *
-         * For p2 the disconnect event will be delayed. We can't
-         * do the same for p1, because we are not running the loop
-         * at this moment. So just skip this step and perform
-         * disconnect in the caller function.
-         *
-         * TODO: maybe it is a good idea to make the same fix
-         * for other vhost-user devices.
+         * Closing the connection should happen differently on device
+         * initialization and operation stages.
+         * On initalization, we want to re-start vhost_dev initialization
+         * from the very beginning right away when the connection is closed,
+         * so we clean up vhost_dev on each connection closing.
+         * On operation, we want to postpone vhost_dev cleanup to let the
+         * other code perform its own cleanup sequence using vhost_dev data
+         * (e.g. vhost_dev_set_log).
          */
         if (realized) {
+            /*
+             * A close event may happen during a read/write, but vhost
+             * code assumes the vhost_dev remains setup, so delay the
+             * stop & clear.
+             */
             AioContext *ctx = qemu_get_current_aio_context();
 
             qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
                     NULL, NULL, false);
             aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
-        }
 
-        /*
-         * Move vhost device to the stopped state. The vhost-user device
-         * will be clean up and disconnected in BH. This can be useful in
-         * the vhost migration code. If disconnect was caught there is an
-         * option for the general vhost code to get the dev state without
-         * knowing its type (in this case vhost-user).
-         */
-        s->dev.started = false;
+            /*
+             * Move vhost device to the stopped state. The vhost-user device
+             * will be clean up and disconnected in BH. This can be useful in
+             * the vhost migration code. If disconnect was caught there is an
+             * option for the general vhost code to get the dev state without
+             * knowing its type (in this case vhost-user).
+             */
+            s->dev.started = false;
+        } else {
+            vhost_user_blk_disconnect(dev);
+        }
         break;
     case CHR_EVENT_BREAK:
     case CHR_EVENT_MUX_IN:
-- 
2.25.1


