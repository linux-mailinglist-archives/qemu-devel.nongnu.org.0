Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99441599E5A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:42:47 +0200 (CEST)
Received: from localhost ([::1]:46746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP490-0003In-Bj
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP468-0005fc-OO
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP461-00063r-UE
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:48 -0400
Received: by mail-wm1-x334.google.com with SMTP id j26so2456067wms.0
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=R4g5feK2z3NYihYvidLiAk+gMsDmpPE7GLZDlbfsxQI=;
 b=YL0d7agIlU3Gu7SEV4msDIQ0A9m23HFVPqhjqj/JMPAqT6no4uQchN1UFVyu5YWdFE
 LMJstOkLhUP7Mco5jD+wDmX9657xw4XEPf6BujjCHkEULeutXkG4gNGH5ZEWXoqRkZ3V
 gwFQ4ygRSDjNFhxg7FWGWYHFX6blZMANGRBscmDIBqbYo+JGkWDKWraWSU+oGzFymW3P
 uB3iQPrTgHiep10S5vuSqAYjwAe/Cyi85M4FLmS2yDE/pe3iUAIZILgkKut+hEk3kVcM
 boQcnFPCU7EM82c4KhJHmk/pNh9GdyxtqtBSEuU5cpI17ZY1WJWyoKMSz24Za0Lne2zs
 CDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=R4g5feK2z3NYihYvidLiAk+gMsDmpPE7GLZDlbfsxQI=;
 b=xBWPCTEBPs7xm7GNU7j1/0iKXLzHqln65nZP/FTJ6pS6jDcSkED8hLNd6hZ3Ccjapb
 twFJKEXfe+TfWqxxCHVYcANOVg/vs0rpkP0zVa6y2lYoRuUJx+5tDukhe3q06lhJTLcN
 IPA43VOgyHJLeRZ64xREnR5khbWyfQmpAsN3Uw2Mgc/QyMADTUcWdEwvh7Wuk0mzjvBk
 OcfdBzUMPDa5Ly6NGYr+5ny6bWfKajDGigbaXAOLL9FEG5Lt/L43ZCuN+B3hJW44vR4g
 AgzB+5pN4wIhamIbT3oGIDd5zRSq6bV11rOotWihIIJ7V306bTKoCR7sifazqOmHNwxU
 gN6w==
X-Gm-Message-State: ACgBeo0Rbsigv6VLf/dAqNGDJ9RUaID4V3Un76j6xRoMnQtdrI32BUSp
 RJyRDY5wCtw7K2dL3v7BxAkCsezjgzgicg==
X-Google-Smtp-Source: AA6agR5uxSaKepDECZTaU7s2kahoWiSqgMZBG4+sR97RAyCvmo3lbjupqjNWTScpJkxscUVLSUQSvw==
X-Received: by 2002:a05:600c:5010:b0:3a6:804:5b08 with SMTP id
 n16-20020a05600c501000b003a608045b08mr8126624wmr.10.1660923577315; 
 Fri, 19 Aug 2022 08:39:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 02/11] chardev/baum: Use definitions to avoid dynamic stack
 allocation
Date: Fri, 19 Aug 2022 16:39:22 +0100
Message-Id: <20220819153931.3147384-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We know 'x * y' will be at most 'X_MAX * Y_MAX' (which is not
a big value, it is actually 84). Instead of having the compiler
use variable-length array, declare an array able to hold the
maximum 'x * y'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 chardev/baum.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 6d538808a0f..6a210ffd815 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -383,9 +383,9 @@ static int baum_eat_packet(BaumChardev *baum, const uint8_t *buf, int len)
     switch (req) {
     case BAUM_REQ_DisplayData:
     {
-        uint8_t cells[baum->x * baum->y], c;
-        uint8_t text[baum->x * baum->y];
-        uint8_t zero[baum->x * baum->y];
+        uint8_t cells[X_MAX * Y_MAX], c;
+        uint8_t text[X_MAX * Y_MAX];
+        uint8_t zero[X_MAX * Y_MAX];
         int cursor = BRLAPI_CURSOR_OFF;
         int i;
 
@@ -408,7 +408,7 @@ static int baum_eat_packet(BaumChardev *baum, const uint8_t *buf, int len)
         }
         timer_del(baum->cellCount_timer);
 
-        memset(zero, 0, sizeof(zero));
+        memset(zero, 0, baum->x * baum->y);
 
         brlapi_writeArguments_t wa = {
             .displayNumber = BRLAPI_DISPLAY_DEFAULT,
-- 
2.25.1


