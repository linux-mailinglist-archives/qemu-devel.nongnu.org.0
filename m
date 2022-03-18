Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083224DE00F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:37:13 +0100 (CET)
Received: from localhost ([::1]:47196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGXH-0001tc-Rn
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:37:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTl-0004Rs-Nw; Fri, 18 Mar 2022 13:33:33 -0400
Received: from [2607:f8b0:4864:20::22a] (port=35658
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTk-0002A4-6a; Fri, 18 Mar 2022 13:33:33 -0400
Received: by mail-oi1-x22a.google.com with SMTP id e4so6424661oif.2;
 Fri, 18 Mar 2022 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjBudQVNMTSjgOEdtYkX7WxblOTeQuNDOTsgp3296vo=;
 b=DoHolSe12gIpWc0L6rxb79auLX7c4U6u2W/zV8IXpOsdyeEydO+Y1OfarBxDi9CfbA
 vqfB0+YEuxgO5j91JXfegMRFxJOXjLKEVwpJzHKKrtwXo/fug06MlhXlcNpGBREpKbST
 9iP8oS30yq42n+dSd3Td0lC/y5/UUoFQpYN0ADht6u/i/EEG3lLPXo1LBsKt/GnlvK/A
 tX0sOC5xSw9XokMlDkOXF169LiCyXade1E6tJ2rCr0b4AeCmKPsi1D3Gcn5wBuKLtxTJ
 MfzoSlfJbg6h1Y5bRtBrssrqJogj9+62dnikYyS5bxcEQPK/fK3ndAU553dWnGL1F9f9
 dcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjBudQVNMTSjgOEdtYkX7WxblOTeQuNDOTsgp3296vo=;
 b=2lBR6YMYVWSfwPSsp+W4/RB+i9vnoWVYcvhzz+qE0o9rJiq186iAIYYi/lHdN909ZO
 ewUKMrEQSMqfuu2SjPIO6P+4eOnLR3aKHaL+8u8ifwMMbdUdmcMRacHQC+391EGUXjBz
 JX1GiGURJVhTdtgO3wmHMFR7z/ImAFmVZBv1NlnTAPucYCRQ61GOB+nNk5yEGhLqohGb
 WzWI23a5Nlz0jzDTiZFpmwv5Z571unwVkgSqECBrhabiJ9QQdv19uZrWDR9nJqaKnblM
 lfRyTrfAel56+Dw3Ae7xm2iBJ7jqc7LaZpCaTbaZkF1T2yfu2ey3Dmt1OB8+wPhYIviJ
 P2vA==
X-Gm-Message-State: AOAM533V1lkHUah6LLV5yqc1Z41+9lMcVJlvheei6ju8r14gQ8CPfmQs
 GlW41pLR/BsRnWYRKKbBtVshpfEPXXo=
X-Google-Smtp-Source: ABdhPJwAOf+Qc0CbLd5+G1/JprBdCM4RMi1BslFy/VWdOKcJdn0ozxAupbQMZxBXChEeKxRAVmmSIQ==
X-Received: by 2002:a54:4104:0:b0:2ec:b263:9979 with SMTP id
 l4-20020a544104000000b002ecb2639979mr8352575oic.66.1647624810614; 
 Fri, 18 Mar 2022 10:33:30 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 1/9] hw/ppc/spapr_drc.c: add drc->index
Date: Fri, 18 Mar 2022 14:33:12 -0300
Message-Id: <20220318173320.320541-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
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

The DRC index is an unique identifier that is used across all spapr
code. Its value is given by spapr_drc_index() as follows:

    return (drck->typeshift << DRC_INDEX_TYPE_SHIFT)
        | (drc->id & DRC_INDEX_ID_MASK);

We see that there is nothing that varies with the machine/device state
on spapr_drc_index(). drc->id is defined in spapr_dr_connector_new() and
it's read only, drck->typeshift relies on the DRC class type and it
doesn't change as well and the two macros. Nevertheless,
spapr_drc_index() is called multiple times across spapr files, meaning
that we're always recalculating this value.

This patch adds a new SpaprDrc attribute called 'index'. drc->index will
be initialized with spapr_drc_index() and it's going to be a replacement
for the repetitive spapr_drc_index() usage we have today.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c         | 1 +
 include/hw/ppc/spapr_drc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 76bc5d42a0..1b8c797192 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -561,6 +561,7 @@ SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
 
     drc->id = id;
     drc->owner = owner;
+    drc->index = spapr_drc_index(drc);
     prop_name = g_strdup_printf("dr-connector[%"PRIu32"]",
                                 spapr_drc_index(drc));
     object_property_add_child(owner, prop_name, OBJECT(drc));
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 02a63b3666..93825e47a6 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -173,6 +173,7 @@ typedef struct SpaprDrc {
     DeviceState parent;
 
     uint32_t id;
+    uint32_t index;
     Object *owner;
 
     uint32_t state;
-- 
2.35.1


