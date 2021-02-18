Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDB731E85D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:04:56 +0100 (CET)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgB5-0000ve-2U
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzW-0004UU-Fy
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:58 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzQ-000104-3F
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:57 -0500
Received: by mail-wr1-x432.google.com with SMTP id v1so2206744wrd.6
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=URgrKoscFh5SeIM+x771X4c87xx5ce4C6s1fpPI8uTg=;
 b=OT13xFdQNme59mP1u1TAAGN7q60WNwp1Mcp/lBtDPS0+p/vTEcM6aBW7+LIrBV0HyM
 8c5isV2P09mchje6vLoUy+lmHqIJ9NkhUmcvnN1nueuw61warvJORkAYzVaCUXlqKLzW
 bXcGTD6CFTx79VmL7mJoFulFjmAAMI9fazrx25jb6VSYYyJIgSwrD+RDzWFHEDYpoCGv
 q9UIr6PRZxrhV19Bz5Q/1Huqi/DsOE3dn9CC06NyX4Sph8NVZiKEb2KAJq2Qyt1gJkZm
 obK+vQhephyDkRyDj2WzbDS8v0HTS0NzsI/WVvw6jcpCbdd7oiMH1JO3QNL7eBZjMsCE
 q1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=URgrKoscFh5SeIM+x771X4c87xx5ce4C6s1fpPI8uTg=;
 b=QisFgiOzr/xeqm51rw/OHYR7PKDlpTWDlzgVZw7A3d742mJBEf7toEVDV424VZbZu2
 IjLETjdTvxPjNv5HEtxZfNEbz5UOcZKYlDyR3MrJ1IsLVf1N3A2lvvEmL4GHPwUI12te
 mdX+ClF/nFg5p64vOnd85K55bnG8g3RuojuhW7OI8ftePq4tmraqykgQ7RRKAW3SM+Cg
 KLxboZ16k1JqmvnUKS5/kaeN9O+wS82JlZNEUEjI8kxllPlFgZH09uCYvEVQsWisJfFW
 1U84JaTHFQodv+yd3urUqnTQXYCdycEmoxJMogbd5xaS/jZu6dvVV2zNDXgvC2S5C72y
 NOgA==
X-Gm-Message-State: AOAM5304Xa9iTzDOuUKqxGcJUV0xgWNMwDc9X31PUIRuIGlDxOJ5ix7U
 Xy2bPLTIEgM2QzrwEs4UOrb5pQ==
X-Google-Smtp-Source: ABdhPJx0ilfzlpsfwY6ludOD8pEEtCHAhIowCIwKp8a8+01X5tgNh66czF/tz/diWPEglPwNRv11aA==
X-Received: by 2002:a5d:6b42:: with SMTP id x2mr3386128wrw.117.1613641970805; 
 Thu, 18 Feb 2021 01:52:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p12sm6242489wmq.1.2021.02.18.01.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:52:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 542831FF9D;
 Thu, 18 Feb 2021 09:47:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/23] tests/plugin: expand insn test to detect duplicate
 instructions
Date: Thu, 18 Feb 2021 09:46:57 +0000
Message-Id: <20210218094706.23038-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A duplicate insn is one that is appears to be executed twice in a row.
This is currently possible due to -icount and cpu_io_recompile()
causing a re-translation of a block. On it's own this won't trigger
any tests though.

The heuristics that the plugin use can't deal with the x86 rep
instruction which (validly) will look like executing the same
instruction several times. To avoid problems later we tweak the rules
for x86 to run the "inline" version of the plugin. This also has the
advantage of increasing coverage of the plugin code (see bugfix in
previous commit).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-15-alex.bennee@linaro.org>

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index a9a6e41237..c253980ec8 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -21,6 +21,14 @@ static bool do_inline;
 
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
+    static uint64_t last_pc;
+    uint64_t this_pc = GPOINTER_TO_UINT(udata);
+    if (this_pc == last_pc) {
+        g_autofree gchar *out = g_strdup_printf("detected repeat execution @ 0x%"
+                                                PRIx64 "\n", this_pc);
+        qemu_plugin_outs(out);
+    }
+    last_pc = this_pc;
     insn_count++;
 }
 
@@ -36,8 +44,10 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
             qemu_plugin_register_vcpu_insn_exec_inline(
                 insn, QEMU_PLUGIN_INLINE_ADD_U64, &insn_count, 1);
         } else {
+            uint64_t vaddr = qemu_plugin_insn_vaddr(insn);
             qemu_plugin_register_vcpu_insn_exec_cb(
-                insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS, NULL);
+                insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS,
+                GUINT_TO_POINTER(vaddr));
         }
     }
 }
diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index 5266f2335a..fa9b1b9f90 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -33,5 +33,15 @@ EXTRA_RUNS+=$(MULTIARCH_RUNS)
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
+# non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
+run-plugin-%-with-libinsn.so:
+	$(call run-test, $@, \
+	  $(QEMU) -monitor none -display none \
+		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
+                  -plugin ../../plugin/libinsn.so$(COMMA)arg=inline \
+	    	  -d plugin -D $*-with-libinsn.so.pout \
+	   	  $(QEMU_OPTS) $*, \
+		  "$* on $(TARGET_NAME)")
+
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index ad187cb2c9..c4a6f91966 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -48,6 +48,13 @@ else
 SKIP_I386_TESTS+=test-i386-fprem
 endif
 
+# non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
+run-plugin-%-with-libinsn.so:
+	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
+	       -plugin ../../plugin/libinsn.so$(COMMA)arg=inline \
+	       -d plugin -D $*-with-libinsn.so.pout $*, \
+		"$* (inline) on $(TARGET_NAME)")
+
 # Update TESTS
 I386_TESTS:=$(filter-out $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
 TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
index 1bd763f2e6..9896319f0e 100644
--- a/tests/tcg/x86_64/Makefile.softmmu-target
+++ b/tests/tcg/x86_64/Makefile.softmmu-target
@@ -33,5 +33,15 @@ EXTRA_RUNS+=$(MULTIARCH_RUNS)
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
+# non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
+run-plugin-%-with-libinsn.so:
+	$(call run-test, $@, \
+	  $(QEMU) -monitor none -display none \
+		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
+                  -plugin ../../plugin/libinsn.so$(COMMA)arg=inline \
+	    	  -d plugin -D $*-with-libinsn.so.pout \
+	   	  $(QEMU_OPTS) $*, \
+		  "$* on $(TARGET_NAME)")
+
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
-- 
2.20.1


