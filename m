Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930FF2CEC2E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 11:29:29 +0100 (CET)
Received: from localhost ([::1]:42742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl8LA-0003UU-5f
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 05:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kl8K1-0002xy-Gr
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:28:17 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kl8Jy-00059C-JQ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:28:16 -0500
Received: by mail-pl1-x642.google.com with SMTP id s2so2850689plr.9
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 02:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=GvmEsWsfUmm7CW2KYF4WPu3vKhy96mf9PLB7+lgW/JE=;
 b=HKSzBFYvrUerVMb/aWiqTEjPsL63ob6ZL8lNufcM4WxK4pxoHJDaKEFWN34M8yJdZ1
 U/jKnP5F96N2T2KKZGkgommSUsZVec8Nrxq10eZMxDrF4U78MDObBokUuZVNz4TG6WPt
 H+bqFitOsoZ2WLOgr/rAaevjBL+coymF5oRZupR8ltWZv9lEXXC3mKDExnUF1Rz5xCAa
 RBLg3Us4hr+HSRFfQeXMqK8mWrme+t8yRiRl3ENJ8babya6dE4tJQO435vocbF+4UTYY
 s2lvEJBfqo0Ip4poZ2Smm5WB2Hhb2J16TmSxzza9Grq+zLzVdDsXPImH9sGfBsf//gew
 2APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GvmEsWsfUmm7CW2KYF4WPu3vKhy96mf9PLB7+lgW/JE=;
 b=s226foaCdABcpAQmJu6fVXtnSBqweJX1iOaPneri8msyduK4tmG7LuJbPNBCA6dwUO
 lxagR7DO1kx9Je9dXh7kMNahLDYsxLJUc8DCqtd2DjlakrffKOZLXTt3asv9tD2J/AUi
 NPNunMOScjK9pXAFLWkE5IsDp0C3XwG7An/TwOK/acKA6UZ1rFpAUfhzG/q6mXm/vv1o
 yeMSXBKPwu4IQrpTgg/As8V+VtlrCiijvCXvXzv/AXWWlpy5YEoqyV6CyJsa0z4LMuX/
 LQcCCuqWkFSq9IMhLtl829pLkrwVPt95yyPqNN8+663AorLSfeqFuC7eMR/9Zy2kAPn5
 9MTQ==
X-Gm-Message-State: AOAM531dHIzBtcA4dQfAcRES5RsGkQZgw6w1ESnh1EZgtPqbrKJK2As+
 ifodWkJOGbl3dOFAV1fvZ3u7Nw==
X-Google-Smtp-Source: ABdhPJze/3OLZAV+QHLWg8K7wyWOLcCbp6our61XiBtUuIudNE7xPqD6r/OLgNTI4Wm4cGL0Ze2PCA==
X-Received: by 2002:a17:90b:358c:: with SMTP id
 mm12mr3584316pjb.122.1607077692089; 
 Fri, 04 Dec 2020 02:28:12 -0800 (PST)
Received: from 64-217.abest.vip ([129.227.156.197])
 by smtp.gmail.com with ESMTPSA id h188sm4411608pfe.88.2020.12.04.02.28.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Dec 2020 02:28:11 -0800 (PST)
From: Li Feng <fengli@smartx.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org (open list:raw),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] file-posix: check the use_lock
Date: Fri,  4 Dec 2020 18:28:23 +0800
Message-Id: <1607077703-32344-1-git-send-email-fengli@smartx.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=2607:f8b0:4864:20::642;
 envelope-from=fengli@smartx.com; helo=mail-pl1-x642.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: lifeng1519@gmail.com, Li Feng <fengli@smartx.com>, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When setting the file.locking = false, we shouldn't set the lock.

Signed-off-by: Li Feng <fengli@smartx.com>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index d5fd1dbcd2..806764f7e3 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3104,7 +3104,7 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
     }
 
     /* Copy locks to the new fd */
-    if (s->perm_change_fd) {
+    if (s->perm_change_fd && s->use_lock) {
         ret = raw_apply_lock_bytes(NULL, s->perm_change_fd, perm, ~shared,
                                    false, errp);
         if (ret < 0) {
-- 
2.24.3


