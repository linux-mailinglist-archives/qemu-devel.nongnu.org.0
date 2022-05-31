Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69B539956
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 00:07:07 +0200 (CEST)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwA14-0008I2-F9
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 18:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9ka-00023Q-RU; Tue, 31 May 2022 17:50:04 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:44612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kZ-0003Qj-3W; Tue, 31 May 2022 17:50:04 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 r14-20020a056830418e00b0060b8da9ff75so4355964otu.11; 
 Tue, 31 May 2022 14:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1CO+abnUZIECsc5SHuhBWiPEPJjWevYjRB7mAYkbx+M=;
 b=mzjwxXGRqwccmt+ag6I/MtKcBUvXeDQAGMPU9uLEWf4I+s2j8khRGv7BkWR/31n2EC
 irPQ3PipyjcE00atU0LtCi51SnUIEVefyj0vw7IHCTsxPnK0tExKL8LoYxvT1BpX3ET2
 iQTcxROHlyoRtOhIn5PYSHdIVLlR81DCIYUEt0p+gQKswEonuogV854+2SiC8tbIZ7Hk
 8vCzT4/KukpdDyMDgiVje122snFCBwLlHcYs35JvsuiRcpTJN13l/u0bHNyZsgKyW8+l
 hreWEGacqyzEmwfwRQmyz9uGApXMCasaWnFjUQtM/EMu+/KwgnU+RVR27Jkn3FwDaiYO
 VviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1CO+abnUZIECsc5SHuhBWiPEPJjWevYjRB7mAYkbx+M=;
 b=JrdVMNAFGJ6GdHl2KCHFtyiDVL4AfdanK1iutOl7zUVgkarDELNQaL9zok0UA/WJS1
 Kr6TYYv/8+a4siFDR+Ec18i0y46KmHotkPYoQWsxzTxfyzJA8iFbOHGq2seZjwyn6SUW
 AQRLEiKhBiEfIlJTqx42HBVhGsyJoI2BWnznGJWXHMtALgzY/ovNcPRvH1LCRdULnfzx
 vZsfndEfVnaMkKw5oEoJFyQ37yKz54l96A3Roe8OaAk37UECP7PsPA/yDjRtqagIv0Zp
 sDyqH2cL3B6k7MNGA17iXt+XqF9aXhO/dW5WCSsdZtqjSXgnx2qn4sy3phyoMLrv9bwD
 bEGQ==
X-Gm-Message-State: AOAM533jVsDgKuwgGyQeov5qB0IhXGkjd5xxu/i3nwKay+zOMofWE6ab
 Moxrx6RBmn+X+j2u94SLD7xheWoYQnx5Mg==
X-Google-Smtp-Source: ABdhPJyAocJY9v81SCuuTdXw4n4z1VqZod4xZH3cOJvzokCojLvoH6+VEOYG05OvqkfBY1GwLrxB4Q==
X-Received: by 2002:a9d:c24:0:b0:608:c7a1:5908 with SMTP id
 33-20020a9d0c24000000b00608c7a15908mr24000770otr.88.1654033801542; 
 Tue, 31 May 2022 14:50:01 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:50:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 15/16] ppc/pnv: remove pecc->rp_model
Date: Tue, 31 May 2022 18:49:16 -0300
Message-Id: <20220531214917.31668-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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
index 785b778396..8f11e077c2 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -262,7 +262,6 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB4_VERSION;
     pecc->phb_type = TYPE_PNV_PHB4;
     pecc->num_phbs = pnv_pec_num_phbs;
-    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_pec_type_info = {
@@ -315,7 +314,6 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
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


