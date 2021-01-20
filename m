Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635E2FDCDE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 00:25:13 +0100 (CET)
Received: from localhost ([::1]:59206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Mqe-0002KW-4l
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 18:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2Mot-0000Sa-Ai; Wed, 20 Jan 2021 18:23:23 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2Mor-0005lq-L8; Wed, 20 Jan 2021 18:23:23 -0500
Received: by mail-qk1-x733.google.com with SMTP id c7so41694qke.1;
 Wed, 20 Jan 2021 15:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7k81pRYm8dCii8PpC3Wn/CKvV0/bga39X496uiCIQc=;
 b=tbxmaY/lay2egugIfIGSjZ76gMA93N7MyJhucdPGamuvtSS9xAJ30TYrj0zg2erYos
 pvt7mXGc+uekdC2hhSo4/YFIIYuhoL1a5ElvTao6zrMNcD/JmEf4KHJ+c03kqTaSkjy8
 OtDVZY9MrbfLktIZe0Cw3YfQIzhOhLmM1ZhbCLt+5pDoIBJ+BRSvLorC4Hkp/0FbTM+d
 /dRGj7hLPOyu7jGDnlTByBDXyVLBJRsQJ1HWrrkWEVyDZZpQD7/Sz0NZG+QnWh6hASH+
 XCmgg9WGhhI8LQQjVo+pC5uHr1WE8aCf/Mhn4IFsQyCaCLYWzdeJOiecGSuCzr5+Rs+M
 OT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7k81pRYm8dCii8PpC3Wn/CKvV0/bga39X496uiCIQc=;
 b=ONnV4d8VFDUW2QS+LHXAtjDCVIHAM4zF1U8wjoZe/WdJ618gFapqXZ2w9AkLOY/itd
 L6zHIyUUFnBGs0iKezb8oTsgl++Z9MjLPmChMmjzc1HywpMsZhfytwOmOUtakokZNKsi
 KnlOosW14Uk0jv5SMtfzfPxOVvnncMOgtvy9cSRfJB2f7LT4BBXwlBzJrocRIpA/bR1D
 VJU77PodQ+7zFwhUysF3qVKp9ccpUq8LoO8MScFmxYpeTYdY3obMjCR4SlIhfKnAshM0
 rnkf8SvIQPuO3BKR5QPp/UomP6/lqW0WIteRS6a1uX46GJ/DS0Qf98peLAmmRSFNt/rk
 3u+g==
X-Gm-Message-State: AOAM532QC9qv3DjjpZ+3zrz6nI/QVITXP9fK/tYiPpeOkTI8FcB7qu6N
 eIHHT0rxdBJYpiOgns0AwCT4CKlWvtM=
X-Google-Smtp-Source: ABdhPJx73d21WB6uWcQWMaX2S3KJo4ta3+h1kdYcJnrGObCw+FhAm6WedPKY/LPejlV77lVkk9uC8A==
X-Received: by 2002:a37:a312:: with SMTP id m18mr12055964qke.268.1611184999959; 
 Wed, 20 Jan 2021 15:23:19 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id b6sm2452548qkc.128.2021.01.20.15.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 15:23:19 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] spapr.c: add 'name' property for hotplugged CPUs nodes
Date: Wed, 20 Jan 2021 20:23:05 -0300
Message-Id: <20210120232305.241521-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120232305.241521-1-danielhb413@gmail.com>
References: <20210120232305.241521-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the CPU hotunplug bug [1] the guest kernel throws a scary
message in dmesg:

pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc: -16

The reason isn't related to the bug though. This happens because the
kernel file arch/powerpc/platform/pseries/hotplug-cpu.c, function
dlpar_cpu_remove(), is not finding the device_node.name of the offending
CPU.

We're not populating the 'name' property for hotplugged CPUs. Since the
kernel relies on device_node.name for identifying CPU nodes, and the
CPUs that are coldplugged has the 'name' property filled by SLOF, this
is creating an unneeded inconsistency between hotplug and coldplug CPUs
in the kernel.

Let's fill the 'name' property for hotplugged CPUs as well. This will
make the guest dmesg throws a less intimidating message when we try to
unplug the last online CPU:

pseries-hotplug-cpu: Failed to offline CPU PowerPC,POWER9@1, rc: -16

[1] https://bugzilla.redhat.com/1911414

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cc1b709615..6ab27ea269 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3750,6 +3750,19 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
 
     spapr_dt_cpu(cs, fdt, offset, spapr);
 
+    /*
+     * spapr_dt_cpu() does not fill the 'name' property in the
+     * CPU node. The function is called during boot process, before
+     * and after CAS, and overwriting the 'name' property written
+     * by SLOF is not allowed.
+     *
+     * Write it manually after spapr_dt_cpu(). This makes the hotplug
+     * CPUs more compatible with the coldplugged ones, which have
+     * the 'name' property. Linux Kernel also relies on this
+     * property to identify CPU nodes.
+     */
+    _FDT((fdt_setprop_string(fdt, offset, "name", nodename)));
+
     *fdt_start_offset = offset;
     return 0;
 }
-- 
2.26.2


