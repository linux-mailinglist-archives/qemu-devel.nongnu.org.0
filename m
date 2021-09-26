Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9499418B8C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:37:27 +0200 (CEST)
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcly-0002rN-TL
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccp-00015X-2N
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:59 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccn-0005Yn-KT
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:58 -0400
Received: by mail-wr1-x435.google.com with SMTP id v17so3074967wrv.9
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unRoKxdhmIQ/3+a2J4b34FjTNk3kwzqzxXg2lM7z0e4=;
 b=QRuWnWT3WadM8I9r2IH3CQ/prDCEDvoUp5H8hsFGWpZLZQXAB7iJLGRPi8knZ3uSWj
 Pg1q3pNZPD4wUpnyqi9nWhx1sn0zmOvSaIM5Sl0jFVU9edSOr7cNaeO8oU3vmcGNWnqF
 WWe0NjN+MAgKAA2pxlIfLj18k34e6VTJ00SqsQkz9btkK5Q1YIDxv31Wz0moQTvBbscA
 3eHfJskC6RgJUfvObFGBZL1TarbBX0+Lw2Gg3wgA1efFgl1tRd8P1O3zq/Kv/eyc6XHE
 hyaQIz1NYLZpQQXaOtN0Z7a+Tbbk8JjG05zzJcJJWt+TQDXmUoou6BBEiLqDx6EcCbE6
 l3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=unRoKxdhmIQ/3+a2J4b34FjTNk3kwzqzxXg2lM7z0e4=;
 b=18jA278P1SuZa8FS35c89eTp4Kx7Dxuppqqm+yPy62l5NH1Ug2kL3YOnKmhQDeim2G
 8FSRtyeW/YGSx8MoKLC8z/k5/XmszmN8HQbFy1E+Zo9hVE++7IIhzZS90MIWtNi03ymj
 8nq8D7RqXgvWIszV9szjl+YuUrXdC8ykYbDrnGgdMRa3bsbIINgV6EmuuIelnLpkGNQE
 icQpQavr4wlshoTWSZB+m/rfeMqCbUty31NreHN+JHUC4W9kieeW3hsQakelE+9FcdGT
 OVkMxURzTO8fi4ROMHVPrEywwMj9wfYKo3fSswi4yQMmbOpds9r64wOMg75saY0L4pbl
 9olQ==
X-Gm-Message-State: AOAM530lqfuHPi+27AurugHVIFo4C0sCYJgv/1PIL5MZ/kLzvx4PcMVL
 3sEinEmx/uemBpykS6/kuX7HQuGnCug=
X-Google-Smtp-Source: ABdhPJwzLznoh1qV93O5PQXzyZv01yeV0Pmkn2BPP/uK4jxHogim/HGyVgAZNm4xnuKlN4MpHhb9ew==
X-Received: by 2002:a05:6000:2cd:: with SMTP id
 o13mr23937397wry.193.1632695276171; 
 Sun, 26 Sep 2021 15:27:56 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o13sm18491519wri.53.2021.09.26.15.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:27:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/40] accel/hvf: Implement AccelOpsClass::has_work()
Date: Mon, 27 Sep 2021 00:26:44 +0200
Message-Id: <20210926222716.1732932-9-f4bug@amsat.org>
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

Since there is no specific HVF handling for cpu_has_work() in
cpu_thread_is_idle(), implement HVF has_work() handler as a
simple 'return false' code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/hvf/hvf-accel-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 93976f4ecea..ba7d4f20a35 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -454,6 +454,11 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool hvf_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -465,6 +470,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
     ops->synchronize_state = hvf_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;
+    ops->has_work = hvf_cpu_has_work;
 };
 static const TypeInfo hvf_accel_ops_type = {
     .name = ACCEL_OPS_NAME("hvf"),
-- 
2.31.1


