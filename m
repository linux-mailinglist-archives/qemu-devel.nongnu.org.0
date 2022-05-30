Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E165387CD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:41:34 +0200 (CEST)
Received: from localhost ([::1]:54420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlGf-0000DK-PO
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlDn-0006DZ-PF; Mon, 30 May 2022 15:38:35 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlDm-0008B7-3M; Mon, 30 May 2022 15:38:35 -0400
Received: by mail-pl1-x632.google.com with SMTP id u18so4884629plb.3;
 Mon, 30 May 2022 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ng4oM9dmzGsSv+SiHIZH/9jskdqZ20IbrVwJee5u3hE=;
 b=i4Sy6dLAQI6aDznPasY9YnLJkbl55bbrA2XJTEENcROf0ibcJ58sGxGEqrI7G3x/vw
 20sjxBSzkSo9anAqr0Bp6DK6F3g3UCP8BLmUSQebaUi0piJrAGv2FMWTHtrRWwRY9ZKb
 q8VqmxkWuj+B6j1W7OEN88UBGFCC9/FlRazGNvK+FKBvXPqskBm6fn3BvHBljxSA/Et3
 siBzV6RH4jAHZDZ6/nE7eugHg9w0TL1ZeSdhcLYydR/WYf7H02UItgJlBMQY3r6P4KPW
 IMTLZ3rUT5smMSnDWYQBwdJ1PxmG7yAqdcKXF67z3Ao0Xb5nw43LTeViz6knoAMAQBCt
 o9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ng4oM9dmzGsSv+SiHIZH/9jskdqZ20IbrVwJee5u3hE=;
 b=KX9vhWgdRtB2S4sSIlew0M8baQH9f3JegFNtncHrrNNbcgZuklNimvMloDurHYVccf
 NRPdSbkuEDSf0VE35wwVxuN9cKdGti9a2J5fOWQ1PHyyYePs3O5ElQ1qErtSohOCmZ+c
 Rfl+kZK5cS8D9t5rtz5Xit/uN8a67dl1oqsQO4t/HJcr0hvw0xcYxgWTtnvJj1GkH4ZH
 18r9nbHSXreFED8odTZeAWkFEr1lOTIDXbevn6nqQvwW3w7z4OZQ1VYd7/4EqbsLQvTO
 /sz40LB9ycklNmmwOei8Qs5gjUoLp21XEE6MAFl/gOHr1YX/a854Fdm90eLZKyWkObrJ
 mV7A==
X-Gm-Message-State: AOAM533hh8snU2ibQl/WwtCpm+0w5yZYzLyRdi9Wn88D7Os4VYMl4k5t
 WOCgOvf9DPewU5ol0g7IcX4InMl6n+A=
X-Google-Smtp-Source: ABdhPJx+OD7mx3wGzrM+kw+WMo+m39tN51RKYOvKBzNCjeOCTfKoryIoRiq9Qh92OhxOe0XvVV3ZcQ==
X-Received: by 2002:a17:903:1212:b0:15e:7d94:e21d with SMTP id
 l18-20020a170903121200b0015e7d94e21dmr57352558plh.92.1653939511992; 
 Mon, 30 May 2022 12:38:31 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 gk13-20020a17090b118d00b001e28e80a8d6sm66530pjb.38.2022.05.30.12.38.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:38:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 01/25] hw/sd/sdcard: Return ILLEGAL for CMD19/CMD23 prior
 SD spec v3.01
Date: Mon, 30 May 2022 21:37:52 +0200
Message-Id: <20220530193816.45841-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
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
added in the Physical Layer Simplified Specification v3.01.
When earlier spec version is requested, we should return ILLEGAL.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220509141320.98374-1-philippe.mathieu.daude@gmail.com>
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
2.36.1


