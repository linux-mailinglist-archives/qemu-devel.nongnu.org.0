Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B19483E8B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:57:45 +0100 (CET)
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fdY-00025y-P8
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:57:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fab-0007ac-E7; Tue, 04 Jan 2022 03:54:42 -0500
Received: from [2a00:1450:4864:20::42c] (port=37707
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4faa-0007nm-1C; Tue, 04 Jan 2022 03:54:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t26so74655743wrb.4;
 Tue, 04 Jan 2022 00:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TVx+fgekrB7KNu8OcNMrn1VBpuxsrGQHX6JNVgK7TBo=;
 b=eRxS1U3XBNsoIN9qRZGcptUOPEQ4vqADvezCtG2/pwxRt1gfigWYW6NYR7Fu3qIaPO
 hNGAgreYRIhYCkIC0GRDOyaqnw4XH6iydSVMe07jpZSHChN7U5p0RZkXolTlHbBTkFSf
 3UhOV4z+7UDYpMZDgb+neu9GNRrtWwtrG/6Foqj7v77Pb+9Ug3UjkK16SWUyiLC5eW9l
 J7GovTuU8KrTwnUKWKoMnykcU9HZB6XOE6HQKi/OkAbEm/leU8e3q4bLRMR5y2+851ta
 EjYHqebAYeT2+gJ5sSTIRB0Q34/2Ub4oicFFUuoq39vBF17M3lAa8QiRa7YfcUZS94sr
 PtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TVx+fgekrB7KNu8OcNMrn1VBpuxsrGQHX6JNVgK7TBo=;
 b=QYqLNWjI79PwzU/yZMcOHys7AiJjblk1gF3MDpSV8esKH1dBIsYLWxDEfKtF0TYBjN
 9IQ3Ie+hreB5y+mqjCccS8Jp+U5iXxLesfgBvfxKglxvKPQ7ugkxbN75GRBRsQb8+KEq
 zeX1Gtubmz1PiXGXhg7IXp/vCyKi9OmPKBFaHBoyzIzuz5HbLZDaxMoScQ5P+8TEB4tm
 ZX3Cio2nwVyF2KsrfxUqX/pt93A+CktUm3h9FzoYsgEyA2SWcruCN3mZmOHUZwT4morc
 GkKFgWGt7yv/AATDHgbOXUw5OCr2+55ewF99stoTMwPbdR//0uaj/rbQcGJxNA2zYkEK
 h/zA==
X-Gm-Message-State: AOAM531YxIcYb+731/Q0Dz55WVOPpMNWSEPIb0pO/l5gasWTMn2mH7+X
 FaK+bBrv0RzxSwS1bvZAEfs6vkx2WxKjtg==
X-Google-Smtp-Source: ABdhPJzXqs9RbpdjtbPmBl/iPhxLtwjSqWUU4iHF+OOTXRuEuNs94Si1K8l8hdn5hsZHhFC6RqWIVA==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
 i3mr41409063wrx.426.1641286478376; 
 Tue, 04 Jan 2022 00:54:38 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id w25sm38652614wmk.20.2022.01.04.00.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 00:54:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] hw/nvram: Restrict stub to sysemu and tools
Date: Tue,  4 Jan 2022 09:54:23 +0100
Message-Id: <20220104085431.2122999-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104085431.2122999-1-f4bug@amsat.org>
References: <20220104085431.2122999-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

User-mode emulation doesn't need the fw_cfg stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nvram/meson.build | 6 ++++--
 stubs/meson.build    | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index 202a5466e63..f5ee9f6b88c 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -1,5 +1,7 @@
-# QOM interfaces must be available anytime QOM is used.
-qom_ss.add(files('fw_cfg-interface.c'))
+if have_system or have_tools
+  # QOM interfaces must be available anytime QOM is used.
+  qom_ss.add(files('fw_cfg-interface.c'))
+endif
 
 softmmu_ss.add(files('fw_cfg.c'))
 softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
diff --git a/stubs/meson.build b/stubs/meson.build
index 71469c1d50a..363f6fa785d 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -11,7 +11,6 @@
 stub_ss.add(files('dump.c'))
 stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
-stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
 if linux_io_uring.found()
@@ -51,6 +50,7 @@
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
+  stub_ss.add(files('fw_cfg.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-- 
2.33.1


