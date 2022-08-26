Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D85A2947
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:23:14 +0200 (CEST)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaEp-0005dh-V3
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4M-00085B-6a; Fri, 26 Aug 2022 10:12:23 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:39558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4K-0003yU-Gr; Fri, 26 Aug 2022 10:12:21 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11cab7d7e0fso2183843fac.6; 
 Fri, 26 Aug 2022 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fq0fN3wHA48GNTZRD1sHCkuC5wNorM3KMo/gVJyzLng=;
 b=n7g3xNpNfIcYjlEc6I9+k/zvhvJ0MTPgud32NPVtC1cibEXChK2lNU8o8I0Oc7c3kG
 5wnDey016f2kxW4ELltj2SfecXFS2s9aM4XsPEtpXvNhqTcT/r1h6DZuHU62oqJVphRL
 vg21sf2YRac2IpJ6XTz4qDMk5jSkv87Y3TGI/POnijbQvr9lG9tt69PNuFp5CF83pI6T
 colMNPrFPDRLR7t4pDDnVG5fJpbHzNrOQAQhA8oWWq5OYleQV0PZowxSGkHDMWtHoyC3
 UY6LS6PsquZtj5Y+ZUsiQuGp68PaOZazfVOrE8YOly6cEavt2JtTiWJqw74lFwKdL/4q
 +3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fq0fN3wHA48GNTZRD1sHCkuC5wNorM3KMo/gVJyzLng=;
 b=nYpyEWw2OB/zfszhhgGybUdZfcn0OAql8h+yfmB/K8FmYZ+jrd2XmGVVqtl7vq7VX2
 /4hoqWu8yYD6rrC+obigJzZwG20lH0TGHGm03bsJy5bO38nafx4XXfxYCtoYPDzGz7/p
 rLW+LIe+CWL2eEDvYouP+zO0xB8mAAqxVMpx1gOPJZii/ocWfs8+H65OLHe1f9Zod6gY
 ze0wSJcr5TOsYqvRj642Hpay3ejRLIoCobmhYqUNxajJfRFbr0ZbS4Wn0ltVn+DgKv5K
 pYDdIK4JdAB9P936HtKXdGZXv4vfv2Qv8glloP45n4YGoP5acgBfSfT4OcMpPacpNj4z
 yEoQ==
X-Gm-Message-State: ACgBeo17AG1VQCvf64T2HU+Gai44jKoZj0/pggKgMUjfsIxWwSKnePgR
 n2kakNeKunRADNWO83K6/4IXCAhMwRY=
X-Google-Smtp-Source: AA6agR7PG2o+PqUIYCzyM4bd4NaH9/Gaw9hYmP6OiXODmq2asi1SaJObHwI7MeSaAu0gC0QA8Sff4A==
X-Received: by 2002:a05:6870:608e:b0:104:887d:4c64 with SMTP id
 t14-20020a056870608e00b00104887d4c64mr1986883oae.173.1661523138772; 
 Fri, 26 Aug 2022 07:12:18 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH for-7.2 v4 08/21] hw/ppc: set machine->fdt in
 pegasos2_machine_reset()
Date: Fri, 26 Aug 2022 11:11:37 -0300
Message-Id: <20220826141150.7201-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

We'll introduce QMP/HMP commands that requires machine->fdt to be set
properly.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..624036d88b 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -331,6 +331,13 @@ static void pegasos2_machine_reset(MachineState *machine)
 
     vof_build_dt(fdt, pm->vof);
     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
+
+    /*
+     * Set the common machine->fdt pointer to enable support
+     * for 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = fdt;
+
     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
 }
 
-- 
2.37.2


