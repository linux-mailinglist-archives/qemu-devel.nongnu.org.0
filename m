Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5345A55964A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:18:53 +0200 (CEST)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fSm-000523-Dk
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0h-0002IK-RM; Fri, 24 Jun 2022 04:49:52 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:43672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0f-0000DV-Ps; Fri, 24 Jun 2022 04:49:50 -0400
Received: by mail-oi1-x236.google.com with SMTP id q11so2749796oih.10;
 Fri, 24 Jun 2022 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9D0tUD26PSk86Xf2Qt6CGYPzLAH9wbOoYCVimWLzjX4=;
 b=HbEPoWqPBHhYK12tA9bzEMY1al98YIf5Z/vVO7nh3MAEx4+GgBa4R6J8/OpgUrOiiq
 rGbztraeFxkYAbv2U59iBfapLEYPEqep7a43z84gwUWoFt3uu9NtAvQX3UHPznOZBcYt
 6OGguo0tSeZlrt84EIGYGPjPr9WVVWHCYb7l9YAmRLIHKXuuKhVj0Xk0KYF1JM8y8S6L
 jGKoIBDSjr7VdpQRqL7vd5JLQ3BsOZgZzhHfqXLl1bYAv9VZ0pr5MKUKzIXyUBczOgBc
 EmZ2AmZXfaLmoLz8MHlG3ho/MTFIAxm6SbdXlCu0DbEXVldniFPkkruK51Nhffo+/4aj
 VIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9D0tUD26PSk86Xf2Qt6CGYPzLAH9wbOoYCVimWLzjX4=;
 b=b+I0Ngwg4gRkUG+LR3ys3ApP/I3KBHj+lj2BywXg4KSqfRI9OvUUAro6CkqyeuUmR6
 Jzdhs0f1GXHvRCiwdBv4leSj+szuKncvVV47vdLCNcjNWHbFJ0u6WYL7j1rp24XagsNl
 aNQrjf7jy5miM27Dpj6dD3apQ1CoE/EG//jYVdbX9SMB9RfQ1zBlfUMHhH3iU/Ud5IXA
 sw1AENMhgP6uzqwG4yIA3auObFIhenkgvjnB9qBNeA6enRIt6Oczv93GfubY9IffWRka
 xkECpxl0T7PqxfunyB9tptnrwgn/kJaqwVMxX/8p4RLWgO4aABL12+29BcMOC/dWSvi4
 v6HQ==
X-Gm-Message-State: AJIora/iv8Ic9+z9QxYnhElADGExIogQxmoFgKqADJXGsUdZHxaHMZ1P
 rcoc9xNxyEihuOpB4Pp05hCI1+skwRo=
X-Google-Smtp-Source: AGRyM1urpJVsylywnhVhMz9PdahvuAtkXdR4BKOqgPHZvpYBkNYSf8fU1SEio1TInj/IbVyeWkfjPQ==
X-Received: by 2002:a05:6808:1919:b0:335:370d:280d with SMTP id
 bf25-20020a056808191900b00335370d280dmr1308069oib.117.1656060587616; 
 Fri, 24 Jun 2022 01:49:47 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 10/12] ppc/pnv: remove pecc->rp_model
Date: Fri, 24 Jun 2022 05:49:19 -0300
Message-Id: <20220624084921.399219-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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

The attribute is unused.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c     | 2 --
 include/hw/pci-host/pnv_phb4.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 0ef66b9a9b..8dc363d69c 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -260,7 +260,6 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB4_VERSION;
     pecc->phb_type = TYPE_PNV_PHB4;
     pecc->num_phbs = pnv_pec_num_phbs;
-    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_pec_type_info = {
@@ -313,7 +312,6 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB5_VERSION;
     pecc->phb_type = TYPE_PNV_PHB5;
     pecc->num_phbs = pnv_phb5_pec_num_stacks;
-    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_phb5_pec_type_info = {
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 29c49ac79c..61a0cb9989 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -200,7 +200,6 @@ struct PnvPhb4PecClass {
     uint64_t version;
     const char *phb_type;
     const uint32_t *num_phbs;
-    const char *rp_model;
 };
 
 /*
-- 
2.36.1


