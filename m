Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4637F64ED36
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:58:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6C9v-0003qe-3Z; Fri, 16 Dec 2022 09:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9k-0003jm-1m; Fri, 16 Dec 2022 09:57:48 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9i-00020e-DM; Fri, 16 Dec 2022 09:57:47 -0500
Received: by mail-ed1-x533.google.com with SMTP id i9so3982095edj.4;
 Fri, 16 Dec 2022 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuw/66x1f/fkchUV1DAgnDH/FSTJzYemzBM1kUHlZ/o=;
 b=EJutQDFQUvgsDZ7FmF+cgif5ppxwiruDvngecjWBZoYdbdP82/lIklcIFoZQJsKzMg
 aUJ6GYsgEgS+hAoC9PhkAoQxCxV3S7+RfCSkVqsyf3NoUZOjVXRPGToI+NcDg7TfETLz
 03HTRqJ3nFvXtCnbeQvYECcv9vqkQSxcvthugOdSxBdO3XGgJZJzLIsfCbjRiYDj+YPj
 Xc7DweS/EfDZ/zgYPT7nAjR44nNyQHuruP5EoM+WzDH1JFlWuDOg1eIztVQcPLUddwjJ
 PdjFjTT5L+KMylEayjdxbIcCiTQBN2b2c4NfCTTMU5J5WFwNMs9TvUtH/JMr/Wr5BeUj
 yfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tuw/66x1f/fkchUV1DAgnDH/FSTJzYemzBM1kUHlZ/o=;
 b=YZ7xp2Lvl8GNvAHIQKf5H3HbRfDQX/KL4xqQdMe0nJACLY/gM7EbTOI6t4GCbru3eZ
 DcxJu90n9Efx1jCLMwr01x/pEKEw/c746aQz95oSvZQTQ0atehm+W48BN1N97tbHh/Qt
 hufhCNNqzgtTFhdI6Ff4XW3qlCyn6hNirW06Xdip6hg9eKfa1clWeTv6jENPU/EdVpy5
 JaT911AA95VctImhGOSqolta0+GxkFKsdryvyUvW/OpLIjzHOs3eiVtp4Zv2t1pQlq9Q
 8B44EDnjgDxiwwWCKkhWdyAn+PvUiJOikr0rWIVEXaMTuOKW4N/FMTEsXPgQnYokIySv
 A5Ig==
X-Gm-Message-State: AFqh2kqQn65Yin2J3xuhEKGyoiAj5PP4AaNiaJdaikfnerlA23I6DbM8
 pEBUYyC8/4SI9lxBvmCwLE4O9iXSTvQ=
X-Google-Smtp-Source: AMrXdXukhcG8H0our3pFSt0YSllrgSmee14ETKrYJ3fyDlYucqbzNqdZeLWgKyBFHPbvHFC10Q0WBA==
X-Received: by 2002:a05:6402:1f06:b0:475:5591:b98f with SMTP id
 b6-20020a0564021f0600b004755591b98fmr3563112edb.35.1671202664014; 
 Fri, 16 Dec 2022 06:57:44 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa7c852000000b00467c3cbab6fsm942225edt.77.2022.12.16.06.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 06:57:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/6] target/ppc/mmu_common: Fix table layout of "info tlb" HMP
 command
Date: Fri, 16 Dec 2022 15:57:05 +0100
Message-Id: <20221216145709.271940-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216145709.271940-1-shentey@gmail.com>
References: <20221216145709.271940-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
2.39.0


