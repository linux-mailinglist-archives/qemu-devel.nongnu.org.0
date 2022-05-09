Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB1B51FF55
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:15:49 +0200 (CEST)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4Au-0004xn-D6
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no48f-0003jd-Vl; Mon, 09 May 2022 10:13:30 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no48e-0000Jk-GC; Mon, 09 May 2022 10:13:29 -0400
Received: by mail-pg1-x532.google.com with SMTP id 7so12134495pga.12;
 Mon, 09 May 2022 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JNXYT/aQpXuhbS2GUtE2VMMP/t0C+1fkqXOIZwRj01s=;
 b=nCXd+gJ1L0059P4ptB7G82zorSy4S8Cgay7cu/s/uK88G+9Nj00WIxgWkattVF6Tgk
 8NYZuEcnC9bSf0eVVDoSeNmZO7FoD+XncBhMfoxrQEh8AFvznkxKoqEFPTT1+FIU/grP
 DgR6hCAm/wfPml3JlyTOJ2x7aIPlKmfo0Px3DoGfjCK/pu7WY1udde222lYKhvr973sl
 v+QHljFHTtq3ZdAOGtXe9v9TM0AzhL83+u5SyGBB4HKAq1ZZgjeIUp2fSoOuJM8j6ooH
 pIhRlhRu2OurWZl8gStHTTRWlnv9x6ZAMZKL5mVUZ+tQ1xBNpp/kl400XhigUFV6Qqtr
 +CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JNXYT/aQpXuhbS2GUtE2VMMP/t0C+1fkqXOIZwRj01s=;
 b=ywAAOPyWcm3DDHWq4OnNr8ptOed3P4agGwiN8EvjCkepxTFs6BzLc//9GWScVpE5lr
 9umIfpepdHM/U/yVreRGHBFX7SXV1UCb++tYebxUDrPJv5vf8wI/C+PiOEuuwFs6OgMN
 Pb+cW7bHo8/SvRGat7G+iEP/WJqLJ2Qxuf0z4S+QgB3pNYRQ/56c21QZJp4nsVCSvr+g
 oWvGY+Ujob+cru5dmO/YoJ3yGY6LycfhdQxwUTRqI2GsKqHv5CF51Lgl+YmQe4izdcZm
 FzqJ8GsDhClj9dFecdojRsGITZIsRHaqEN0+L/0dr6Xu3oLMuMitCmU7ObM3d2F3VDkU
 vllg==
X-Gm-Message-State: AOAM531IQdZD6+56bDE5jGgKZA6XqR8KoRV8KO7hfU0EASMPthdkK/w+
 ueZHUNBxPDSllkpfCy9Uhs47vhqFYeo=
X-Google-Smtp-Source: ABdhPJxkk7gutQdriWOAHE6FPLOTz5mDnFW2dVTBX2Q5hsNe74GA9BzXoornDNrGxMAdFEsl0LpILA==
X-Received: by 2002:a05:6a00:15d3:b0:510:3c69:b387 with SMTP id
 o19-20020a056a0015d300b005103c69b387mr16125831pfu.30.1652105606456; 
 Mon, 09 May 2022 07:13:26 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090aa08d00b001cd4989fee4sm12571068pjp.48.2022.05.09.07.13.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 May 2022 07:13:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] hw/sd/sdcard: Return ILLEGAL for CMD19/CMD23 prior SD spec
 v3.01
Date: Mon,  9 May 2022 16:13:20 +0200
Message-Id: <20220509141320.98374-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

CMD19 (SEND_TUNING_BLOCK) and CMD23 (SET_BLOCK_COUNT) were
added in the Physical SD spec v3.01. When earlier spec version
is requested, we should return ILLEGAL.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8e6fa09151..7e3bb12b1a 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1263,7 +1263,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            break;
+            goto bad_cmd;
         }
         if (sd->state == sd_transfer_state) {
             sd->state = sd_sendingdata_state;
@@ -1274,7 +1274,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     case 23:    /* CMD23: SET_BLOCK_COUNT */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            break;
+            goto bad_cmd;
         }
         switch (sd->state) {
         case sd_transfer_state:
-- 
2.35.1


