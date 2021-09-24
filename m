Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C10416F6A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:46:55 +0200 (CEST)
Received: from localhost ([::1]:35896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThnC-0004xN-He
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgK-0003nW-Qz
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgJ-0006aR-8m
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id i23so25588934wrb.2
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tl5Shev5pC48yBd7v32jcWMdVT27BoRgDVkMAOt+xfs=;
 b=h3tkiY2k0lHeSqtRriwt9QIC83HOiZiAKrcsDl8tQbBwa4WPBlqa1Orwxe9R9O4cs9
 CWPEAqw3MPFnJq9fY2NBiOnvT4dsQ2v4zVPT+YobBKMrvS2a4emJ1KD5hPYAePG9QptX
 OHPUS/NyGTwTw1ArwaM5QcShpmvHmCJVDA6NWhzBJjoqPlFCFMtgIUwy0Wou9XnYrdf/
 Vxv7ucrIHbM+lJEjTF74ZwWIGZVF4ZZ7h2OWu9KcZGl/+OuRvFhtlAcCfWXg5tl6mLvA
 tqvunK7SyObtxVQwIH7w9dYlRJ0LMpCA17thLnWOvdRjBz2awCnV0PYMnzcIzXG2F1o/
 U06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tl5Shev5pC48yBd7v32jcWMdVT27BoRgDVkMAOt+xfs=;
 b=Z93Ascr0+XMRlsXPN5iLA7werD57u3AcPWkIYTAcr/jPyqHbRvCJ0TIg2VdD1hjh9a
 WsntmEgPFQKsGMnGPvUwuXdE8xuRQidQ10n6R7lu8MSxyaE+BiuFtPQUoy3Epizb565w
 abebFKDlRkwOUGbsxo2QOrV0SUBk+DDUeb2Y2aI4MstZBnYG5qTUenTGM9bEd9GzBl0F
 f004cuISF7L+4LKnI/YjstCfPPrfTHqrr8oLitbvlfAEadcERNSyvphgq3/7Ext4Bqsw
 gxglC5c08NaCzTSeb7A6O0hGkKQceUNI6NFry+SbIRf/76SLKhV25KMwslqLoUjjfnTr
 V2vQ==
X-Gm-Message-State: AOAM532KdLgo1rK4P5E9Dm/AmycyxVBtUsOOxcmcEWUsAPxv2R6yYxVI
 flWruJL8JSomS86J5W/9XIImcziD0MQ=
X-Google-Smtp-Source: ABdhPJxpSFfhBSDIUHhM4X9NLXTfO2llO8y8MDnrDunwT+GB1+QmAcUEuH5WSEM06DTsSFyKa8xDtQ==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr10244900wri.323.1632476385844; 
 Fri, 24 Sep 2021 02:39:45 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j134sm14310026wmj.27.2021.09.24.02.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/40] accel/nvmm: Implement AccelOpsClass::has_work()
Date: Fri, 24 Sep 2021 11:38:19 +0200
Message-Id: <20210924093847.1014331-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Reinoud Zandijk <reinoud@netbsd.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no specific NVMM handling for cpu_has_work() in
cpu_thread_is_idle(), implement NVMM has_work() handler as a
simple 'return false' code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/nvmm/nvmm-accel-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index f788f75289f..36296f79ff8 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -83,6 +83,11 @@ static void nvmm_kick_vcpu_thread(CPUState *cpu)
     cpus_kick_thread(cpu);
 }
 
+static bool nvmm_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -94,6 +99,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = nvmm_cpu_synchronize_post_init;
     ops->synchronize_state = nvmm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = nvmm_cpu_synchronize_pre_loadvm;
+    ops->has_work = nvmm_cpu_has_work;
 }
 
 static const TypeInfo nvmm_accel_ops_type = {
-- 
2.31.1


