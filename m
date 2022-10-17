Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E98601808
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:49:19 +0200 (CEST)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW6w-0007Ko-R1
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgX-0004vZ-F0; Mon, 17 Oct 2022 15:22:02 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:39898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgW-000346-1l; Mon, 17 Oct 2022 15:22:01 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso6371963otb.6; 
 Mon, 17 Oct 2022 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FJeaKwncU3G1wudkKdG62ntI4+l0De0HVu2CViF7TA=;
 b=IVMgT1eqfqbzzUMEANVVLu7caEGkJI8/SDCOQZEvMg+qjRPjv6X+zOerMFR7R5+Wp+
 MQEGKfkLHRzpvq3l8wzP+jxIH+yBN4NvPA6ZhXi+ugDFUpBYVzpVdTVyRJrKn5fd7HZ3
 n7ahLQpgsdA/v2rRlaGcXCkukLhWVBB4lQ8SH7AvrFqYhNbJ+Do58NLajrCpGDbLMHl7
 hw6nsKcy9/BBJbzm6Q88UNSpsgHX/rwPQnCh43+pSH7/+GwB3WK67GdMeb6W4tjAuVXy
 BWzd8SJZ/1VpmGB+g3aSO+6wPAzmLu/eMAF33LInI7nu06/c95gNt3kaDJSvZPj6cuuy
 yo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FJeaKwncU3G1wudkKdG62ntI4+l0De0HVu2CViF7TA=;
 b=Zlefc4BEg77JmzK2K1DKDpv70kE8owfaz5DeZK55sdILSRYB+/cCFsZCmwdRBn0KHG
 +vdhxj4xBZ4fY5RB+v7yoZETW3rNjH4BQKoc/SayEOtBpiymCX5AEEK5y5gpzUj2xtqT
 dZgJ5Ul8qNksUT1zU3qmD+dPBPwXPuXx7YdPpeHT+dypsuc9hcR8Qy9ikMtkKA3RyvYj
 wfXTuhNb9UFlgvJ8BYp1h/SitkCMXUI7BfUl9GsddJ7zzPho8XyXoym18p2oYPv56hOb
 iVv6Mt2kX+eL537Qc32axcylmOaUcqWd0djd+Dn41K+BgzofmxKmGhpOLrSN7nIFYLD5
 6+LA==
X-Gm-Message-State: ACrzQf2SS1qJOGX+Up5owf9D0Q9ix5mk2DWZAfrWA0XKh3kqF2OXIvkx
 ovf/lptvI+RuYBhbItk6v0SS/4l+Fhc=
X-Google-Smtp-Source: AMsMyM5ItiLgJg/NBYBFlt/tIpYbjYy3x2hY8JUJsP1PD2ptkE8trkILR4VbxMmW091+g08aeqrGJA==
X-Received: by 2002:a05:6830:33e1:b0:655:e771:f572 with SMTP id
 i1-20020a05683033e100b00655e771f572mr5889870otu.245.1666034518584; 
 Mon, 17 Oct 2022 12:21:58 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 37/38] hw/riscv: set machine->fdt in sifive_u_machine_init()
Date: Mon, 17 Oct 2022 16:20:08 -0300
Message-Id: <20221017192009.92404-38-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' QMP/HMP command for the sifive_u
machine.

Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220926173855.1159396-15-danielhb413@gmail.com>
---
 hw/riscv/sifive_u.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e4c814a3ea..b139824aab 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -634,6 +634,9 @@ static void sifive_u_machine_init(MachineState *machine)
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = s->fdt;
+
     /* reset vector */
     uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
-- 
2.37.3


