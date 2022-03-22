Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE74E4647
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 19:51:24 +0100 (CET)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWjbH-00043x-4j
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 14:51:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjVe-0001Js-Q1; Tue, 22 Mar 2022 14:45:34 -0400
Received: from [2607:f8b0:4864:20::22d] (port=38834
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjVd-00027U-A8; Tue, 22 Mar 2022 14:45:34 -0400
Received: by mail-oi1-x22d.google.com with SMTP id r8so2197002oib.5;
 Tue, 22 Mar 2022 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7f8Slps6kTB2L0YS104RO82zM8TUqid6XT3BdhH7GY=;
 b=VH6gPE89Llad+njQE/v47cxzqsRrf0DyOPg8AfNP+Ulv61TYWfWXabKdJigR7SEjtG
 Ki3EcroXZG2kBT5NUnR4BW5RXNLqR9M0aHjSJiFX6M2fEwJRxSLyKATlPDeQv2AvfBBf
 toPGQwU18i0hLS9mgyCO+QW95LtBJvvYpXDjnVI0PjWfEpVP0CPGcdteSfcdFjJ7aQoK
 Alr+0pn11muC3MBVvwJdoqEShP5/I3z1gg3Tv+l/N5uWcLNXaFlR9eAaHj/uKrQlowXz
 ZyCMOAcA1ucd4cK2Aac4N3g+jb2f1QeoYxXGJLXtnaWpRJ+iM/aQt6L1Q8xSbNSapwYB
 hzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7f8Slps6kTB2L0YS104RO82zM8TUqid6XT3BdhH7GY=;
 b=FhGxyVDwyX7PjotGECS5c/3n7bKOA7HR8QqeCV5sjeJverS/e4CoiuxUJu4nvvLYbk
 4k9neYRqcmS7QKJWbaOPBF2xB9kOEL/Q3tRjd0Psa6r+NjxJycmX353iqQ3b678rfkkh
 OwQg1HEc5Y1O1p9OFdJIY0VkHhsdrjHqcHF4/pF5TqsZqYImLrfkVRIgkq91Z8D/1pAx
 vVgo+y3Vrqc2Bl3dH40A0PEUEEGaccAFP5t/6AxobMrAIH1v72+eUS1h3bXaFn4p8G9g
 shdrQRdEfZDXKaE2cBXArZ3tusBhB9X3oepDO6NNQXA7maNnNcG+4bZtepD2faNccS4C
 670A==
X-Gm-Message-State: AOAM531LoBN1EWSa2QyugLjHjTZpdRfeQRXr0PFWIW/Ew/VepYCwz2Yi
 KTePlkFzpHkRuFKFoUbssJRaayoMQKY=
X-Google-Smtp-Source: ABdhPJyhjZLulNyjNgi75jSqgCI3hDH47oTLrG0vowtktLEDnBLb4gYIuoTqKvPImi1I8WorMmOU4g==
X-Received: by 2002:a05:6870:42c8:b0:de:193b:cba6 with SMTP id
 z8-20020a05687042c800b000de193bcba6mr2402362oah.204.1647974348630; 
 Tue, 22 Mar 2022 11:39:08 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d0469000000b005c959dd643csm9109627otc.3.2022.03.22.11.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 11:39:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 2/4] hw/ppc: use qdev to register physical DRC vmstates
Date: Tue, 22 Mar 2022 15:38:52 -0300
Message-Id: <20220322183854.196063-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322183854.196063-1-danielhb413@gmail.com>
References: <20220322183854.196063-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to logical DRCs, let's convert physical DRCs to register their
vmstates using dc->vmsd.

The same constraints with instance_id being set to spapr_drc_index()
also applies in this case. However, since realize_physical() calls
drc_realize(), qdev_set_legacy_instance_id() is already being set.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a5ef64d2a2..5a60885876 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -640,9 +640,6 @@ static void realize_physical(DeviceState *d, Error **errp)
         return;
     }
 
-    vmstate_register(VMSTATE_IF(drcp),
-                     spapr_drc_index(SPAPR_DR_CONNECTOR(drcp)),
-                     &vmstate_spapr_drc_physical, drcp);
     qemu_register_reset(drc_physical_reset, drcp);
 }
 
@@ -651,7 +648,6 @@ static void unrealize_physical(DeviceState *d)
     SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(d);
 
     drc_unrealize(d);
-    vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, drcp);
     qemu_unregister_reset(drc_physical_reset, drcp);
 }
 
@@ -662,6 +658,8 @@ static void spapr_drc_physical_class_init(ObjectClass *k, void *data)
 
     dk->realize = realize_physical;
     dk->unrealize = unrealize_physical;
+    dk->vmsd = &vmstate_spapr_drc_physical;
+
     drck->dr_entity_sense = physical_entity_sense;
     drck->isolate = drc_isolate_physical;
     drck->unisolate = drc_unisolate_physical;
-- 
2.35.1


