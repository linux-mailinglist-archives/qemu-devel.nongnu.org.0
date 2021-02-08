Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC6C314304
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:31:05 +0100 (CET)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9F3g-0001Pn-4a
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCj-0003ej-JW
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:10 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCi-0006KW-0u
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:09 -0500
Received: by mail-wm1-x331.google.com with SMTP id o24so43576wmh.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cN1ZcZPR2RGrOQpA8sK4oqGTYEHRS4ZzRRQsbqTSWis=;
 b=OcFGOQ5pHzNDFIIbsee46MvK5f2nF/yFcxQ453WF8falY8uh84CG5/ZtQ6LEWwLCiv
 +T2Zh+uB5J1m4pP1IdqJdcleWyb1a5y6NzE1DENir+cB+UNzDnmIgla9FShKImny5h+9
 iC4KoOckj9ymKO7jquxMm8W2F4ArffPL0zchgB122zjgy5q0bxjZCADpbMQbfI+JA+RS
 mMFcgn6vSjZk5VjSJfqLOJ2Chw4drHGJkvf1DdxzyX/0dqRkR9gaqSPvENrSgEyOE0eA
 bNvkiXaSSZhCPwUYBkNEYj2n2AkLS5AMFtnB/VfFPBxL6EpvwZMMctMqKk4q7hp8uICd
 QYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cN1ZcZPR2RGrOQpA8sK4oqGTYEHRS4ZzRRQsbqTSWis=;
 b=R4zAFZIM/Fh8wS+ycry5nUVUzKIsSOsiSkP4EYbWpbH+eSkBfxuAxjDZbb0bzksokF
 aKbc6WToMlMIwUujHWPhFzA6SaGbfvd2or2cm5GZBZsPoZo8RvjsBM8oflnOyZIfKGno
 oPYHA2T5x1ITyxqtZ5hMxzSBcuqO+d7gY+7sHfcMqekd76sz1A0WX2b4wpiTWKtRpAqz
 R+ypZedmFMV1eW3hYm+Tjz/9yIXJsM8to5haPLBkDKSw+dbh3JvpsY4jieDwOCLCNV0/
 jixJX9oHV/pKDf0aFYT381GarMAwnHW9QMPfAoE56PCYEgvL32XJxJcnDwkHs2dMr8k6
 XeNg==
X-Gm-Message-State: AOAM5328G5XdsJByUhV7quW7GaXXPRa9Noeiv9JzoWVrs3BMOBS6NA1N
 kixEG5XiYVRzBGB4h6ifT2WGzzUWIDwjCw==
X-Google-Smtp-Source: ABdhPJyf5i5jTekJeH2QHw6zJTNBolH4NvRUScT2vuSdEb3P013PneRJccSzKBGFYYwzK3VCd2pcFg==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr49532wmh.85.1612808646765;
 Mon, 08 Feb 2021 10:24:06 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/46] cpu-throttle: Remove timer_mod() from cpu_throttle_set()
Date: Mon,  8 Feb 2021 19:23:21 +0100
Message-Id: <20210208182331.58897-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>

During migrations, after each iteration, cpu_throttle_set() is called,
which irrespective of input, re-arms the timer according to value of
new_throttle_pct. This causes cpu_throttle_thread() to be delayed in
getting scheduled and consqeuntly lets guest run for more time than what
the throttle value should allow. This leads to spikes in guest throughput
at high cpu-throttle percentage whenever cpu_throttle_set() is called.

A solution would be not to modify the timer immediately in
cpu_throttle_set(), instead, only modify throttle_percentage so that the
throttle would automatically adjust to the required percentage when
cpu_throttle_timer_tick() is invoked.

Manually tested the patch using following configuration:

Guest:
Centos7 (3.10.0-123.el7.x86_64)
Total Memory - 64GB , CPUs - 16
Tool used - stress (1.0.4)
Workload - stress --vm 32 --vm-bytes 1G --vm-keep

Migration Parameters:
Network Bandwidth - 500MBPS
cpu-throttle-initial - 99

Results:
With timer_mod(): fails to converge, continues indefinitely
Without timer_mod(): converges in 249 sec

Signed-off-by: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>
Message-Id: <1609420384-119407-1-git-send-email-utkarsh.tripathi@nutanix.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/cpu-throttle.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
index 2ec4b8e0bc..8c2144ab95 100644
--- a/softmmu/cpu-throttle.c
+++ b/softmmu/cpu-throttle.c
@@ -90,14 +90,21 @@ static void cpu_throttle_timer_tick(void *opaque)
 
 void cpu_throttle_set(int new_throttle_pct)
 {
+    /*
+     * boolean to store whether throttle is already active or not,
+     * before modifying throttle_percentage
+     */
+    bool throttle_active = cpu_throttle_active();
+
     /* Ensure throttle percentage is within valid range */
     new_throttle_pct = MIN(new_throttle_pct, CPU_THROTTLE_PCT_MAX);
     new_throttle_pct = MAX(new_throttle_pct, CPU_THROTTLE_PCT_MIN);
 
     qatomic_set(&throttle_percentage, new_throttle_pct);
 
-    timer_mod(throttle_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL_RT) +
-                                       CPU_THROTTLE_TIMESLICE_NS);
+    if (!throttle_active) {
+        cpu_throttle_timer_tick(NULL);
+    }
 }
 
 void cpu_throttle_stop(void)
-- 
2.29.2



