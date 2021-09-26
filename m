Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD603418B6E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:32:20 +0200 (CEST)
Received: from localhost ([::1]:54840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUch0-0008Q7-Au
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccc-0000fP-8o
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcca-0005OF-59
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:45 -0400
Received: by mail-wr1-x434.google.com with SMTP id w29so46359313wra.8
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ka2Zs6W/m1VUMtJW+H1oHcUfryePq3cXFIahmgjrmno=;
 b=pzfCGttxJjFHrz6CzdTeug1V7wBYecdbfYdES2RtB1/A5PEvAZy3jGXgsshet1oQhz
 xzNWcyjyO57PJwok1DIWDAQxLxIpNm/jjoVQXXIQottDFvCt1DPxAqK9yUoDyQ4AQv2F
 ZinlQ3IvWwJHwvR6mDlKj2HFyGHZlZmPuFOCbFjjcyHLqjPUgRxvIR9ZazJYIR0ISUmy
 FU3GXMDInNGZrOfSwBgpiY3sgbqxs+fHHzoQHRFk060zmM7YAYYerEVW5RVmXOKPbuzw
 5kFM4iX+JfpLz0KXZ2pDMrYP14hbxlVRxZoberEI3qgTSrCc2Kw8dZlzYMWHtqVjocIU
 HDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ka2Zs6W/m1VUMtJW+H1oHcUfryePq3cXFIahmgjrmno=;
 b=7Zk4Sa8udFu3eOY6DiUWHTa+Y24YrQskU43eUN2uDHT/ueIpibZGAFHdtJVEZbh9MY
 Grh0vvskMgvPDYha2xWgeWOpBIl01hsSGEtyPN1j+3rVCGIsu7v/i5GGS9C46hDSfeb0
 wpYsoRO2fqTiPkoNF9XgFDzWv7OCg5KbALEMbvsz+ZDXp1V5auEZJF4mKKqtcoWb4Xd3
 CMGEpZuIjq+xvAuIaI1hNRm4QGmD6y3kcvo5CDXIjx9w+ujlan72KMSb/R79EQ8S9dwA
 1Rq20Z1ottofoSB3W9jBQpnokKx0HH43h4xSA8Z1nvXmJde/CgzMkX7At5+yh3/p7O/K
 bA2g==
X-Gm-Message-State: AOAM532vFhig9piSyBg4G55SIPCqn3LJfOsP7sFjalQOMWa8uXlelnm+
 aiDlkB+jE1gRbFdm9ofGX0TxBJv72dQ=
X-Google-Smtp-Source: ABdhPJyaJpfbVN02fReKDqm7RY9CNNRdk78xdvEthkfFXhnDTPRucYvfhUAFoRRM1xfp/JFl+ysnIA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr13048636wmr.89.1632695262222; 
 Sun, 26 Sep 2021 15:27:42 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 k17sm14911278wrq.7.2021.09.26.15.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:27:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/40] accel: Introduce AccelOpsClass::has_work()
Date: Mon, 27 Sep 2021 00:26:41 +0200
Message-Id: <20210926222716.1732932-6-f4bug@amsat.org>
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

Introduce an accelerator-specific has_work() handler.
Eventually call it from cpu_has_work().

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
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
index accb20f0589..85b06d3e685 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -258,6 +258,9 @@ bool cpu_has_work(CPUState *cpu)
     if (cc->has_work && cc->has_work(cpu)) {
         return true;
     }
+    if (cpus_accel->has_work && cpus_accel->has_work(cpu)) {
+        return true;
+    }
     return false;
 }
 
-- 
2.31.1


