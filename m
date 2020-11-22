Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A982BC53F
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 12:07:47 +0100 (CET)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgnDd-0005Gy-Sa
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 06:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kghTw-00085R-Ps
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 00:00:12 -0500
Received: from mail-m971.mail.163.com ([123.126.97.1]:32770)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kghTm-0006pn-Va
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 00:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=FhJqm6LMcknrGDFitb
 gA+AMYsMPo0SRChj3tSH47gjI=; b=qaAKEygaeTru5dqPUQd7UqEvt7961zcSpU
 vhaLqMLPrXCefj6BpfsydJyKN5Fl4hBE2GvcHeirAal0p1kbOndhdWwMSMQYOJCE
 Dk6etu7laXT7Px1HFnt7OX+00g3+YBExpm1gbDClspS5XhIWdsQPQHabojhU40je
 6mSbmGpNo=
Received: from localhost.localdomain (unknown [218.106.182.234])
 by smtp1 (Coremail) with SMTP id GdxpCgBXl5ex7LlfUJn7BA--.4164S4;
 Sun, 22 Nov 2020 12:44:33 +0800 (CST)
From: ruc_gongyuanjun@163.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] /net/tap.c: Fix a memory leak
Date: Sun, 22 Nov 2020 12:44:26 +0800
Message-Id: <20201122044426.13454-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: GdxpCgBXl5ex7LlfUJn7BA--.4164S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr47tw18JrW7Ww45Xw13urg_yoW3WwcEgw
 n7ZFWDGrZ8AF9akrsrZ395KryUCw4UWF97Kw1YyFyfCa1xXws2krs7JF93ZFyxWryakr90
 kF9Ivayq9ay0kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREMmh3UUUUU==
X-Originating-IP: [218.106.182.234]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbCrxvk5V0DZcbSkwAAsJ
Received-SPF: pass client-ip=123.126.97.1;
 envelope-from=ruc_gongyuanjun@163.com; helo=mail-m971.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 22 Nov 2020 06:05:42 -0500
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
Cc: yuanjungong <ruc_gongyuanjun@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: yuanjungong <ruc_gongyuanjun@163.com>

Close fd before returning.

Buglink: https://bugs.launchpad.net/qemu/+bug/1904486
Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
---
 net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/tap.c b/net/tap.c
index c46ff66..fe95fa7 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -817,6 +817,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
         if (ret < 0) {
             error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
                              name, fd);
+            close(fd);
             return -1;
         }
 
@@ -831,6 +832,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
                          vhostfdname, vnet_hdr, fd, &err);
         if (err) {
             error_propagate(errp, err);
+            close(fd);
             return -1;
         }
     } else if (tap->has_fds) {
-- 
2.17.1


