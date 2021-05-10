Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2A5378B6C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:09:58 +0200 (CEST)
Received: from localhost ([::1]:36532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4jV-0000st-Pc
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dja@axtens.net>) id 1lg4h1-0007fm-Ag
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:07:23 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dja@axtens.net>) id 1lg4gz-0000eB-6f
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:07:23 -0400
Received: by mail-pf1-x430.google.com with SMTP id i13so13577677pfu.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EZjBTCjfLjuw+fMtZby49poKJKIsVUn8rmA8SEDnUfc=;
 b=YgC8uMIiU4nV3mshNswsTcHHNLAMytLLva8RoIiQJqWUSRtsO+AunFnlFD0+HEeQWC
 Uq4Zfx/GVkJ0lBBn22a56sGzOBuLkcvzVxvYlRvodE5KjIPy7ReK1vdHmHs1Fiyp6oi2
 8PFP8TTRJEhdcv4z6WR2Tr4pITeiG8y2mTZRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EZjBTCjfLjuw+fMtZby49poKJKIsVUn8rmA8SEDnUfc=;
 b=pOxQ45Ikf+qCUPFfrKKjOFbf4yiqZguFSFlm7oUEHIxSpyQrk/iAHHzgNp+trM+FAw
 nzZNN8Wd1DSsgdZyCfAD6TJHadaoCQlI+Rq85mbpt+kvxLBXQcgigSq4sI8NkTMBLWj7
 nRIoWVFFxp//9zr01rM6NxVQJErOC9wxtBCO6lYQc0lTUdHJaowEIC6MbKV8K1w4gRf2
 iBL3qgb6PWBrnZF+5Daaa5C8SF9w5Fb18PEVDxGEnxesC+Gn+LSkrP3pz1JLitS0pQU3
 eE0Ys7erHzksVilkR9xYyVBRd1waZ3G6Qc0D+tE6u7LuEGVkqsuLmKyjvjZ6blrmz8XV
 h0tw==
X-Gm-Message-State: AOAM531IkQ4Y7rMrDJZNnG/b6lApT1RDYp1Sp86apcbBrtwZTy6XIQZB
 aLrH+f03wambftw5fIHLtpHhGQ==
X-Google-Smtp-Source: ABdhPJzICCcB19A+6zdbe6pTjxw8Ds9LTGfoTk5pRvs2Hyesv8yxXG5NPFjKT/N5XQQ5IBGHCvmduw==
X-Received: by 2002:a63:338b:: with SMTP id
 z133mr24379977pgz.442.1620648438464; 
 Mon, 10 May 2021 05:07:18 -0700 (PDT)
Received: from localhost ([120.18.209.143])
 by smtp.gmail.com with ESMTPSA id 1sm10866501pfv.159.2021.05.10.05.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:07:18 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: qemu-ppc@nongnu.org,
	david@gibson.dropbear.id.au
Subject: [PATCH] ppc/spapr: advertise secure boot in the guest device tree
Date: Mon, 10 May 2021 22:07:13 +1000
Message-Id: <20210510120713.90053-1-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=dja@axtens.net; helo=mail-pf1-x430.google.com
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
Cc: qemu-devel@nongnu.org, Daniel Axtens <dja@axtens.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ibm,secure-boot property of the / node determines how firmware
and the operating system should enforce secure boot. The meaning
of the various values are:

 0   - secure boot is disabled
 1   - secure boot in log-only mode
 2   - secure boot enabled and enforced
 3-9 - secure boot enabled and enforced; requirements at the
         discretion of the operating system

We expose this as two properties:

 - secure-boot: determines whether the property is advertised in the
                guest device tree. The default is false.

 - secure-boot-level: what value is advertised if enabled?
                      The default is 2.

This doesn't make the firmware or OS actually _do_ any verification, it
just advises them that they should.

Signed-off-by: Daniel Axtens <dja@axtens.net>

---

Linux already reads this property. Versions of SLOF and grub that do
verification are available on my GitHub:
 - github.com/daxtens/SLOF branch ibm,secure-boot (not production ready!)
 - github.com/daxtens/grub branch appendedsig-2.06
---
 hw/ppc/spapr.c         | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h |  4 ++++
 2 files changed, 46 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3b1a5ed86518..544a412c3d18 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1157,6 +1157,20 @@ static void spapr_dt_hypervisor(SpaprMachineState *spapr, void *fdt)
     }
 }
 
+static void spapr_dt_stb(SpaprMachineState *spapr, void *fdt)
+{
+    /*
+     * PowerVM may provide fw-secure-boot, which purports to tell a partition
+     * if the underlying firmware was booted securely. It's not meaningful
+     * for KVM as there are no agreed semantics for what it would mean (host
+     * secure boot only gives you integrity for the host kernel, not host
+     * qemu). So we omit the property for now.
+     */
+    if (spapr->secure_boot)
+        _FDT(fdt_setprop_cell(fdt, 0, "ibm,secure-boot",
+            spapr->secure_boot_level));
+}
+
 void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space)
 {
     MachineState *machine = MACHINE(spapr);
@@ -1263,6 +1277,9 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space)
         spapr_dt_hypervisor(spapr, fdt);
     }
 
+    /* /ibm,secureboot */
+    spapr_dt_stb(spapr, fdt);
+
     /* Build memory reserve map */
     if (reset) {
         if (spapr->kernel_size) {
@@ -3298,6 +3315,20 @@ static void spapr_set_host_serial(Object *obj, const char *value, Error **errp)
     spapr->host_serial = g_strdup(value);
 }
 
+static bool spapr_get_secure_boot(Object *obj, Error **errp)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
+
+    return spapr->secure_boot;
+}
+
+static void spapr_set_secure_boot(Object *obj, bool value, Error **errp)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
+
+    spapr->secure_boot = value;
+}
+
 static void spapr_instance_init(Object *obj)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
@@ -3353,6 +3384,17 @@ static void spapr_instance_init(Object *obj)
         spapr_get_host_serial, spapr_set_host_serial);
     object_property_set_description(obj, "host-serial",
         "Host serial number to advertise in guest device tree");
+
+    /* If we have secure boot, the default level is 2: enable and enforce */
+    spapr->secure_boot_level = 2;
+    object_property_add_bool(obj, "secure-boot",
+        spapr_get_secure_boot, spapr_set_secure_boot);
+    object_property_set_description(obj, "secure-boot",
+        "Advertise secure boot in the guest device tree");
+    object_property_add_uint8_ptr(obj, "secure-boot-level",
+        &spapr->secure_boot_level, OBJ_PROP_FLAG_READWRITE);
+    object_property_set_description(obj, "secure-boot-level",
+        "Level of secure boot advertised in the guest device tree");
 }
 
 static void spapr_machine_finalizefn(Object *obj)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index c421410e3fb8..d829d0c27011 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -210,6 +210,10 @@ struct SpaprMachineState {
     int fwnmi_machine_check_interlock;
     QemuCond fwnmi_machine_check_interlock_cond;
 
+    /* Secure Boot */
+    bool secure_boot;
+    uint8_t secure_boot_level;
+
     /*< public >*/
     char *kvm_type;
     char *host_model;
-- 
2.27.0


