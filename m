Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8426D4A8B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:48:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSS-0003s6-B4; Mon, 03 Apr 2023 10:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSN-0003r0-0f
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:51 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSJ-0001AX-On
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:50 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so14569038wms.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VidZ338/Ll675LpmUIMXQVVwfttOYy1vFb692uMsJIU=;
 b=WEZHtHCadaQla3wo+MneEsv+quPH235LaPthExJHIuEDd1IvVcyyFd+Rf15cT8cPLx
 Kgx1yfWNGyJC7sGROHpMGY9KTe0lWxd3cqMTZWOGhJHaPpbAZVW0TD4BCJlDfs/wppVf
 zQHkSgPET5HwgrB3iVjslpWYe3kd9/FdwK8fvFP69Vqw37pGTK6e30z4YJ4hmZCiXsYl
 ruCyvwup0oR30pdjxXBUfHpeixLYKENz+do+v+tQo2XupeL+Sbh2Bo10TVUw8YELIDF4
 oYWlBu16X9gLP5qn3rLd9GROt7cJnDmGMCJ1KXISepZ6imf8oFLZ2uw0m68QR+Nubvok
 edkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VidZ338/Ll675LpmUIMXQVVwfttOYy1vFb692uMsJIU=;
 b=aacIYqPZ+jXgZVnaT0ev+U+z8T1tWF4tzz6vI5p1b+LQqSZG7rnwe93NSMQFpJX3Mf
 /jjSti4vmd9VL2Djff6joDbcrK8lFptrYStwvKzNQm8Ro6z4eBnNioXpywstW7XS4kXS
 kcK1zElSqeaTnTRBJ0mZJBxu0Tid+5OlCnrcN5g9JVBI4hpp6Cl68r29vBEY6b3x7OGJ
 uLXyqnj8eix1adFz9vG7M1a1WdtbI5PKLnWOdGRr+rSiPQwBpXjqptlVCw1hpAbaKCQ5
 d+qidY8KQpdhnwgq9KR0B8Xk998/b4KqEZdwQM4SrTl0S79O+JMYjIsIOomZX4Iwt8XQ
 pz0A==
X-Gm-Message-State: AO0yUKVQebGUhpQJzfsdG0OD4ciZ0y/82vFjRJPVwT5OkD1AP/ixtuDk
 GCQLndlWOSXfX+8iZAnn0NBMru/+PcmH5jX4Tp0=
X-Google-Smtp-Source: AK7set+XuyLboAp+32/dhEjcLqLhEeLc+K4XotaEDXfOysGthZD31DiueNK7IjB8rFh9/rPjNS+uGA==
X-Received: by 2002:a7b:c44a:0:b0:3ef:8b0:dbb1 with SMTP id
 l10-20020a7bc44a000000b003ef08b0dbb1mr26691138wmi.7.1680533203939; 
 Mon, 03 Apr 2023 07:46:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 08/10] hmp: Report 'one-insn-per-tb', not 'single step mode',
 in 'info status' output
Date: Mon,  3 Apr 2023 15:46:35 +0100
Message-Id: <20230403144637.2949366-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The HMP 'info status' output includes "(single step mode)" when we are
running with TCG one-insn-per-tb enabled. Change this text to
"(one insn per TB)" to match the new command line option names.

We don't need to have a deprecation/transition plan for this, because
we make no guarantees about stability of HMP output.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu/runstate-hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/runstate-hmp-cmds.c b/softmmu/runstate-hmp-cmds.c
index 76d1399ed85..20facb055f0 100644
--- a/softmmu/runstate-hmp-cmds.c
+++ b/softmmu/runstate-hmp-cmds.c
@@ -30,7 +30,7 @@ void hmp_info_status(Monitor *mon, const QDict *qdict)
 
     monitor_printf(mon, "VM status: %s%s",
                    info->running ? "running" : "paused",
-                   info->singlestep ? " (single step mode)" : "");
+                   info->singlestep ? " (one insn per TB)" : "");
 
     if (!info->running && info->status != RUN_STATE_PAUSED) {
         monitor_printf(mon, " (%s)", RunState_str(info->status));
-- 
2.34.1


