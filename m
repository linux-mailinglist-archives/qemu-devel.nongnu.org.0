Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607966819B0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:52:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMZF5-0002lQ-C5; Mon, 30 Jan 2023 13:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMZEW-0002ca-RO; Mon, 30 Jan 2023 13:50:28 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMZES-0007bs-Hp; Mon, 30 Jan 2023 13:50:23 -0500
Received: by mail-ed1-x52a.google.com with SMTP id m8so2711156edd.10;
 Mon, 30 Jan 2023 10:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1TCnRtSC/qK36qtxF8mPutKkZQGPygNYFgtr/qGSLHE=;
 b=ZpmRnEvm56e9GtINB3/sAY/gC7GYWG6AJfr/rAoW8sN7qQYTRWjtIJY8o9KNvxtrmJ
 Gj9HCZxXscRjDQ/QYN4deGL0Th5GF+hOAvS070kN/mU+IWO0DEwE2Tqf2IouHxnW0j39
 x1qhmnMXsXyQxp+S+8uiWdZZOPgp+eyKJOg4laWabzMMV5B8p3REYfzIecK5wEsRJrBV
 G9WoEDopP4zqAJv+ZSt8HY+ZQqrOcyqt06xawtsrNxzQkgojppigfAntELsi2y0M2f8Z
 7FqDs9Gwuvd1CTqVyaeOvG+lrKXofsEf2nY7TMD/H/vpqiK27bfl3tiL0Z6Oxebr3dyW
 HB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1TCnRtSC/qK36qtxF8mPutKkZQGPygNYFgtr/qGSLHE=;
 b=Yo41EWVsEamsdOzgjh/JBLVf/hekV2ilRNecuDoCcQKLTe5+TAjImuTEoP5oqmxPND
 jjHN4USPFyWI+FyGVv9cMjI9rwA+VSQls7NzfAs0KaZ+DM582wmYm3E8Ifmy6fnTVou4
 d740/7iC+EoCbZ81Z5O/PrksEs8fVSHLBLD9ru/Ulgu9HGMQyspIlAHxUww0wQAJ1KPs
 QGHIfhRZ5wA+swvHx7Tt8KglMtAj1k6BPmTAa/hwIcNxe/PBVuwr8IbwgurUH0b9YZOW
 4OsewLJ9iKddTPRs5o2cBxgWlWDgawAMGcn5RUXCkNHIpC+M9nvaQre3e43k2uEmx9w+
 zffQ==
X-Gm-Message-State: AFqh2krHuV4OlDr1CbF+iMUIJkNV//cVY/K+6RKcyfGQvh6Rjbcip34Q
 mt8+j7Y3grKmlXjY/Aa/b7ZMlspCLmQ=
X-Google-Smtp-Source: AMrXdXs7pMcSkLIxz0FxirIqy4fybycuayZ55j+Na0VYRZ4wzRxCjof9elrcUspb2EDfCKVP97QXug==
X-Received: by 2002:a05:6402:1044:b0:498:8c60:d7d9 with SMTP id
 e4-20020a056402104400b004988c60d7d9mr51933952edu.12.1675104617645; 
 Mon, 30 Jan 2023 10:50:17 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-240-001.89.12.pool.telefonica.de. [89.12.240.1])
 by smtp.gmail.com with ESMTPSA id
 w25-20020aa7d299000000b0048789661fa2sm7135587edq.66.2023.01.30.10.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:50:17 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] target/ppc/translate: Add dummy implementation for dcblc
 instruction
Date: Mon, 30 Jan 2023 19:49:50 +0100
Message-Id: <20230130184950.5241-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

The dcblc instruction is used by u-boot in mpc85xx/start.S. Without it,
an illegal istruction exception is generated very early in the boot
process where the processor is not yet able to handle exceptions. See:

https://github.com/u-boot/u-boot/blob/v2023.01/arch/powerpc/cpu/mpc85xx/start.S#L1840

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 target/ppc/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index edb3daa9b5..8c32e697d9 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5261,6 +5261,14 @@ static void gen_dcbtls(DisasContext *ctx)
     tcg_temp_free(t0);
 }
 
+/* dcblc */
+static void gen_dcblc(DisasContext *ctx)
+{
+    /*
+     * interpreted as no-op
+     */
+}
+
 /* dcbz */
 static void gen_dcbz(DisasContext *ctx)
 {
@@ -6832,6 +6840,7 @@ GEN_HANDLER_E(dcbtep, 0x1F, 0x1F, 0x09, 0x00000001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER(dcbtst, 0x1F, 0x16, 0x07, 0x00000001, PPC_CACHE),
 GEN_HANDLER_E(dcbtstep, 0x1F, 0x1F, 0x07, 0x00000001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER_E(dcbtls, 0x1F, 0x06, 0x05, 0x02000001, PPC_BOOKE, PPC2_BOOKE206),
+GEN_HANDLER_E(dcblc, 0x1F, 0x06, 0x0c, 0x02000001, PPC_BOOKE, PPC2_BOOKE206),
 GEN_HANDLER(dcbz, 0x1F, 0x16, 0x1F, 0x03C00001, PPC_CACHE_DCBZ),
 GEN_HANDLER_E(dcbzep, 0x1F, 0x1F, 0x1F, 0x03C00001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER(dst, 0x1F, 0x16, 0x0A, 0x01800001, PPC_ALTIVEC),
-- 
2.39.1


