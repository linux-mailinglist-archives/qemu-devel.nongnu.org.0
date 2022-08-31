Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AFF5A86D2
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:35:48 +0200 (CEST)
Received: from localhost ([::1]:36052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTV5-0006QU-4x
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSom-0003ig-Kr; Wed, 31 Aug 2022 14:52:04 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSol-00086u-1n; Wed, 31 Aug 2022 14:52:04 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11edd61a9edso20211602fac.5; 
 Wed, 31 Aug 2022 11:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mVFogPrCk7p6fTF2Pz5aJkmbnscDLacQaUoqlMD6eSg=;
 b=LGAgxfodbbcq1xCvbDYSgSrlNcBSQ1PkrwY/BcsGCkIh5XpKcfCQNtAfZ2xw0aYoR2
 fGUriUiwGSaQuIB9sxm1xStPX6pBP/UAcBoWfRWIMVrs0mzEmTPOAU8Wsd7WBOzFRugN
 S9Eopa6Pnf5QP8kzYBt1MNn14unZVR+g5LEgprNpw7k22QP9cxbQY0ZL4Fylbr+fk0C7
 GA1m9akCVdR4UeB3LjSDBY/Gci9d9WlMNxiYf7nsmxu16NYlzE9L+iUFcA6KMpzDm9te
 CZL2St9VZ5GSB8xg7DwfyOcg4+vCaHJtRk/fjFqBtkCxvIp7+h+S5N+jrmb90SnVUi5Q
 vcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mVFogPrCk7p6fTF2Pz5aJkmbnscDLacQaUoqlMD6eSg=;
 b=z1YoXN0CbO55LgLrM94WNKUVdOsvd3iOmvYrmyJcRacQbwzfnEppIrQC+f0nIyp9rQ
 FKbF57+ttZo1XRzjY9RwI6+18JL2D8JYKl2YgMWkGjIfWf/1fbBdWiOot4F4PbWwQS0h
 xBQXzr6AqUH+otFjbjugGHKkDFacAGulVp7VARt4c/p9Q9NdmvNSTyEbuGdyGkoL2cMC
 5EoYDy9lOfH1BTZVxWWWBNve/FMyVmEWqQCZrtrL8NWk76yG4bTuKBaCswak5rqIfnd6
 Y2zZGCO0lJZkFEC8eSLVSIC15EqRYh0x5MUwRNvTXtFyPSWud0NXzBrBuxS2w95qbKbx
 kGYQ==
X-Gm-Message-State: ACgBeo3x7t9my5yXi8EbM38CETVzPX4qblBfsOeAvafuFnNifTIT4E05
 IW2nyvTxKKzQgwrT4q4uS9OQr2nU+QE=
X-Google-Smtp-Source: AA6agR6JS54IM7qfLMEVF6rnYZgBXBvFU4wA/ihyEe/X0ZeghSqYk3LyhvbFswIecJXySrITxSRyjQ==
X-Received: by 2002:a05:6870:f103:b0:11e:96c4:9239 with SMTP id
 k3-20020a056870f10300b0011e96c49239mr2048632oac.18.1661971919516; 
 Wed, 31 Aug 2022 11:51:59 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 27/60] ppc/pnv: user creatable pnv-phb for powernv10
Date: Wed, 31 Aug 2022 15:50:01 -0300
Message-Id: <20220831185034.23240-28-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-11-danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index c063d01f8d..354aa289d1 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2251,6 +2251,8 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     pmc->dt_power_mgt = pnv_dt_power_mgt;
 
     xfc->match_nvt = pnv10_xive_match_nvt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static bool pnv_machine_get_hb(Object *obj, Error **errp)
-- 
2.37.2


