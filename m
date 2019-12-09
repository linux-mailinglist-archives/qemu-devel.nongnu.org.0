Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A280F117014
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 16:14:39 +0100 (CET)
Received: from localhost ([::1]:41330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieKkA-0008MH-8X
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 10:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ieKY3-0003bA-N6
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:02:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ieKY1-0001Wh-Ir
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:02:07 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40765)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ieKY1-0001Vg-BX
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:02:05 -0500
Received: by mail-wr1-x442.google.com with SMTP id c14so16555923wrn.7
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 07:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FD2f+Nbu9tSiCoNEXPrgDf5vOFg7Yixed0iiSTqFeNk=;
 b=K/fFKf25PiwDzxOrE6hxBDYmqGgXKHetDM0qyCmWRC6Kbho2bO4msh4gr7cjoLaR9Z
 +GW3kjLByTTofFSruYR8MCqcjCS+RGdmGlJDnxKuLWSgsAxVkzsPiAOwNumYcVcQ12CX
 kGQ2ffDQoUvzPr7W349ff7gMX1ujyn7Ex30Irwx5px7u9nby1/mzLrfb3CwJPPzJi+VJ
 RpQoz1VhbQD7IEi9MvBkXVgdyFdJl8OmBnCSKOneCa1+L9Fe26IgYJb6+jrRPzBBvs7G
 NcCAfkG+FkENew5EqiSuFzvkK6ap2J6RUYj7YG8wJthPG7JHViE3pgA9DIe3Yyy/wYpf
 S4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=FD2f+Nbu9tSiCoNEXPrgDf5vOFg7Yixed0iiSTqFeNk=;
 b=e8+VduZZA8a2CLf/Xy38D0AyOuKwAIG7LbkDzvAkV7tVDbJZC/X2rDeDvLS8EoSKxr
 hRtHZT2YfbCCqfsClmON7mgCdP+KQ4d0Ji8i0ITvE3Y6e0WH9J66U16yxzlbWbFcls2a
 qaJDMlMUNAsD3mNO3jXzyAFZ2W1GF+Q4x9MXuX9kt0FpMh6U1PFQNfNgbOaZ6kdM2ETh
 ElqvteiRXdEpeOICMUL3iYDpEQzC9pv6WEgASJ9+s5ws9vElACy+Hu1MIDrlEZO7A8Dw
 oC4RwUGGTuNf4bDnN2QCJ0xeTnpfVALmLFCTU21qqVD3TZBoO9IrYI+a6aoYv04nF8ih
 MJCQ==
X-Gm-Message-State: APjAAAXD2O/HBWNkV/tY5/IL6fN9ybq8PemarMJZAqHnFUP+NLxkEFH6
 vr4DoE+oPsHdSv0XIVjyld7oURNq
X-Google-Smtp-Source: APXvYqz0eHB2vK8To2G/mhdArXpaB8A2XVPmEi3NdF7T7layEb5BIr1zkqhe+2Ts2PZ3w/9MV2Zr8Q==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr2514645wrw.370.1575903724017; 
 Mon, 09 Dec 2019 07:02:04 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g9sm27219371wro.67.2019.12.09.07.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2019 07:02:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/18] xen: convert "-machine igd-passthru" to an
 accelerator property
Date: Mon,  9 Dec 2019 16:01:42 +0100
Message-Id: <1575903705-12925-16-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575903705-12925-1-git-send-email-pbonzini@redhat.com>
References: <1575903705-12925-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: thuth@redhat.com, elmarco@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first machine property to fall is Xen's Intel integrated graphics
passthrough.  The "-machine igd-passthru" option does not set anymore
a property on the machine object, but desugars to a GlobalProperty on
accelerator objects.

The setter is very simple, since the value ends up in a
global variable, so this patch also provides an example before the more
complicated cases that follow it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 20 --------------------
 hw/xen/xen-common.c | 16 ++++++++++++++++
 include/hw/boards.h |  1 -
 qemu-options.hx     |  7 ++++---
 vl.c                | 14 ++++----------
 5 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 45ddfb6..d7a0356 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -412,20 +412,6 @@ static void machine_set_graphics(Object *obj, bool value, Error **errp)
     ms->enable_graphics = value;
 }
 
-static bool machine_get_igd_gfx_passthru(Object *obj, Error **errp)
-{
-    MachineState *ms = MACHINE(obj);
-
-    return ms->igd_gfx_passthru;
-}
-
-static void machine_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
-{
-    MachineState *ms = MACHINE(obj);
-
-    ms->igd_gfx_passthru = value;
-}
-
 static char *machine_get_firmware(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -862,12 +848,6 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "graphics",
         "Set on/off to enable/disable graphics emulation", &error_abort);
 
