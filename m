Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C860181C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:56:02 +0200 (CEST)
Received: from localhost ([::1]:58870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okWDJ-0007wg-P0
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgP-0004gS-De; Mon, 17 Oct 2022 15:21:54 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:46053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgN-00032q-Ij; Mon, 17 Oct 2022 15:21:52 -0400
Received: by mail-oi1-x22b.google.com with SMTP id o64so13205449oib.12;
 Mon, 17 Oct 2022 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3CT7+WbJcBsnE0slV77fLYxU0RSlK8xxSRpIF14gBA=;
 b=FEqiNQy884QXF5xXjsVZ4qdr2u2nVJ6nmZNncdrlouwr0Js9xBEcSQBM0hk4QErNFo
 tisCN+5+xMutc3gXiTT0qeYEGXgwDquMrtHH75r3TyoJSigGqRrbCAgNw8WyVjAi+UnM
 83NnffqB6MgxhsXpWZsCAY2stGBWwpBOAw0LV2BenGqB4/kLFH6j5bx+eRELZmKX2+9G
 8LBtBYud3/QPVT81isUvbrWc0PEw74YNFK8hQHyKl571u5+S9lmOiY60IwrK8UJNRE5L
 ed33UYwULQ6fIdUDFSNk9zItREX/zgk62PCuHanboK1ZU6/jZANBwmsD6HDco0l9+Q7e
 W2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3CT7+WbJcBsnE0slV77fLYxU0RSlK8xxSRpIF14gBA=;
 b=kt0x2Re0ZQeV5OZfbgsujprBMKq86nwNzmSpgtT4t8IQWat5Sb8y0BsioH5plNn+BO
 gLZgusTvOW9proxdhsLn6Jy3y9HqHOEkL3QTBsxYkLe+I4Ep56TGoyiU6gjuxPucnU4r
 YY8dK+uQn3nOVlmCvUA4c/fkgawMmoVZbMzrqQhfpurxvBY88BjCUYGaEBPZ5kEpvPSG
 kw/muZo5m9p1Ys/grAVnsyUejmQUHCiKSei1unI18CZ7T6RS7vHFb4a7DMUmy/vCkpPi
 JFPtARYeu0O9JGDRazoiiaITIgNAgHRU8sUK68QV8r4XaN7j8NOcbQJDEGHF6LRUuDfL
 ZaUg==
X-Gm-Message-State: ACrzQf3tplsBMbje1S1n8XoSrmjbsfN76tXWI9S/9k6W4QyMz8e8Es2P
 lrb94cnWXnfzVfXhcMZZd/jbFQ58/ok=
X-Google-Smtp-Source: AMsMyM6LgJyp6PHv+QR2Y/qA48fZUueHuNr0wnVlBJan62kU8pOAAb/EYp0BS7TEuxDV5/ELifWBWQ==
X-Received: by 2002:a05:6808:118e:b0:345:9c3e:121d with SMTP id
 j14-20020a056808118e00b003459c3e121dmr5818040oil.211.1666034509843; 
 Mon, 17 Oct 2022 12:21:49 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 34/38] hw/ppc: set machine->fdt in pegasos2_machine_reset()
Date: Mon, 17 Oct 2022 16:20:05 -0300
Message-Id: <20221017192009.92404-35-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
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

We'll introduce a QMP/HMP command that requires machine->fdt to be set
properly.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-ppc@nongnu.org
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220926173855.1159396-12-danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..ecf682b148 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -331,6 +331,10 @@ static void pegasos2_machine_reset(MachineState *machine)
 
     vof_build_dt(fdt, pm->vof);
     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
 }
 
-- 
2.37.3


