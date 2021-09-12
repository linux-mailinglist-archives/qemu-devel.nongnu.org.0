Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20287407EF4
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:31:08 +0200 (CEST)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTJr-00014m-1f
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGo-0005Y1-4l
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGk-0004Ps-IF
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:56 -0400
Received: by mail-wm1-x32d.google.com with SMTP id 140so1526805wma.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iF+BUQdpUBLOExjcgfnC9NPPhj36bSjul81IxTvt2js=;
 b=hSZtuSplvRjYXLF1yzhj9cjdxRlSfPrekdGiG09GjIsSKcN3YdbEpDFrE1tIJN1+l3
 ABxiRFpNC6E27dVfIqAneQm0C4yuM2V4MHTHdd0RjBuQDOA5GijQ6TLs7Vq16ynq6WMI
 d2mC2/9jyCsWT3lxn9ZSuLrSw9enT5H/8EA20o8skiHzI754qW1f0QlYqXkjXF26BLaV
 Ve5IFKKc1TBzRqRXp+tgtyNsigq1xJhCJ3JjkOh0TutaRZ6WBB7qiusrXv7vuohg+KUq
 ZXQoxu0Xj5oVzX60SjBJAdpOSk6QxAntVX+k2u3QStP7VOc3a/eOHY5tVMvLrqM/YI/G
 ONuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iF+BUQdpUBLOExjcgfnC9NPPhj36bSjul81IxTvt2js=;
 b=08XE8vFkn6lBGAQHnIJXBsjK/H50jLMxM0hMEutEpjgK0/tQqFgjFhUz3FgKQlCdl4
 60n/PWk817ugFNA2Y6snO73zvHDCnr+8+UprgjtMLzhtQEUVlNLh1lwV+gmQZZITq/AU
 gKQdoZU/NdQ2sDrGYmQywca/7lklIQTfAvOWd1eqBbHVwLSI203g8uh6HZpuuGNqAC7z
 Bcg+MRyQsHzt6KV0qRECCsCznuKttL5TAb1sbR9AGuin3qbjXjb7/Bc1tK7p0tYy6mGs
 /LDQ3KZKebaZiykFV+1yd4Gr66Ff+rBZh8mZMiWnrrF8sNzS3bbHeJJge27U6+MKsNH5
 nj7A==
X-Gm-Message-State: AOAM53013b4Mz8jrL6okh35A7tAeB2o5Zt2tXJ+QljrqX6yFqBhLhYAJ
 Eoq1OJ4z24JWRehZ9/23LbZJkTN/4MQ=
X-Google-Smtp-Source: ABdhPJw09MOwyJfxQabRzE5VdDnCL1hJpIP3tqXjCQYn1TAcIdztxCVmTlKrua2IlA3wqa71AWiP2g==
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr7588981wmh.145.1631467673096; 
 Sun, 12 Sep 2021 10:27:53 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s24sm4510797wmh.34.2021.09.12.10.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:27:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/30] sysemu: Introduce AccelOpsClass::has_work()
Date: Sun, 12 Sep 2021 19:27:05 +0200
Message-Id: <20210912172731.789788-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce an accelerator-specific has_work() handler.
Eventually call it from cpu_has_work().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 5 +++++
 softmmu/cpus.c             | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 032f6979d76..de83f095f20 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -31,6 +31,11 @@ struct AccelOpsClass {
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
 
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
+
     void (*synchronize_post_reset)(CPUState *cpu);
     void (*synchronize_post_init)(CPUState *cpu);
     void (*synchronize_state)(CPUState *cpu);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7e2cb2c571b..2a61dfd6287 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -255,6 +255,9 @@ bool cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (cpus_accel->has_work) {
+        return cpus_accel->has_work(cpu);
+    }
     g_assert(cc->has_work);
     return cc->has_work(cpu);
 }
-- 
2.31.1


