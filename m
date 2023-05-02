Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5EF6F4383
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:16:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovS-0004KM-Lb; Tue, 02 May 2023 08:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oK-OR
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouV-0003CH-7V
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so3539664f8f.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029708; x=1685621708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Of3H77zDfMHdjjVbFofwmkKao182e8UoJG/ba+xlPXQ=;
 b=SepH+0Z9AX/mnhkkHoYXUOcsUuQt3fFJqw/6WID6K/r/xTREuHTR+muIofHEwrAD2z
 iWiPEuO75Qdvq3lLDKImwMKo5tKmiJWCP+b6/QMyuQOkEQlNfLX86cF0PNYrIShtOObx
 +Srb4XmfNjdMso7xADI0be/UXRVS6CHmbqir22yY3ju1aW9RS6iW63GBopDzBtbKVuIA
 WIFNNP2pC3GuoTvjf3+XT5onXEobNlIxQETx9yfQXhQwZIKo6Rh/AsQMj88xKe7TQz/0
 t2GdyCNkpRynD28eq1e69lfWVyqQh0UMi7TK61ZeiifwsOWMGCtWJ+wph2QYMknKLRkU
 Z2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029708; x=1685621708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Of3H77zDfMHdjjVbFofwmkKao182e8UoJG/ba+xlPXQ=;
 b=kc6LO5kQdl9H1e3SToztUTWzKAoK2apZetmaiNrmKfbPrOzoJafYqFx5C0OaHRzTbv
 /vyovQNGxFATkyyKglXQMl/Ee20kNiNJZrPdg11YkeK+367DLOtLe+qmwW5p2zo7w7Yh
 7CnuwHI1G9rf4wKt8suCa4LtDqSG4VeQ8FOTqlpp4uT6bWGGXTB54DTNewWwkzEnJEv+
 Pef4Z7+lHA6cwstELAi0VyejbWBwbllYf+j0U7IDNxAHgMGJZoM+3pkDOHNgNZptT+SB
 6w7sXdP9uhPzoaRaP5BLCRinLUaXqRmilSGDF7OhZduN084/cgM2hkxrYJQv8WtMybc5
 BH8g==
X-Gm-Message-State: AC+VfDwvIK04vC/+O6xDAV0xXSviY70/5IhfbhdkvbIbw8653BmPVryx
 +HrP1eOsj0fk07yUB76gQjWa/nusscOw955yVtI=
X-Google-Smtp-Source: ACHHUZ6SaTsxWZlVmpb5y9BkeeM13s5ue3ffY8s8wS9v42O4f84HHYFqu7XKdOMigzmfAn4IOZT6Dw==
X-Received: by 2002:adf:d4c6:0:b0:2ef:b8e3:46fe with SMTP id
 w6-20020adfd4c6000000b002efb8e346femr11784313wrk.37.1683029708596; 
 Tue, 02 May 2023 05:15:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/35] make one-insn-per-tb an accel option
Date: Tue,  2 May 2023 13:14:40 +0100
Message-Id: <20230502121459.2422303-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This commit adds 'one-insn-per-tb' as a property on the TCG
accelerator object, so you can enable it with
   -accel tcg,one-insn-per-tb=on

It has the same behaviour as the existing '-singlestep' command line
option.  We use a different name because 'singlestep' has always been
a confusing choice, because it doesn't have anything to do with
single-stepping the CPU.  What it does do is force TCG emulation to
put one guest instruction in each TB, which can be useful in some
situations (such as analysing debug logs).

The existing '-singlestep' commandline options are decoupled from the
global 'singlestep' variable and instead now are syntactic sugar for
setting the accel property.  (These can then go away after a
deprecation period.)

The global variable remains for the moment as:
 * what the TCG code looks at to change its behaviour
 * what HMP and QMP use to query and set the behaviour

In the following commits we'll clean those up to not directly
look at the global variable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230417164041.684562-2-peter.maydell@linaro.org
---
 accel/tcg/tcg-all.c | 21 +++++++++++++++++++++
 bsd-user/main.c     |  8 ++++++--
 linux-user/main.c   |  8 ++++++--
 softmmu/vl.c        | 17 +++++++++++++++--
 qemu-options.hx     |  7 +++++++
 5 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 5dab1ae9dd3..fcf361c8db6 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -42,6 +42,7 @@ struct TCGState {
     AccelState parent_obj;
 
     bool mttcg_enabled;
+    bool one_insn_per_tb;
     int splitwx_enabled;
     unsigned long tb_size;
 };
@@ -208,6 +209,20 @@ static void tcg_set_splitwx(Object *obj, bool value, Error **errp)
     s->splitwx_enabled = value;
 }
 
