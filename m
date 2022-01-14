Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40C548ED73
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:54:14 +0100 (CET)
Received: from localhost ([::1]:59090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ou5-0001g7-W4
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:54:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8OqM-0005ge-Lr
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:50:22 -0500
Received: from [2a00:1450:4864:20::336] (port=51809
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8OqL-0002ON-0q
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:50:22 -0500
Received: by mail-wm1-x336.google.com with SMTP id c2so1439641wml.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4j5ZpoogZrXBGeG+pIIBBROVX3mdgsqsUVcHMIm4RM=;
 b=eaHKcHp/MI13hh0jZndo5XL5050D0CxxYZW9kRqxFiGF0QI67dTblhgevJ00RqrBid
 1a2jgyrNK8fCqzOcA1KFCb6tjxNSfHsDLY52udUaS2H+/LHJ7YJPCHwL5NIifl0w5Iw1
 wXqLJ+Y3pYstRnJSeZhURjrLgDj5N0PAd1Vo50aAfiYM8TIGi2l6Qz/kkucC/fntDPSS
 V6kfBdIG7lkQPppi+nERqQz24sE929Pl1ClGDfopTWWF0TEhCv9Qii2u9r8xLku9VkDq
 x5P4EIW+DRviMBs/EWuimMqPL+U1hWxqbJHc0ckFG50PIOOcTnez7JbNbiPM16jqag+f
 cegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4j5ZpoogZrXBGeG+pIIBBROVX3mdgsqsUVcHMIm4RM=;
 b=juQ+Aj672jNfMKbH9OvCS2uRT5kOO6k9AUElp7OXTpo6DsId605igU9EJTebjlBEId
 ZDZvNVVdqmQsBP8VjVpR4uDYb9V15/r3apj0u9DbpQ0j3hyvT6O38f5yXOvz4SiBJJFo
 cqqM0+VbjTkMiCa5o6iCHjAGhoGp9gudA1JRY7Z5Vsot7s82O+MWlRpuC+E8BGYTtZY9
 1tA0Xp166XNJ/xONHB9bdYO3m3PscrgFWfGuvN2keOPrC8S67bCYLdm7Is99LHx9jzQR
 9jOHqZI04Ga3OwxzSp0OdapTGVd891SinhXqyAbau3uqZE3VApEJcDeeurr7dC+b3Qkc
 qhFg==
X-Gm-Message-State: AOAM530h7n0A35+q9sGvDpFiUebOI5/I7I8vfXWEpLVgWJDfu7AtVNgj
 j6jLtnThF8YqtGcb1wJGx4KFe2kMkH50GA==
X-Google-Smtp-Source: ABdhPJwx+oweiqin5BHLKgyCnKYd85xLTtyP8r8oH3qQ2KZJCwiFvHeBPmbU+0r/sBYM1etrsWJ3IQ==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr8713811wmc.75.1642175417534; 
 Fri, 14 Jan 2022 07:50:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id k35sm5017651wms.21.2022.01.14.07.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 07:50:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Remove stale "not threadsafe" comments
Date: Fri, 14 Jan 2022 15:50:15 +0000
Message-Id: <20220114155015.3767671-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In linux-user/signal.c we have two FIXME comments claiming that
parts of the signal-handling code are not threadsafe. These are
very old, as they were first introduced in commit 624f7979058
in 2008. Since then we've radically overhauled the signal-handling
logic, while carefully preserving these FIXME comments.

It's unclear exactly what thread-safety issue the original
author was trying to point out -- the relevant data structures
are in the TaskStruct, which makes them per-thread and only
operated on by that thread. The old code at the time of that
commit did have various races involving signal handlers being
invoked at awkward times; possibly this was what was meant.

Delete these FIXME comments:
 * they were written at a time when the way we handled
   signals was completely different
 * the code today appears to us to not have thread-safety issues
 * nobody knows what the problem the comments were trying to
   point out was
so they are serving no useful purpose for us today.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Marked "RFC" because I'm a bit uneasy with deleting FIXMEs
simply because I can't personally figure out why they're
there. This patch is more to start a discussion to see
if anybody does understand the issue -- in which case we
can instead augment the comments to describe it.
---
 linux-user/signal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 32854bb3752..e7410776e21 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1001,7 +1001,6 @@ int do_sigaction(int sig, const struct target_sigaction *act,
         oact->sa_mask = k->sa_mask;
     }
     if (act) {
-        /* FIXME: This is not threadsafe.  */
         __get_user(k->_sa_handler, &act->_sa_handler);
         __get_user(k->sa_flags, &act->sa_flags);
 #ifdef TARGET_ARCH_HAS_SA_RESTORER
@@ -1151,7 +1150,6 @@ void process_pending_signals(CPUArchState *cpu_env)
     sigset_t *blocked_set;
 
     while (qatomic_read(&ts->signal_pending)) {
-        /* FIXME: This is not threadsafe.  */
         sigfillset(&set);
         sigprocmask(SIG_SETMASK, &set, 0);
 
-- 
2.25.1


