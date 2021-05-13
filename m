Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51537FC0B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:01:25 +0200 (CEST)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEiC-0002Sd-Vo
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhENC-0002aB-I4
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN8-0000yu-Ql
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vt0rPlIVTA2zME2ANb52VRIm2f7ixfDlgEfuDufRLOU=;
 b=IexCJojMUMYhFmnQ6W79s6+fKCdMZekTAhkI0AjCacI9tzpUXpdEvqazCDTG69WeR9KPGg
 SvU9zWISxCQ73Zh7mXGHe9BhSn55xc9MOCNaPzYsfwbkgiDko2QjDI5zzt8G9oeKLf857b
 aKkH4+jENcYfTdg+DFX7OiWJWa8SFss=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-PKcSlLMnPjWv5nCSpzWcDg-1; Thu, 13 May 2021 12:39:36 -0400
X-MC-Unique: PKcSlLMnPjWv5nCSpzWcDg-1
Received: by mail-ej1-f72.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so1989730ejb.14
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vt0rPlIVTA2zME2ANb52VRIm2f7ixfDlgEfuDufRLOU=;
 b=EscYRwryutM9q9aIYKkOuN+DNK3ErbQEQQq/8VruQeW7FMTKiLfJwH5lP73LNmU7Oi
 dyZOQioD8RtUCPrvWIwcVDuKWeSqcgaohixi/+j3ALP1STQjq5Zou/fQfcglMNXbChbY
 yjy9xCDP5kGboeRoYzYYnsyxyIbdMqkNojv3JF9CaD2zMG9nLRXvQBaNzN3lrFxJGH7q
 7mWPWRAfhRs8SaUTYtAdgc7zcdMUElxFG62Z3HYt2dOSINfAZIATMh7SZTKvaLayo9C1
 1oHuPH7Og4BAqo11eIOKV4OTwaZ1NcmojG4jM23ZWl/vahhHhXCInh4azZ0Xw6R+Ff41
 Tkug==
X-Gm-Message-State: AOAM531Zx/JHmA8OFQ9wsMPUR/1F9tTHjCz3vgaZiaC1xZKKuEjU/192
 8MO6aTQjqqoRKV58GRrRbbPZ7CJdggLBQ/00msFf+AVpUuDPs6sKSHPoSUX7IVuH/6vEvNgBMoO
 off7LF+Ke+VjBkL/M/jy6oDCDBm0zW7BowZUVK5fU/uQa2+ungk7F3mdDplYeakWn
X-Received: by 2002:a17:906:9246:: with SMTP id
 c6mr45279436ejx.10.1620923974156; 
 Thu, 13 May 2021 09:39:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE1l7ofRjRJFGt9vB7ZIomsyEQvq5BC5uZr95cBlF78n+jfrvZh5DW7F56Oa6yX27iwzRPlQ==
X-Received: by 2002:a17:906:9246:: with SMTP id
 c6mr45279413ejx.10.1620923973899; 
 Thu, 13 May 2021 09:39:33 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r17sm2644904edt.33.2021.05.13.09.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines
Date: Thu, 13 May 2021 18:38:55 +0200
Message-Id: <20210513163858.3928976-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the Virt and Spike machines use NUMA. Add a RISCV_NUMA Kconfig
symbol and only have these machines select it. Adapt the Meson file
to only built it if required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/riscv/Kconfig     | 5 +++++
 hw/riscv/meson.build | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index b72a248809e..b22736169c1 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,3 +1,6 @@
+config RISCV_NUMA
+    bool
+
 config IBEX
     bool
 
@@ -35,6 +38,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
     select PCI
@@ -75,6 +79,7 @@ config SIFIVE_U
 
 config SPIKE
     bool
+    select RISCV_NUMA
     select HTIF
     select MSI_NONBROKEN
     select SIFIVE_CLINT
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index a97454661c0..ab6cae57eae 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -1,6 +1,6 @@
 riscv_ss = ss.source_set()
 riscv_ss.add(files('boot.c'), fdt)
-riscv_ss.add(files('numa.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
-- 
2.26.3


