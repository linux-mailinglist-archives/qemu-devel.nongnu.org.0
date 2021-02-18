Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71531E81F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:53:19 +0100 (CET)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCfzq-0003QG-FA
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu4-0006fx-Sk
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:20 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu2-0007Co-2E
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:20 -0500
Received: by mail-wr1-x430.google.com with SMTP id f7so1031355wrt.12
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3wMc78pIuJOVyJ1kIY4dz6S3vDEP3+kX04z/lZIyERQ=;
 b=m7jYKHEpS3WHQ6HD8uQyAaWmiEJxYYZqE3a3uPNwH+EublOOkjUvhS54Um3Qr3v1tL
 veo093Bo0RyaAAY4jv9C21pnwsvghFSnrF9ywaONYR1QRZ7KT0DGYJg46pQjUCVcMbPj
 bo5DmzebrivnqVwSbhVA46kXu79q9ytwXEG0rSNrR0qp+/RfFzrljJE3U7VWEeh172DB
 8YMagx8JUq0Ng+r3KC8sV6zAO7FUl+6lEXfMF+bRAkczVFtxRCvT6vk8RIyMrPUdXh0C
 yhj3Hdt+qzNTL/581opI1WuMfDMs4Fzs3Yzaw7zU/vK4EEwsW4sNv2bMjzQlN7PXuknR
 0f5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3wMc78pIuJOVyJ1kIY4dz6S3vDEP3+kX04z/lZIyERQ=;
 b=To55UO5wQPIEgYX1Bw691Rf7odteIyjB3EIP0zjOkvL6D8KfBULpFevG36lMVC3pBy
 FpjiwQSCk8QE9ckY4Q8N0FMbDkV9O4DZz57Sc8wsIYPg1+rs7jU3pSkr1Swhg+rYbi0s
 qjX1Aut3BnxuXXFtX9OjQwKTR/X8yEk9sHN8m9jnTkzUex24yoAa885QjVOycGW8uaY3
 h35/IMewRUY7dUc0c2EYyNfWlkcIUDiijE0Qw3a4KYTyXU808P6h+4iemEnjnUzEtQXJ
 zAYfrPVd0rLPrUSHzoDqSKy5iTTLaSdkO8TNcXKyzd0LHjCdyuZjyFXnZWtxqmdOknLh
 hT8Q==
X-Gm-Message-State: AOAM531JPwsNZlWGSsCwDk8QWhajQMsAY7FpoM7F1vgMUZOovBcdIPsH
 rNJwJGpdtWZ2MfxKLXDzavOSqA==
X-Google-Smtp-Source: ABdhPJw02fVDg/ENwVrVzKrK4nOjC8dLYIl+E1K+CnBoUJxNv0Wx6KKxMYPUZiUsA6+IZbCpEISI1w==
X-Received: by 2002:adf:f80e:: with SMTP id s14mr3495342wrp.363.1613641635136; 
 Thu, 18 Feb 2021 01:47:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm6717535wmi.48.2021.02.18.01.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 545211FF90;
 Thu, 18 Feb 2021 09:47:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/23] contrib: Don't use '#' flag of printf format
Date: Thu, 18 Feb 2021 09:46:47 +0000
Message-Id: <20210218094706.23038-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, zhouyang <zhouyang789@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the misuse of
'#' flag of printf format

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-2-zhouyang789@huawei.com>
Message-Id: <20210213130325.14781-5-alex.bennee@linaro.org>

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 37435a3fc7..4b08340143 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -63,7 +63,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
         for (i = 0; i < limit && it->next; i++, it = it->next) {
             ExecCount *rec = (ExecCount *) it->data;
-            g_string_append_printf(report, "%#016"PRIx64", %d, %ld, %"PRId64"\n",
+            g_string_append_printf(report, "0x%016"PRIx64", %d, %ld, %"PRId64"\n",
                                    rec->start_addr, rec->trans_count,
                                    rec->insns, rec->exec_count);
         }
diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index ecd6c18732..eacc678eac 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -88,7 +88,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
         for (i = 0; i < limit && it->next; i++, it = it->next) {
             PageCounters *rec = (PageCounters *) it->data;
             g_string_append_printf(report,
-                                   "%#016"PRIx64", 0x%04x, %"PRId64
+                                   "0x%016"PRIx64", 0x%04x, %"PRId64
                                    ", 0x%04x, %"PRId64"\n",
                                    rec->page_address,
                                    rec->cpu_read, rec->reads,
diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 3b9a6939f2..6e602aaccf 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -209,7 +209,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
              i++, counts = g_list_next(counts)) {
             InsnExecCount *rec = (InsnExecCount *) counts->data;
             g_string_append_printf(report,
-                                   "Instr: %-24s\t(%ld hits)\t(op=%#08x/%s)\n",
+                                   "Instr: %-24s\t(%ld hits)\t(op=0x%08x/%s)\n",
                                    rec->insn,
                                    rec->count,
                                    rec->opcode,
diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 5aad50869d..7fd35eb669 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -134,7 +134,7 @@ static void report_divergance(ExecState *us, ExecState *them)
 
     /* Output short log entry of going out of sync... */
     if (verbose || divrec.distance == 1 || diverged) {
-        g_string_printf(out, "@ %#016lx vs %#016lx (%d/%d since last)\n",
+        g_string_printf(out, "@ 0x%016lx vs 0x%016lx (%d/%d since last)\n",
                         us->pc, them->pc, g_slist_length(divergence_log),
                         divrec.distance);
         qemu_plugin_outs(out->str);
@@ -144,7 +144,7 @@ static void report_divergance(ExecState *us, ExecState *them)
         int i;
         GSList *entry;
 
-        g_string_printf(out, "Δ insn_count @ %#016lx (%ld) vs %#016lx (%ld)\n",
+        g_string_printf(out, "Δ insn_count @ 0x%016lx (%ld) vs 0x%016lx (%ld)\n",
                         us->pc, us->insn_count, them->pc, them->insn_count);
 
         for (entry = log, i = 0;
@@ -152,7 +152,7 @@ static void report_divergance(ExecState *us, ExecState *them)
              entry = g_slist_next(entry), i++) {
             ExecInfo *prev = (ExecInfo *) entry->data;
             g_string_append_printf(out,
-                                   "  previously @ %#016lx/%ld (%ld insns)\n",
+                                   "  previously @ 0x%016lx/%ld (%ld insns)\n",
                                    prev->block->pc, prev->block->insns,
                                    prev->insn_count);
         }
-- 
2.20.1


