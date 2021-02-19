Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D63731F89C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:49:50 +0100 (CET)
Received: from localhost ([::1]:47794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4I9-0008E1-JD
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DR-0002kO-PU
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:44:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DN-00020B-K9
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2sRdB0zIoimpAVT57VzO2FhLqlcfJwpEUsEldtsV6E=;
 b=IVI8idI2fOPiXQUalz6tx4ri9bh3BpVsrs5TkY5kOtoJsVlGKpdUXTt9vp5DXYuKB2jNTm
 GUXCw798T8kPYurSAh9ONiwDts6M6wsIReYmnq2AOz6z9AboKrwe0ThDzQ4BLlcsvXopGp
 JsPTQYEXLV0S4lHoVXy0cPkp2h26BH8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-9-1Pj5AOPseTfZ5voQvagQ-1; Fri, 19 Feb 2021 06:44:50 -0500
X-MC-Unique: 9-1Pj5AOPseTfZ5voQvagQ-1
Received: by mail-wr1-f69.google.com with SMTP id q5so2312900wrs.20
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H2sRdB0zIoimpAVT57VzO2FhLqlcfJwpEUsEldtsV6E=;
 b=kabDz/Lo8klTswhiM0VfVzlRPRSl7VOV3VwyEXeJd7GBO+IXzhD8eDABQPu8AVPNzs
 zCaSk1meDmJlOq3rt/7JjujQyxmCIDrivUxhFzYvAjNmDYvRNDPaVyHnWm+0Y+I+b7tI
 q0bRVqyAVeyXsx48cF016PUkejDJF3lfxLVbAegzuOlwG7ecBsiz2MY9l2uNkKMa+rxm
 A7hYISRY6u+dvoxoq4/ZWZ3GvUiBZvRAHed3lEVZXO8NIiqhIhPO9F9wXayTQUACf0+0
 bpB1g2AjnlyPSM9KmTiWsr8GO+da4xUrw3w69+ZtkA9fhdJ7IyMUPQKPUthGPnFgg3UK
 UXyg==
X-Gm-Message-State: AOAM530B6DSRN6uUVDKLdICPd6FEaYYqBNKT0UTRR5OJWcf7G02GXpco
 Okwex0llWWUU5eXRGRGIp2KV1PBXFzACQ6F9mMwHAwXsBMIYq+esWs+GBM84445U+Vz4Q+CgHPe
 3Ens+1kaFbzXVdliEn3aM+J3rxaFAZkCZfLFUhqZ/caqeuJ8SiQhxZPKhh8Fz6Kl8
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr7787144wmj.96.1613735089454; 
 Fri, 19 Feb 2021 03:44:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgm4hoiLeIRkPi+gaIG0uc4d/99GH2Q3rzeROPR607tJ3j/N9Qtv1NMuMxJComOxflJzzI2w==
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr7787095wmj.96.1613735089135; 
 Fri, 19 Feb 2021 03:44:49 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z63sm11490157wme.8.2021.02.19.03.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:44:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] hw/arm: Set kvm_supported for KVM-compatible machines
Date: Fri, 19 Feb 2021 12:44:24 +0100
Message-Id: <20210219114428.1936109-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
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
 Radoslaw Biernacki <rad@semihalf.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following ARM machines support KVM:
- virt
- sbsa-ref
- xlnx-versal-virt

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/sbsa-ref.c         | 1 +
 hw/arm/virt.c             | 1 +
 hw/arm/xlnx-versal-virt.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9f707351531..6923b6e77ff 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -858,6 +858,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
+    mc->kvm_supported = true;
 }
 
 static const TypeInfo sbsa_ref_info = {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae9..7e3748b6cd6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2582,6 +2582,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->kvm_supported = true;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8482cd61960..fb623c0cd54 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -621,6 +621,7 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
     mc->no_cdrom = true;
     mc->default_ram_id = "ddr";
+    mc->kvm_supported = true;
 }
 
 static const TypeInfo versal_virt_machine_init_typeinfo = {
-- 
2.26.2