+static bool tcg_get_one_insn_per_tb(Object *obj, Error **errp)
+{
+    TCGState *s = TCG_STATE(obj);
+    return s->one_insn_per_tb;
+}
+
+static void tcg_set_one_insn_per_tb(Object *obj, bool value, Error **errp)
+{
+    TCGState *s = TCG_STATE(obj);
+    s->one_insn_per_tb = value;
+    /* For the moment, set the global also: this changes the behaviour */
+    singlestep = value;
+}
+
 static int tcg_gdbstub_supported_sstep_flags(void)
 {
     /*
@@ -245,6 +260,12 @@ static void tcg_accel_class_init(ObjectClass *oc, void *data)
         tcg_get_splitwx, tcg_set_splitwx);
     object_class_property_set_description(oc, "split-wx",
         "Map jit pages into separate RW and RX regions");
+
+    object_class_property_add_bool(oc, "one-insn-per-tb",
+                                   tcg_get_one_insn_per_tb,
+                                   tcg_set_one_insn_per_tb);
+    object_class_property_set_description(oc, "one-insn-per-tb",
+        "Only put one guest insn in each translation block");
 }
 
 static const TypeInfo tcg_accel_type = {
diff --git a/bsd-user/main.c b/bsd-user/main.c
index babc3b009b6..09b84da190c 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -50,6 +50,7 @@
 #include "target_arch_cpu.h"
 
 int singlestep;
+static bool opt_one_insn_per_tb;
 uintptr_t guest_base;
 bool have_guest_base;
 /*
@@ -386,7 +387,7 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "seed")) {
             seed_optarg = optarg;
         } else if (!strcmp(r, "singlestep")) {
-            singlestep = 1;
+            opt_one_insn_per_tb = true;
         } else if (!strcmp(r, "strace")) {
             do_strace = 1;
         } else if (!strcmp(r, "trace")) {
@@ -444,9 +445,12 @@ int main(int argc, char **argv)
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
     {
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+        AccelState *accel = current_accel();
+        AccelClass *ac = ACCEL_GET_CLASS(accel);
 
         accel_init_interfaces(ac);
+        object_property_set_bool(OBJECT(accel), "one-insn-per-tb",
+                                 opt_one_insn_per_tb, &error_abort);
         ac->init_machine(NULL);
     }
     cpu = cpu_create(cpu_type);
diff --git a/linux-user/main.c b/linux-user/main.c
index fe03293516a..489694ad654 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -69,6 +69,7 @@ char *exec_path;
 char real_exec_path[PATH_MAX];
 
 int singlestep;
+static bool opt_one_insn_per_tb;
 static const char *argv0;
 static const char *gdbstub;
 static envlist_t *envlist;
@@ -411,7 +412,7 @@ static void handle_arg_reserved_va(const char *arg)
 
 static void handle_arg_singlestep(const char *arg)
 {
-    singlestep = 1;
+    opt_one_insn_per_tb = true;
 }
 
 static void handle_arg_strace(const char *arg)
@@ -777,9 +778,12 @@ int main(int argc, char **argv, char **envp)
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
     {
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+        AccelState *accel = current_accel();
+        AccelClass *ac = ACCEL_GET_CLASS(accel);
 
         accel_init_interfaces(ac);
+        object_property_set_bool(OBJECT(accel), "one-insn-per-tb",
+                                 opt_one_insn_per_tb, &error_abort);
         ac->init_machine(NULL);
     }
     cpu = cpu_create(cpu_type);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index fb6c221e8e5..6c2427262be 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -182,6 +182,7 @@ static const char *log_file;
 static bool list_data_dirs;
 static const char *qtest_chrdev;
 static const char *qtest_log;
+static bool opt_one_insn_per_tb;
 
 static int has_defaults = 1;
 static int default_serial = 1;
@@ -2220,7 +2221,19 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
     qemu_opt_foreach(opts, accelerator_set_property,
                      accel,
                      &error_fatal);
-
+    /*
+     * If legacy -singlestep option is set, honour it for TCG and
+     * silently ignore for any other accelerator (which is how this
+     * option has always behaved).
+     */
+    if (opt_one_insn_per_tb) {
+        /*
+         * This will always succeed for TCG, and we want to ignore
+         * the error from trying to set a nonexistent property
+         * on any other accelerator.
+         */
+        object_property_set_bool(OBJECT(accel), "one-insn-per-tb", true, NULL);
+    }
     ret = accel_init_machine(accel, current_machine);
     if (ret < 0) {
         if (!qtest_with_kvm || ret != -ENOENT) {
@@ -2955,7 +2968,7 @@ void qemu_init(int argc, char **argv)
                 qdict_put_str(machine_opts_dict, "firmware", optarg);
                 break;
             case QEMU_OPTION_singlestep:
-                singlestep = 1;
+                opt_one_insn_per_tb = true;
                 break;
             case QEMU_OPTION_S:
                 autostart = 0;
diff --git a/qemu-options.hx b/qemu-options.hx
index 42fc90aae47..b8bc94f370c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -182,6 +182,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"
     "                kernel-irqchip=on|off|split controls accelerated irqchip support (default=on)\n"
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
+    "                one-insn-per-tb=on|off (one guest instruction per TCG translation block)\n"
     "                split-wx=on|off (enable TCG split w^x mapping)\n"
     "                tb-size=n (TCG translation block cache size)\n"
     "                dirty-ring-size=n (KVM dirty ring GFN count, default 0)\n"
@@ -210,6 +211,12 @@ SRST
     ``kvm-shadow-mem=size``
         Defines the size of the KVM shadow MMU.
 
+    ``one-insn-per-tb=on|off``
+        Makes the TCG accelerator put only one guest instruction into
+        each translation block. This slows down emulation a lot, but
+        can be useful in some situations, such as when trying to analyse
+        the logs produced by the ``-d`` option.
+
     ``split-wx=on|off``
         Controls the use of split w^x mapping for the TCG code generation
         buffer. Some operating systems require this to be enabled, and in
-- 
2.34.1


