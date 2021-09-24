Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFA416F89
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:51:14 +0200 (CEST)
Received: from localhost ([::1]:50032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThrN-0005uW-Iz
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThg6-0003HU-T4
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:34 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThg5-0006OD-Gd
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:34 -0400
Received: by mail-wr1-x436.google.com with SMTP id t28so12098017wra.7
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unRoKxdhmIQ/3+a2J4b34FjTNk3kwzqzxXg2lM7z0e4=;
 b=qmujrEu3hn7XgcVz9kAzGT/jAIzF8K/yOgPqjK8Lil7oWfw4w7gZeyRdBPI55MkkwV
 x2k5P5C8z6aFCWkQh2WPlMW8kf00hsNJFdIWCfXROCoYhO37u+mwQ1io51IzHcGCEtvw
 0hhQ1FSqIJlJ9XYE7YcZNktmqkMRyR2hwppSjDfJeB4VFWuJPYxmrxl7+REEe6XvSw3a
 rY1I0kyRvC2fcyg1lzMt2eRUXkNUnWbpqtAMKDVZrGIrKfD2XWzKX42lTEqSpjPMx4dn
 P0ND3soSQexG9hZIhVBu/SXapPbhwGrYYkmYy0FXEjTOPSHmxBt7goJdY1DPkhmqmN7W
 8rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=unRoKxdhmIQ/3+a2J4b34FjTNk3kwzqzxXg2lM7z0e4=;
 b=sgfI+BHx6MedjjTjfaVfXyV6OqGObjJrSsIb4vbxIP1fMqNe99vfAltXqcyCnhZl5m
 rHbrfIjkx2VJNJpAvHO7EG7xVExDfiqS1TSwr5l/Z6e293eRKqQ4HWP9NDMPx4leWjx1
 TlsCgqDWRQNSuMetm9orLregojYKkl45ek2FByo22Ip2O/ifBA+nLuCoDjroJlGU4s0e
 ivo/nu2I4ZRLdLafibAE2dDtEe3FgBOo9qATBXzTrHyr9dUJaUqacYaT/is2aTyujtQh
 8rjgxAJqf9ORRJ1sHnvoAkO22Igdziyc/2UF1q4mPnOW26NKzMUuR5Nl2QkEPmv5vBwr
 AuHQ==
X-Gm-Message-State: AOAM533FfbN2XRYJzu/nktdZzF6S/KRRZHMwsfwLOaHyUFaxvtUTUihD
 sVICU/LZdPx9xbeRjV9uUzN6e1ds+XM=
X-Google-Smtp-Source: ABdhPJwoSWqS8c0rBTbISQPqY0TkK2y2mKEKENvpQ3aFNCqeowBkhiUwo/emexE2feG3h4xscjkCOA==
X-Received: by 2002:adf:e806:: with SMTP id o6mr10005295wrm.239.1632476372032; 
 Fri, 24 Sep 2021 02:39:32 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 r2sm8364089wrg.31.2021.09.24.02.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/40] accel/hvf: Implement AccelOpsClass::has_work()
Date: Fri, 24 Sep 2021 11:38:16 +0200
Message-Id: <20210924093847.1014331-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>
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


