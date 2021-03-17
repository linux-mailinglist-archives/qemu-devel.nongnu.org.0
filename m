Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778BC33EA97
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:31:49 +0100 (CET)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQei-0006tM-GB
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVs-0003zO-9V
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:40 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVq-00080I-9H
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:40 -0400
Received: by mail-ej1-x62c.google.com with SMTP id jt13so954249ejb.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V1k83nSOBQHKX3KyY5kO2YVliDyi+4QoKl7OCC4rWPk=;
 b=YIg0u2dFh5+c3E5JAVrd5/R9nhrSIV/kDrAHKzyXxpSzPVvJRL1gk9d6NGmE7nbOsb
 xqYAQWq/JdV8M6AemeTVIfJOgp1qdTB8f/3yXW6HpofR7w+FfRXGVUV+TQhZoUvIhpeI
 cnGi7CM3Dhz5yUJi1AOF4J+lgF4ijjvjER9N2rHyhTbL8ecxrklzJVZJF5sIy/6MKfy1
 u7IV35VeIeWTzZtqexox2CX7sZebKHxg6lXjMiRTS+Mcbt9NOAAXTivJgzHm8kS8EdQm
 ywmckWVxlHyBq0Y2478WJaHBFGQDTteVx+zq3mNWBFpBxD/78drJZZpUTMgPoUicLMFn
 eq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V1k83nSOBQHKX3KyY5kO2YVliDyi+4QoKl7OCC4rWPk=;
 b=jt4P4LbTpHkd4Y5+XOHaL+AspDgeGrIhsx5pY1LbHGx9lsGeeDzJWrFwhvZULDYzjc
 BAY/zXRBGWhwLUSYlUCld/jWSRHbcDEOrxWJeoGZ4/pd5pS3SuC4PjBYMhOd6tV3kcRJ
 egKQT5u6f0YXLlGRfElsils73QQcm2P1MILHte9V+SEAac9GvY041SqTETTWP9TLNlCY
 oXm36OKNe/pSvFZFf8NzQPkEmQEL4ai1hOoA0gpdMmLiBWzxF/LnyHU2JlBr6e/ygPI2
 iWnHRBCDmdxmAXIzP2HzxHkScBHNcDjFrk1XEEipnd9uk5u/KAZ81yBJoDodXDEudgqc
 +LQg==
X-Gm-Message-State: AOAM532w0+phwa9i/QjEF7SbDOjeYe5fED5TqV+4FzT/LjvnD9fJjip0
 kryBXnI44qf8C14hg+wdbVUYgw==
X-Google-Smtp-Source: ABdhPJxr4uOpN9vOwGtM3xKGofY047n+uNTz5lE49/6c/AFMGbaL7kpI8K4HKxujaW/e3mWrkVnp+g==
X-Received: by 2002:a17:906:1c41:: with SMTP id
 l1mr33671066ejg.299.1615965756888; 
 Wed, 17 Mar 2021 00:22:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v1sm10347155ejd.3.2021.03.17.00.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A07021FF9A;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 11/15] plugins: expand kernel-doc for instruction query and
 instrumentation
Date: Wed, 17 Mar 2021 07:22:12 +0000
Message-Id: <20210317072216.16316-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312172821.31647-12-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index a3805bb299..ad9dc4b69d 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -327,21 +327,70 @@ void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
                                                 enum qemu_plugin_op op,
                                                 void *ptr, uint64_t imm);
 
-/*
- * Helpers to query information about the instructions in a block
+/**
+ * qemu_plugin_tb_n_insns() - query helper for number of insns in TB
+ * @tb: opaque handle to TB passed to callback
+ *
+ * Returns: number of instructions in this block
  */
 size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
 
+/**
+ * qemu_plugin_tb_vaddr() - query helper for vaddr of TB start
+ * @tb: opaque handle to TB passed to callback
+ *
+ * Returns: virtual address of block start
+ */
 uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
 
+/**
+ * qemu_plugin_tb_get_insn() - retrieve handle for instruction
+ * @tb: opaque handle to TB passed to callback
+ * @idx: instruction number, 0 indexed
+ *
+ * The returned handle can be used in follow up helper queries as well
+ * as when instrumenting an instruction. It is only valid for the
+ * lifetime of the callback.
+ *
+ * Returns: opaque handle to instruction
+ */
 struct qemu_plugin_insn *
 qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx);
 
+/**
+ * qemu_plugin_insn_data() - return ptr to instruction data
+ * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
+ *
+ * Note: data is only valid for duration of callback. See
+ * qemu_plugin_insn_size() to calculate size of stream.
+ *
+ * Returns: pointer to a stream of bytes containing the value of this
+ * instructions opcode.
+ */
 const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn);
 
+/**
+ * qemu_plugin_insn_size() - return size of instruction
+ * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
+ *
+ * Returns: size of instruction in bytes
+ */
 size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn);
 
+/**
+ * qemu_plugin_insn_vaddr() - return vaddr of instruction
+ * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
+ *
+ * Returns: virtual address of instruction
+ */
 uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
+
+/**
+ * qemu_plugin_insn_haddr() - return hardware addr of instruction
+ * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
+ *
+ * Returns: hardware (physical) target address of instruction
+ */
 void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
 
 /*
-- 
2.20.1


