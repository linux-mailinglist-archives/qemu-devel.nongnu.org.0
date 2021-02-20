Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B783C320232
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:24:57 +0100 (CET)
Received: from localhost ([::1]:37548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG4u-0008IM-Np
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFux-00021Z-Gy; Fri, 19 Feb 2021 19:14:39 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuv-0005tq-Tg; Fri, 19 Feb 2021 19:14:39 -0500
Received: by mail-ej1-x633.google.com with SMTP id gg8so5538734ejb.13;
 Fri, 19 Feb 2021 16:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qh/0Ss/cVm5EwuEbhAfkwZcS/qVzMmiRGBnEd0cOA9M=;
 b=WENlvlvSpzopF/e/Z5IR279XevIjs3VVJKxBNg3wVJDMGxaPT0k7PmtSrAcp1xvF1s
 TMqF5S2A20nYCEamCPtoJszE3wD35gS5xZUv4fCaPBXiuQMj/x5tvEHXgJpyq+uoH17n
 0dxwj2BG3wEEsj62Bds/1yTBB8up+OTnaIzfNLoNyCj8qT4fxX/8O22ISiuxWeOvGB0r
 WRKvqM+DtUqwMj2Wfo85TM+nYif7erwWB8FYZTtjPFB67ZCxns93FQuqOPcotrsl+r30
 N3+KheR38fTY2gMRopMNr0+6vRn3NyFwNljLSPe/SN5Ugu6DWNoJRfvx2D8Plj0mQU9n
 Y5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qh/0Ss/cVm5EwuEbhAfkwZcS/qVzMmiRGBnEd0cOA9M=;
 b=pWylEAzIfq8EP7ErFXRvyX71oONpy/6e82zX67k9fyvbQFXbGR3pHR5tzRzC8RG2wV
 rNZIGD+6k0nDDzaqCr/8oP895fy/JSi+hJlzCihZyNkqKcgtNfJEHEbd7xh2lPRKiGf7
 WY/ZROGG8uns4I2kZTHRVSJTZkG8OeCNpwuml9sEz2E11fSdBAffbbGOR+m2iVSHRXBR
 vJxbmKDczgzKIaSOG1F5fFesmHxYNyx1ABsEhJqW0JXr9WOuiHDiFfpOCuIFQLp1iqNR
 t6/WTxMGsTRwhueqLezkOeq63bMrFlHZo7nV+VtrAaPTBz0u4uR3BNWajbIcH/y17Znj
 Ndkw==
X-Gm-Message-State: AOAM530Y/zgtCkOSWJUGIJVsCML9tsJMeJJDKXoVFh9g2JYmFQh4d45O
 5SGITw4ThPv0u0DM0Az+zxz5zOFEWCQ=
X-Google-Smtp-Source: ABdhPJx5jvqNcbIkJDaW5lB7B+zF2YB2Ldcpwkl47brphddQfdnAGaXUZQ2c204H+gZsI2gPS8/oEQ==
X-Received: by 2002:a17:906:7d87:: with SMTP id
 v7mr7564939ejo.214.1613780075971; 
 Fri, 19 Feb 2021 16:14:35 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i18sm6027138edt.68.2021.02.19.16.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:14:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/18] hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode
Date: Sat, 20 Feb 2021 01:13:07 +0100
Message-Id: <20210220001309.2225022-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Unlike SD mode, when SD card is working in SPI mode, the argument
of CMD13 is stuff bits. Hence we should bypass the RCA check.

See "Physical Layer Specification Version 8.00", chapter 7.3.1.3
Detailed Command Description (SPI mode):

  "The card shall ignore stuff bits and reserved bits in an argument"

and Table 7-3 Commands and Arguments (SPI mode):

  "CMD13 Argument [31:0] stuff bits"

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210216150225.27996-9-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 3a515a5365f..8b397effbcc 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1163,8 +1163,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 13:	/* CMD13:  SEND_STATUS */
         switch (sd->mode) {
         case sd_data_transfer_mode:
-            if (sd->rca != rca)
+            if (!sd->spi && sd->rca != rca) {
                 return sd_r0;
+            }
 
             return sd_r1;
 
-- 
2.26.2


