Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4CC35146E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:25:08 +0200 (CEST)
Received: from localhost ([::1]:35470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvRj-0002Un-6Y
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPF-0000ju-Aw
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:33 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPD-0006gh-My
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:33 -0400
Received: by mail-ej1-x62d.google.com with SMTP id e14so2301608ejz.11
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BQ2k06TKvkRak3oJkOP50HBxN0KuGNiuSPZNaP9RB5o=;
 b=NjLQXYtswEi83ijiKTbBVcTBY4ZXaRs8AS31QtE3M2lA2+51v02UqCBtT7u/2KNEhG
 Z8e80FHf/qC7ZmDXhDWQjM86OPZvm7SYTC3q4u8itKdxiEH/EPqC19EiTFzpkVduUhH/
 z84xKyA8x0tth3kNs4peDateGw++qIiOGmnW69faB+w001g1yR6XXF1/bc6vRPxU1rgT
 iEw4SSYy1EW12R4Qi9/pUFrVPTW1k0jbUULq8nRQ8SqCu2MZB4AerumSExyyWkg91pr6
 wiklxzsVw2AOhyiJTOzCMgswZBMk0UkP4EFtVABcUs6SmrPc3IKL2haC+ZbKsDlugh9h
 XLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BQ2k06TKvkRak3oJkOP50HBxN0KuGNiuSPZNaP9RB5o=;
 b=glz/CYeE97RuCoKV/RbyW42dRTUDn9VFnRr3eDdU4DF+JhkuX18DFjs+DAvQxtuokG
 AeASqhrB/UWfcZ19tQ6+IS56EtqbGQaNJwvo/gcXHnPqOwfNj+gIM8SHTQcQ7+z0C/vx
 MYVl0Gqtoj3dyGMlhPBaaPK0DLaIc0UZpt48KwXGx5ylSRWwZoGd9cJheYZzaiDls4Xp
 xe91v+Td1Rj2AHVPvswnDgktbUtAEiqC5MKVpfHeAxkyIeXZn/osC8VxIXg7FuQXCVJj
 ug6Xpii83v4kVhEE+m4pX+0FbkWXM2R+J8/+yh+5mwEGk2RxJPUeFYwgDW7yh29onxuM
 E0VQ==
X-Gm-Message-State: AOAM532keCvR/1/6DLB1zpNBwcuk/HOp0wBBW/AVoyk6nksUxY3lsWXs
 e3NxfoMcvgbvQbWUUijS2jzvXmvaOVU=
X-Google-Smtp-Source: ABdhPJwbTN5MafkBHpewYcQ2iZsliIy+EW3jo4GKIAHYmJIwpiy8oUVZw5waxSn4cYXiUp0W1S+s+A==
X-Received: by 2002:a17:906:9442:: with SMTP id
 z2mr8992610ejx.79.1617276147636; 
 Thu, 01 Apr 2021 04:22:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] replay: fix recursive checkpoints
Date: Thu,  1 Apr 2021 13:22:15 +0200
Message-Id: <20210401112223.55711-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

Record/replay uses checkpoints to synchronize the execution
of the threads and timers. Hardware events such as BH are
processed at the checkpoints too.
Event processing can cause refreshing the virtual timers
and calling the icount-related functions, that also use checkpoints.
This patch prevents recursive processing of such checkpoints,
because they have their own records in the log and should be
processed later.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <161700476500.1140362.10108444973730452257.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 replay/replay.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/replay/replay.c b/replay/replay.c
index c806fec69a..6df2abc18c 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -180,12 +180,13 @@ bool replay_checkpoint(ReplayCheckpoint checkpoint)
     }
 
     if (in_checkpoint) {
-        /* If we are already in checkpoint, then there is no need
-           for additional synchronization.
+        /*
            Recursion occurs when HW event modifies timers.
-           Timer modification may invoke the checkpoint and
-           proceed to recursion. */
-        return true;
+           Prevent performing icount warp in this case and
+           wait for another invocation of the checkpoint.
+        */
+        g_assert(replay_mode == REPLAY_MODE_PLAY);
+        return false;
     }
     in_checkpoint = true;
 
-- 
2.30.1



