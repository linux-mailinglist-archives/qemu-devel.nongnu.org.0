Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025B6418B7D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:33:48 +0200 (CEST)
Received: from localhost ([::1]:58628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUciQ-0002XH-Ft
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccu-0001I5-0L
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccs-0005ci-IC
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id t18so46545105wrb.0
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
 b=l1osCv3MPzqgSzoxrqidoFJvfUrpqdySR6e3d5PyocAsPBu8DRmKHIjGSrbwgzEYhA
 bR+tCqk514wbnVqQv0VfY/v2NvvtTVruunZ2eChdI/C/XB7KvWTH0OSeAauJsJDYzUAY
 YKBvptZ67wBuQBbav7u1xzoDkHxPQEoBjNkerx1d6BDW9PKyrhDLAOUIYpuM+eoqpW0a
 6n1kS6DjEc4nwiK0MP5/lDIt8fbw/8JXmRPL6CkhiLoknT9hXoamDnYxYn14EcLCI18A
 dcZlpfQpxfV3OfTKUHjlf4gItf51SI2azsfLGmM5z3wctde7EQZuYsoCzDgblz88eqxX
 3eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
 b=uBKBNVSpXj4Hxe/VOujB+X9U13CVcnqDbfqHXCPndraiaN+me/ZSU2jKTkiV/cmmkB
 4RvKb8x/Qr3oEuVEM1Ko4lGnIpmys0ej6F1h88xcM1+1ZqGlBi4wKS/mpDPOJs2HAAKB
 baWj2OJi6BUiZroMwslZ3lR8ZdDfN6QQVIsPSIq8UuPdczaBwPEqlZq6k1jHbIoFOhiI
 UqmPkzLgpemVhPmugCUpFqgpB/zPc6DpqEblVNKeHMTw6+nCtwEWZ0idZOgG2iEwUW6k
 Tt1fxNiAtSl96I6eHsCGtkltz0UCA6sQTaMh90dymSgXyGHg1GXwBP20XgP0by4tgXGZ
 GK7Q==
X-Gm-Message-State: AOAM531QtdfbE8zxbB2rX0q2CsBi/Ymzt662776y30DifMvr9czJb9Br
 GAtXUOJyZiKszf5jyArbF2AG2Jva0EY=
X-Google-Smtp-Source: ABdhPJxmPoo78Gq10X1qkG1+F6AOJR5/mKqsgSjopX2F9E8AKUc+XowymUi62g9Q1AyyCSqaqYnArQ==
X-Received: by 2002:adf:d21b:: with SMTP id j27mr9077391wrh.33.1632695281066; 
 Sun, 26 Sep 2021 15:28:01 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z6sm17776552wmp.1.2021.09.26.15.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/40] accel/xen: Implement AccelOpsClass::has_work()
Date: Mon, 27 Sep 2021 00:26:45 +0200
Message-Id: <20210926222716.1732932-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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


