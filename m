Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE42418300
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:01:38 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9BJ-0005Cz-RD
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92T-0000fM-3p
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92R-0005pN-NT
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id t28so23084737wra.7
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cb3odcmCuQWoFCXt4iYOTDt5qWlPQnfLAh89ZyyxruA=;
 b=DE4w4ld7rRT7nzqPQAZUdpnJI44nhsZM71vrw8kOMxoZ8cl5cWTG7GT3dCZTJQI2Rc
 uTNuoWGJZ3rXMzIl8yN8R4ECnf7RjByaiQYYsgKXzCkdZ1IyO8sq5++hWSFJl2LmzSx5
 oilHTxhb2G4xR2mZ/S+WIZQ1bSSwDMQ7yXdvdfkcyh3caUR8CQDGTzwiFNPlkHEr1YUt
 D2aUy3mCuVUAG9G6Ui02jmyeq8nqWmINtM29b33AgmjZz7kEEPAe+2wC3C0nmGDnaFvM
 uIWVu1rQ8A20JNKHZceqigRu++aqgfMAe5nlo8sl7upfZdYpCqHevl98gm+drF1dDk2U
 tE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cb3odcmCuQWoFCXt4iYOTDt5qWlPQnfLAh89ZyyxruA=;
 b=nC6vl/C9aH8owA7dRskin9LMzmJ6ya/Z3ePpTJeMlzjd1biu+jMPX6QWWq6qVGXmnP
 vcD3MlV3gh5giBjczzTgrD0DdXC+P5I5c+C+9ZolF2XEOsh1PLU0Fz52BLO1lbjKPouD
 f26hWdKUxLriOWlC50jH9TqSsrGjHjp43TdijRO5e77BXU1O9u3ANer7JppsU91USSYx
 JnBq8273ARC/QK59BpXcvWqJp1YGaA/O92tvBeB2OKHrTlAksfgftNgxQA2Rkx4w0gPq
 ix/YOtaI7gckXmckeH8sDQNP0rPxFIQk+DLQ9YrV29pgU+WJgV34W2J5kyqQBZx1snn+
 VR9w==
X-Gm-Message-State: AOAM5339OCDdOU5bswynHqe+9UP7eV+v+31vv5AHqb/euvP/H88MVrEq
 9hQlfQ1dqX5+D1cm5Zd80B6HIGOGLEQ=
X-Google-Smtp-Source: ABdhPJy/iQ6OqFZmRhbqPntWlhkYLyd9pw0x7+xi5UREpf7hFJFp9o6UHhlQgrYBYEYq1EkI/VjBhQ==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr17862480wrr.278.1632581546133; 
 Sat, 25 Sep 2021 07:52:26 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 y9sm18217307wmj.36.2021.09.25.07.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/40] accel: Simplify cpu_has_work()
Date: Sat, 25 Sep 2021 16:50:52 +0200
Message-Id: <20210925145118.1361230-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all accelerators implement a has_work() handler, we can
simplify cpu_has_work() by removing the non-NULL handler check.

Add an assertion in cpus_register_accel() for future accelerators.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index bb16a25bcef..bbb83d5982a 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,10 +251,7 @@ void cpu_interrupt(CPUState *cpu, int mask)
 
 bool cpu_has_work(CPUState *cpu)
 {
-    if (cpus_accel->has_work && cpus_accel->has_work(cpu)) {
-        return true;
-    }
-    return false;
+    return cpus_accel->has_work(cpu);
 }
 
 static int do_vm_stop(RunState state, bool send_stop)
@@ -613,6 +610,7 @@ void cpus_register_accel(const AccelOpsClass *ops)
 
     /* Mandatory non-NULL handlers */
     assert(ops->create_vcpu_thread != NULL);
+    assert(ops->has_work != NULL);
 
     cpus_accel = ops;
 }
-- 
2.31.1


