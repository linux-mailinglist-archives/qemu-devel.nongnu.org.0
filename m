Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41F2F548B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:22:05 +0100 (CET)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznae-0008Tu-8V
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1kzn95-0005qV-UG; Wed, 13 Jan 2021 15:53:35 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:38121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1kzn94-0000Si-CW; Wed, 13 Jan 2021 15:53:35 -0500
Received: by mail-lf1-x12d.google.com with SMTP id h205so4796232lfd.5;
 Wed, 13 Jan 2021 12:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUgrc3M0DZmOlA4+yxCQfDMaewayvLv0hgNavKax1XM=;
 b=nnhDWPswhzmDPwjRLsX2Rdu9Jazppom0aM2MhrSnV2FguxVHwViXGzLiag5AXt8jmd
 8YYhG1a95LthVQZirK/hj4llTb8gaZOq09gcs7gdVIGGaSl9/2mpkb/DRNTjmKXuhYlP
 TUBIyDmHPgKzElXtqMWokZ+Mkv2REClGvTvevpkTY3sDsNqNIoE83f3WJvmGNpD7bbWx
 Ma/Fbno+EtQZCFKOizVOveZh1jMEFEP9Wbmke6c8UprdQI7aIWIDh7nrpT80oSSHeXAA
 gx3q3wYVNGurU+l7AdgnITj1bPHO2UckcyAvyqjZ5QqXA0MnSoxvNG3+jYRp+87ZIRgF
 BW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUgrc3M0DZmOlA4+yxCQfDMaewayvLv0hgNavKax1XM=;
 b=G446qAy6Ud1DaOQDzLSI3LzQxP78GNqawPoB727S014auQ4Q7n4UWNZP8zIUGrD60r
 ltRZJYjxrF5mwup8+vNi9/vtXzIZmpDxkGteRnTAxORz1bZUfeCQU6WnmM+FFniAJlTF
 m/Eg84bUqokF9pOe6x/kerriWBUtkfmPZ7iebH8ihx9hTEhrk2+RL5r9I5GQ5jA0waIQ
 QdBYIsp8Iv7H4Sy8mMTciVXAqYawhwsYSXdGGA64L02C69hmeMPEjNu7bty3VBLTVMGP
 navS6Z4LBhy2/Rbe9XfhjDcfzov0C4HP9MQ/xlcv+x4tHNfWLT/TCvr3cIVCTG4sO5b4
 /Mqw==
X-Gm-Message-State: AOAM530BXYIJ2S182eRu0U5c1qBEN4sAz+xFHlGi7TSm/fOEEVzeOHPA
 lhwAEGDDNnTNcr3lZPM+dGDerPmKKrF69t66
X-Google-Smtp-Source: ABdhPJy6oEdM08YOtI4xOuf95QGozQcwUszvUj9yBiIIcL+q8tEy/IYz8JC+3g9NgFhHY82a23MoPA==
X-Received: by 2002:a05:6512:20c1:: with SMTP id
 u1mr1586728lfr.549.1610571212062; 
 Wed, 13 Jan 2021 12:53:32 -0800 (PST)
Received: from localhost.localdomain ([188.243.183.134])
 by smtp.gmail.com with ESMTPSA id a24sm316167lfi.192.2021.01.13.12.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:53:31 -0800 (PST)
From: yaroshchuk2000@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT
Date: Wed, 13 Jan 2021 23:53:23 +0300
Message-Id: <20210113205323.33310-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jan 2021 16:18:39 -0500
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
Cc: qemu-trivial@nongnu.org, r.bolshakov@yadro.com,
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
---
 target/i386/cpu.h         | 2 ++
 target/i386/hvf/x86_emu.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..cc35676b50 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -371,6 +371,8 @@ typedef enum X86Seg {
 #define MSR_MTRRcap_FIXRANGE_SUPPORT    (1 << 8)
 #define MSR_MTRRcap_WC_SUPPORTED        (1 << 10)
 
+#define MSR_CORE_THREAD_COUNT           0x35
+
 #define MSR_IA32_SYSENTER_CS            0x174
 #define MSR_IA32_SYSENTER_ESP           0x175
 #define MSR_IA32_SYSENTER_EIP           0x176
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index da570e352b..2d362763fb 100644
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
+        val |= ((uint32_t)cs->nr_cores << 16u); /* core count, bits 31..16 */
+        break;
     default:
         /* fprintf(stderr, "%s: unknown msr 0x%x\n", __func__, msr); */
         val = 0;
-- 
2.28.0


