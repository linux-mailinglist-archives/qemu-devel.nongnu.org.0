Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48AA31F8A5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:51:44 +0100 (CET)
Received: from localhost ([::1]:56112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4Jz-0003EH-Rt
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DY-0002qb-7g
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:45:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DT-00022N-EJ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0vt/SIQERosIkjtlGwMC0PxcViyxR2oXSsZjlPDjv1Q=;
 b=GGDmoaS9jdLKVppjy3ZKiJqKVoTGa3BMQYPgvR4WUxgT0zhp/2bjwOPmyIdkVComj0cWYk
 Ew05+C0ezgQwifztGT6ImAVeGF6xP2DO3FXu4xLC4XPQ+prY1JA9SLqmDTTwxlM+UdWi2E
 5UBkk2GzfXL5QRFuIhg77S6dTklFZy8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-K7t6KRdgNTmSnSEtLVwFAw-1; Fri, 19 Feb 2021 06:44:56 -0500
X-MC-Unique: K7t6KRdgNTmSnSEtLVwFAw-1
Received: by mail-wr1-f72.google.com with SMTP id e11so2283073wro.19
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0vt/SIQERosIkjtlGwMC0PxcViyxR2oXSsZjlPDjv1Q=;
 b=T1geoeySvqBUivFSF05aBfZ1NhXX9XVicd2NuJmW8Liw0olQS3ZAg7DEhUVovEeBKS
 fMuaPrjtWZtXvmQ85HGuPy+lc7y7LauJK8SKudurvmWHFQPWdMlFVEv3ZJ5i8Z6YmQHU
 XfJw4KSQ6UXd4YnaQuwuwpAraYXho8m5B6YJBs1mA15vQmq4tCdvBnGfqte8GHDpI9ge
 3zQspFFCvwwppT637DIyXMDbQ977Ealab4hNm362ziNcgKCtC+m6VA/GBCa8t/rTTsPb
 PJBK8BX4U5Do0cVp5Ga94ac5nSnl6s8I1X4KBX5drWeBiHJD5R7AUNoyFm3MiLgt+Jmk
 6v4g==
X-Gm-Message-State: AOAM5303znAFCRQGiHCGeCbAvvAeZl16++BykovyWsWqjNSoipZHhMxz
 VoR+p0CRkbTZJrHmXNsb8LZfC43N/Giq/1ujcnr10nHBub1b0QkPzkO2Y/7QB8bx+4ZQpPWPPL+
 YpR/sI0jDfl+PdP4STUkvDaciEW2x4iZbsbsLtWgCd2kBf46vFTYrlDj18WO2hoBZ
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr7567130wmo.183.1613735095220; 
 Fri, 19 Feb 2021 03:44:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKgapT4Wk26+iPVTffeQai1yYGvwGLxBWsJgyU3zvvSdjwgGSG7pAUOZ3XrSXF4+i1f3+P6A==
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr7567079wmo.183.1613735095017; 
 Fri, 19 Feb 2021 03:44:55 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y62sm13962465wmy.9.2021.02.19.03.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:44:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] hw/mips: Set kvm_supported for KVM-compatible machines
Date: Fri, 19 Feb 2021 12:44:25 +0100
Message-Id: <20210219114428.1936109-5-philmd@redhat.com>
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

The following MIPS machines support KVM:
- malta
- loongson3-virt

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/mips/loongson3_virt.c | 1 +
 hw/mips/malta.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index d4a82fa5367..c5ef44819a7 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -622,6 +622,7 @@ static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = LOONGSON_MAX_VCPUS;
     mc->default_ram_id = "loongson3.highram";
     mc->default_ram_size = 1600 * MiB;
+    mc->kvm_supported = true;
     mc->kvm_type = mips_kvm_type;
     mc->minimum_page_bits = 14;
 }
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427bf..f06bd3eff25 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1456,6 +1456,7 @@ static void mips_malta_machine_init(MachineClass *mc)
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
 #endif
     mc->default_ram_id = "mips_malta.ram";
+    mc->kvm_supported = true;
 }
 
 DEFINE_MACHINE("malta", mips_malta_machine_init)
-- 
2.26.2


