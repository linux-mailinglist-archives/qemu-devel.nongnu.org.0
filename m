Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3638A3CFDCC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:43:56 +0200 (CEST)
Received: from localhost ([::1]:47556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ruV-0001rs-8F
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsf-0007T2-Dv
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsd-0004lM-Hs
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZ02lmCvE+St1io4CllH1PZSe61X92+HP6d2rWeRb4I=;
 b=esSb3IwQGAY8/6op2DAi8V8dvaK2SG+0HgJsoJEy1vrSSk9Hua/YEWLZ4nC0pqxeUgXfRO
 gmF/VP82a1lS1tFtr9TEr6TVUpSjXYqkSYQ62ueVvv/FJosDmP7pI+m7k3lwqpBmyKMJuJ
 x5up3p0t1LN8wOyGy7Kqr95wxy2Y580=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-l8UhshjNP_GlIiEtMnnR8w-1; Tue, 20 Jul 2021 11:41:57 -0400
X-MC-Unique: l8UhshjNP_GlIiEtMnnR8w-1
Received: by mail-wm1-f70.google.com with SMTP id
 g13-20020a05600c4ecdb0290242a8f4cf9cso1384972wmq.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZ02lmCvE+St1io4CllH1PZSe61X92+HP6d2rWeRb4I=;
 b=oOa/3jzcSR41rMTXFl5/sVLWHFBKkLk2Ad5lqgvpdNUt8hlnQnXFuTb5eqRLJ3y4DB
 kP+Wc/H6FxMJevZpupAHV0oWO2Q0Wh9bTlOywSFyFu1xdbnloXaUDwZWSJOSichIKD0o
 rOrfMQbPEMZYDVx/TlZiC5jr8JOSNuWWoXFfr/fgfyaK4i3RCgnMVNxFxxty0teTA/MO
 s15Er6e3JSdbOoDSR+NTRUP89wNPOF75/DuF81ZVtpSxK/vBQ3yS3Pa0aeM0B44eLH5L
 yFoIOB/2zRiG5DjEcDddB7ENBERcXgi99joC755LrWMSDXNQFUGY9+Suru88Of3keoQQ
 aTeA==
X-Gm-Message-State: AOAM5318XepxjQWD7319+qz3i/YHPZgEapd6OaYL+8yuQ/n3hey7nF1O
 EECgEJXYQOWTS4129ZdVd+QfuU1oKZh3ZxEtzFe+uWSltWcYPTI0YefymS+uGD2pUESdDyLBcAC
 kMR68aAMgyre8tD2VnsQ5idsO4GBI2HMzKs1pTuA2kHvw7WBVzTZEybJ1L+J97fo8
X-Received: by 2002:adf:f411:: with SMTP id g17mr5289362wro.160.1626795716228; 
 Tue, 20 Jul 2021 08:41:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf0zJRy+VHWBcPCzu6hEgBR5k3+Y/Z79m3rH4pGqcs7vadum1UASt61vYDBNNSgEct+MVYkw==
X-Received: by 2002:adf:f411:: with SMTP id g17mr5289346wro.160.1626795716061; 
 Tue, 20 Jul 2021 08:41:56 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 s13sm23885232wrm.13.2021.07.20.08.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:41:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/17] hw/acpi: Do not restrict ACPI core routines to x86
 architecture
Date: Tue, 20 Jul 2021 17:41:27 +0200
Message-Id: <20210720154141.3919817-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ACPI core routines (in core.c) are not really x86-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20210616204328.2611406-21-philmd@redhat.com>
---
 hw/acpi/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 9b7fa75719c..29f804d13ea 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -3,6 +3,7 @@
   'acpi_interface.c',
   'aml-build.c',
   'bios-linker-loader.c',
+  'core.c',
   'utils.c',
 ))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
@@ -14,7 +15,7 @@
 acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('core.c', 'piix4.c', 'pcihp.c'), if_false: files('acpi-stub.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
-- 
2.31.1


