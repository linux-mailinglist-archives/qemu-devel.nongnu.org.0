Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB52A8907
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 22:29:23 +0100 (CET)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kamos-00073r-AO
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 16:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kamj9-0002oP-B8
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 16:23:27 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kamj5-0005Tj-B4
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 16:23:27 -0500
Received: by mail-wr1-x441.google.com with SMTP id 33so3397735wrl.7
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 13:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MvkEJhOTTURl32F+uN0ekuj0WJYncaqeHJMVTEXiVk4=;
 b=HMdI09Xs/+trcFkmEhJq0dfdIe8E649T4Ov3fA9K/F5N6HBMQOEEiDs0Qxd8j0TWvs
 BKG+COYBtztDNpynLfJsFXuL6QflprNjTughelbUxsJWEBPW6FUOWflYM3b4fXyR2sQq
 mCTMi5+v7YBGbGBm5vuu55Z21buOJ3g2vxFJlY/n2cY3CT27qs9b/0Qrb1NGUTbBdpJN
 Z3wn/QY0ESNXFejfLIED4469WPjl1fKLYyAGWGGQaULrPAi4AHtZrVtEPQNlJQq6vXLM
 cjgRzoRnGtkYly5+h/4rr/nXZz476A6mYnxAlSrnZeOz1T1RUZTzmqkVUNwwvdlV7S9G
 1W7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MvkEJhOTTURl32F+uN0ekuj0WJYncaqeHJMVTEXiVk4=;
 b=Aq76iRaUbrPjWhTsyaA6gg8FLkaGiOIzUaxJ+AJsveRXfdg97+7iEkUBfLQ+1XUva0
 w+CiMuuf8BuAUacen0729zbmeIq5CSHZLo+fMqoAudRdE1Xh7qbKjVb/jeJQxs9GdvLo
 FNad/A5EX4qAmkbZqTXopLd4EivbIeELgJ/dSB1qX4i1+ruBOWQ9jbbhisTVLBJ+wt9h
 t4qnJNAkp78G+0OHm4y48yzIpIkmEyrBItKxZlqCMzVSTEuqiLd+w0/U5/AirflhXhTW
 gHzSGP3rlhhgqDbzWhVkoI3zf0ofmVni+LHsXcShrjigmrypM3+eYVCHOPBSJXtmTm3K
 ae8w==
X-Gm-Message-State: AOAM530gQPf/nXEEiCvgkFvQ1IuOJUH/J4GHABHqcfIqLEOwVClTDwWG
 8CkUWjVZHcAEu61F0MTRVpJfwU14HWy/Lg==
X-Google-Smtp-Source: ABdhPJwXqA727fOm6dk3+A5Uvj4hJyAoKDWQPnwY9wfLO5yq2hQFTPbUgSgX4ZYlmzoCpRl0QFRR2Q==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr5252857wrl.415.1604611400761; 
 Thu, 05 Nov 2020 13:23:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e25sm4861587wrc.76.2020.11.05.13.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 13:23:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 3/3] linux-user/sparc: Don't zero high half of PC, NPC,
 PSR in sigreturn
Date: Thu,  5 Nov 2020 21:23:14 +0000
Message-Id: <20201105212314.9628-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201105212314.9628-1-peter.maydell@linaro.org>
References: <20201105212314.9628-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function do_sigreturn() tries to store the PC, NPC and PSR in
uint32_t local variables, which implicitly drops the high half of
these fields for 64-bit guests.

The usual effect was that a guest which used signals would crash on
return from a signal unless it was lucky enough to take it while the
PC was in the low 4GB of the address space.  In particular, Debian
/bin/dash and /bin/bash would segfault after executing external
commands.

Use abi_ulong, which is the type these fields all have in the
__siginfo_t struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/sparc/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index c315704b389..d12adc8e6ff 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -247,7 +247,7 @@ long do_sigreturn(CPUSPARCState *env)
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    uint32_t up_psr, pc, npc;
+    abi_ulong up_psr, pc, npc;
     target_sigset_t set;
     sigset_t host_set;
     int i;
-- 
2.20.1


