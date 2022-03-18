Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B44DE040
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:49:11 +0100 (CET)
Received: from localhost ([::1]:60348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGis-0003Yc-I5
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:49:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGU0-0004h3-H6; Fri, 18 Mar 2022 13:33:49 -0400
Received: from [2607:f8b0:4864:20::22b] (port=37401
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTz-0002Bz-3i; Fri, 18 Mar 2022 13:33:48 -0400
Received: by mail-oi1-x22b.google.com with SMTP id q129so7472313oif.4;
 Fri, 18 Mar 2022 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVb5c++t288vr7BV98pG2n6JbwWwcLnK2P7v8qIUDaY=;
 b=j9aJgLbW9f+P4gMXd2XQby2giIqAcgsZXXGJhapLeoOfZYiXcfrQ6+sE8psax5cnoT
 /260QnQnFSA/o6ftZ5iyxxhnY58aFJxMta2cvorztAM+Z0OTt4WRQWYkE2rnewTdUUhc
 0NzA31vHNKG6uw64qGnHHodotevboaQjOaYA/r43LcTVUA6p0ucXcb+4PxmT7hSaN3YI
 45oXq1FQlsJtSMt/pH6KRCUnsYVc5qH4WRhC0qZwJDHS9oo3HoDW0QZ0zGlS1pfK6y7q
 nFutg3JBN7n8rYYuTvBaTzXF2RA3wsGHRfpb4oL6QxlYiWD6dLWOi8oQq7miOsCzlwiN
 FqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVb5c++t288vr7BV98pG2n6JbwWwcLnK2P7v8qIUDaY=;
 b=dz+/xPrG8971dQlCSR6sBlLhDYhFh3JCV4+iJtZZJ6IOX0m/gliHbEH/+TiAj3AelQ
 FxMAkW161wC5ghVPGvywnLMp96z86jMpy3eUp4vYXCz7KaW5SBG6tqde/CIYyU/SULF9
 tTHNM3/m/UtQTTScHYcjYvTK2ldpOrXr9ajljRfI+auvRBni09UF4c3GE1xGdKv7DqlO
 Nck311wZo+rdpyfO7mI0v8ooOvMpWqrcQt33wCFUrbI7QODszGuqicF3ZEAO8wVFm9ck
 Iv5OQnGysbebY0xKfP38byMUKG7+hkwBUHcbaw1Ze2QQfNNJA+JBIYw0g25u8MR/x7ZI
 tnvA==
X-Gm-Message-State: AOAM532LaMh2IzaNk92RJU4bfMWh/Ek+vcUAJsU3nSkr3o6f5l7r0TUA
 L3fsWAxOH+DIGaOUpspMHaoOvo8fNtA=
X-Google-Smtp-Source: ABdhPJw0YRE6lxVzks4OoqPlHpGJtPkyvLc+bsco41TiIa2jCV8i2YZrnReL8hAz0erhb72wCWOf4g==
X-Received: by 2002:a54:488d:0:b0:2ec:f566:db6c with SMTP id
 r13-20020a54488d000000b002ecf566db6cmr4766623oic.109.1647624825763; 
 Fri, 18 Mar 2022 10:33:45 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 8/9] hw/ppc/spapr_pci.c: use drc->index
Date: Fri, 18 Mar 2022 14:33:19 -0300
Message-Id: <20220318173320.320541-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 5bfd4aa9e5..f9338af071 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1419,8 +1419,7 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
     g_free(loc_code);
 
     if (drc) {
-        _FDT(fdt_setprop_cell(fdt, offset, "ibm,my-drc-index",
-                              spapr_drc_index(drc)));
+        _FDT(fdt_setprop_cell(fdt, offset, "ibm,my-drc-index", drc->index));
     }
 
     if (msi_present(dev)) {
@@ -2429,7 +2428,7 @@ int spapr_dt_phb(SpaprMachineState *spapr, SpaprPhbState *phb,
 
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_PHB, phb->index);
     if (drc) {
-        uint32_t drc_index = cpu_to_be32(spapr_drc_index(drc));
+        uint32_t drc_index = cpu_to_be32(drc->index);
 
         _FDT(fdt_setprop(fdt, bus_off, "ibm,my-drc-index", &drc_index,
                          sizeof(drc_index)));
-- 
2.35.1


