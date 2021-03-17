Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9A033EA8A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:29:38 +0100 (CET)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQcb-0004hX-5t
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVr-0003wO-10
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVo-0007zV-Ed
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:38 -0400
Received: by mail-ed1-x530.google.com with SMTP id b16so977850eds.7
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rQc1qB+dj1Aep27H7tyCH6v/LAf+f1B6hR9k7rulrqQ=;
 b=B8zu3exmsDI27bxT/ZQdAn2bvvSL81LymVUnEUr8oOWiLHZWkxMhARDhD//mMIO5Mj
 nhLT27cC2gaiq8YmzZ7P+ds+eiwC9BkS0ftukDbPZQEe4ThIRmrn/fO4qllEManRJ8nL
 VcocpmUPibYF9c6y+/VZy2kFuoBku7ePIz2EDUfnfN/mGvRMhf13R32y1k3qOYHdZJFy
 tYNJ+yPvTXyg8hrfjeMv4PhDfZa6qaAyD8gReehvodfKDlgDodvnSoD8HOZ2+P0kHGAH
 xWg56ObmhpeYMnKn43IIOx0gBvwX48tyrEN/wwcB90SaDOUb8Ire6w1X0Pm8vutHU68E
 wjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rQc1qB+dj1Aep27H7tyCH6v/LAf+f1B6hR9k7rulrqQ=;
 b=MDX99z9Hpt3LS6zVopKvegD+wjp4kNOhyTXunlHoLxm+m7usK6V5MBpDvRh8QOgQ8z
 /vjzyGVpJnO0K2+UQimNEw2l7tvzcMCImBwReGrfcZ2JJ5RehV7r2dw0mU1qHLisJ1Ma
 i1Tcpw3KBbQzH9rBZxzTyecGcVnQzTaI6U29Yc31WBF545VpKNz4JuMzSfFGR1Pzz1zd
 +5dnLe3AT7ZvOFZBdN7qD7u/TNVSZEbLnCMfVoUjnp5RR2hXj7F8gyiZngirCDvnoXyS
 aJnHynALuCBRt3FfAD/BZXzzAyr1rEIxd1Tbv2h0rPGkL7wIFm0A9iiZffrOBKsnkF2Y
 nbKg==
X-Gm-Message-State: AOAM533xPYvxQhWDp05UArHS9ld8xuhI/6tkt4Rl6ZIkwnuGT4Il5brm
 HZaiw/HKL6yG/gAWGvnxPUWksg==
X-Google-Smtp-Source: ABdhPJzWZeQsq8RHBLr3LUcO2Nw+1p4LMFjyoXma+bQOJM1aDChSpZ9gcGYfAOzI2MbV6d38XOZvZw==
X-Received: by 2002:a05:6402:48c:: with SMTP id
 k12mr40595149edv.237.1615965755118; 
 Wed, 17 Mar 2021 00:22:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v1sm10347142ejd.3.2021.03.17.00.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8CBE91FF99;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 10/15] plugins: expand inline exec kernel-doc documentation.
Date: Wed, 17 Mar 2021 07:22:11 +0000
Message-Id: <20210317072216.16316-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the extraneous @cb parameter and document the non-atomic nature
of the INLINE_ADD_U64 operation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312172821.31647-11-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 272d240a8f..a3805bb299 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -269,6 +269,14 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
                                           enum qemu_plugin_cb_flags flags,
                                           void *userdata);
 
+/**
+ * enum qemu_plugin_op - describes an inline op
+ *
+ * @QEMU_PLUGIN_INLINE_ADD_U64: add an immediate value uint64_t
+ *
+ * Note: currently only a single inline op is supported.
+ */
+
 enum qemu_plugin_op {
     QEMU_PLUGIN_INLINE_ADD_U64,
 };
@@ -283,6 +291,9 @@ enum qemu_plugin_op {
  * Insert an inline op to every time a translated unit executes.
  * Useful if you just want to increment a single counter somewhere in
  * memory.
+ *
+ * Note: ops are not atomic so in multi-threaded/multi-smp situations
+ * you will get inexact results.
  */
 void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
                                               enum qemu_plugin_op op,
@@ -305,7 +316,6 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
 /**
  * qemu_plugin_register_vcpu_insn_exec_inline() - insn execution inline op
  * @insn: the opaque qemu_plugin_insn handle for an instruction
- * @cb: callback function
  * @op: the type of qemu_plugin_op (e.g. ADD_U64)
  * @ptr: the target memory location for the op
  * @imm: the op data (e.g. 1)
-- 
2.20.1


