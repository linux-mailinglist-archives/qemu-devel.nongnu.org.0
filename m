Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2A3347BE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:17:33 +0100 (CET)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4Kp-00014Q-UX
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK4GZ-0008M2-6P
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:13:07 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK4GX-0006iA-MG
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:13:06 -0500
Received: by mail-ej1-x630.google.com with SMTP id ox4so25330374ejb.11
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f9Yv/6szprBEGjiMG9pi95AAgx2yyob8DeXjxNAsoTQ=;
 b=Yby+BlmbUNDcAp+VFSryyjUuZj3dX0PBaPQnf0vk/UHBI6Lhd4okXUfvjtOCg0U7FS
 5kAu7P+gRTqHJVltO/UXvjCeiPe80Kb7DaoRQKxmR7gZVEMTYmTSUS82iZYYyeMcYh+z
 YNZddnkvwa5+0W1kfHM46VifoNOnX0klQM8ahTMKlssjhI/uW/UK82LGVvYqWPMAA4qh
 X6xtrlTuM1am09rQaZor+Ow0A0mtoMgweWK4VwX3qE4KauXAcigqQrTgc96jkE15yG+T
 OOiFG6CV+3J36Et7rl4bsdE39AuxgeeaSPKIiqvIkk1LonEKJA1pvL4tQl49QLg0lkng
 hgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f9Yv/6szprBEGjiMG9pi95AAgx2yyob8DeXjxNAsoTQ=;
 b=lf90P2g/lqgZvciYbCNIKiYs4VedNsicGivNPlF8uoIOIIW8tWpf+ICldLTiRG9JG4
 Ix+oTsRg638nLcMlWK8NN82llTMGfA34tVUnRnAwpV9IcKzYq3So3qxIlcyQMduEwL4a
 WKR6SXZXhVHAbiz6ICB78mZ1ZWiPmj3K0vFFb4qPTndo8tRYF8vakqDQzmgXdVCo2tIt
 iRBiZoUfWFq0nbUix11m7K8MhrzyXr9D2YLtDrkaVnnLtpRXbruJpIip51tTohY8SsX5
 9Jny93UnwsBYymrq/UFvyOHXk/bJk8LsGqYpVKggaOsg1q04SzXVd/STmgRxA+RUKztl
 k1ZQ==
X-Gm-Message-State: AOAM531GWoQbxWSU5YnNTlADVTyL9Hdtz6gxZ4XVNJe1jNt5IGFBTUVF
 BCBAnXCdTh8d/wk3EhoQIzY=
X-Google-Smtp-Source: ABdhPJxlkM0qU9mo53vr8vo85OU5h0vwtzSUS1eDlq5vpjLFIIq2w2nir4CrbG01V8nNnch+iWDFtA==
X-Received: by 2002:a17:906:9386:: with SMTP id
 l6mr5138799ejx.455.1615403584308; 
 Wed, 10 Mar 2021 11:13:04 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u17sm111555edr.0.2021.03.10.11.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:13:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Xu <peterx@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] NOTFORMERGE memory: Ensure AddressSpace physical base
 address is zero
Date: Wed, 10 Mar 2021 20:12:55 +0100
Message-Id: <20210310191255.1229848-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310191255.1229848-1-f4bug@amsat.org>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AddressSpaces aren't suppose to have a physical base address.

