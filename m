Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F1588E15
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:58:43 +0200 (CEST)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEtU-00076V-Qk
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgi-0003Di-Gz; Wed, 03 Aug 2022 09:45:28 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgh-0004ug-07; Wed, 03 Aug 2022 09:45:28 -0400
Received: by mail-ua1-x929.google.com with SMTP id z5so3030121uav.0;
 Wed, 03 Aug 2022 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tl9Z8luQcwSh6QRgPGjf321Es9TY+GefKufsOtFTomE=;
 b=R9PkPcKWwk7MgyCTfIhGWm9O4aUS9m6vMxpqUVElvWjP9SRzUVuUdjYZDFUJueFVYc
 +aWfaYJD6NwvKVY+4PLXWr42R9vb3O74tpXNUanvhJBCpP8vpj2MlAn+K+n0Y4gRXJJF
 BNaoFBJY+MfWsoA9fMUbpCAHNcw/p0k9mwdo7i9sJZ8CDC6IQGrbK5kgxuk7qnQowjRY
 xAQZOWgwk0ez+1cwHSGAOtDYGeJ/Z19Ad+QgsNxlNNaLV4clavb1PtgLOhQuYBGQwyjZ
 CnAtsKMqk8GXOlS49/fNBqoTivG5CL1xtvrF2YOJMJLLjF8une3LmXgSvsSHWBEkQAyb
 u7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tl9Z8luQcwSh6QRgPGjf321Es9TY+GefKufsOtFTomE=;
 b=ZTWNsvhGRite4G2GUBBNFrIDbHClGQD7i0pVNcZ4zpdn5xzWmytvSB4EzW61krIaNy
 EyVJkdScpe7mvpVXTsyIudOxyalsHfIe2znvBEx4w2bKejKwJHy5FPyjxGTSoZS79qjJ
 qEqpP0e+QmjmT+VDMhl3XDEm0tAuy/Fn7WEcMo3s9K318NhsrBXCFuCU6uUnUq3OLpaX
 aIwQUvKIP27Z0sbvZwHs0+SKznEA8XdFEdxFuVyYsGX2cH1+ajzya4gg5yqKADT3vfCQ
 ICOUqsFkMXPP4ELd708slNwnIosmNX2tPSiPYPCvwDhjoUXm69AJ782l4oDppqlz8GkM
 Fc+A==
X-Gm-Message-State: ACgBeo10+XOOTc7rzNYr5JugzGaET3P/21fde8PpyIQS1Jvx9+Oy48FM
 7mRjfggPoo/phbyQzteIO5p8OOSVR6I=
X-Google-Smtp-Source: AA6agR6ZT+RoVFfJ8S+9b8kJBfxCwKo8XPU4CRhThsdgznqH63qh6oJPfmlWV23h0ytpWVUtW84TSw==
X-Received: by 2002:ab0:38d5:0:b0:387:5dfa:95e4 with SMTP id
 l21-20020ab038d5000000b003875dfa95e4mr6114870uaw.50.1659534325292; 
 Wed, 03 Aug 2022 06:45:25 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 10/10] ppc/pnv: user creatable pnv-phb for powernv10
Date: Wed,  3 Aug 2022 10:44:59 -0300
Message-Id: <20220803134459.2633902-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
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

Given that powernv9 and powernv10 uses the same pnv-phb backend, the
logic to allow user created pnv-phbs for powernv10 is already in place.
Let's flip the switch.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index b6314dc961..02f287feab 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2159,6 +2159,8 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     pmc->dt_power_mgt = pnv_dt_power_mgt;
 
     xfc->match_nvt = pnv10_xive_match_nvt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static bool pnv_machine_get_hb(Object *obj, Error **errp)
-- 
2.36.1


