Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C432356D68
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:38:36 +0200 (CEST)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8OB-00065f-OK
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lU8NR-0005Z5-39; Wed, 07 Apr 2021 09:37:49 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lU8NP-00077L-Bw; Wed, 07 Apr 2021 09:37:48 -0400
Received: by mail-ed1-x534.google.com with SMTP id s15so5942573edd.4;
 Wed, 07 Apr 2021 06:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kk17FMJUo/m9ouAK7Ve/JRf9B5bmijM2EW2uqtHeQaA=;
 b=BxfiAap+lujhYLuwBt9vgxgPqojvBRrqGxRPK57g2zkAbcL+ZYBqBFnAjvawhFyYvs
 uNBaqvOWvYgP4wE2k0YotsHZF+KfDhM0Z2iyh1p2R+oUQgXiqTp5Y+nxxHrBIZiXlCpz
 3W+6K6hpjZKwSL3986c4WqJ7ClcdI46FzDXRbEZF6mcFGlv+hfUuloqsOoQoxzZcoCFn
 yyIVr36fdJTpp6B+pNJOJHlHvzsKo29QiOSBs7xUueErvW1sfMjDufZMB2fv2TJJFpQe
 xtY82I18jiLzM6+ADVQMgcZz+7KKwDztNk7GPh6lDX9GYwjmXoKyxeZpSz8hegJzF6gI
 Ch0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Kk17FMJUo/m9ouAK7Ve/JRf9B5bmijM2EW2uqtHeQaA=;
 b=WA7CHq/JWn3+ZApQD9D18L2lFlYJqikqtPaWOyIr48zsrYQ7fRe1zB0roZrtERoPpm
 o7MKjm3MdHhD/uhL1nEvOsdBLZU+MFBhhD29pYgqtLRFRQ3aRafCLU7OZfAQwRXMdOfh
 Z0ZkIX05/aTTwFt4hAYxWJVm7J2BZ3IqKoP/wWEZieNlgRqwoGgjcxKJN+5ruz1a2O2r
 OOYe79ukxmlpjufrwAYNIBZdM0KEvRZU+tnY424ebx5JiYYv0LMT2hz80nuNZVFP0SQs
 O8J9/U3j58hCDBylbAItpI1YWhoaqGieeAGMRIlegjUJfVk5Haf8UoPF2CjdzD0R5FMl
 oOkw==
X-Gm-Message-State: AOAM532W10KpvlMHXXrvgh0d58TxIZN9if7pMbh3mhDx0y3tGyaMl78/
 uOT4wm0ER84nNxXpkrvIfPoV2rtqe6XV/w==
X-Google-Smtp-Source: ABdhPJzB6ZYUa9H27EtgXixYvFO6Fv7ZWX1B2kOAQ1ivKQcIN77WcWGYKjEyKm2hHJXHqt1RsEidUw==
X-Received: by 2002:a05:6402:1051:: with SMTP id
 e17mr4555156edu.42.1617802664917; 
 Wed, 07 Apr 2021 06:37:44 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id ho19sm12343399ejc.57.2021.04.07.06.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 06:37:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0?] hw/block/fdc: Fix 'fallback' property on sysbus
 floppy disk controllers
Date: Wed,  7 Apr 2021 15:37:42 +0200
Message-Id: <20210407133742.1680424-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting the 'fallback' property corrupts the QOM instance state
(FDCtrlSysBus) because it accesses an incorrect offset (it uses
the offset of the FDCtrlISABus state).

Fixes: a73275dd6fc ("fdc: Add fallback option")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/fdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 82afda7f3a7..a825c2acbae 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2893,7 +2893,7 @@ static Property sysbus_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fdtypeB", FDCtrlSysBus, state.qdev_for_drives[1].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
-    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
+    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
                         FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
     DEFINE_PROP_END_OF_LIST(),
@@ -2918,7 +2918,7 @@ static Property sun4m_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fdtype", FDCtrlSysBus, state.qdev_for_drives[0].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
-    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
+    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
                         FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.26.3


