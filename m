Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DCD3CFE26
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:48:34 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ryz-00031H-ND
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtE-0000Fy-GW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtC-0005DZ-Pt
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTWqF5j01lrfXdYS+sckUTHsMubMM9qF0ZRvuOGu5Ko=;
 b=alZON10j2u1+zH3BYYIt9B0xi+N3/ehctbRUp9U9SSJg2mKBywSqf6IkBiXyNxVE4MZCWJ
 Vw1sofhkHYQcSGGYvRQIqeN9Jf6qQONr4/uQCGihhfVgN6n66qiTuvz29ap/BcPd+2Y963
 1vrcNUKqUUBoT3fatq/z5rrw0gBnQZw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-joXfhKzTPHO4SK3T933TgQ-1; Tue, 20 Jul 2021 11:42:33 -0400
X-MC-Unique: joXfhKzTPHO4SK3T933TgQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o21-20020a05600c4fd5b029023448cbd285so1389455wmq.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTWqF5j01lrfXdYS+sckUTHsMubMM9qF0ZRvuOGu5Ko=;
 b=emoV/L2FGNRBqWNRHOPyR5kCO/ysULwVEv5CYB9gs5qvmkpKtsJApihvL8MJE5CJqI
 +Dxx6CkzqkiWMFGMNWeneentKECCiXmad6O46RbkENV3IZnAOWmy00/zaDvq4aCY1Ttu
 +X9o+e0Mob1kQ7Popo2B59l7Eze9CJLUkCjNTdJRNF1GLyux7oDn0l5h7i0GY4BbB057
 Jumwber/osSwupeHT6GA7OT9Oo9kQt6tfNn7JiltIYg0Ou1Syh3bbGCCqCDhlPM3RfLv
 6ug0wBLbpeafleYKutSz1LL9i/lEhK6YYaie8+YetC9VmAkhOaRqOhckEnbgVfbzvj6e
 XNwg==
X-Gm-Message-State: AOAM531GAhfAX4y9D5nkMKplQE43+hryUbXDdZug1OHV1sNTayXZi6iR
 tSwZsEupr4orC7dN9Df7TNi4G5XtjIHYkXZIMb9luqmxtc+h/Llo1tkuRpxlvh1RW7Slm/WnvOz
 34w1D4S0VLe4kw5m22mDieTR0EBkSGCAkrP/mA1xtQVdYR7atMEKslYgtIOQMRgQu
X-Received: by 2002:a5d:464b:: with SMTP id j11mr37090927wrs.356.1626795750928; 
 Tue, 20 Jul 2021 08:42:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz190psKarMH+XfCol/svTKqPjB2NfoQv0LhjU1apj1SGhTxuLEAkSIhaCDeCUDV0n+XQde9w==
X-Received: by 2002:a5d:464b:: with SMTP id j11mr37090906wrs.356.1626795750728; 
 Tue, 20 Jul 2021 08:42:30 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 l14sm22911607wrs.22.2021.07.20.08.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/17] hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines
Date: Tue, 20 Jul 2021 17:41:35 +0200
Message-Id: <20210720154141.3919817-12-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the Virt and Spike machines use NUMA. Add a RISCV_NUMA Kconfig
symbol and only have these machines select it. Adapt the Meson file
to only built it if required.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210515173716.358295-8-philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig     | 5 +++++
 hw/riscv/meson.build | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 86957ec7b06..0590f443fdf 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,3 +1,6 @@
+config RISCV_NUMA
+    bool
+
 config IBEX
     bool
 
@@ -34,6 +37,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
     select PCI
@@ -74,6 +78,7 @@ config SIFIVE_U
 
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
2.31.1


