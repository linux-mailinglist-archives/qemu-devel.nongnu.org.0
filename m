Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541235146F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:25:09 +0200 (CEST)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvRk-0002Wi-Gq
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPF-0000jy-Am
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:33 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPD-0006h3-TV
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:33 -0400
Received: by mail-ej1-x62c.google.com with SMTP id w3so2338900ejc.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FACbZ/ff7TqFtcB9utnNWMNn2f00Di6NIXduzRvbc4=;
 b=Z40ifjb5sl2ZBU7owkyFN6CWhnjICrIB7SYKHyLw5KYbIXNd9n/l2U/y6AZPnfJnpQ
 EC7AnI5ral0VYAHENXFL8l2Uip274820qrB2mcInZqvZ0nO4g6FYqelmFkKPiV8fb1Oh
 m9Gs826RlF+/1gK/IjdjMbaMxP9sxYEGddoq8nH5N+8RPZIhP0hCud71bIsHHRM9Be5g
 i66Eo6hPMsk5hAYgiB7VwuktGqK095KqfptQeWHXwUb5ElrV1MNtGE+Z34LxSuat9nUj
 hLPz6fROFXW6+LrG2Fg687MT1BJBvu9T17OX9JY+N8CXRyrpkWMg23Yz0/dkR1UsJjnD
 rUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4FACbZ/ff7TqFtcB9utnNWMNn2f00Di6NIXduzRvbc4=;
 b=cY8H6xklbxZ+3l1fUpRntnNyhjxlxwBlPr0e1t8saJ2dxEhN0JUkgljuHfeL9zijIK
 QsFFNkRnEW9DiITEbQGNK8XGueDCDziQJZYbunNCwFzHQCNsMPuJ7+0yC2nrXuUt9Usw
 J/mQwkQk+nBw8KruYz/iP0gQiSgCR3KRQdv4dTAh/Ys/NmZbxLDy8TAtXwkcgt6CPc0Q
 3CvwBygXu6pohIRUl2D9oA7P3w/YO9DtZE9QAoCitLxLJp9tTLfkoL62oIZ5ZD9bH2x/
 AG4glfPXTPE2a/+bGmKVrYk2wLw4yiMkVsXuJ1qokdFJIH56MsELFhtN3aYChDL0VskT
 tSQA==
X-Gm-Message-State: AOAM533J+G1B5fcF8YEfNLRuNA28313kf+6AhFANrHlurptrQ7PKsVEm
 zysUfm8LNUmgREfbaU3BR/8u9s0h85w=
X-Google-Smtp-Source: ABdhPJyR1XW//ps6yl8v25TSziefnTxjqGjrfP9Ji6GqHM/Ogv2TWu7d6iPMCsQtSGOH+EA5Mb2/jg==
X-Received: by 2002:a17:906:af6f:: with SMTP id
 os15mr8686331ejb.279.1617276149576; 
 Thu, 01 Apr 2021 04:22:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] replay: notify CPU on event
Date: Thu,  1 Apr 2021 13:22:18 +0200
Message-Id: <20210401112223.55711-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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

This patch enables vCPU notification to wake it up
when new async event comes in replay mode.

The motivation of this patch is the following.
Consider recorded block async event. It is saved into the log
with one of the checkpoints. This checkpoint may be passed in
vCPU loop. In replay mode when this async event is read from
the log, and block thread task is not finished yet, vCPU thread
goes to sleep. That is why this patch adds waking up the vCPU
to process this finished event.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <161726519158.1476949.7614181684462079836.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 replay/replay-events.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/replay/replay-events.c b/replay/replay-events.c
index a1c6bb934e..15983dd250 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -15,6 +15,7 @@
 #include "replay-internal.h"
 #include "block/aio.h"
 #include "ui/input.h"
+#include "hw/core/cpu.h"
 
 typedef struct Event {
     ReplayAsyncEventKind event_kind;
@@ -126,6 +127,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
 
     g_assert(replay_mutex_locked());
     QTAILQ_INSERT_TAIL(&events_list, event, events);
+    qemu_cpu_kick(first_cpu);
 }
 
 void replay_bh_schedule_event(QEMUBH *bh)
-- 
2.30.1



