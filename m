Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C044218F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:17:26 +0100 (CET)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdkB-00074E-FG
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHj-00012X-Sw
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHh-0008Td-P7
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/4BMq7DrQu+zCZQqgn6KN2GFLHZ2AhJb11IE3m6BvI=;
 b=RLA4TKCGRVOWvmQNV9cpFlOWY+Uyn5YC2bcIZWbgMdqSufp5QN4tlza3JEt3Wus8TV7xAX
 JQfyEsFNsskLQAxeD899YFz8nLJ20sNJX7Ll55A5vPacGfEbjAPWlMrQ3UsBOInBKTCasl
 ZO3V4ow33tFZhO4r2vwivbFrFoZAkV8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-LXjm2bBJNR6Fs-P1XmLklA-1; Mon, 01 Nov 2021 14:43:52 -0400
X-MC-Unique: LXjm2bBJNR6Fs-P1XmLklA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso52507wms.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/4BMq7DrQu+zCZQqgn6KN2GFLHZ2AhJb11IE3m6BvI=;
 b=jZ5r29I1Yb+MLnwqa3Koe86Ss7fRCJGbum9tlBOMrfEPzAZOv8XAhy06aSlXS4GDGh
 ZzPU888Cbs4+azFZUhpwjBsYyShQJGFF5+hbOH7Fw/hrjObjsp7B3UJIA8y+oDrAMBgR
 YqcCE8zraELFLcySTq0WSevmnq44rr4lWRbmjRq9PkHkvsyw603ipvxtvrRD2WcimkJ5
 D6JcjLM6tI+ndxsL0Jua8Mk39BUmn1SEJOEu81VT7V1oZ2hpBVR33IStbXBjOTRszLil
 MIxOvIRbGzbcj9SlVgq2Ikz9fQl4Um20JZBlGJsP1iEADb42hEKmonCwjxnNCi4dXEsz
 atmg==
X-Gm-Message-State: AOAM530eweMb2MLMcZz/+BWnCRG/brhyOhSNJTRWQTM5tCglEZT2Zh7P
 We2JGerjrEAb0R5ukR1snM2MpJk2okLp/yrla/ZTwVDqOO/MO8AuMmp2MOB7GhweO9Cd9gWFPz7
 y0LHBy4TQ9M/PZ2cTiDwEf9hY29I1ZiF947NLb/nMSV9qs1JhUKAsAGdqRRHSBAGJ
X-Received: by 2002:a5d:58c5:: with SMTP id o5mr23112970wrf.15.1635792230553; 
 Mon, 01 Nov 2021 11:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjHqzi3yr+pZ4o8shqMaGSGS9W7EXt8i+7Ju1NmeqJx1eY6jDwQrELoqkN+WOkPtZnlFVHbA==
X-Received: by 2002:a5d:58c5:: with SMTP id o5mr23112931wrf.15.1635792230275; 
 Mon, 01 Nov 2021 11:43:50 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o2sm15128956wrg.1.2021.11.01.11.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] machine: remove the done notifier for dynamic sysbus
 device type check
Date: Mon,  1 Nov 2021 19:42:59 +0100
Message-Id: <20211101184259.2859090-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101184259.2859090-1-philmd@redhat.com>
References: <20211101184259.2859090-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Damien Hedde <damien.hedde@greensocs.com>

Now that we check sysbus device types during device creation, we
can remove the check in the machine init done notifier.
This was the only thing done by this notifier, so we remove the
whole sysbus_notifier structure of the MachineState.

Note: This notifier was checking all /peripheral and /peripheral-anon
sysbus devices. Now we only check those added by -device cli option or
device_add qmp command when handling the command/option. So if there
are some devices added in one of these containers manually (eg in
machine C code), these will not be checked anymore.
This use case does not seem to appear apart from
hw/xen/xen-legacy-backend.c (it uses qdev_set_id() and in this case,
not for a sysbus device, so it's ok).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211029142258.484907-4-damien.hedde@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h |  1 -
 hw/core/machine.c   | 27 ---------------------------
 2 files changed, 28 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 602993bd5ab..9c1c1901046 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -317,7 +317,6 @@ typedef struct CpuTopology {
 struct MachineState {
     /*< private >*/
     Object parent_obj;
-    Notifier sysbus_notifier;
 
     /*< public >*/
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 7c4004ac5a0..e24e3e27dbe 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -572,18 +572,6 @@ bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type)
     return allowed;
 }
 
-static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
-{
-    MachineState *machine = opaque;
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-
-    if (!device_is_dynamic_sysbus(mc, DEVICE(sbdev))) {
-        error_report("Option '-device %s' cannot be handled by this machine",
-                     object_class_get_name(object_get_class(OBJECT(sbdev))));
-        exit(1);
-    }
-}
-
 static char *machine_get_memdev(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -599,17 +587,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
     ms->ram_memdev_id = g_strdup(value);
 }
 
-static void machine_init_notify(Notifier *notifier, void *data)
-{
-    MachineState *machine = MACHINE(qdev_get_machine());
-
-    /*
-     * Loop through all dynamically created sysbus devices and check if they are
-     * all allowed.  If a device is not allowed, error out.
-     */
-    foreach_dynamic_sysbus_device(validate_sysbus_device, machine);
-}
-
 HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 {
     int i;
@@ -949,10 +926,6 @@ static void machine_initfn(Object *obj)
                                         "Table (HMAT)");
     }
 
-    /* Register notifier when init is done for sysbus sanity checks */
-    ms->sysbus_notifier.notify = machine_init_notify;
-    qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
-
     /* default to mc->default_cpus */
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
-- 
2.31.1


