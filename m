Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47C6017D8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:39:56 +0200 (CEST)
Received: from localhost ([::1]:56108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVxr-0002M3-HC
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgR-0004s5-QW; Mon, 17 Oct 2022 15:21:57 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgQ-00033T-Al; Mon, 17 Oct 2022 15:21:55 -0400
Received: by mail-oi1-x229.google.com with SMTP id n83so13215790oif.11;
 Mon, 17 Oct 2022 12:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5WKh5pU5ti6mWxMMUJXUey7oA6ivXt+7njW2XdfQk7A=;
 b=c4sCVPVkjIFDly/enb6flFkcJPO1Nw1jMNhJcETJJETdq0uAkdOMkVUQabEgMlJWwU
 +uc/BWbQAsh2JWUfaySx5AZBsrUxDcWpWENZJvm3en4tq+2pmWbfeJgA3d5qt0vly0FT
 AMm0Y147IHp5q/Cf9b87xzSX0qjqCh43H5TsqIzl7bnQfcKRLnRyD1T9P3ZBRSfw6ra+
 ppJWL8/Rbddkh0CZkOBjYPjO9Lv+sF3n8EWbURwQcxpZiAxgIX6D+marYMYQLMunCZR7
 P1VDHmTajRMv82QhykmTQMKO5d23tf6rylFmUaEKb2wyn3i5QDChh96wG94RSaAHns6Q
 4qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5WKh5pU5ti6mWxMMUJXUey7oA6ivXt+7njW2XdfQk7A=;
 b=SpRuQWPXQ9jHXpqaI7lU3hRJ6RLvYqbsEi9WpAiHhoEn/GgWMxm4dbL7bFqH7KhCQQ
 jk60R27oTg1BJycm62MHb/kkfPiDDJEYiPekB443QoXlbO5hmngTGrRXJIsQgKDJq9Rk
 ILiK7ASd2l0IN+iImGLMejKEtIXSSsWJkKb3RGVZc50ttADOOJo/j0mcm7zPrCB1Ma3R
 lW5+ggRNRWlrYGpKlsuS6NiZhgefsmv89zTj0ERlhocQESK1sJG7dT9PMJ0SBcUwkYPb
 +2NK1SoJ5Uv7f5BuuDzslVD7QSCULhvPMtSa8Ssq6w+RtfXPe9zcCcaAj+xS/64fbSbz
 bA9g==
X-Gm-Message-State: ACrzQf3WW736RMfSpwyQK+tXImh2DKj/PWCpQpfJuB5hkl3dcerDZMFE
 llFKZZ1gghqI4M2eGu2o0iViw84lq+c=
X-Google-Smtp-Source: AMsMyM5C03v6MVpV2xmzwDX7jQJjiC+OUmyPhWQidkxyDBfS06huqswQhyOiTn+3THp+TnRmqDPmdw==
X-Received: by 2002:aca:5808:0:b0:350:9790:7fe with SMTP id
 m8-20020aca5808000000b00350979007femr14534025oib.79.1666034512742; 
 Mon, 17 Oct 2022 12:21:52 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 35/38] hw/ppc: set machine->fdt in pnv_reset()
Date: Mon, 17 Oct 2022 16:20:06 -0300
Message-Id: <20221017192009.92404-36-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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

This will enable support for the 'dumpdtb' QMP/HMP command for
all powernv machines.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220926173855.1159396-13-danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 78e00afb9b..40bb573d1a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -678,7 +678,13 @@ static void pnv_reset(MachineState *machine)
     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
     cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
 
-    g_free(fdt);
+    /*
+     * Set machine->fdt for 'dumpdtb' QMP/HMP command. Free
+     * the existing machine->fdt to avoid leaking it during
+     * a reset.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 }
 
 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
-- 
2.37.3


