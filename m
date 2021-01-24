Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9E6301EA4
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:13:24 +0100 (CET)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3llD-0004O1-5p
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljF-0002Va-W6; Sun, 24 Jan 2021 15:11:23 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljE-00082a-Hw; Sun, 24 Jan 2021 15:11:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q7so10204091wre.13;
 Sun, 24 Jan 2021 12:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T/1NZ8/f0wZzR7INwfjM1hzMjKDJt4XlIepYoJ5WcVI=;
 b=ETGQg6zutDbix10CfW6O2jyNabSrbXEEBkVdImIvmRmG3I9sxjmb/UJLzHQQCHjFUi
 dAfb0Z4fjO2KL8GX7hlcR7dLGsewTXpuvALJOsskL/GtY1TtSHALWaQ9TVwL5erftTia
 XX22o9CNcGBjrH8cVCMijDZS1r+AvcpyqBML/RRbsCqfQGN71BT8SQ1ukiH29vdpSCAf
 7pk70H+A6QMXMozga8r+f9RZczzbMs/GxaQmAdvfwgBgUmqJCMAR4NaAI0Pk4OocZMtK
 MPcEnLaAmW55m62bzObYGQhCfDPlNu/sTsImIdUkSIjq4rKRH9j22uRn+hGO3PtpJ/sv
 20kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T/1NZ8/f0wZzR7INwfjM1hzMjKDJt4XlIepYoJ5WcVI=;
 b=AHHlJukzfnBzZiWDmczW0sT29sjmJ0Vs8JtNycmpHWesC8I7y05vtbEjrTPSXGWgxg
 o4DVRCWS7O9MsBLDRkvfo3iWhsju6kTkNFv7qZJven6RfuEZNoA26zfo9LwuitIIxSKb
 +wKNLNYZ0rqwAZLXlYSAFc41EKP2GKx5//ZEW/HtpayFFrY+CwIRCiwIHHXQUSFsBzdG
 hdcSm8B/hQ63Pan8eXruKuvZFkfr17XvKmqkK217st6gX67sNX3CFOtdloMJkTjrYxMc
 54jPEySvDeOrYql7MxHg0Oqw9qNoZz2fBLeZ3Gv6hhjOmvtR0/n2/Gf2hcmngVY9f+Sw
 iTiQ==
X-Gm-Message-State: AOAM533OD9XiUhwn1j4E2Pl04kEbZJyClBtuBHca/ey934SBIhR3MtiR
 qXazffJmZJLkuxTG09y3OYDRCwQxg64=
X-Google-Smtp-Source: ABdhPJz1s7aaeJdlB12dA2vujvU7hxBV8j5eoSi4Myy4pTI++VbZMYgjHedQbjLOyNYkda0AWhcZpw==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr13982470wrs.82.1611519078734; 
 Sun, 24 Jan 2021 12:11:18 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n11sm18927313wrw.47.2021.01.24.12.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] hw/sd: sd: Support CMD59 for SPI mode
Date: Sun, 24 Jan 2021 21:10:59 +0100
Message-Id: <20210124201106.2602238-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
References: <20210124201106.2602238-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

After the card is put into SPI mode, CRC check for all commands
including CMD0 will be done according to CMD59 setting. But this
command is currently unimplemented. Simply allow the decoding of
CMD59, but the CRC remains unchecked.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210123104016.17485-5-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4375ed5b8b2..bfea5547d53 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1517,18 +1517,12 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         if (!sd->spi) {
             goto bad_cmd;
         }
-        goto unimplemented_spi_cmd;
+        return sd_r1;
 
     default:
     bad_cmd:
         qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
         return sd_illegal;
-
-    unimplemented_spi_cmd:
-        /* Commands that are recognised but not yet implemented in SPI mode.  */
-        qemu_log_mask(LOG_UNIMP, "SD: CMD%i not implemented in SPI mode\n",
-                      req.cmd);
-        return sd_illegal;
     }
 
     qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state\n", req.cmd);
-- 
2.26.2


