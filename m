Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E39482414
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:58:30 +0100 (CET)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HUM-0003Pe-2H
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:58:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLZ-000703-ES
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLX-0000qf-Gw
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93VPh+l1pFg92Ehm7FnMqhc0uWxRDWcIdf0CzMkvjbk=;
 b=D0nCwUwD9PoQzUzF8DcC9V7RgW2Bzjllf04rRcVesoeS6CpvwftDDbuC5j4YkKz4v3kpb5
 QJXsh+Tl5BnlVKYAt4TQpGYiZBP7l5DSe5M2Gfd+8eNIAtc08anHVw0Fivs5vaW9oz9qOh
 n1NGeyreO2mtUevxjtj8xttUlMkyOVw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-P3b7HEe3MO-UVXKaiCq-wg-1; Fri, 31 Dec 2021 07:49:20 -0500
X-MC-Unique: P3b7HEe3MO-UVXKaiCq-wg-1
Received: by mail-wr1-f71.google.com with SMTP id
 o20-20020adfa114000000b001a2abc089d8so7479474wro.4
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=93VPh+l1pFg92Ehm7FnMqhc0uWxRDWcIdf0CzMkvjbk=;
 b=40REgsEl3lDLjnaZaBa5ugIdQkUich7SvvH3Tc9W0xyJbAGiCwl4v1+3gNninVxkHR
 WaZBEFNwoxLT54VaB9fpOq2glI/VU7fTJAfAEuVwv3QBRc33k2FN59GgQjKRSXf4CqAw
 xoEhtbXGAaz4dKtG7S1OyzRzKwRcJphB+ZJbgpcSDwskjvm5hvRbXer2+c0HnBoKys5u
 jbl9VMu6gWQy3vo/v3NRfifPgGs9eIaQ9iql30xj18zbkMGkqQmfQ64KS0G0A1/KEgvK
 HgROQcdvFkJYQQ8KzEO4j8ADJqp066qvmX2o/c6vgkVwt7viXeX16WIfaPrO+msHQfag
 0gLw==
X-Gm-Message-State: AOAM530tax3W/b89KbogYocCJC1ySPzYCivLerHe4lUY595xiHb9b8O1
 c8DsAUvWJOnvX+4ZuHbaGa6vtN4WXbvHZEkk9qE6I4ftb5G9n5BWEZ+Pm38fXz2fDOagBoYDUvf
 VuZDlOG6GVu1H0FfiNiO3FB4LLBnWABzWUTAkjwltWGzVWgngvnt3faZUo6aWJHv1
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr29302479wrw.313.1640954958312; 
 Fri, 31 Dec 2021 04:49:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7CYZVL3mgRAeJ2vF4LSDCeG8wD0+tbRSix0I/GbFEekILPoeksc7hgOZi3yej2AcoCxK6rg==
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr29302458wrw.313.1640954958019; 
 Fri, 31 Dec 2021 04:49:18 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id l26sm26399403wrz.44.2021.12.31.04.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:49:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] MAINTAINERS: Change philmd's email address
Date: Fri, 31 Dec 2021 13:47:53 +0100
Message-Id: <20211231124754.1005747-20-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The philmd@redhat.com email address will stop working on
2022-01-01, change it to my personal email address.

Update .mailmap in case anyone wants to send me an email
because of some past commit I authored.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211231000759.707519-1-philmd@redhat.com>
---
 .gitlab-ci.d/edk2/Dockerfile |  2 +-
 .mailmap                     |  1 +
 MAINTAINERS                  | 18 +++++++++---------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.d/edk2/Dockerfile b/.gitlab-ci.d/edk2/Dockerfile
index b4584d1cf64..13029310f6d 100644
--- a/.gitlab-ci.d/edk2/Dockerfile
+++ b/.gitlab-ci.d/edk2/Dockerfile
@@ -3,7 +3,7 @@
 #
 FROM ubuntu:16.04
 
-MAINTAINER Philippe Mathieu-Daudé <philmd@redhat.com>
+MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 
 # Install packages required to build EDK2
 RUN apt update \
diff --git a/.mailmap b/.mailmap
index c45d1c53014..5113f55b3a0 100644
--- a/.mailmap
+++ b/.mailmap
@@ -63,6 +63,7 @@ Paul Burton <paulburton@kernel.org> <paul.burton@mips.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
 Paul Burton <paulburton@kernel.org> <paul@archlinuxmips.org>
 Paul Burton <paulburton@kernel.org> <pburton@wavecomp.com>
+Philippe Mathieu-Daudé <f4bug@amsat.org> <philmd@redhat.com>
 Stefan Brankovic <stefan.brankovic@syrmia.com> <stefan.brankovic@rt-rk.com.com>
 Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 
diff --git a/MAINTAINERS b/MAINTAINERS
index fe5eea76f67..ae6c74f3ff5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1630,7 +1630,7 @@ F: pc-bios/bios-microvm.bin
 Machine core
 M: Eduardo Habkost <eduardo@habkost.net>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
 F: cpu.c
@@ -1811,7 +1811,7 @@ F: docs/virtio-net-failover.rst
 T: git https://github.com/jasowang/qemu.git net
 
 Parallel NOR Flash devices
-M: Philippe Mathieu-Daudé <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 T: git https://gitlab.com/philmd/qemu.git pflash-next
 S: Maintained
 F: hw/block/pflash_cfi*.c
@@ -2227,7 +2227,7 @@ F: hw/isa/piix4.c
 F: include/hw/southbridge/piix.h
 
 Firmware configuration (fw_cfg)
-M: Philippe Mathieu-Daudé <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: docs/specs/fw_cfg.txt
@@ -2525,7 +2525,7 @@ F: scripts/coccinelle/errp-guard.cocci
 
 GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 S: Maintained
 F: gdbstub*
 F: include/exec/gdbstub.h
@@ -2536,7 +2536,7 @@ Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Peter Xu <peterx@redhat.com>
 M: David Hildenbrand <david@redhat.com>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
@@ -3030,14 +3030,14 @@ F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
 
 Firmware schema specifications
-M: Philippe Mathieu-Daudé <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Daniel P. Berrange <berrange@redhat.com>
 R: Kashyap Chamarthy <kchamart@redhat.com>
 S: Maintained
 F: docs/interop/firmware.json
 
 EDK2 Firmware
-M: Philippe Mathieu-Daudé <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: hw/i386/*ovmf*
@@ -3275,7 +3275,7 @@ F: block/null.c
 NVMe Block Driver
 M: Stefan Hajnoczi <stefanha@redhat.com>
 R: Fam Zheng <fam@euphon.net>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/nvme*
@@ -3518,7 +3518,7 @@ F: tests/tcg/Makefile.include
 Integration Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
-- 
2.33.1


