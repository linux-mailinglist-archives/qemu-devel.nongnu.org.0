Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F64418CDF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:46:20 +0200 (CEST)
Received: from localhost ([::1]:40854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcuZ-0003Zj-HJ
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdl-0003NV-LT
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:57 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdc-0006Ds-Vl
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:57 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d6so46339383wrc.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=esdj4T8w87yQQx5q0gedYQmjf/1Q5yjrjrc7iKp6hio=;
 b=gecrH13smwausK6V/DRNlOKZbmEp+oD/ny+JaRb9x6yq/TnzLzeaZHdtY72VbzjON8
 lQ/INtdnMpvrsgMt1OvO08AtW/m+FKdl2spCtUHhx7a9lxF4yEk2MgAqfJ74t7YzFj1S
 W5ej/+xsozSbzIUz9dMc7bE1RqhP1c3wdwtHB/qySit0KnNHupwHWo5P8L4OfC9Bx5K7
 At0MO5lrzGWfHNIjK+22GR3ctTcwj6yVgClZ7MrNzJWPTxufoGp/iXlMHXH8uTr/Em+y
 ztDUidKAngVjtyHeLoyV8OoijnQINTlPqKgR495B1eJB7pTQnHiFPjlynSHnhFckKVKc
 +Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=esdj4T8w87yQQx5q0gedYQmjf/1Q5yjrjrc7iKp6hio=;
 b=x3Tg1JLNJmn7/IyKqMUE50TLdYQ4Sg3fJNdQTtHfvolNDnqcNPAJvDY6PczaeCU1aN
 0+SI/qT7znOL34Ae4qppvrHaglQMn795nScrzaIFyXDfLx2OvkFxCETAdpvQWpkY+B77
 Ri3JaAsx2cToubZ4ZaZJlANjJvzzVDMEu1c0Gd/VUKsgyPAtaM4kwUTtcBc1ckwKd1OJ
 CXTNPAJCNC6Fyao8G/qhZyAdiQ8hLgoFdbmviSFLckx08LlVoVh5ZiOnDpnR99YSZa49
 h3dQQROBDnIJ5Z6dblW3+9EfIGMrvkt0Z3Y1qaLFV488q2ENogY+7QsGjE78yx0kzlgd
 J44A==
X-Gm-Message-State: AOAM532AzHlg3UMVypz8Ts7gUdTgPWgaoF2iyThT97cGTUsf8A0p2mey
 DypDqyAFMhD1XU4B+7gvFWx4V3JmG8M=
X-Google-Smtp-Source: ABdhPJyaGp3Sv9/X7ahP5iTmqxA+OFRT3tiHR6pN+PNuyKHrUXPyeGrkWvyeWu05KZAKHqKPVWObig==
X-Received: by 2002:adf:e983:: with SMTP id h3mr24750995wrm.231.1632695327463; 
 Sun, 26 Sep 2021 15:28:47 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s13sm1662078wmj.9.2021.09.26.15.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 19/40] target/avr: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:26:55 +0200
Message-Id: <20210926222716.1732932-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5d70e34dd54..6d51f91ca2c 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -195,6 +195,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
 static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
+    .has_work = avr_cpu_has_work,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
@@ -211,7 +212,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-    cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-- 
2.31.1


