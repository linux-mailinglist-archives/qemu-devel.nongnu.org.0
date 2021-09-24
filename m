Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA7416FBE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:57:04 +0200 (CEST)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThx1-0000Zj-W0
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgP-00045o-Hp
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgO-0006eO-5N
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id w17so25392521wrv.10
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLzuxgLTjxaUP4zi8sBdv28yd73Nm8j1vjkLU2rmh+g=;
 b=f9ZL3EOw/t0ewQ/J3qUr/XDg+2/vLXiO08wfQZMDath/X8ZF2LHytkPE6mXMpEYpPR
 sh0p3mkeEI1BCzJpnbrBKPhK6Qn6j5h+4WsfFSzaq1X57X2aZRiGrjDYQJBXHHjaf+Lr
 tZbI86ntZYeIJ9KAo/sIkpgSFo5zBy7QeOP2e+igZI3aNYcai36Z1d1HchBGjb029rlR
 0gpAn5OumA47ALj9BFcFSTA6PI94Yk4m0a+WUwvKsVuCYWiDEsfogyG97r+R3zbfIyNY
 lzDeC/mzWAOWFegP9vBD6i5mnLUwADAs7iY6FrUUzUnIz64lugaagTZUAviIwTI7sPGx
 CT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aLzuxgLTjxaUP4zi8sBdv28yd73Nm8j1vjkLU2rmh+g=;
 b=vrW651lMzI/9m4DKmVdYqQtRKArmCYx2ghMTusl1EClTi1LGAJKRpCnEYcyPQXfOZQ
 pmXG/tmAQvfB3mTrf8TWSrwFnFOiBCv62rwqV9tZh0klBclEQLPOwn2dGClscj+VyjVk
 g7ZHQfHS7v2G7dC6ws8ybyspNjj6HGELTKvTkpXe1mLht0NdyFFvFEIeiMENTdfqXGOq
 S36FjOFBn89ClCxDC28KzeqG0lx1QsaZKj+BCFjRi4KcXSUaP5AwSSlMDL0tKb+BOYab
 y4A7L1eH54ZwkPNInk1s6ALM7NAf5LyS2Eewc4ktQoXIjqNtPNRpoT70chFmTEq+yFmc
 HtAQ==
X-Gm-Message-State: AOAM530s7KxUI/7B4Eu7nAbW02GBckGAsV6HbJa/piEVfYds+9Y/PX/V
 fGaRq0KbavaJDqpq/+a81FqQ/VE0pgg=
X-Google-Smtp-Source: ABdhPJxp/fayYxaCMCK/+TcvLqk2YoBMQJ5PaEhNYsJeXbQWsoZDyzGhocfAOG/2rhLTrLb40Dpdpg==
X-Received: by 2002:adf:e404:: with SMTP id g4mr10220699wrm.143.1632476390668; 
 Fri, 24 Sep 2021 02:39:50 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 y64sm8519500wmc.38.2021.09.24.02.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 13/40] accel/qtest: Implement AccelOpsClass::has_work()
Date: Fri, 24 Sep 2021 11:38:20 +0200
Message-Id: <20210924093847.1014331-14-f4bug@amsat.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement QTest has_work() handler in AccelOpsClass.
Since no CPU are available under QTest accelerator,
this function is not reachable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/qtest/qtest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 7e6b8110d52..903c39ec1bf 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -47,12 +47,18 @@ static const TypeInfo qtest_accel_type = {
 };
 module_obj(TYPE_QTEST_ACCEL);
 
+static bool qtest_cpu_has_work(CPUState *cpu)
+{
+    g_assert_not_reached();
+}
+
 static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
     ops->get_virtual_clock = qtest_get_virtual_clock;
+    ops->has_work = qtest_cpu_has_work;
 };
 
 static const TypeInfo qtest_accel_ops_type = {
-- 
2.31.1


