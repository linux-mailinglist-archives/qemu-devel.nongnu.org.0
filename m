Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93F956BB25
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:49:43 +0200 (CEST)
Received: from localhost ([::1]:60636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9oMY-0004v2-1H
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzT-0003Dh-UC; Fri, 08 Jul 2022 09:25:53 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:47018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzR-00075X-7W; Fri, 08 Jul 2022 09:25:51 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so29156791fac.13; 
 Fri, 08 Jul 2022 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDexHeGMq2oItEKHgJ+IRqrh4m3ya+HwYZSSXayG/mI=;
 b=cHgwuYPI/fh6HNGUG0Xi5EkwpnEXjRzS4ghpJoM1tZM4NDIwE/UjAhi44T0OG0KEiI
 EHSyp15LKdXvRGxKZa9BariSUdve7l1gplB7eV+6I64ADa6jt64TCztPj6cJNH71qcq7
 v61fbkxWA8aukOjRTYJIMBQcLfJhuNs5n+S9iQFGIK/I3BfVYsnXxxyaNfB6LWcrZp5+
 BLWnGL7pe4HghZeb2qB6qX61cPnfOySZ73y3setn6TG0Hk9NMKz3kbXcm2gG6YCuEk6r
 oMX2bCzUkqpbTx19+s7kcE1wTM+tSrNDcIKXPwTeUEKLrCG20qhm1cISBWBwOSuMY3y0
 yFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDexHeGMq2oItEKHgJ+IRqrh4m3ya+HwYZSSXayG/mI=;
 b=ZtTzEvuoOUMAcnVhWqTVBszaVBe52HLmS4ZsFJjrh6FvOOAi/HYYnO4MqSMr255Hcf
 JUFKQfTQbdNs8GOCzA/dQ67RhovhZXya+y91oh4rH/zd5woGaWksbddXe7KBEoBOTWr5
 iMDJMdYuRi9zDoSJQN8gcVHMwpczNWVkEPYVqWywC/kjzcDwYCqg3+M9IPEwgX4B0Xzu
 jBmWqgXiJHp0FJJNa3aROaAW91ku3Lk0YDJj/AP+DSip1VUC2XdYrgDELYUCwsjKhohs
 XN/GV1+rZK4VgP2qcdnu3OWqoecjk5736sXZOnSonuTLZSL3/NQ/6zz4t3chYUaOWQ/Z
 YSRA==
X-Gm-Message-State: AJIora857j4x9PmvSAdQfahgjGFfsnEhJJ2wwovFHnNjtowxB3eZKihG
 m3SmeE88JdQbUSU1WAONDgLNMmSGDlQ=
X-Google-Smtp-Source: AGRyM1uNCPbYjdHlPHRTQHugoZaHQuvhyvwIjxXcZj1sDvakynPzLWL/BPCnYFXT7+4nAykAbvGffw==
X-Received: by 2002:a05:6870:5254:b0:10b:eaba:ef3c with SMTP id
 o20-20020a056870525400b0010beabaef3cmr5922120oai.263.1657286746763; 
 Fri, 08 Jul 2022 06:25:46 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 10/10] ppc/pnv: user creatable pnv-phb for powernv10
Date: Fri,  8 Jul 2022 10:25:22 -0300
Message-Id: <20220708132522.581382-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
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
index 32040a52c8..b9c1bbaa84 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2163,6 +2163,8 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     pmc->dt_power_mgt = pnv_dt_power_mgt;
 
     xfc->match_nvt = pnv10_xive_match_nvt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static bool pnv_machine_get_hb(Object *obj, Error **errp)
-- 
2.36.1


