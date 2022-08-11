Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004EE590520
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:54:57 +0200 (CEST)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBSS-0005zP-QJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEL-0001Yj-8t; Thu, 11 Aug 2022 12:40:26 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEJ-0003j9-Bd; Thu, 11 Aug 2022 12:40:20 -0400
Received: by mail-vs1-xe31.google.com with SMTP id m67so18770091vsc.12;
 Thu, 11 Aug 2022 09:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Sn4xl/142S+OTYEPzp1yUWz15FgOyBWufr7c6LSMjp4=;
 b=nI36pYXdy2twWkprf/4mCr42b5LT6OqsGao4fgcj9S9tr4aWA2YrkPdHyj92I7JxmS
 QQ7fEBYqL4zwpiHl5Xw2/CvIPA2q9LH2sFi/qWb8SdZj3tsazQmEnRj4gii4TzvnOJsq
 V1QxFeTig4+v+EbXHuSUtApNaxXgZS5xdzHH7vKiK/B9NJrs9qVkHyWjQMtMZ0t0Jqlk
 CRp4rAMivZs9BxpWat2rCQAg0PS6l7oJoE7oU/qZWZNuFJHP4IdeKzuiTa+4rDFbR/3L
 Yu46kbx2/gsWrTvqN+vkNxQW+CScdBfcZ4kJIeOqAXuDI7tf83YOcP9n+QTCsKDJAhP9
 lSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Sn4xl/142S+OTYEPzp1yUWz15FgOyBWufr7c6LSMjp4=;
 b=7YnKz6v2m9KTCBLX+8LSTYJlMR/V9mErZ0W/Eq92w6ct/qh0V/NxE6L9YPqQV1pfaQ
 a8HTH7uSipXolSM7sn1G/W9eR5laKM1PViliQYYqqlAAW3mqcy8SrUIsJmtZLXa+Ww9S
 3UebPrrUbXBKNiDvhAPINQJCA8udFcxkuK3i+UUandALwuzTMfEospEkgSVgTi2IMdRT
 7xFELaX2UrDdyKycT0TE7+gZxiBg7SKSM2na5WMAs84Y/TBs6qFfBK9ZLEcditpxX91G
 kAUJmcfNFs1Vojk+fn6ewC6GmWzETfim2gndUAMLgzS4oKflGzePNaQeKs8+KBVqx4le
 iFnw==
X-Gm-Message-State: ACgBeo1ZUFd32nw+On1qkIXy9lE3nqPGRxLfHJ4gT/lR9Ju6fhbugx5N
 U01wacCImyKGYLfsd7sE83231v9dCQY=
X-Google-Smtp-Source: AA6agR4TbrrW6LRglbvDVB7s+EinQt7PA3AJVGhZU7e+z0Ltgy3C76s9V0yuarc3NFG2M8mY1u5XMw==
X-Received: by 2002:a05:6102:3d9a:b0:388:b72a:7e4 with SMTP id
 h26-20020a0561023d9a00b00388b72a07e4mr2510vsv.32.1660236016528; 
 Thu, 11 Aug 2022 09:40:16 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:40:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 10/11] ppc/pnv: user creatable pnv-phb for powernv10
Date: Thu, 11 Aug 2022 13:39:49 -0300
Message-Id: <20220811163950.578927-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe31.google.com
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e6c14fe231..9bf35ca9d6 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2226,6 +2226,8 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     pmc->dt_power_mgt = pnv_dt_power_mgt;
 
     xfc->match_nvt = pnv10_xive_match_nvt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static bool pnv_machine_get_hb(Object *obj, Error **errp)
-- 
2.36.1


