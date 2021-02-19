Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C283831FE64
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:54:02 +0100 (CET)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9yb-0001IJ-S6
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kq-0002xD-GY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9km-0005b8-Ph
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0XNpw7EsZwRfqH5jj+d5q0K26B/2H8ocJXujjf2y0q0=;
 b=RDQEjTRLZTWO2mxBVuE+CjuwWYnePnPDhe8EbBtHCO5ciJX6yb2P6dMZLwdDp105DHn+43
 Wv5sAUTAyloJyAW4gJabhwg3ByiTlGol+azzEp4iDiIbEuA8TSWDwMwzJ4m3WXVtyG3h8Q
 DTITpNp4g3ky6p7qnB3q5/xLThu8hm0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-sh_GMLRLMjOS0ZtzegpcLw-1; Fri, 19 Feb 2021 12:39:38 -0500
X-MC-Unique: sh_GMLRLMjOS0ZtzegpcLw-1
Received: by mail-wm1-f71.google.com with SMTP id y18so2778485wma.8
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0XNpw7EsZwRfqH5jj+d5q0K26B/2H8ocJXujjf2y0q0=;
 b=c7YASDI4EpNeVRfnA1IKBODy7MDe/qVo19gE+XeW4A6GzqNOy52OcAZq/Qj/yIO6/B
 Oc1ZJDxCU372aYJ7V3d+L+FNc9U4tyaaFJ52Ee6AMsRHqoYRVCvfhkfcQ3dv5PaFbbrN
 +0SExT/+avvfHMW+PtCgjm0Zcj/sYqNnqq3H8XiVnbdnyLD9lHgyaAaBFBDDtgtWeWv6
 oZVAf+xcuKT6WLGmgRDEW1i6tFQi7KCsBQmgtMlbQHI2f5VHY11CkfFzI0vejUn7ROnM
 jZf+m061VOcTZcqy7O1dOPgDbN1x3t/Ng1E35KLHqDALd54ksGHp2HJ9Fl8ML7JLv/FR
 F0aQ==
X-Gm-Message-State: AOAM531z52c8O8+CL5sIlZFIjNW8kEQIJWSL6xEQPGuKI9yHB3OwT949
 xSTWy5YrRVMzPHY1UCTFkWJrrL1wdABm7XgySDYwD8LPsaIF+kfWirGA9qOXFWB9CfwmklTsLps
 Wd3Qw5vF27gWibRVkqhZKTZwXAeJkdVEy/oITaWh5f/W84x44K+8OYtupYfXLga3U
X-Received: by 2002:adf:fb91:: with SMTP id a17mr10124663wrr.93.1613756377041; 
 Fri, 19 Feb 2021 09:39:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUWYk16cfFnjfBZLMWl2Vy5aAjSJDcFd3Zrj54+kp+HHEcqph2ioitLZ00EdqyQhCQF2e9eA==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr10124607wrr.93.1613756376757; 
 Fri, 19 Feb 2021 09:39:36 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c133sm2365046wme.46.2021.02.19.09.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 08/11] hw/i386: Explicit x86 machines support all
 current accelerators
Date: Fri, 19 Feb 2021 18:38:44 +0100
Message-Id: <20210219173847.2054123-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

x86 machines currently support all accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC: not sure about this, x86 is not my cup of tea

 hw/i386/x86.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6329f90ef90..2dc10e7d386 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1209,6 +1209,10 @@ static void x86_machine_initfn(Object *obj)
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", "xen", "hax", "hvf", "whpx", NULL
+};
+
 static void x86_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1218,6 +1222,7 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = x86_cpu_index_to_props;
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
+    mc->valid_accelerators = valid_accels;
     x86mc->compat_apic_id_mode = false;
     x86mc->save_tsc_khz = true;
     nc->nmi_monitor_handler = x86_nmi;
-- 
2.26.2