Add an assertion to demostrate the problem:

  $ echo info mtree | qemu-system-mips64el -M magnum -S -monitor stdio
  QEMU 5.2.50 monitor - type 'help' for more information
  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000007ffffff (prio 0, ram): mips_jazz.ram
      000000001fc00000-000000001fc7dfff (prio 0, rom): mips_jazz.bios
      0000000040000000-00000000407fffff (prio 0, ram): vram
      0000000060000000-000000006007ffff (prio 0, rom): g364fb.rom
      0000000060080000-00000000601fffff (prio 0, i/o): ctrl
      0000000080000000-00000000800002ff (prio 0, i/o): rc4030.chipset
      0000000080001000-00000000800010ff (prio 0, i/o): dp8393x-regs
      0000000080002000-000000008000200f (prio 0, i/o): esp-regs
      0000000080003000-0000000080003007 (prio 0, i/o): fdc
      0000000080004000-0000000080004fff (prio 0, i/o): rtc
      0000000080005000-0000000080005fff (prio 0, i/o): i8042
      0000000080006000-0000000080006007 (prio 0, i/o): serial
      0000000080008000-0000000080008007 (prio 0, i/o): parallel
      0000000080009000-000000008000afff (prio 0, i/o): nvram
      000000008000b000-000000008000bfff (prio 0, rom): dp8393x-prom
      000000008000d000-000000008000dfff (prio 0, i/o): dummy_dma
      000000008000f000-000000008000f000 (prio 0, i/o): led
      0000000090000000-000000009000ffff (prio 0, i/o): io
        0000000090000000-0000000090000007 (prio 0, i/o): dma-chan
        0000000090000008-000000009000000f (prio 0, i/o): dma-cont
        0000000090000020-0000000090000021 (prio 0, i/o): pic
        0000000090000040-0000000090000043 (prio 0, i/o): pit
        0000000090000061-0000000090000061 (prio 0, i/o): pcspk
        0000000090000070-0000000090000071 (prio 0, i/o): rtc
          0000000090000070-0000000090000070 (prio 0, i/o): rtc-index
        0000000090000081-0000000090000083 (prio 0, i/o): dma-page
        0000000090000087-0000000090000087 (prio 0, i/o): dma-page
        0000000090000089-000000009000008b (prio 0, i/o): dma-page
        000000009000008f-000000009000008f (prio 0, i/o): dma-page
        00000000900000a0-00000000900000a1 (prio 0, i/o): pic
        00000000900000c0-00000000900000cf (prio 0, i/o): dma-chan
        00000000900000d0-00000000900000df (prio 0, i/o): dma-cont
        00000000900004d0-00000000900004d0 (prio 0, i/o): elcr
        00000000900004d1-00000000900004d1 (prio 0, i/o): elcr
      0000000091000000-0000000091ffffff (prio 0, i/o): isa-mem
      00000000f0000000-00000000f0000fff (prio 0, i/o): rc4030.jazzio
      00000000fff00000-00000000fff7dfff (prio 0, rom): alias mips_jazz.bios @mips_jazz.bios 0000000000000000-000000000007dfff

  address-space: I/O
    0000000090000000-000000009000ffff (prio 0, i/o): io
      0000000090000000-0000000090000007 (prio 0, i/o): dma-chan
      0000000090000008-000000009000000f (prio 0, i/o): dma-cont
      0000000090000020-0000000090000021 (prio 0, i/o): pic
      0000000090000040-0000000090000043 (prio 0, i/o): pit
      0000000090000061-0000000090000061 (prio 0, i/o): pcspk
      0000000090000070-0000000090000071 (prio 0, i/o): rtc
        0000000090000070-0000000090000070 (prio 0, i/o): rtc-index
      0000000090000081-0000000090000083 (prio 0, i/o): dma-page
      0000000090000087-0000000090000087 (prio 0, i/o): dma-page
      0000000090000089-000000009000008b (prio 0, i/o): dma-page
      000000009000008f-000000009000008f (prio 0, i/o): dma-page
      00000000900000a0-00000000900000a1 (prio 0, i/o): pic
      00000000900000c0-00000000900000cf (prio 0, i/o): dma-chan
      00000000900000d0-00000000900000df (prio 0, i/o): dma-cont
      00000000900004d0-00000000900004d0 (prio 0, i/o): elcr
      00000000900004d1-00000000900004d1 (prio 0, i/o): elcr

  qemu-system-mips64el: softmmu/memory.c:3193: mtree_info: Assertion `!as->root->addr' failed.
  Aborted (core dumped)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccdee..164e7971e5b 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3190,6 +3190,8 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
         qemu_printf("address-space: %s\n", as->name);
         mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
         qemu_printf("\n");
+        /* address spaces aren't suppose to have a physical base address */
+        assert(!as->root->addr);
     }
 
     /* print aliased regions */
-- 
2.26.2


