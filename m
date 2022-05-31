Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B046D539915
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:52:54 +0200 (CEST)
Received: from localhost ([::1]:58566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9nJ-0003Tj-Hg
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9k3-0000Ea-5p; Tue, 31 May 2022 17:49:31 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:33963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9k1-0003Kf-GV; Tue, 31 May 2022 17:49:30 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f314077115so232078fac.1; 
 Tue, 31 May 2022 14:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1XLQXA2zIOXa8yl+dwEEXPr3as/VYtJrfGwXifLwIjM=;
 b=OrxyjbLJVnhS6BWG2fF8oEJ1xsQRstxk67hmyJe63G1qTjLDOHLI6E5VbEliLjBXaR
 mxfDDQqWCQzaUm0IV22OlMQEswBBIf46bR2jFh10WoAsUuTPDb+nUVG/GA6Ja0KHNvU5
 IeWURvmz9JBOZ+L0s3OoSB7SrD69qzFOFrEQ51O/toeau2hqP6N3SHRh1w7tQUWscYIM
 1fBw4sd5POWwjzBDDsfFf5QAuRoT3+omXAGq/J089THXhgiqKsxGL7NS8Hmeh6HJ7NDs
 Upl8n/VFjUTWhdfkQJ4I3HikHsP5x4+o9brAqeLaYgRulIAUBQ8el0vKNHD2TaRYF75Y
 KazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1XLQXA2zIOXa8yl+dwEEXPr3as/VYtJrfGwXifLwIjM=;
 b=MfZ1o/nGZsl4Gu97UKlLFa7vgCFTYQLD2FJ0+ESLg5fyMGpGi1JnloMlDa0evmb/ix
 dnE9cCEWJVbDMKNV2l13U4CceZNcrR50dvz4QErWk1Fa52jHQbNM9rl536lE9A9QXGSv
 LMjm4YD9UEE7AG2DQJXCKYXVpOFCVMlvaGUnnKa/nwbxAko3L2b9JF4AXz8pzTPWUC4d
 BP6gsh+Ceg+BQoXxap6iCfHtJ9fPz0hD4f/KtFD9+QeP92mv/OfburFYTZwKoQMKjeoi
 AkGAKdcWIDNDamlehPAUJ6Roy3i3YcvX5/WA2R0FFpd8RwbdvYeqBULF1iP0lagOseeQ
 mPjA==
X-Gm-Message-State: AOAM532xC7iOvGRFf7u7oSYjefpA15dUcUcOFijzq0x860Ov71HxuKCT
 q3T51WP6r2GEbmo8janTtR4Y3dfN2d0v8Q==
X-Google-Smtp-Source: ABdhPJzROxIgbc2tK/iKSHv8JzSlm4sNTzDy4k+RJq2BIdsnAV/B0j/Wm9qxBHnxslGHk3B8P6iKFA==
X-Received: by 2002:a05:6870:340b:b0:ee:37af:2722 with SMTP id
 g11-20020a056870340b00b000ee37af2722mr14447387oah.91.1654033767682; 
 Tue, 31 May 2022 14:49:27 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 02/16] ppc/pnv: add pnv_get_phb3_child()
Date: Tue, 31 May 2022 18:49:03 -0300
Message-Id: <20220531214917.31668-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

The ics and pic related functions in pnv.c relies in the fact that the
child device of the chip is always a PnvPHB3 object. This will change in
the next patches, and the PHB3 will be a child of another device that
will be attached to the pnv8 chip.

To ease the amount of changes done later, on let's create a helper that
retrieves the PnvPHB3 pointer from the child object in these functions.
After that we'll have a single place to change when the chip starts
using the upcoming device instead.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 7c08a78d6c..aaf4d241c3 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -652,10 +652,15 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
     return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
 }
 
+static PnvPHB3 *pnv_get_phb3_child(Object *child)
+{
+    return (PnvPHB3 *)object_dynamic_cast(child, TYPE_PNV_PHB3);
+}
+
 static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
 {
     Monitor *mon = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+    PnvPHB3 *phb3 = pnv_get_phb3_child(child);
 
     if (phb3) {
         pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
@@ -1942,7 +1947,7 @@ typedef struct ForeachPhb3Args {
 static int pnv_ics_get_child(Object *child, void *opaque)
 {
     ForeachPhb3Args *args = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+    PnvPHB3 *phb3 = pnv_get_phb3_child(child);
 
     if (phb3) {
         if (ics_valid_irq(&phb3->lsis, args->irq)) {
@@ -1992,7 +1997,7 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
 
 static int pnv_ics_resend_child(Object *child, void *opaque)
 {
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+    PnvPHB3 *phb3 = pnv_get_phb3_child(child);
 
     if (phb3) {
         ics_resend(&phb3->lsis);
-- 
2.36.1


