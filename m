Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C403FF129
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:19:39 +0200 (CEST)
Received: from localhost ([::1]:58014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpRC-00039g-9Q
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpNq-0007PN-Gy; Thu, 02 Sep 2021 12:16:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpNo-0000au-Tq; Thu, 02 Sep 2021 12:16:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so1767143wmq.0; 
 Thu, 02 Sep 2021 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wV14RcZMLIQqRNfbc2l4krY7RhS99j63lxSZtHhlqHE=;
 b=EKqirEKnM17VK0zDlsK2zMeCBYwgcIwGau/nM2ojAXQ1rvdOXkyoVbGuyEtcnzeBcf
 xImFuE98afvxno05q0YdC27nz6NANS7cu771VPDYoClXWYNKBPbXOfx9/ySz5LCrUECJ
 Q4xIJxN/kF3No93cpZwlCIAaJ6XH09BodtAvBDBdkeBdwCBDaphPwkcvpVDIxHiZ6ysU
 O+OUGJNK0KyuMps/0T4ys/RLGMV8UZ8emOYDNmBvg+JTSjUog7qhAQcBWa/t3lzLUf2T
 odXtoH2/j2F/4nd8pGQvQwtB64/pnwk36AxB7fddw33eEJVy5u1yikEgzNZHCoqMgJ3i
 wCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wV14RcZMLIQqRNfbc2l4krY7RhS99j63lxSZtHhlqHE=;
 b=obfnCFlA/xBJxSJ93vlT+eyCoKKTthPrYewOZnWObjJmi1w3iBtkBZIYCPjj6h0vGE
 x8PQDi0aa15Jgm+P4NGOFTSH9C9IF4+G9RKwngmhwY8t9JfSCq3pRHGd1w0mwtsdnV58
 dhNRPT08EqhxmYwCbAI1z68v9ctdLL6zvkc5+Mk/oQ6czmFv/t4jO3+JN/2hUPkF5TJ9
 ihYt0abRxemfdri9OtBPdFb6xebcY0bOwR0aF7yfL4va6uIrGFuxZTFvgyERZrIUryHV
 j8SOCZI8RV7qxiGVLSdkcBu3Rg0LsOI9x+qMgx/Yj9GhzK0M/1ZouMCbNxbGd+2qaIhW
 AYzQ==
X-Gm-Message-State: AOAM530BAsWoqWCdDJSersNw/sjh7TOLxAITXbd3rVz0DzGmIXj2x2wt
 ZhF4oo53jHtbqLiSqb5siU8QuaXdlqI=
X-Google-Smtp-Source: ABdhPJw7/6UEiBwptJyfAbxmtA0JM7jALL+mTrdaJbBQ6pe56ORuZs2k15EQns1EFPDQ4opAGTbfXw==
X-Received: by 2002:a05:600c:2101:: with SMTP id
 u1mr4147345wml.45.1630599364755; 
 Thu, 02 Sep 2021 09:16:04 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p5sm2438468wrd.25.2021.09.02.09.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/30] hw/core: Un-inline cpu_has_work()
Date: Thu,  2 Sep 2021 18:15:16 +0200
Message-Id: <20210902161543.417092-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to make cpu_has_work() per-accelerator. Only declare its
prototype and move its definition to softmmu/cpus.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 8 +-------
 softmmu/cpus.c        | 8 ++++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2bd563e221f..e2dd171a13f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -546,13 +546,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
  *
  * Returns: %true if the CPU has work, %false otherwise.
  */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
+bool cpu_has_work(CPUState *cpu);
 
 /**
  * cpu_get_phys_page_attrs_debug:
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840b..7e2cb2c571b 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,6 +251,14 @@ void cpu_interrupt(CPUState *cpu, int mask)
     }
 }
 
+bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->has_work);
+    return cc->has_work(cpu);
+}
+
 static int do_vm_stop(RunState state, bool send_stop)
 {
     int ret = 0;
-- 
2.31.1


