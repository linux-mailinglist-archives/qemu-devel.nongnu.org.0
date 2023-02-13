Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DA3694E1A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfh-00087E-VX; Mon, 13 Feb 2023 12:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfZ-00084e-H6
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:14 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfW-0005Pe-Cv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:13 -0500
Received: by mail-ej1-x635.google.com with SMTP id k16so2176189ejv.10
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0842IyvHR5+exwrxY6bfCMS76td+5avfT/jT1Uqcfw=;
 b=EjUQhK6rUF+tSFEdAAMElpipDQV9bIloTPGroMEtEkjlp4GhMin/m+14Q+ygRHMJoD
 xcJSp6Oe74UVoSZ+LOP5zLiVELy961y64/5moPgufoaQXw8P65J8CVuzHxqeYswtK48Q
 v6gu5qIm9yiOjFYlChA9Ba8UenrkxOGX4pJeizMp03HKSDdElzbZ9TqZ1SP1l7Wb0ADg
 4vrx/vQ3hhcaA5XGR7JtvUHek5nSiWLYBOIRIlGb+lSysyJNPgzmtGRICqfKMVm/V+Ne
 WI2HLcV6xDbuo9kZJkrco2ky9zZAHpvc9oj7ZhT0E4eGCUggjwVQHoECHkriSNQuYyoL
 1R7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0842IyvHR5+exwrxY6bfCMS76td+5avfT/jT1Uqcfw=;
 b=vpWMP1yxz28rGe3U9TiB/zhwtznQFhWNKdC+VjVtRxvtZI2GXZUdMSubDCj/34WuDG
 kWd37J+RSlmywqID399DHqqrxBtkI9sC5CSv/3ugQzMyS2ZnLybJuHUGf1MBlRS5ugl/
 tEi1XJHlf61UBqNlA8LkxVPVQXur3I5TRtUcyhT78EcpOTudZFJEMJlf578BHtj8Iku8
 y13uMRWR3b5qd2+co1GnsyDjYPD1TNHO3Ue7CleNeF9PKkjZUFeHy5nc4D7K8XBzu9Cg
 HiDsCyNtnQycM9GCVSEP5wY6OYxLcl6WXO1FFcganIXEmhZjicqCtaYJgVNaeQGUBiwm
 tHVA==
X-Gm-Message-State: AO0yUKUCBpgLWK3F1sisdLoSmKa19daR9cDkxJCxKoTEg/DsMSE7WEyP
 oxkJObHJ4Zh1XbyL1pnIQWrKLnOxv8M=
X-Google-Smtp-Source: AK7set/IJJEaYre7sLBZeEvFFtyhLCBOvha63vEVcvK0JKaWAA29K4uamsLkN9j7aTpo5pFwqnb0AA==
X-Received: by 2002:a17:907:6e8f:b0:88a:d760:19ac with SMTP id
 sh15-20020a1709076e8f00b0088ad76019acmr34659999ejc.1.1676309466572; 
 Mon, 13 Feb 2023 09:31:06 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 06/12] hw/i386/pc_q35: Allow for setting properties before
 realizing TYPE_ICH9_LPC_DEVICE
Date: Mon, 13 Feb 2023 18:30:27 +0100
Message-Id: <20230213173033.98762-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This is a preparation to make the next patch cleaner.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_q35.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 85ba8ed951..dbd2160d4e 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -236,9 +236,9 @@ static void pc_q35_init(MachineState *machine)
     phb = PCI_HOST_BRIDGE(q35_host);
     host_bus = phb->bus;
     /* create ISA bus */
-    lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
-                                          ICH9_LPC_FUNC), true,
-                                          TYPE_ICH9_LPC_DEVICE);
+    lpc = pci_new_multifunction(PCI_DEVFN(ICH9_LPC_DEV, ICH9_LPC_FUNC), true,
+                                TYPE_ICH9_LPC_DEVICE);
+    pci_realize_and_unref(lpc, host_bus, &error_fatal);
 
     object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
                              TYPE_HOTPLUG_HANDLER,
-- 
2.39.1


