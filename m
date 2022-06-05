Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2253DC8C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 17:22:27 +0200 (CEST)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxs5B-0000bv-Ne
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 11:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nxs2F-0007uo-Vm; Sun, 05 Jun 2022 11:19:24 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nxs2E-0001HB-Ey; Sun, 05 Jun 2022 11:19:23 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x62so15766106ede.10;
 Sun, 05 Jun 2022 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NYSiknA7dppfMTXs8EU/RKTT7XzgL7wmzt2hdrpwxV8=;
 b=BXwoPJnnp5JelODgJEDYw5qG4JUoLZkgt0utsnT+dKP53Si+sZVGAqxTJ3I5coHSBH
 6S/c9sRJpuRMCUXwk8TgtiW+xrQpsQtXyCBTjo0f5D1sGIHIf8BjCq794DAy8X8fe0v6
 0yZBPPBFJZoR0YMF1opS9ryD8udjeZCElw1EREm+yJVhhKVkn2blDETB3JFegPZi4v6X
 Fx7NAzBHXk+tqpPyKnJQPQyxzszyPmx17OPFbjh5Dqfdpfv0xdLRX2Y/ORLoMPnq9Js1
 73Dht7Zm9hlqg7Z1kVqpSmp9snpqju9KmQW07csBS3s5Rxkuhcb4nme9yCPT8IzwB1Mg
 Lmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NYSiknA7dppfMTXs8EU/RKTT7XzgL7wmzt2hdrpwxV8=;
 b=ziwyH+EZvbvQBejK+t/XbTlEOPz7QFH32mDP453U9PI9ShXfxhZBIwdSOCNiF7ZDC1
 FMkS6OAWozj+3EeA2WtJldeuFuLqwThzOHFS5wM0yZy1qSYXAFOkPj/+69L7HPn4yh1e
 Ea5h2avpgb1K7d1cV4vv5EfcCSTLfZlK1m5VYnU5I+Fx5zeWGxza9lZWAmJ99I9V2Yza
 R8DOyN4M6sFRSjl/O0lWBEUXBk5DO2npdlmY4LfeVW0yQCfEhb/rhOyaq/JmPWQ1iLdh
 gib7bgsKgU7tCBj29kz10ErzlzGN1Kzstg1sOEcKwyksmj0E0zumydBerbF7tH0t3vxr
 coXQ==
X-Gm-Message-State: AOAM532Lq2434QN2kJs6hBVGyf5vrgqteaA+M2W9V/sQyMy1kB1V5qOR
 h1Ej3B/UdWnvj16720JOxybjGhB1D73jJQ==
X-Google-Smtp-Source: ABdhPJwDzCy6N2ZAVQ//4JJAFISOvZUTu7dxmcFuzAYNO28A+mFmjpPHujQgujejNZTbdhB5D9/Uog==
X-Received: by 2002:a05:6402:43c5:b0:42d:e4f6:d63e with SMTP id
 p5-20020a05640243c500b0042de4f6d63emr21780063edc.303.1654442359678; 
 Sun, 05 Jun 2022 08:19:19 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 q24-20020aa7d458000000b0042aad9edc9bsm7090493edr.71.2022.06.05.08.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 08:19:19 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] hw/mips/boston: Initialize g_autofree pointers
Date: Sun,  5 Jun 2022 17:19:08 +0200
Message-Id: <20220605151908.30566-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes compilation due to false positives with -Werror:

  In file included from /usr/include/glib-2.0/glib.h:114,
                   from qemu/src/include/glib-compat.h:32,
                   from qemu/src/include/qemu/osdep.h:144,
                   from ../src/hw/mips/boston.c:20:
  In function ‘g_autoptr_cleanup_generic_gfree’,
      inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:52:
  /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_load_data’ may be used uninitialized [-Werror=maybe-uninitialized]
     28 |   g_free (*pp);
        |   ^~~~~~~~~~~~
  ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
  ../src/hw/mips/boston.c:790:52: note: ‘dtb_load_data’ was declared here
    790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
        |                                                    ^~~~~~~~~~~~~
  In function ‘g_autoptr_cleanup_generic_gfree’,
    inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:36:
  /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_file_data’ may be used uninitialized [-Werror=maybe-uninitialized]
     28 |   g_free (*pp);
        |   ^~~~~~~~~~~~
  ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
  ../src/hw/mips/boston.c:790:36: note: ‘dtb_file_data’ was declared here
    790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
        |                                    ^~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/mips/boston.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 59ca08b93a..1debca18ec 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -787,7 +787,8 @@ static void boston_mach_init(MachineState *machine)
 
         if (kernel_size > 0) {
             int dt_size;
-            g_autofree const void *dtb_file_data, *dtb_load_data;
+            g_autofree const void *dtb_file_data = NULL;
+            g_autofree const void *dtb_load_data = NULL;
             hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
             hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
 
-- 
2.36.1


