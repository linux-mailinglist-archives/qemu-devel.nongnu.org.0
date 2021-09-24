Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A4416F7B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:49:22 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThpa-0002ED-1L
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgZ-0004Vi-Du
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgX-0006lu-II
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id t8so25549842wrq.4
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cb3odcmCuQWoFCXt4iYOTDt5qWlPQnfLAh89ZyyxruA=;
 b=RE5yOKxUSUjUjzBeY1vl15zYkKv1NHrBTccxFGXGjCS/P8zN3+D0uQ9sIHQVbSsTIt
 td/0iLjn78mOYgZIc3PdXVrGdDrxmHrfN9GfRv0E5OnWan024I4RpKk5z0hJWGEw1ysq
 DowOcOy9Degv8AWfT55kpHF4S9G6ztmdPJPbJHzdFVPzyluXiNcbmlX6Thq9sB37LmkJ
 fishgmrRwg/hBbS8lxrVFpu902Wj4L/bNAavQdrwePCHfa31N+RnN5TKjsvqBXkA07YB
 Km8Sp0rMXWHLQyFxubHUPYPXn4/Z/X/Evof3TNc/Ti4rX967BPgWGdDz/DR8UGw6vfaY
 nd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cb3odcmCuQWoFCXt4iYOTDt5qWlPQnfLAh89ZyyxruA=;
 b=sVEcc/3owFuljTcmyOZKZJK++Ic1t305SQ7vhPNpXIzgG4ip2Vv5qiwhHtn1r5OGJ7
 19RLPH05iTbebuWoqM+xNNoN9fJAZycQuHsetIPdnq7bZSC3cNo28oAJ03saUjcMM2LA
 uaO8QyPP4uFSSxZFeL1bARSR2yGV79PohUtyVgd5YG2PoKi2xyD37ukQ7FmMSP7KCkfq
 rrglHDmVGSoNauyq3c7lMxx0R4md7rSJF3JqsveMVCszjOXPPcgsmd5t0QZnXaPUUje8
 39J62IPSVItmUyNLbAERtBMdnf3EVQUpDcuMGvIwOy5QLKencNP+og1vhxrlp637qJci
 au2w==
X-Gm-Message-State: AOAM530PU4ZdxVMtgbQvHKhal5FIIGnCuEgFV2TqCYhLR2fOI9suITSl
 L9CBz2LqGzAzesuE5hsTG7fytkWzfyg=
X-Google-Smtp-Source: ABdhPJz2P7KzGgKM/BX5BJYm5dekVepazlfXTWILHEYQqAftVsrNjp4pAZ+F/NQEE521ToO/3fMsiA==
X-Received: by 2002:a5d:6ad1:: with SMTP id u17mr10469818wrw.204.1632476399970; 
 Fri, 24 Sep 2021 02:39:59 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 k26sm1163062wms.39.2021.09.24.02.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 15/40] accel: Simplify cpu_has_work()
Date: Fri, 24 Sep 2021 11:38:22 +0200
Message-Id: <20210924093847.1014331-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all accelerators implement a has_work() handler, we can
simplify cpu_has_work() by removing the non-NULL handler check.

Add an assertion in cpus_register_accel() for future accelerators.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index bb16a25bcef..bbb83d5982a 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,10 +251,7 @@ void cpu_interrupt(CPUState *cpu, int mask)
 
 bool cpu_has_work(CPUState *cpu)
 {
-    if (cpus_accel->has_work && cpus_accel->has_work(cpu)) {
-        return true;
-    }
-    return false;
+    return cpus_accel->has_work(cpu);
 }
 
 static int do_vm_stop(RunState state, bool send_stop)
@@ -613,6 +610,7 @@ void cpus_register_accel(const AccelOpsClass *ops)
 
     /* Mandatory non-NULL handlers */
     assert(ops->create_vcpu_thread != NULL);
+    assert(ops->has_work != NULL);
 
     cpus_accel = ops;
 }
-- 
2.31.1


