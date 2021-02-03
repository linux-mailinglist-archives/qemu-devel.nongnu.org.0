Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9698B30DCBE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:29:26 +0100 (CET)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J9o-0001go-T6
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7J5d-0005O9-Bi; Wed, 03 Feb 2021 09:25:05 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7J5b-0000Cg-Ie; Wed, 03 Feb 2021 09:25:05 -0500
Received: by mail-ed1-x52f.google.com with SMTP id y8so11936511ede.6;
 Wed, 03 Feb 2021 06:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kaP3R/qu+ldSx+S+KGlvJ4b2oIxu41EJJ0K98J8iP7k=;
 b=WwzdnJbj+SOOL117rWxBEL5qfmMM/9wrQDV1XF5bYvoxcxHb8x+Q9PiGnxPwxlHWOo
 E5lTuqga2B28aYU3+xFA4W/ekx5dxQ0eUDPPVu6moHNfBygswPKb3FucGIAIZxOJtfw4
 doYXYF0SYatvvsWmdN8GwWEmuusn2d+F+47ytL9QSe5D4nzbaIbzHyltSX0KzdhDq0hP
 GiQ9Kr+UXT/WlYHxjEXmxHiWIBnPjOYzgBB3CPFilrf/dZ3EvGljbi1BoT3k9XW5LtYe
 w24VpzgTIzFbsG4E1PXmMKcQCIhQfwsr+GG8wGR96N+/dd9pMwt51+YUgAKHfZ5u11QD
 BdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kaP3R/qu+ldSx+S+KGlvJ4b2oIxu41EJJ0K98J8iP7k=;
 b=Tue0UKRmprUwKOwk4pKriKmbls1Xvjt/vLVQ6iweNevZakOPsmCv4YLfJ95cpvHdwF
 Om0z0BKTozjpqc7GIhMiVIc+U9u7kbGUOpk7eKGm/BBcmOmKDguL5JebDbmBifF95TxN
 zCOBnAZOYFK2yS7k2ZaXdLgyEgh2DbmNTNHthYLSxppyZsvgGnGEm6fJrU4yEtcExwEZ
 R1X9zXF18bAHOW/acr8aOm0E3tpoJKMgXCbPfoj+CTGBgMX6VgE+PKxyMt0/UCYKr7hQ
 oGnfnmzJFIvmFVYrPqm00Dcdwu5ceMAzlDHd0MgyotnA8I5bzb0AttYir8yPHAJ8YWQM
 Iljg==
X-Gm-Message-State: AOAM5335oBFBBIozu7Pgsu8IbN4og8dNjko8IXwVTIB+rrqs1vjVaOEW
 dtJ8WUfCAgeC+PayPHLQ5o8=
X-Google-Smtp-Source: ABdhPJwXLuJoMdYXfvzNG6aERVKVaejifERBNe+BIG3DZecE9KWBjHR2iW6r2Bt6FImvufvvCbTf1Q==
X-Received: by 2002:a05:6402:1642:: with SMTP id
 s2mr3078781edx.360.1612362301925; 
 Wed, 03 Feb 2021 06:25:01 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id p12sm982638edr.82.2021.02.03.06.24.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 06:25:01 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 2/2] hw/ppc: e500: Fill in correct <clock-frequency> for
 the serial nodes
Date: Wed,  3 Feb 2021 22:24:48 +0800
Message-Id: <1612362288-22216-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612362288-22216-1-git-send-email-bmeng.cn@gmail.com>
References: <1612362288-22216-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the <clock-frequency> property of the serial node is
populated with value zero. U-Boot's ns16550 driver is not happy
about this, so let's fill in a meaningful value.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

(no changes since v1)

 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c795276..01517a6 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -126,7 +126,7 @@ static void dt_serial_create(void *fdt, unsigned long long offset,
     qemu_fdt_setprop_string(fdt, ser, "compatible", "ns16550");
     qemu_fdt_setprop_cells(fdt, ser, "reg", offset, 0x100);
     qemu_fdt_setprop_cell(fdt, ser, "cell-index", idx);
-    qemu_fdt_setprop_cell(fdt, ser, "clock-frequency", 0);
+    qemu_fdt_setprop_cell(fdt, ser, "clock-frequency", PLATFORM_CLK_FREQ_HZ);
     qemu_fdt_setprop_cells(fdt, ser, "interrupts", 42, 2);
     qemu_fdt_setprop_phandle(fdt, ser, "interrupt-parent", mpic);
     qemu_fdt_setprop_string(fdt, "/aliases", alias, ser);
-- 
2.7.4


