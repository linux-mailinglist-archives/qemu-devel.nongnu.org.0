Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B36B3C51
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:33:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa2F-0007gM-Us; Fri, 10 Mar 2023 05:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa27-0007Wf-UV
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:32 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa24-0004GK-3D
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:31 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso5678292wmb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDK+aMGOP0xpM2yh43emDI7/ZdusXKwC3yy2K8RboBM=;
 b=pbx30FAU1PHXBeDRBdzLPqFzMPxlMt5gj3ogc1Z/VGq27I2UQct9NCH/L22rIsnIOF
 x1gjJ9iHkhG7YLRHy0O8hu19Rcq16rMFt8qq9ZzvSoLJQz9qrSoTizKgPl1RGegdFLb9
 HNJN9zj5z0LZubaPHXGI2OPYOGUMvjmcVCYAC2YnmZVpJmszACo4axdTsdCNOhMY5+Iy
 rMrYC3/On+EQGjjdsgt5yJT0dk/uD1Idf0uX4S+K5iChosFpzhxiXf7OgFY7HInxNK1Q
 xmMykO4i1MwOYziQcimdLBtKLj6uxH9nf/jGYJIY62OHZrJHk6vm+wVLpyliZ4OrIuKR
 x77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDK+aMGOP0xpM2yh43emDI7/ZdusXKwC3yy2K8RboBM=;
 b=O+9sVNA9XXCtJMrWqUtgX6nlNab3T2TM+XQC3jewy1Is/62c+DA2fm71BzRgERYMXR
 Gf6FOdFybS/9VRjRWfA3nDFrZj8WV0APxWEPlS2q2QkRxQ7i/9Iq2IobSgVCxFZs1E3b
 toqGMAL+l+vljdxmi5idzV74bR+cdOIj4xW4yIpU/xdaXSVML//e8s69GDdDkmUJJhL9
 Ik+YZEs0+L8ybvSFx23Nyvab2ycfLtKZKkb9pEXd0bgywkCAbRTe2fjNiOvsj82/FEDj
 v+g0EX6kqjKrYG7TL5YtZ5VdMuhFHRh5Lw9vpsb0MBtQE4EWlg9GDuYWZzuQnm2+InJK
 sBZA==
X-Gm-Message-State: AO0yUKUu8CcmY4Q+1owK+J+aW+J+rj7h5I1XVSxvXfnIGzVBGj/EsAKj
 y7mzEnGJNKXFGWHP1KuWGDrnVA==
X-Google-Smtp-Source: AK7set/WTBvF7WMMhEIErsfVnZ3+2/DD2gy8wnNnnKcFXHvN6xWv1/6wchv7FB99q3aWpNaDNBNlPw==
X-Received: by 2002:a05:600c:3b99:b0:3df:3bd6:63e5 with SMTP id
 n25-20020a05600c3b9900b003df3bd663e5mr2235604wms.12.1678444286355; 
 Fri, 10 Mar 2023 02:31:26 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcc15000000b003e20a6fd604sm1675768wmh.4.2023.03.10.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23A101FFBE;
 Fri, 10 Mar 2023 10:31:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 06/11] include/qemu: add documentation for memory callbacks
Date: Fri, 10 Mar 2023 10:31:18 +0000
Message-Id: <20230310103123.2118519-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 include/qemu/qemu-plugin.h | 47 ++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

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


