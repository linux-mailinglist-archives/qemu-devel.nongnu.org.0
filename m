Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29616CC770
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:05:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBmM-0000AD-K8; Tue, 28 Mar 2023 12:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phBmI-00008d-Tj
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:02:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phBmG-0004Ha-EI
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:02:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e18so12764247wra.9
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680019347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MbnN+0f617dsehwYtlh7IWt8dwxE1cjBMBOmowF/jo=;
 b=VJZ0iiE81gahmAHh33wdnxu9f+fm7PWswjCh7eESenZk4qw+MBxuSDrdCRJA0VrjEI
 +C7aKvPD13wY3jABL63HkqOa9uMkiu9Mbn2+aR07oiNg+xMVJQrsjvj4hLMsKVcydEBY
 nwiqU5BDc6N6afTuF03JZqD8tCyzkYo3IEfdUUPofFV4GZMfjkRzf6rM6AHXt6J9wY2r
 HMQigzyW+2RXu4nay6XAGfMfQXkEWxNc2j8yR2sEAbCMcg6+rBtCdJvepi60ZidtWN9n
 c0gEDCsuxeLXDQAbKpXAHz6BYiGfYjVotey3OfXSQsTFqFBrXE/2h/6xbGPnvH2z/hHT
 0Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680019347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MbnN+0f617dsehwYtlh7IWt8dwxE1cjBMBOmowF/jo=;
 b=bIz2wdAgqn7NF8vDh0uxunPmXB79SH205WlM7gRk1ie9gepsqlctAohD9L2JvwyoCg
 ZyKuqbJo+1o+QEqjYt6Hd51WVHk4llvfV9t241+aa0zt7Sj+dM+SorrALkqYEBq0KUAJ
 W8XX+dvtLR1HbG50kT599TXkrIRD00kSfOrYYQ0H6Pt5ZyAyQX/NvrdwpxNkJElOEEEJ
 76jxWIZC7PzYHx/7I4UGjPwPUCI3np2eV0ddZPIj7rtxxuolU6kPH2KG5nQQskqzowsg
 Vh6nF2WSqhZ0rRbqOHqFzqLHtR0723u77HqKyKmNNUKtizZcqyCLY5mDgMNOQNIr8w9C
 xHJg==
X-Gm-Message-State: AAQBX9fh5YBgPvjp1djw+P4CA9apE6DINPyVen/VszNnY/bgImy7TGg2
 8R1t59C9uq3513/aJ2kuo4+e6vT/vRGxz2i1t84=
X-Google-Smtp-Source: AKy350ZFQOfZ6NGkv37Y8Zyt4NAfhytXhLygwXOKe3bf5X+CGLXdwq0Za3H95yZDpyNDB1L/YK+wcg==
X-Received: by 2002:adf:f4c2:0:b0:2ce:ad40:7705 with SMTP id
 h2-20020adff4c2000000b002cead407705mr13934370wrp.25.1680019346740; 
 Tue, 28 Mar 2023 09:02:26 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a5d4dcb000000b002cfe3f842c8sm27713200wru.56.2023.03.28.09.02.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 09:02:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-s390x@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 3/3] softmmu: Restore use of CPU watchpoint for all
 accelerators
Date: Tue, 28 Mar 2023 18:02:03 +0200
Message-Id: <20230328160203.13510-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328160203.13510-1-philmd@linaro.org>
References: <20230328160203.13510-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
2.38.1


