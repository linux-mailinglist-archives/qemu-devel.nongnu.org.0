Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1E2D10C1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:43:49 +0100 (CET)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFrm-00043y-I0
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmEw8-0002gg-9O
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:44:12 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmEw4-0001J4-Vv
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:44:11 -0500
Received: by mail-pf1-x442.google.com with SMTP id t8so9633482pfg.8
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=ZsEFjNWuTU7g2lyFSkhLZ5mPKeE5fJakZfwtu2VSi7w=;
 b=xOpswS402ygtbPKqo1jTrzn2PwLfZ3Dg5aWatGiuLHg2VpPGtyjiaeH6HSlW0LQfj+
 yAP8PAxGDr+iBDzyCBxEy1TxXe/vvajvb+9Z93co/QQn4n7M10niLU6B7UJRxO2h2+C+
 yobjEhB/nq9ixzNk3CENngSiuy/hQID1MFZ5f5r1cE4yI96nMjLcn5D3Ku8gEMea7ibY
 IPzlGpttlQF8R8Fezhm2jw8YltqrigZUNOxx8dkmJFk1OvlKcL2VnIKlk+Tg3t2ZDY8m
 7s+uAVHKP40bJP5gGs1xmwZf8I5dm7RWe4WOlnTyRMiwDqA805J5K9AZP1pXYWQVAOfK
 Vc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZsEFjNWuTU7g2lyFSkhLZ5mPKeE5fJakZfwtu2VSi7w=;
 b=Hb8Olkgy891lJsqH18Ga114f4vZ8tJeP8DdcaafMByifS7Ik0GzDM6R9c6B8RVXP69
 922pe8wrwCYHGYXyhe/Wf5nMV96GhtUpSTr1k2STwnjzsEvjCynTA8SKICKnB8ek7K7s
 md0q2kB2s4ixYjWgH4JeEufJilKKTllqZqahNm61uDc60znGYntkF/Yn3zYBw0nPz8Vy
 WQnkNIWoUNwm9P0az6ymKQ4O8b9QvAmtzU1K5ALT4RCS1+rGQtdxSNkCVFN2w5umbDfO
 qZqsNOX5gmcm5eWInSoShSzHuiPSFp0eBzvamZTmvCWRIFOC7/YADdnlfGfHOODtFAYh
 5NVA==
X-Gm-Message-State: AOAM531L/UhVn7r0sOlPgPKDR8Yjvh6k1nl5P7855S61hYM5EKs5zjYg
 PoPUfQaBzqm99chVrDRj5/Gw6w==
X-Google-Smtp-Source: ABdhPJw0xmCyhPWXdXJUED0u12OKsuUFb5TQ0g/xGN75bCOYP/846OCjZxqp3JYnQQcZZEu2LXO3ug==
X-Received: by 2002:aa7:928c:0:b029:19a:de9d:fb11 with SMTP id
 j12-20020aa7928c0000b029019ade9dfb11mr15748558pfa.21.1607341437304; 
 Mon, 07 Dec 2020 03:43:57 -0800 (PST)
Received: from 64-217.abest.vip ([129.227.156.196])
 by smtp.gmail.com with ESMTPSA id w2sm10469086pjb.22.2020.12.07.03.43.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 03:43:56 -0800 (PST)
From: Li Feng <fengli@smartx.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org (open list:raw),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2] file-posix: check the use_lock before setting the file lock
Date: Mon,  7 Dec 2020 19:44:06 +0800
Message-Id: <1607341446-85506-1-git-send-email-fengli@smartx.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=2607:f8b0:4864:20::442;
 envelope-from=fengli@smartx.com; helo=mail-pf1-x442.google.com
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

The scenario is that when accessing a volume on an NFS filesystem
without supporting the file lock,  Qemu will complain "Failed to lock
byte 100", even when setting the file.locking = off.

We should do file lock related operations only when the file.locking is
enabled, otherwise, the syscall of 'fcnctl' will return non-zero.

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


