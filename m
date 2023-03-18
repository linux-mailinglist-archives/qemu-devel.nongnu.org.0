Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244AE6BF9AF
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:49:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1W-0004oc-Tb; Sat, 18 Mar 2023 07:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1Q-0004mm-QA
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:52 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1P-0007Db-0k
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:52 -0400
Received: by mail-wm1-x333.google.com with SMTP id m35so4748673wms.4
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBYk5bGVNcz+Cm3QC0lbKHCg7DWMcmjX+dS/dafzz5k=;
 b=VsSFWHlYpziQ/+tP46C3S5dBq0DjOGjgiKxjp1Lxou1C/Px8y2nGtyi/bENTPhNLrD
 eDowkwLvFpeqnAa/G20pOrKvMF5R7nhwVjvleVuQbb+s7bvn6Idrvtw+6j9ZPRtw975u
 fLYhzlnJcxC5BgHTQp6ZI5e+j5P2b94h2fbENW05EMdeh9y3kcwtJc1pRiHmp14rmV5y
 0FZBBn4SdK8Z8FENOuNhFxtgnSBJEyoWa9uEeP0he0485eBd8jSe3LdJotMMM3GY6eJ9
 jcRlex8xUzeqKKL7fWq1F67XsXaOndfrJj7uUtp+KgKMwr4gTulnpUBLTMgbfwL+jL06
 szxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fBYk5bGVNcz+Cm3QC0lbKHCg7DWMcmjX+dS/dafzz5k=;
 b=J0BUwKIf/6vwPI9wi4xJO5yXg1cJJkUyX44l+Bm7wGjE06C7j9d6dLoO8tl/bbnz8L
 LD1nhf9tYumsGpjQlMZPQe1gQ5ImDTpJOCxuv3ocHWatmB9jNx2FfnXV8BhmV/wRhP29
 4XuhUDG4vgrZSpr9YFeHQCG+LwJ9n+4seBrmZHdk2cDF35NggmlkJmcn0yQ+PSO2MLa3
 KLoSB9LDfpJutDvmpPMZznXo70VRW2iMVaiHcHioy3L7qiPiZ7khi/y0QBNZTIxtgC1S
 jQaoqYokDqD22zJsdlyeHjzwSSuoyCKz1bsfgyp8zr5zGhG126SM/ER69mCjcLowF+JC
 9qSg==
X-Gm-Message-State: AO0yUKVIqb37Us5g3xR6nL9ZnMdu9+9TVJgnFvc9cGB4cEdDxmdwslkt
 eG6HpHP7KQ3M4Xe3WcW1i4DvYw==
X-Google-Smtp-Source: AK7set/oZao4+/cmFXb8hrzbiPL1upNlMwMrNDqTbhqrhEhvUQlentKhyMbkV+n5/HmSOKYg7OpU5g==
X-Received: by 2002:a05:600c:19cf:b0:3eb:2da4:f304 with SMTP id
 u15-20020a05600c19cf00b003eb2da4f304mr25867313wmq.17.1679140009719; 
 Sat, 18 Mar 2023 04:46:49 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c028400b003eb192787bfsm4582187wmk.25.2023.03.18.04.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 275151FFBE;
 Sat, 18 Mar 2023 11:46:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 06/31] include/qemu: add documentation for memory callbacks
Date: Sat, 18 Mar 2023 11:46:19 +0000
Message-Id: <20230318114644.1340899-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some API documentation was missed, rectify that.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1497
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230315174331.2959-7-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index d0e9d03adf..50a9957279 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -481,17 +481,56 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
  */
 const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h);
 
-typedef void
-(*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
-                             qemu_plugin_meminfo_t info, uint64_t vaddr,
-                             void *userdata);
+/**
+ * typedef qemu_plugin_vcpu_mem_cb_t - memory callback function type
+ * @vcpu_index: the executing vCPU
+ * @info: an opaque handle for further queries about the memory
+ * @vaddr: the virtual address of the transaction
+ * @userdata: any user data attached to the callback
+ */
+typedef void (*qemu_plugin_vcpu_mem_cb_t) (unsigned int vcpu_index,
+                                           qemu_plugin_meminfo_t info,
+                                           uint64_t vaddr,
+                                           void *userdata);
 
+/**
+ * qemu_plugin_register_vcpu_mem_cb() - register memory access callback
+ * @insn: handle for instruction to instrument
+ * @cb: callback of type qemu_plugin_vcpu_mem_cb_t
+ * @flags: (currently unused) callback flags
+ * @rw: monitor reads, writes or both
+ * @userdata: opaque pointer for userdata
+ *
+ * This registers a full callback for every memory access generated by
+ * an instruction. If the instruction doesn't access memory no
+ * callback will be made.
+ *
+ * The callback reports the vCPU the access took place on, the virtual
+ * address of the access and a handle for further queries. The user
+ * can attach some userdata to the callback for additional purposes.
+ *
+ * Other execution threads will continue to execute during the
+ * callback so the plugin is responsible for ensuring it doesn't get
+ * confused by making appropriate use of locking if required.
+ */
 void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
                                       qemu_plugin_vcpu_mem_cb_t cb,
                                       enum qemu_plugin_cb_flags flags,
                                       enum qemu_plugin_mem_rw rw,
                                       void *userdata);
 
+/**
+ * qemu_plugin_register_vcpu_mem_inline() - register an inline op to any memory access
+ * @insn: handle for instruction to instrument
+ * @rw: apply to reads, writes or both
+ * @op: the op, of type qemu_plugin_op
+ * @ptr: pointer memory for the op
+ * @imm: immediate data for @op
+ *
+ * This registers a inline op every memory access generated by the
+ * instruction. This provides for a lightweight but not thread-safe
+ * way of counting the number of operations done.
+ */
 void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
                                           enum qemu_plugin_mem_rw rw,
                                           enum qemu_plugin_op op, void *ptr,
-- 
2.39.2


