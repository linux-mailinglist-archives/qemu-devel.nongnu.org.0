Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8707C552F55
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:02:16 +0200 (CEST)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ai7-0008C4-LB
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aRE-000852-LO; Tue, 21 Jun 2022 05:44:48 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aR9-0007Q8-L1; Tue, 21 Jun 2022 05:44:45 -0400
Received: by mail-oi1-x22d.google.com with SMTP id v4so16415756oiv.1;
 Tue, 21 Jun 2022 02:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlXraOtf2sbS3ADdQCtU+Ose4IYOB9EgS1SJhAMg7yI=;
 b=fBuyB22Rn4o3ZcaNEiOnXqQQYywgDK01zLFZIoT2X+ku88zHtnGKbbrCOmnOdfnQ3g
 ZcqHo9frpDNa5ve084HcGJK7/aIZDdB4WYQOkXETySZNtTIGcum9Mrdo+EVQNwGKRMf7
 xy0++1lNFiZB+lSidCWhDxlqnCBpRJp51u/C5AljauLPfHes7FKP2j06aqeOAGQuTvZI
 vZbKELjTnu8sZQrlVR08oCFoM0mIJDmoS9ZyVBEkJJD5iZOM7KdGqG/Gl1X4GFgpwvNz
 RJjzPL7Idg0IFeU9j289w3fn7UPdZlg9BiPI3Ttb2NqB34i1kEixhMV2SqfeOC+csESS
 0nIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SlXraOtf2sbS3ADdQCtU+Ose4IYOB9EgS1SJhAMg7yI=;
 b=wzZ7fbE0/Hv+o0IPs2tecgf1C+gMC4NjAXEMI9LRKIWzz5hN+OWX5SWjgO5l1+mO5m
 XhHOpmLsXVNgQULqnM/1gkWp5/QWsIQjP/XMerjUaxIk6CTmakbzgPQ3jTCTBqRgwqoO
 9T4HPGCGllzjcSq57w6wvj1gJuQlKVNEsD3g8lGiH0tiD2rn7W8uMRlSn9J55CsnRF+H
 CLcC5S9fJS7CYkbCIWeY+A1tlOP1Zqwla3GmSvZGexAEf5JflmHKYiPe2TrMn8GfvmEi
 BY2qO/s0oKbJ1Dok6AgXaQETHjPSw612gftKYho6qjYkh8dQKuCmTpkrrnDma7f8PRk4
 UMWA==
X-Gm-Message-State: AOAM530iTpQFlOfIEv9/ZRZZO2qRBU1PniBkzXv4TXdKz4IrKka6HlDp
 VQ1gBfT+hk1mENiXlHtp5k0AhpGCegJiTg==
X-Google-Smtp-Source: ABdhPJw1kFieY7/epyMLEw4a9asrz9ztWYQ5vD2TIRnk3fJ3EvYrZXJ1I+RwW8moMY3UVyg2yoXbLw==
X-Received: by 2002:a05:6808:e87:b0:32e:3cfb:fad7 with SMTP id
 k7-20020a0568080e8700b0032e3cfbfad7mr19535657oil.197.1655804681193; 
 Tue, 21 Jun 2022 02:44:41 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 15/15] target/ppc: cpu_init: Clean up stop state on cpu reset
Date: Tue, 21 Jun 2022 06:44:00 -0300
Message-Id: <20220621094400.122800-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Barrat <fbarrat@linux.ibm.com>

The 'resume_as_sreset' attribute of a cpu is set when a thread is
entering a stop state on ppc books. It causes the thread to be
re-routed to vector 0x100 when woken up by an exception. So it must be
cleared on reset or a thread might be re-routed unexpectedly after a
reset, when it was not in a stop state and/or when the appropriate
exception handler isn't set up yet.

Using skiboot, it can be tested by resetting the system when it is
quiet and most threads are idle and in stop state.

After the reset occurs, skiboot elects a primary thread and all the
others wait in secondary_wait. The primary thread does all the system
initialization from main_cpu_entry() and at some point, the
decrementer interrupt starts ticking. The exception vector for the
decrementer interrupt is in place, so that shouldn't be a
problem. However, if that primary thread was in stop state prior to
the reset, and because the resume_as_sreset parameters is still set,
it is re-routed to exception vector 0x100. Which, at that time, is
still defined as the entry point for BML. So that primary thread
restarts as new and ends up being treated like any other secondary
thread. All threads are now waiting in secondary_wait.

It results in a full system hang with no message on the console, as
the uart hasn't been init'ed yet. It's actually not obvious to realise
what's happening if not tracing reset (-d cpu_reset). The fix is
simply to clear the 'resume_as_sreset' attribute on reset.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220617095222.612212-1-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 0f891afa04..c16cb8dbe7 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7186,6 +7186,9 @@ static void ppc_cpu_reset(DeviceState *dev)
         }
         pmu_update_summaries(env);
     }
+
+    /* clean any pending stop state */
+    env->resume_as_sreset = 0;
 #endif
     hreg_compute_hflags(env);
     env->reserve_addr = (target_ulong)-1ULL;
-- 
2.36.1


