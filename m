Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5F5AC82F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:49:48 +0200 (CEST)
Received: from localhost ([::1]:60802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzN5-0001gR-KS
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9E-0006uq-E3; Sun, 04 Sep 2022 19:35:28 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9B-00055D-Jv; Sun, 04 Sep 2022 19:35:28 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1273a47cdb6so4100063fac.13; 
 Sun, 04 Sep 2022 16:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hBI/7RO7Fr1a9pi8i5aU6Jr0VxpF0f01rU6VBZnellI=;
 b=CEu0xFxc8fOqebSA1zvlCwGlhAykRCyOfwJaWOiQebIB6y6dqcKL0WzA/SMPR28Dm6
 v6ZEsH101nEVZsnZblgTF61vIMK8DwmQuv4gMFOI63IN2WpVtWzdNmFlR327Q7qCTmzI
 CNJxAQu7ErIYVHRkap9yY0i0rBEhGcTTMxVAmn28hmHkz8l9G+BvtvbyUQw9DwTTe7mU
 IyzFyq5QKQQxCIZ6gBGyFdp/UQGmyE7IIqSCFpCUwwVPNYdMZl73g3R0q5spJoKic37g
 xzFvgOf5BZBt58iotV4qEgKoebgrnQB3cnK+dSAMoRSb/K5BPoq4kFfJYgTjI0+jfseH
 HGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hBI/7RO7Fr1a9pi8i5aU6Jr0VxpF0f01rU6VBZnellI=;
 b=cCQbUrjrDfiPAiKcjvymV1Hp+RBAr5kngjY09RtZ97kf7fvsGVuWd4XaV1lMTTlSaH
 ysJOraB1GC1z6cs2tIcbNh+KnDV297BZlahp0QOHOXSlr79LuXUwI8+ittwuzskt2AII
 047MkKOZDNKe+E8BeV48BeVAP2SIgYOjJ2nS8UCaPKwzK6xDi5K/eXTvuUhVd2bWwmBn
 nrOv6vju2q47f0nYyY8DzzAAQLOYwWzh1bfeR+IKtghf0SD6ugAWD52mnMucJ26akisL
 ODa+BL23GUUWYem820Xslef2uiUW7DkmitBL7wNHUJ2CYfO6eGi8fCLebGMjTVh1Tj3e
 aN4g==
X-Gm-Message-State: ACgBeo2bE4R5ZC1cTBfTz36k2O6WDNayBSuy+e/lIESJ/BoGJi6oFl1S
 4W77wqGciF9gKJEoYYbLNqnUQhFJft+hzA==
X-Google-Smtp-Source: AA6agR7QW4Iz40Mdl7AMZhuwHHY6rDjSGdXENOFY4c9bKr/umfR3wrrefqzkOPGVASbt631bpee9Iw==
X-Received: by 2002:a05:6870:630e:b0:10d:ac9c:362b with SMTP id
 s14-20020a056870630e00b0010dac9c362bmr7795219oao.157.1662334520928; 
 Sun, 04 Sep 2022 16:35:20 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 08/14] hw/ppc: set machine->fdt in pegasos2_machine_reset()
Date: Sun,  4 Sep 2022 20:34:50 -0300
Message-Id: <20220904233456.209027-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

We'll introduce a QMP/HMP command that requires machine->fdt to be set
properly.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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
2.37.2


