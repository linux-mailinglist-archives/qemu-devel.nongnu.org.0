Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0A418B8F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:38:31 +0200 (CEST)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcn0-0004vU-IY
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcei-0005a3-7g
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:56 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceg-00075O-Kc
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:55 -0400
Received: by mail-wr1-x435.google.com with SMTP id v17so3084621wrv.9
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZAYjmxiur5f+p7A1SrpNSihQLXDhLnmlUZZ8rIaewhE=;
 b=jsNC4UiFCCOc2HUh0HNgZLNrEdz6P4qvQ0mAeYBhC7vOUFqJtVT+ZKTq+ommX2Gv/Z
 5bCDDmm/W/ucFF7C1BKLiJKJYczgi6VI9KO+R60U0U+Bt1Vo9WD1amFz//cX9Jy4evbH
 PB2cnijxH3uXrPKjysxYQxRExv0a8RO9HtOeUzvYtJzN6AFLs1lbMT9biUI1PdjvtWdN
 B1OesHs76zxglJyP8j+TBiJQRM/O6wlgQDo8xgQXp2NmtJeTQz2lto6KZR3aJP2L0dnH
 v34IaWFzVpn11AKhqRR5Fv4xhHCcHZycB8fQTggHlTV0Nk+dke7RFQguVYESDlSoyUp/
 IqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZAYjmxiur5f+p7A1SrpNSihQLXDhLnmlUZZ8rIaewhE=;
 b=4Vok4oTPMrdv1FAmSULRPyln0UrVHxb7jyfKZV81OyYhN74IAWcYmRn5nbwGLnJnao
 ajjLzm55b5SlUiKNzmNy3OEGl+limjF2r+f5MtPHW0jOzVqVcYMQ32FyVu2wFCADBk23
 fxwenWmsbSeUlNyDejqASt5bnR8VEBOF0PG5xMPSzVsOJWGAzi9p5g3+B2ItWp85tuLa
 wtOfDBehbBCEUHyU5Jftmh+BJubAahUqmSbmCTnIGmsh8/ZOojgCMBO3xHby98iFHGv3
 /hwVRQx3mASXmJ85VUe4lDulTZepupTLBy/wsmfbO0zdiN65EW05pJplR2Evsd255xAu
 f8iA==
X-Gm-Message-State: AOAM531DGvAG0f3uwHTvxHIT31QoG3wViWP+n8VIvt19EB4xl5Q0XvAk
 k7vlmEl9/PxADEyZUxBVh5MCLnM4c58=
X-Google-Smtp-Source: ABdhPJzbAkOWH+XnJWCqO/LwNB8D6EKgJcl2dCcLx9IwuEfNbvFMuIN9ekfL6d5CH0G8+h5/PTVYsQ==
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr24875417wri.131.1632695393269; 
 Sun, 26 Sep 2021 15:29:53 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s13sm19176691wmc.47.2021.09.26.15.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 33/40] target/s390x: Restrict has_work() handler to sysemu
 and TCG
Date: Mon, 27 Sep 2021 00:27:09 +0200
Message-Id: <20210926222716.1732932-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/s390_flic.c | 15 ++++++++++++---
 target/s390x/cpu.c  |  4 +++-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/intc/s390_flic.c b/hw/intc/s390_flic.c
index 74e02858d43..22bc38e9b4e 100644
--- a/hw/intc/s390_flic.c
+++ b/hw/intc/s390_flic.c
@@ -312,19 +312,28 @@ static void qemu_s390_inject_crw_mchk(S390FLICState *fs)
 
 bool qemu_s390_flic_has_service(QEMUS390FLICState *flic)
 {
-    /* called without lock via cc->has_work, will be validated under lock */
+    /*
+     * Called without lock via TCGCPUOps::has_work,
+     * will be validated under lock.
+     */
     return !!(flic->pending & FLIC_PENDING_SERVICE);
 }
 
 bool qemu_s390_flic_has_io(QEMUS390FLICState *flic, uint64_t cr6)
 {
-    /* called without lock via cc->has_work, will be validated under lock */
+    /*
+     * Called without lock via TCGCPUOps::has_work,
+     * will be validated under lock.
+     */
     return !!(flic->pending & CR6_TO_PENDING_IO(cr6));
 }
 
 bool qemu_s390_flic_has_crw_mchk(QEMUS390FLICState *flic)
 {
-    /* called without lock via cc->has_work, will be validated under lock */
+    /*
+     * Called without lock via TCGCPUOps::has_work,
+     * will be validated under lock.
+     */
     return !!(flic->pending & FLIC_PENDING_MCHK_CR);
 }
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3a..df8ade9021d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -88,6 +88,7 @@ static void s390_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.psw.addr = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool s390_cpu_has_work(CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
@@ -104,6 +105,7 @@ static bool s390_cpu_has_work(CPUState *cs)
 
     return s390_cpu_has_int(cpu);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 /* S390CPUClass::reset() */
 static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
@@ -269,6 +271,7 @@ static const struct TCGCPUOps s390_tcg_ops = {
     .tlb_fill = s390_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = s390_cpu_has_work,
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .do_interrupt = s390_cpu_do_interrupt,
     .debug_excp_handler = s390x_cpu_debug_excp_handler,
@@ -292,7 +295,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
-    cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
-- 
2.31.1