-    object_class_property_add_bool(oc, "igd-passthru",
-        machine_get_igd_gfx_passthru, machine_set_igd_gfx_passthru,
-        &error_abort);
-    object_class_property_set_description(oc, "igd-passthru",
-        "Set on/off to enable/disable igd passthrou", &error_abort);
-
     object_class_property_add_str(oc, "firmware",
         machine_get_firmware, machine_set_firmware,
         &error_abort);
diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
index 5284b0d..6cba30c 100644
--- a/hw/xen/xen-common.c
+++ b/hw/xen/xen-common.c
@@ -124,6 +124,16 @@ static void xen_change_state_handler(void *opaque, int running,
     }
 }
 
+static bool xen_get_igd_gfx_passthru(Object *obj, Error **errp)
+{
+    return has_igd_gfx_passthru;
+}
+
+static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
+{
+    has_igd_gfx_passthru = value;
+}
+
 static void xen_setup_post(MachineState *ms, AccelState *accel)
 {
     int rc;
@@ -177,6 +187,12 @@ static void xen_accel_class_init(ObjectClass *oc, void *data)
     ac->compat_props = g_ptr_array_new();
 
     compat_props_add(ac->compat_props, compat, G_N_ELEMENTS(compat));
+
+    object_class_property_add_bool(oc, "igd-passthru",
+        xen_get_igd_gfx_passthru, xen_set_igd_gfx_passthru,
+        &error_abort);
+    object_class_property_set_description(oc, "igd-passthru",
+        "Set on/off to enable/disable igd passthrou", &error_abort);
 }
 
 #define TYPE_XEN_ACCEL ACCEL_CLASS_NAME("xen")
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 36fcbda..cdcf481 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -287,7 +287,6 @@ struct MachineState {
     bool mem_merge;
     bool usb;
     bool usb_disabled;
-    bool igd_gfx_passthru;
     char *firmware;
     bool iommu;
     bool suppress_vmdesc;
diff --git a/qemu-options.hx b/qemu-options.hx
index 9775258..6f12b31 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -37,7 +37,6 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                kvm_shadow_mem=size of KVM shadow MMU in bytes\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
-    "                igd-passthru=on|off controls IGD GFX passthrough support (default=off)\n"
     "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
     "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
@@ -71,8 +70,6 @@ more than one accelerator specified, the next one is used if the previous one
 fails to initialize.
 @item kernel_irqchip=on|off
 Controls in-kernel irqchip support for the chosen accelerator when available.
-@item gfx_passthru=on|off
-Enables IGD GFX passthrough support for the chosen machine when available.
 @item vmport=on|off|auto
 Enables emulation of VMWare IO port, for vmmouse etc. auto says to select the
 value based on accel. For accel=xen the default is off otherwise the default
@@ -120,6 +117,7 @@ ETEXI
 DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "-accel [accel=]accelerator[,prop[=value][,...]]\n"
     "                select accelerator (kvm, xen, hax, hvf, whpx or tcg; use 'help' for a list)\n"
+    "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"
     "                tb-size=n (TCG translation block cache size)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 STEXI
@@ -130,6 +128,9 @@ kvm, xen, hax, hvf, whpx or tcg can be available. By default, tcg is used. If th
 more than one accelerator specified, the next one is used if the previous one
 fails to initialize.
 @table @option
+@item igd-passthru=on|off
+When Xen is in use, this option controls whether Intel integrated graphics
+devices can be passed through to the guest (default=off)
 @item tb-size=@var{n}
 Controls the size (in MiB) of the TCG translation block cache.
 @item thread=single|multi
diff --git a/vl.c b/vl.c
index e6ff56b..ee872f2 100644
--- a/vl.c
+++ b/vl.c
@@ -1257,13 +1257,6 @@ static void configure_msg(QemuOpts *opts)
 }
 
 
-/* Now we still need this for compatibility with XEN. */
-bool has_igd_gfx_passthru;
-static void igd_gfx_passthru(void)
-{
-    has_igd_gfx_passthru = current_machine->igd_gfx_passthru;
-}
-
 /***********************************************************/
 /* USB devices */
 
@@ -2642,6 +2635,10 @@ static int machine_set_property(void *opaque,
     if (g_str_equal(qom_name, "accel")) {
         return 0;
     }
+    if (g_str_equal(qom_name, "igd-passthru")) {
+        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value);
+        return 0;
+    }
 
     return object_parse_property_opt(opaque, name, value, "type", errp);
 }
@@ -4456,9 +4453,6 @@ int main(int argc, char **argv, char **envp)
             exit(1);
     }
 
-    /* Check if IGD GFX passthrough. */
-    igd_gfx_passthru();
-
     /* init generic devices */
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
     qemu_opts_foreach(qemu_find_opts("device"),
-- 
1.8.3.1



