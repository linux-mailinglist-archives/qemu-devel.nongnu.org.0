Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE0F31BA62
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:31:45 +0100 (CET)
Received: from localhost ([::1]:49566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdya-0000YY-J8
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk6-0005la-0o
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:47 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk4-0005bJ-JA
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:45 -0500
Received: by mail-ej1-x629.google.com with SMTP id jj19so11089683ejc.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOb5WqK1h7H5VvgqNLb/EnTdOMmXVIKU1eAqcJBfqNs=;
 b=kWFa6blpdDKXkQqlM/1dJELCLMt4tDow3aocqNQ4kJyuvYvN9SmIyEpHAGsmUiC+T8
 QXeHTKh9b3BNtvLONzU0IvL5e11UAUrwlhPsYvoBNkYMrWmAShO0ZSomPXt85PWkJo3j
 0bDSKSOtJivlvUjmQWhol/PB/VcsdQp3N3hEBErpTZB6Odh4k9GEBiopFV+7P63IBGq4
 EgcqTRbpbasHWmlWncPBdM6TyqnDhgZW1Yt3bkXxLLLDQV0Km8A6HfBh+tp+FraLqIXV
 WNGR00F7dQfv6P6eIW8hQNG8diHma/6Ityxh4uRxRJf6n0y0R44y/c2PuMg0rYhQhS4V
 A0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wOb5WqK1h7H5VvgqNLb/EnTdOMmXVIKU1eAqcJBfqNs=;
 b=bz5ySZOXb9IYGFYHfnfhUPeQzvbxb0RVLNfnMxBPovBNZ7BLroC5am3BiSwkVNSAxl
 z3LPvONlOz7yY0VIJeN8Nl6bV/V09L4rShDaUKeR/A/bYHAyreeD+oSD3mgGxz2Blp50
 2vkv12fD+beKmH7YfJalWVCid3s7OrsTMzwmTHDrYVvMYOfGteLyLJXNuIKVVQSRv5dJ
 n8ErcXEsGOyX801EkOwNACcu0JKJLPV/Hqmtpv5UeAqwn8L3TgKX5G+3sjRDyeEiat1J
 b2qf+SEIV88gS89BTX2p4csplYRCQF2SXy6ZzNUDfo2NnERjtl8JIOEz6ld/uI4S2B+7
 k07Q==
X-Gm-Message-State: AOAM531aE6vfu1l62mT9YK0xkRCheMBYnGMdUNcNm7J+ryt23RQ+XS1F
 BGBufYzErlRhxJPXWi+m8dSMp6HLe5M=
X-Google-Smtp-Source: ABdhPJy0GcvzQOH+ShVIbwnGNXlRF/2zmOo2zT3LUi7tBTOvBuHlzflQLDNtg3vwQNN5BWXjwNuBZw==
X-Received: by 2002:a17:907:3e06:: with SMTP id
 hp6mr15523255ejc.254.1613395000562; 
 Mon, 15 Feb 2021 05:16:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/19] target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT
Date: Mon, 15 Feb 2021 14:16:25 +0100
Message-Id: <20210215131626.65640-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

Some guests (ex. Darwin-XNU) can attemp to read this MSR to retrieve and
validate CPU topology comparing it to ACPI MADT content

MSR description from Intel Manual:
35H: MSR_CORE_THREAD_COUNT: Configured State of Enabled Processor Core
  Count and Logical Processor Count

Bits 15:0 THREAD_COUNT The number of logical processors that are
  currently enabled in the physical package

Bits 31:16 Core_COUNT The number of processor cores that are currently
  enabled in the physical package

Bits 63:32 Reserved

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Message-Id: <20210113205323.33310-1-yaroshchuk2000@gmail.com>
[RB: reordered MSR definition and dropped u suffix from shift offset]
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h         | 1 +
 target/i386/hvf/x86_emu.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8d599bb5b8..82c1ac00ef 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -368,6 +368,7 @@ typedef enum X86Seg {
 
 #define MSR_IA32_SMBASE                 0x9e
 #define MSR_SMI_COUNT                   0x34
+#define MSR_CORE_THREAD_COUNT           0x35
 #define MSR_MTRRcap                     0xfe
 #define MSR_MTRRcap_VCNT                8
 #define MSR_MTRRcap_FIXRANGE_SUPPORT    (1 << 8)
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index da570e352b..e52c39ddb1 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -668,6 +668,7 @@ void simulate_rdmsr(struct CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
+    CPUState *cs = env_cpu(env);
     uint32_t msr = ECX(env);
     uint64_t val = 0;
 
@@ -745,6 +746,10 @@ void simulate_rdmsr(struct CPUState *cpu)
     case MSR_MTRRdefType:
         val = env->mtrr_deftype;
         break;
+    case MSR_CORE_THREAD_COUNT:
+        val = cs->nr_threads * cs->nr_cores; /* thread count, bits 15..0 */
+        val |= ((uint32_t)cs->nr_cores << 16); /* core count, bits 31..16 */
+        break;
     default:
         /* fprintf(stderr, "%s: unknown msr 0x%x\n", __func__, msr); */
         val = 0;
-- 
2.29.2



