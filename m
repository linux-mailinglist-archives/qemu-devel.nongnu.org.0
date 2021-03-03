Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43232BCAD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:07:22 +0100 (CET)
Received: from localhost ([::1]:33222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZeL-0006Je-Of
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZN8-0006wt-Vt; Wed, 03 Mar 2021 16:49:35 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZN7-0002gA-Iu; Wed, 03 Mar 2021 16:49:34 -0500
Received: by mail-wr1-x431.google.com with SMTP id h98so25343201wrh.11;
 Wed, 03 Mar 2021 13:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bxkFypL9ynYmWsntppZ7LktvbyLhxQp4d+/kAn8sAgo=;
 b=MBF4+lTxuVvAnOCUmds0Qif+mBC839/cwZpVlFExnBSDxJq0zPe9fiuu+X20wPaSKp
 HUA2DhHdtUnQPmmwONDZVz2FtdSMAXVJjHBrkFo5Y7eWWMWWmMlJB91E/1q/xGdRLC5g
 E1K7DnDmYmFhlPAwNEPUCYeVHf00vOQukF+hvEJihnNa/47ymr5qPHXg3OOVdLoW2a1q
 t4hLkJqznaHlZZ3Wu+Z9qYcqzsKlwtQP9LhVkIsBOK4RZkudywiesPTs70J4Nn7IfYvi
 HOuMj3ZvWNav8bhX8wTzcbEOeB8c3dr7D658TkZdiKL8bhMEYmrmifgud+63wr9HdA4T
 aXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bxkFypL9ynYmWsntppZ7LktvbyLhxQp4d+/kAn8sAgo=;
 b=MOYaj6RCFwT85BYzUZh/OZQ/wn3FeHWyWAT3l0Kfdo9C/Ch23/OgZ3kyrdlZmXX8Du
 aK7WSiBkjbY7jAFfdI4Dg+19C5tnBNXHLexvZtQYZuwzNIgwA4ooeRtjZOXE1ORkkb37
 gJWD4Vu444vzZloxmtXZ88nPXFUVWbxRMuYpaK0YrJfLdujwxBgZTP2Y3EpyRdCGymy4
 wDJ4DMJpttlpOyi6RfsTuetgqBjfTcS1WuCDuvs3oyeZYbdXQrDQ9yo6NkBSXZHSlkVT
 RNMbPQopKWyCegokIYQrdG5E/x8W1Eaer3IZ8IkXysME+dYt74ZSRoegyxfkTQkARBnF
 45vQ==
X-Gm-Message-State: AOAM532HteQZLwFb6w44nm98Qb/VZIsDcSgOYAmjLA+kcgr4hNY4pMkw
 tjG1QC3CSuw8bsckuJHNbe0QwGQkg+E=
X-Google-Smtp-Source: ABdhPJzZfI7TQhb4TmfrwYHeRw812f6SyR8WPbICKpu/1KKUh9xn2khVtehQMbw0VqHf6UkDh81hMA==
X-Received: by 2002:adf:a18a:: with SMTP id u10mr681832wru.197.1614808171102; 
 Wed, 03 Mar 2021 13:49:31 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o2sm6723019wme.16.2021.03.03.13.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:49:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/28] cpu: Remove watchpoint stubs for user emulation
Date: Wed,  3 Mar 2021 22:47:06 +0100
Message-Id: <20210303214708.1727801-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we remove all access to the watchpoint methods from user-mode
code, we can now remove them, as they are not used anymore.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fe4206b540f..b708f365a7a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -916,39 +916,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
     return false;
 }
 
-#ifdef CONFIG_USER_ONLY
-static inline int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                                        int flags, CPUWatchpoint **watchpoint)
-{
-    return -ENOSYS;
-}
-
-static inline int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
-                                        vaddr len, int flags)
-{
-    return -ENOSYS;
-}
-
-static inline void cpu_watchpoint_remove_by_ref(CPUState *cpu,
-                                                CPUWatchpoint *wp)
-{
-}
-
-static inline void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
-{
-}
-
-static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                                        MemTxAttrs atr, int fl, uintptr_t ra)
-{
-}
-
-static inline int cpu_watchpoint_address_matches(CPUState *cpu,
-                                                 vaddr addr, vaddr len)
-{
-    return 0;
-}
-#else
+#ifndef CONFIG_USER_ONLY
 int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                           int flags, CPUWatchpoint **watchpoint);
 int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
-- 
2.26.2


