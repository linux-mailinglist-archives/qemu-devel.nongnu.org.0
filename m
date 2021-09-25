Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAAD41830B
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:07:02 +0200 (CEST)
Received: from localhost ([::1]:43270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9GX-0007im-EW
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU922-00089p-5Q
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:02 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91z-0005N8-10
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d21so36375438wra.12
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unRoKxdhmIQ/3+a2J4b34FjTNk3kwzqzxXg2lM7z0e4=;
 b=ft5GFZkKb5tuEPokb9Ek+0+A5ZgW2VFhekYV1f7EE5hq2yE+YvyVJNYcjFhCCZhbGb
 ILxRW22fWR3cQnXIfg97FgLHiIYGMDEZD1+JImhwKDkKzyjKcMLR6whiGRI0JQL6TrYp
 VA9hgIckq6e5QJkggO/8sAt66IIgHcRqHnk09tsRq83KqsKc+AFl5koPUgYactaRZC++
 +/rn0as6gk/TfatH0G0BsBZxzvE1rBoun5bN95Wm4z6FFfbr+M5GUoPXL/GFMgD5UvUn
 cEResTSkuvhTw33Jwp0PpVNnLd0EDWznpltde6l+CZxvbt4/gkbZxypApyNtrjOzW7Dj
 XVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=unRoKxdhmIQ/3+a2J4b34FjTNk3kwzqzxXg2lM7z0e4=;
 b=tw1ulWq+Ebd9pLNG0nD1AxAmQRXLYAnjb4iIwddlzW83ply1iv9sli48qIXjxSgUlo
 ETSuorI1Q61A6VCDiM/8WtmQ9NkwviODj41Hr5Z/wwJ/TB5xG+qF8D97ug3Yw0pT2rBg
 QTkVQQ866pMKHNGn+vVj42HSoFtsC0IdbnjZbmQMxXYxuXlQo9H1Bl4Z/dIV08ymcr7Y
 NI/x66sxyZo0ynAKriFfyuh18ZnExRnldXN7Wd93iBTicuhLyh114MqU/a0tB2hkpZAt
 rKLjv+qc8pzigkk4NvCksP6rNl4+jJgvDLNCfun1pg/UvmH6KLjNHfnj1qzz4AclT586
 4gUg==
X-Gm-Message-State: AOAM530DVWOcm7PqDIsAd0BLDiqt2DAOZZIBrv7RypFT6Rxszyt5llmy
 Wh6hHz1joNjLNRCOhsJ+ZExCQsVIOWY=
X-Google-Smtp-Source: ABdhPJxzi+tBxAEnmGk1ZVdKghIl6UcNQLPCNwNpmo9CizTuHSUS8CyrIdM5H+T9qEmC0rgw3A/umA==
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr17140276wrz.280.1632581517631; 
 Sat, 25 Sep 2021 07:51:57 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j4sm11674264wrt.67.2021.09.25.07.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:51:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/40] accel/hvf: Implement AccelOpsClass::has_work()
Date: Sat, 25 Sep 2021 16:50:46 +0200
Message-Id: <20210925145118.1361230-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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


