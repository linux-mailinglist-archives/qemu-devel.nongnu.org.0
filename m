Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203DA5A866F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:08:30 +0200 (CEST)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTT4e-0006mL-QL
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoD-0002vU-KO; Wed, 31 Aug 2022 14:51:30 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoC-00081R-33; Wed, 31 Aug 2022 14:51:29 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-12243fcaa67so3627821fac.8; 
 Wed, 31 Aug 2022 11:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=maOtvEyxCjJlLbbvZggWNQ0bVdJobpViTB2ScqYa4Ok=;
 b=Mif8wElBzZn7S/wo6EpC3dx+XwT+2EvG5gxfaohGx/Xx3BUE8o0X+Qmq1IHSHM6pcv
 CDEn9wMn4tTj6gJdXVVXVNAb5DsYPFHpziay6he9pDBLE7yQreClgZH8YPmGHC8Mq1pd
 znQt0z/hGmk5yMaIYdDkqsgiFImEdW6TRPAEjBR4H6eA9E4hlmU0kgJmB6T9UM+TLLZU
 PaOZvQHFRXJ0QPNTeHTt98DvQboYUQ3c53YkRz4YFxRSNRG+x2q34Lkr+FZg9TZynQA6
 5fAilwo5mZVHApDRQ25HOYrs3L3AwiNhJwOOJElzpwfQfW3z478cfHHI+GcIh+qgrkmP
 jawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=maOtvEyxCjJlLbbvZggWNQ0bVdJobpViTB2ScqYa4Ok=;
 b=BvbL5jT+o2TjRhRvb9rxRNZ9E3SG/PcT68ZTtkXWBXqdgIPJdonUfSlO1IMCCB5g0R
 AcfdTqUeSqA6zNXvfagcT4xsHbNLNArBQeAc07MbHRHrVBDFuygAjwBqhcA9uKpGm41A
 IFkpdq1MvJJnTrUkaRbYVA/K3SAWn6TmPsVY/ZIxddkn7GW8K/HZ7W9z6NgSCnrkh5kb
 1ZBgF7pUksjfC6HZn4OEgj0kKnbpVQ8Pyp7DGWc/r1PIeopd0vlKdBiU/DqfH7zRabtX
 qGx7r3nZukRXsmDxUTzugLrZZF0GWlgWZCKDq02t6qee9pnbKBWp86lLcfAeJVqetB/O
 esrA==
X-Gm-Message-State: ACgBeo19aOZJgJskn1gxdUvtHaRkGVvt0wooyzKPK1SPm3LiPfq6jglf
 6dn4nOfAOCDjWcVAJe0jIZVCfJpITpQ=
X-Google-Smtp-Source: AA6agR57+WOgDmpr8D0hWTIoM2VFNdt8dlzbX/IHTJP+Lkms2ce1LaMl0KIMnFqbiG8I4jbmoemRww==
X-Received: by 2002:a05:6871:154:b0:11e:33b7:ddf7 with SMTP id
 z20-20020a056871015400b0011e33b7ddf7mr2093686oab.116.1661971886945; 
 Wed, 31 Aug 2022 11:51:26 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 15/60] ppc/pnv: remove pecc->rp_model
Date: Wed, 31 Aug 2022 15:49:49 -0300
Message-Id: <20220831185034.23240-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220624084921.399219-11-danielhb413@gmail.com>
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
2.37.2


