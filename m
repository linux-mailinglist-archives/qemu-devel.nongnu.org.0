Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F213418B91
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:40:04 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcoU-0000MQ-M5
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccy-0001Td-9z
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccw-0005g9-UU
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g16so46516103wrb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCLxbLnwCEUqojfStjhPo9ZalBzirYzUtLUPN9TYqi0=;
 b=p1q50X1invMCdHbWySnroGfBro0IzBX3SAokQ52PVvE0ZT0Wj3fneFkMBn3HEYFBpY
 pxJnxr3OoVzMHskVrup2qTQgAvQPj3zpv5RrZdL/La49M6SJ6FaUOKM2wCLDw/2h/IsH
 O6TgensLqBINc5QDJOzFH0i7q9NMBoiFYmbRwb0AosiBocricGVbhmnVHU2MwWHB8Wxd
 bLeKvsl9hiNvBYtzya0s2g3hTI2hWvQEGohIsTqYPAz8cjBtwKWiskx4P+4hhg7IULH1
 sH9RkQpfMDO703/GyWo+FkmSGgsqwnJu8Xoe0n6XVmRFGRSqAg0iGumCLQ/3Tc/nmXYS
 hgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dCLxbLnwCEUqojfStjhPo9ZalBzirYzUtLUPN9TYqi0=;
 b=pUQwx00eH5q+HPemWwUfHmr7CnJ9PvbMC//m43Vp6WHto+dt5KJnBWomXArTB8VOqT
 ngfzfSKs/KMa7dOXTw3j1F22rkKciuH6GTRCTiXSL/3IkjdrjoJqI6c0kK2RKaN1D7Xl
 nDXx8kVVtwvQ/aCByUFdlhJoDBuNoeklbyZSkkMTgIQnJip1ZPaUO8g2aSplV7Spvg2H
 p5vyNGsg8GuB+4/65Hyidfaqu7sE+4N9gx2qUwN+19qAGMhejMfxy4OoNQEWSBRT8fAl
 njCXtaMCD0/3c+KTQSwGFTL9YQAF8AeojQj7N9cMqaU59oDdwUFejltmFQ+d/of1FGkC
 hrTQ==
X-Gm-Message-State: AOAM5333wXidcX20W+7Wf0HVB7bPHVnwXWkCi7NoX6mFDSNCo/TuMcTW
 fDPdi15TtnFq6uAKak0LdTxm96s0PAk=
X-Google-Smtp-Source: ABdhPJyJrnt7JB1iL+qPvwDLQlGRFZl6KezWSTiJYBlgvS8dqkbkejgKMY0bstYABHWB8Cm8v0eTDA==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr12468459wmq.77.1632695285592; 
 Sun, 26 Sep 2021 15:28:05 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i67sm17801799wmi.41.2021.09.26.15.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/40] accel/hax: Implement AccelOpsClass::has_work()
Date: Mon, 27 Sep 2021 00:26:46 +0200
Message-Id: <20210926222716.1732932-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

Since there is no specific HAX handling for cpu_has_work() in
cpu_thread_is_idle(), implement HAX has_work() handler as a
simple 'return false' code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hax/hax-accel-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 136630e9b23..5407ba17eaf 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -74,6 +74,11 @@ static void hax_start_vcpu_thread(CPUState *cpu)
 #endif
 }
 
+static bool hax_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -85,6 +90,7 @@ static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hax_cpu_synchronize_post_init;
     ops->synchronize_state = hax_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm;
+    ops->has_work = hax_cpu_has_work;
 }
 
 static const TypeInfo hax_accel_ops_type = {
-- 
2.31.1


