Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9F306DA5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:34:06 +0100 (CET)
Received: from localhost ([::1]:42788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l50sX-0000au-3F
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pP-000740-TZ; Thu, 28 Jan 2021 01:30:51 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pO-0001B0-7V; Thu, 28 Jan 2021 01:30:51 -0500
Received: by mail-pl1-x636.google.com with SMTP id 31so2763969plb.10;
 Wed, 27 Jan 2021 22:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qu1ZmvGNvRZOgkDiq631N2CdZ3gr5633WsnUpwSjfns=;
 b=qcLBgdIxmKQmyb9Z3+0hiKwCyHqFBJQhiy/yl1J6PqYJkZmFOKBhyRjkhfMobsotqu
 QZ02uV/6o14eb2orkaAb+6XrlqsXLI1it0LcIiaed55ncKn4hiaK++0lZflS7hwIIEqh
 HK4f0WV9iQT7T/aaalaEbl8SGlQsiFB16HeYOEtcjWD8vwXsrXdL6pfderM7tQ5kURCa
 jtHKadBYvB/X8vU9qmWzclDrpqhy3xtNVI0c4dKS4fdXJmtTamqRmUjmJFdfGSi4rKS+
 nVjUc+gs6fZUF3DVtzMUJIx49ENelDQV6sLGrK2eZ+St+gL5Cj59RwtCxWR91k/l/UqH
 z/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qu1ZmvGNvRZOgkDiq631N2CdZ3gr5633WsnUpwSjfns=;
 b=kCnfKYE99W25WZfJiM3COlH2oYg2st+1d8t0c0YNp6hlYlQb4XmdBrdAZZCb4dTzE9
 rkIbdD1b2z1cPjmbWphhkmADdBTLiRk+E4WFUlU4FYh2xEm2kMUu0wFqukrVBZqpzUgp
 8Mg1TI30zPpi9+9hH5XKY0akrlNWIr6+Q6hOKsxalJUHtyHW7bA6CViNRyMsAb9NPiof
 t9v0wxy9mn6sxyLK7+Kv2kofy+mOsxxRqAwkKk3ltBxj5TpS2keZH+9OjFdWQTxDisVl
 Hyb6wxMs8rtnEiQuPKEQO3Za4RyZsBfgVPXA/trdT7FvomJekoXUo8BCrstfNni8PS/0
 S5fw==
X-Gm-Message-State: AOAM5333dKlZa/vRVP4suAcvPudL02wO4AD9RbwZnY2bHXwQHE7Vfspz
 ISpktwONB8cXQ+xIAT4/4g0=
X-Google-Smtp-Source: ABdhPJw2aCbxu1XRT8FBp7MVAifejtzuITINaklqoCekicAiTbcGTfQyVUaEdODXkKQXnwkMjYlBnQ==
X-Received: by 2002:a17:902:eec4:b029:de:aa86:5269 with SMTP id
 h4-20020a170902eec4b02900deaa865269mr14939251plb.66.1611815448634; 
 Wed, 27 Jan 2021 22:30:48 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:30:48 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 2/9] hw/sd: sd: Remove duplicated codes in single/multiple
 block read/write
Date: Thu, 28 Jan 2021 14:30:28 +0800
Message-Id: <20210128063035.15674-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The single block read (CMD17) codes are the same as the multiple
block read (CMD18). Merge them into one. The same applies to single
block write (CMD24) and multiple block write (CMD25).

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 hw/sd/sd.c | 47 -----------------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b3952514fe..09753359bb 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1181,24 +1181,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 17:	/* CMD17:  READ_SINGLE_BLOCK */
-        switch (sd->state) {
-        case sd_transfer_state:
-
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-                return sd_r1;
-            }
-
-            sd->state = sd_sendingdata_state;
-            sd->data_start = addr;
-            sd->data_offset = 0;
-            return sd_r1;
-
-        default:
-            break;
-        }
-        break;
-
     case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
@@ -1245,35 +1227,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Block write commands (Class 4) */
     case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
-        switch (sd->state) {
-        case sd_transfer_state:
-            /* Writing in SPI mode not implemented.  */
-            if (sd->spi)
-                break;
-
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-                return sd_r1;
-            }
-
-            sd->state = sd_receivingdata_state;
-            sd->data_start = addr;
-            sd->data_offset = 0;
-            sd->blk_written = 0;
-
-            if (sd_wp_addr(sd, sd->data_start)) {
-                sd->card_status |= WP_VIOLATION;
-            }
-            if (sd->csd[14] & 0x30) {
-                sd->card_status |= WP_VIOLATION;
-            }
-            return sd_r1;
-
-        default:
-            break;
-        }
-        break;
-
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
-- 
2.25.1


