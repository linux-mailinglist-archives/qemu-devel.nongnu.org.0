Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F832F693E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:20:12 +0100 (CET)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07EA-0005Uq-NP
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071K-00024j-J7; Thu, 14 Jan 2021 13:06:54 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:37274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071I-000530-ID; Thu, 14 Jan 2021 13:06:54 -0500
Received: by mail-qt1-x829.google.com with SMTP id v3so1889831qtw.4;
 Thu, 14 Jan 2021 10:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VDLy9yZJvgziL6d8soe8VMasuJQ37LuaHX+qxMTvNSA=;
 b=MjAmb0OtUZjHDBgW5I8B0s9hNv7J47D5pj/llHIMMMwr0edJVLo7dzlF5YJPWmJXui
 AKsPIRegGzI1qUxP7oqK3x37UfPaRlLlc0jNPXXKGtCl8pwu49jcvJNsltj8PIAvwwN2
 EWBvcMxTbAF4NKFmnDAPQMTliHZBGJRMoqlLFyms3SBQvZRGIZLuPhtcQh2dt74dfC/6
 ivjjtO7SVmXgl64+XIhOPRG5E8ReL7olqtb7sd7qIw7nM2q5izQOm8D8Cl3XGmVI/gmD
 czlPBLWiMCDNvhixir7CPHVP6VwJL9J/AFgvC2em59WfI0sP5spsRlDlCkOl7VqvBFhX
 kfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VDLy9yZJvgziL6d8soe8VMasuJQ37LuaHX+qxMTvNSA=;
 b=hQ0fMFvB6XGOny8G9bKUTHqb1clC7OXmtGL8RnPB4rKi38Rn8c6SZglUONGIU6fAOz
 9nppMFEisXG8vAXpJrcthW1F58VWJbLJCYnxGDcGlSaxzrWu+PCdwNxpT/JGGaOThC4M
 GpHva1h1duWUAeg2R9AL/yFvX4oAnxmy1HLcfq9DHe/ch08IvGKfi4HvF/hgW2OMM1/F
 bYsDAEnoSo72rG/zzgXvx++lL3qs1YquHti9C3/wY/7Yvtwk2w1Y1K4FvQmlXVNRKc2w
 KozOcDfE63TxbW5i0tU5GqfUmjC9uQttJ6h7cERyFwFsjKkm56SDKfrEG+HOC+q0jVEB
 2MPA==
X-Gm-Message-State: AOAM5312KJeV4aR3igq4LEAcEikjB1PTriXfNUfPFc5BvxKo9++kxqlb
 A2Eg2dBTS+Q1zbd4WDWDHDravneLBaNYGw==
X-Google-Smtp-Source: ABdhPJzPCdVD2+X8kO6RzrsOuXXD/nGpG9vLstpSq0pLW196GwrNb/R6Rf5AO87HfAAVp/vzE76aHw==
X-Received: by 2002:ac8:6987:: with SMTP id o7mr7960371qtq.295.1610647611120; 
 Thu, 14 Jan 2021 10:06:51 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:b984:ff01:270:b51c:24a5])
 by smtp.gmail.com with ESMTPSA id a1sm3448129qkn.104.2021.01.14.10.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:06:50 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 7/7] spapr.c: consider CPU core online state before
 allowing unplug
Date: Thu, 14 Jan 2021 15:06:28 -0300
Message-Id: <20210114180628.1675603-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114180628.1675603-1-danielhb413@gmail.com>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Xujun Ma <xuma@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only restriction we have when unplugging CPUs is to forbid unplug of
the boot cpu core. spapr_core_unplug_possible() does not contemplate the
possibility of some cores being offlined by the guest, meaning that we're
rolling the dice regarding on whether we're unplugging the last online
CPU core the guest has.

If we hit the jackpot, we're going to detach the core DRC and pulse the
hotplug IRQ, but the guest OS will refuse to release the CPU. Our
spapr_core_unplug() DRC release callback will never be called and the CPU
core object will keep existing in QEMU. No error message will be sent
to the user, but the CPU core wasn't unplugged from the guest.

If the guest OS onlines the CPU core again we won't be able to hotunplug it
either. 'dmesg' inside the guest will report a failed attempt to offline an
unknown CPU:

[  923.003994] pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc: -16

This is the result of stopping the DRC state transition in the middle in the
first failed attempt.

We can avoid this, and potentially other bad things from happening, if we
avoid to attempt the unplug altogether in this scenario. Let's check for
the online/offline state of the CPU cores in the guest before allowing
the hotunplug, and forbid removing a CPU core if it's the last one online
in the guest.

Reported-by: Xujun Ma <xuma@redhat.com>
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1911414
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a2f01c21aa..d269dcd102 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3709,9 +3709,16 @@ static void spapr_core_unplug(HotplugHandler *hotplug_dev, DeviceState *dev)
 static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, CPUCore *cc,
                                       Error **errp)
 {
+    CPUArchId *core_slot;
+    SpaprCpuCore *core;
+    PowerPCCPU *cpu;
+    CPUState *cs;
+    bool last_cpu_online = true;
     int index;
 
-    if (!spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &index)) {
+    core_slot = spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id,
+                                    &index);
+    if (!core_slot) {
         error_setg(errp, "Unable to find CPU core with core-id: %d",
                    cc->core_id);
         return -1;
@@ -3722,6 +3729,36 @@ static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, CPUCore *cc,
         return -1;
     }
 
+    /* Allow for any non-boot CPU core to be unplugged if already offline */
+    core = SPAPR_CPU_CORE(core_slot->cpu);
+    cs = CPU(core->threads[0]);
+    if (cs->halted) {
+        return 0;
+    }
+
+    /*
+     * Do not allow core unplug if it's the last core online.
+     */
+    cpu = POWERPC_CPU(cs);
+    CPU_FOREACH(cs) {
+        PowerPCCPU *c = POWERPC_CPU(cs);
+
+        if (c == cpu) {
+            continue;
+        }
+
+        if (!cs->halted) {
+            last_cpu_online = false;
+            break;
+        }
+    }
+
+    if (last_cpu_online) {
+        error_setg(errp, "Unable to unplug CPU core with core-id %d: it is "
+                   "the only CPU core online in the guest", cc->core_id);
+        return -1;
+    }
+
     return 0;
 }
 
-- 
2.26.2


