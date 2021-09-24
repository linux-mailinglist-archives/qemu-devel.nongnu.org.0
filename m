Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D5416F8A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:51:33 +0200 (CEST)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThrf-0006QT-WF
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgB-0003Sb-Ux
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:39 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgA-0006Rg-2O
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id u18so25545820wrg.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
 b=bfJDRUtHlsDizMGatZPk963VYYfAkBfTjsNmiwj/ymhx0kRc6VMLElf3zBqxnARhDn
 lgmgbrEhIGHtgHu/8x+tntzdV2SngC2qWF2GAwfvOtMhG+V42rxSWucJiP7xIrIGReXz
 l5t9jVP65mPF1GmicTiZGk4oLjys78iV6BtOhMY43Z6OA7grVc9JwzvqRzjqVuuxwUkC
 i1rYTGO8A5FNd3Xng6BsOrIPE1h+jG56FVJbFE/XhtVgUXtuAxE+HmINDUE2vF+hCr/y
 7CIfaAlsit+sLqNVs49NVF94QACZCvY/8QbD4Llhgxgoqiw1AsyONwYLBrR6BOTi/Z/H
 7hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
 b=0ygSC8FshLWtxHWifv0TVklorsVRowrFIl5M/1S68q06/FaSir0Cbp45ulFeVw521Z
 x860czo9LK5ZNnp2gDfdfdULUrNi8ApbtYsinfLZmnWVJJnS04iB9KPPYgashi+wY91R
 myJxiCKGCPAi3krOLgC+ptB34Ws87S0HEHQLylcH7+in1c/QFpGogJ7eTFSM+2YHaxXC
 ACyJ0nq1ZvlxZN9Lpnurc5jpsa+6rxw34XBCO6O3kJ+ox9/tUxgcWTQ1zxIv0TccDf63
 sGbvnAr5u7F5YesV0U0C8NPVxu6o+Rn17sn2opwKGS0SAt3GkcG29tehEJ2ClKVrlVza
 mV8w==
X-Gm-Message-State: AOAM532FyVla3D8ABRttvcvsFXvXbwUw5eiVs3v4iHCB7h7Jaxs3XJXT
 BNuaz44gu4pXaHRF8QNvb8Niv/cI3J0=
X-Google-Smtp-Source: ABdhPJzv1Bde65pNl0VvYERfNs+TTxQ5croc4mEh0wp0bxdkKK3MHRcKkC10fZSBqwi13saNHJwzfg==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr1077703wmi.60.1632476376611; 
 Fri, 24 Sep 2021 02:39:36 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 c185sm8256519wma.8.2021.09.24.02.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/40] accel/xen: Implement AccelOpsClass::has_work()
Date: Fri, 24 Sep 2021 11:38:17 +0200
Message-Id: <20210924093847.1014331-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no specific Xen handling for cpu_has_work() in
cpu_thread_is_idle(), implement Xen has_work() handler as a
simple 'return false' code.

Acked-by: Paul Durrant <paul@xen.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/xen/xen-all.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b2..fe5a37fa2e6 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -215,11 +215,17 @@ static const TypeInfo xen_accel_type = {
     .class_init = xen_accel_class_init,
 };
 
+static bool xen_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->has_work = xen_cpu_has_work;
 }
 
 static const TypeInfo xen_accel_ops_type = {
-- 
2.31.1


