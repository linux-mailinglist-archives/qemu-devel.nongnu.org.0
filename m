Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE06CCDD1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 01:01:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGp-0006wB-OY; Tue, 28 Mar 2023 18:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGm-0006ve-UZ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:24 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGk-00073J-Rz
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso16757482pjb.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAjWx8wHRPQYJiH1acoUNfkkeaHJ4tKlefw+Iq5YcRg=;
 b=h43nSX/T0rQTACB/bnUecG/niMEOLuCZKgmoEwSEDvskUqRXQHlvHIMuaXDqsZBKoF
 gs0Dw6EHSeHWxg78bAvX2wBGpKQ3TF78rOhz0jz5+JgyuVlLW/nPrR6ArEGILlf1EUUJ
 yLM7+dTAYA8X3UrPdag1FCvTAy+GovCLHXPnq9mYzw0jqgBH6ZjAjGRW7gFgEq28OBhG
 G1f7ScpAfYHHCywJYL6Pl0Fg4vB+7O1XNycCsQu462AsTphDcpC6w566WMq9DzKA1i//
 /b4yE/3V98df0j6GXqulJliYTL1nPghFQriQYn0BcKy7Iz8koJBOSlnX8YPs7fw0OaSM
 ZsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aAjWx8wHRPQYJiH1acoUNfkkeaHJ4tKlefw+Iq5YcRg=;
 b=s89Tce0yfL0yZ/0MVs2d4yocpNT3R/gdgI4FvoqgmUvpfhayl6UhpMCIxMx+m5x1N/
 wxFoKjgpCsF0hfR2wksnjRDw+8qVctF1ghmckhEWO4ntG0qAmqrXXkijLMSRPwqgFYT/
 KPJZ1IE8z+4Wb/klXg2bba/tENdHw19gy1M5sri0vr7oJbLWSCSNur6Qdc2lQb7QSeYc
 JqbMYSEBHzpMTGEZAvm6llJLW5wsioCWsezJRcJLCBmSgcsgrWOdlTB00OsZzHw3fNfr
 DqathakPS3v3y/0oMPT9MPoe3Dn5G4vuSrbsx+/78L8Nyhnto3JL81E0aQoKrciGBOJG
 2WTw==
X-Gm-Message-State: AAQBX9cBSGA0pUdThaA4jdD83C8xVDR2ZHQYQpFiGEM7lpllmiO6EZ/s
 LwgqkVqSbbCTfgrz4yHWoOHO/ihtUsUNWyY7JdI=
X-Google-Smtp-Source: AKy350YvVVvqctoytRFLc60meK51eMeJHhHb+fuQTkTNZo7ES9ti6XDkahcRhWdIIVhJUaRA2V5UWA==
X-Received: by 2002:a17:90b:1b0c:b0:23f:5273:1ae1 with SMTP id
 nu12-20020a17090b1b0c00b0023f52731ae1mr18036577pjb.14.1680044301930; 
 Tue, 28 Mar 2023 15:58:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 15/15] softmmu: Restore use of CPU watchpoint for all
 accelerators
Date: Tue, 28 Mar 2023 15:58:06 -0700
Message-Id: <20230328225806.2278728-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

CPU watchpoints can be use by non-TCG accelerators.

KVM uses them:

  $ git grep CPUWatchpoint|fgrep kvm
  target/arm/kvm64.c:1558:        CPUWatchpoint *wp = find_hw_watchpoint(cs, debug_exit->far);
  target/i386/kvm/kvm.c:5216:static CPUWatchpoint hw_watchpoint;
  target/ppc/kvm.c:443:static CPUWatchpoint hw_watchpoint;
  target/s390x/kvm/kvm.c:139:static CPUWatchpoint hw_watchpoint;

See for example commit e4482ab7e3 ("target-arm: kvm - add support
for HW assisted debug"):

     This adds basic support for HW assisted debug. The ioctl interface
     to KVM allows us to pass an implementation defined number of break
     and watch point registers. [...]

This partially reverts commit 2609ec2868e6c286e755a73b4504714a0296a.

Fixes: 2609ec2868 ("softmmu: Extract watchpoint API from physmem.c")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230328173117.15226-4-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 softmmu/watchpoint.c  | 4 ++++
 softmmu/meson.build   | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ce312745d5..397fd3ac68 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -949,7 +949,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
     return false;
 }
 
-#if !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)
+#if defined(CONFIG_USER_ONLY)
 static inline int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                                         int flags, CPUWatchpoint **watchpoint)
 {
diff --git a/softmmu/watchpoint.c b/softmmu/watchpoint.c
index 9d6ae68499..5350163385 100644
--- a/softmmu/watchpoint.c
+++ b/softmmu/watchpoint.c
@@ -104,6 +104,8 @@ void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
     }
 }
 
+#ifdef CONFIG_TCG
+
 /*
  * Return true if this watchpoint address matches the specified
  * access (ie the address range covered by the watchpoint overlaps
@@ -220,3 +222,5 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         }
     }
 }
+
+#endif /* CONFIG_TCG */
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 0180577517..1a7c7ac089 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -5,11 +5,11 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'physmem.c',
   'qtest.c',
   'dirtylimit.c',
+  'watchpoint.c',
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
   'icount.c',
-  'watchpoint.c',
 )])
 
 softmmu_ss.add(files(
-- 
2.34.1


