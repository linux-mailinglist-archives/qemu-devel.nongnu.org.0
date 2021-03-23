Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D9B346538
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:31:56 +0100 (CET)
Received: from localhost ([::1]:55294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjwi-0001RI-19
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjJu-00054x-NU
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:51:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjJl-0003QF-9H
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:51:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e9so21284641wrw.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8TVtAnPRoKv1ZFmeJLpzKUIx1+VyTuxS/3GdmywQ+Cw=;
 b=IhhYR+BbNLsyups1003+HoBVeHOq93NcJqW3cfaXQ17ZEugbNMwVofr3Q1jGgWNRcK
 fyWM6jPz4PoKw6XeWnOKxAUXcMkAMYc6tCyDpTCm4JGs0i0ikWBG2RSQgPIvTgF925qF
 9FiL3pdETIhrxuhE5NQQhNz6hUMKu8CSJN6AcX8yn3cHD3B2of7fhlqIdusSksWZ4F3K
 YCFsvwcm3kHwYEreBUcW2KFNSXRD0LthJHb/jbdWw1g0+LhzSjAfUMEryM1Oq9D8SA94
 ZALs7tN5t+b0IM2ud9LGU7sAIJv0UEZb/y+cX47zTgwMA8+9qJm0W+thyoSc8/fPj9Dv
 bbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8TVtAnPRoKv1ZFmeJLpzKUIx1+VyTuxS/3GdmywQ+Cw=;
 b=UrECwK/NgU7iictJ6mlobYRImsrhns43cO0ChPum15d91stEqdCpFPFBiCUuCIa9L+
 iFxJXS0bO9AVenIJBGP9VrXEJY/WHhd4PsXV3B2/RAG2VJLtUG0R9bHJIWowLpPqomi+
 koatAQqSuBVYMT+gLjxRSOfkaGGGRlCcIjZXtHkYdLXC8VXsfEnSeMyRJnZneQgk7bFt
 3shcF9KLNouCJ3QSls7U2in1L6dY9ivDlP8xEk5PDtE/F4QDRoUffJHCHEY97ywsrP+G
 O4y6PSHg5OqcTOReNeucHbXI/ZuBFxrq8t5x6sSO2yMTRdaBmy3dRyL04tcan7woyGre
 HlXA==
X-Gm-Message-State: AOAM5324LNlkbznHuefzxTfCPHjtmg8teKHtW9PQGQ95JRzPZU/ijyHC
 Sv28cDn5KsrSkmGyZIyUsb3A4ZNMVdj7Qw==
X-Google-Smtp-Source: ABdhPJz+6k1eBK6DlIw/cKh3BgePk26p7+ytbSSXooSUyhhVc+wEM3p7OVp9NOHvTDgAzSTJrEmljg==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr4588010wry.232.1616514698814; 
 Tue, 23 Mar 2021 08:51:38 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d204sm3116514wmc.17.2021.03.23.08.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:51:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/13] blobs: Use Meson source_set to store blob files
Date: Tue, 23 Mar 2021 16:51:20 +0100
Message-Id: <20210323155132.238193-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we want to conditionally install blob files,
declare them using a source set.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 pc-bios/meson.build | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index f2b32598af7..1c4074bcb0d 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,3 +1,5 @@
+blobs_ss = ss.source_set()
+
 if install_edk2_blobs
   fds = [
     'edk2-aarch64-code.fd',
@@ -22,7 +24,7 @@
   endforeach
 endif
 
-blobs = files(
+blobs_ss.add(files(
   'bios.bin',
   'bios-256k.bin',
   'bios-microvm.bin',
@@ -81,10 +83,12 @@
   'opensbi-riscv32-generic-fw_dynamic.elf',
   'opensbi-riscv64-generic-fw_dynamic.elf',
   'npcm7xx_bootrom.bin',
-)
+))
+
+blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-  install_data(blobs, install_dir: qemu_datadir)
+  install_data(blobs_ss.sources(), install_dir: qemu_datadir)
 endif
 
 subdir('descriptors')
-- 
2.26.2


