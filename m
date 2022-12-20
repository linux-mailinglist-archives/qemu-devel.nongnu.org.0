Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46D56521FA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:06:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3d-0004Jo-VI; Tue, 20 Dec 2022 08:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3b-0004HU-W5; Tue, 20 Dec 2022 08:53:24 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3a-00012h-GC; Tue, 20 Dec 2022 08:53:23 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-14455716674so15426602fac.7; 
 Tue, 20 Dec 2022 05:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UolbehPZVT4MZJ701HApHrkweA0x+o6XOjYoy2v+Dhg=;
 b=JzUqyHAo2YRzzPqxPI+SVuBmbE5WFzEo/u1ysBN6xroPV/5z2K4cwHzAaYSN412Hlj
 qdPTRtLThUGssf6GNDt2gZycGcHy70ogB43IvxeQ8rl6E8WIRCNIjmOkiBcbIE1QncfE
 8mV7RGUSQWqOcfMhuFDeYOaX3hbXvJsn0CpyYYQTZSEi6DHJ/4Xqf7eqU6DL+RshbwDg
 xXY749u/3C2W/HWzG1X9twbYE8RXC/YBB8LXXvoWKB2dp+wqIiFFsq0RL+SuLwirmSUP
 bXid5b+dqOnwX6MzkqeNGsgZAaCy4lL14/bzHlUFhv/FdNG1LfYdKtNxjosmzAXg74BA
 Ja0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UolbehPZVT4MZJ701HApHrkweA0x+o6XOjYoy2v+Dhg=;
 b=5ejFvtj3lhsOWKx3josM7dmwmI8/2BakUUi10Chfr62+dtasL3YP8gneE8biwItm4O
 PdtoqHHZky6OU3F4JlILgu4ZbxP1twoyPCIXqzkJqW4+JCrXxIiIYAGgk4YBpOgMI13c
 rcShHDe9xRRu4OCQHKtjmlH+rmwkvDHe7XVl2S6qevzQZ+RBY/WpJoYrLlYJZ7Vnu2XY
 M31hQcHc6JCjjPlvAmFfAcpPNlzPq4A6/1GcGLIZ77vc30kJqUBreAQi1CUJB0jLk1lr
 50D0BmC9y/RtH3Fk17neHKqQrTOfkUrPvxLueh00wmp3qyjfbJK5V3OXbkdUEbXqJz6r
 BAfA==
X-Gm-Message-State: ANoB5pniO/Sa9F5Og9BkhCaBKTc+Hutyc2lD/5u1T0mjadTVZlJnDlr0
 plI/kj4Z9fs2WS6ukmzyN2E+VIBF3DE=
X-Google-Smtp-Source: AA0mqf7k0z1/kW1AoSF41ON+KJ/emKLZOA5FEqAfRadAPLKSJPMDvnpr22NsrHPeBMUG3Qx+ZWFYZw==
X-Received: by 2002:a05:6870:cc88:b0:143:9b6b:a871 with SMTP id
 ot8-20020a056870cc8800b001439b6ba871mr20208896oab.23.1671544401402; 
 Tue, 20 Dec 2022 05:53:21 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:21 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/15] target/ppc/mmu_common: Fix table layout of "info tlb"
 HMP command
Date: Tue, 20 Dec 2022 10:52:45 -0300
Message-Id: <20221220135251.155176-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Starting with the URWX columns the columns didn't line up.
Before:

  QEMU 7.2.50 monitor - type 'help' for more information
  (qemu) info tlb

  TLB0:
  Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123
  0x0000000000a80000 0x000000000105d000   4K 117   0  SR--UR-- --M-- U----
  0x0000000000100000 0x000000000114e000   4K 117   0  SR--UR-- --M-- U----
  <snip

  TLB1:
  Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123
  0x00000000c0000000 0x0000000000000000  16M 0     0  SR-XU--- --M-- U----
  0x00000000c1000000 0x0000000001000000  16M 0     0  SRW-U--- --M-- U----
  <snip>
  (qemu)

After:

  QEMU 7.2.50 monitor - type 'help' for more information
  (qemu) info tlb

  TLB0:
  Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123
  0x00000000b7a00000 0x000000000fcf5000   4K 18    0  SR-- UR-- --M-- U----
  0x0000000000800000 0x000000000fd73000   4K 18    0  SR-- UR-X --M-- U----
  <snip>

  TLB1:
  Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123
  0x00000000c0000000 0x0000000000000000  16M 0     0  SR-X U--- --M-- U----
  0x00000000c1000000 0x0000000001000000  16M 0     0  SRW- U--- --M-- U----
  <snip>
  (qemu)

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221216145709.271940-3-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/mmu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 49067c05e6..8901f4d134 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -980,7 +980,7 @@ static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int offset,
         pa = entry->mas7_3 & ~(size - 1);
 
         qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %4s %-5u %1u  S%c%c%c"
-                    "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
+                    " U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
                     (uint64_t)ea, (uint64_t)pa,
                     book3e_tsize_to_str[tsize],
                     (entry->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT,
-- 
2.38.1


