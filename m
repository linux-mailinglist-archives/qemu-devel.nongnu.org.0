Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115D3320237
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:27:34 +0100 (CET)
Received: from localhost ([::1]:44648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG7R-0002kl-2g
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuX-0001V9-TD; Fri, 19 Feb 2021 19:14:13 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuW-0005i3-8C; Fri, 19 Feb 2021 19:14:13 -0500
Received: by mail-ej1-x635.google.com with SMTP id w1so16777601ejf.11;
 Fri, 19 Feb 2021 16:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fy9SqTT3Pn6dnjUOO63fiY72ONZWC5VONbRFMJ3FRcE=;
 b=TswmdrwOJrMQUYVUhYL49m9C86/WnHdBw03bfxBqvcMjasokaLaRQO/Xe8eJEVTBSt
 cw+exWhCfvmo1cN+mGctC+9qrAkYO43s1RYWg66Efz26cJ91jSvg5Jc0/d0OhPZe/OOu
 VvaCamZbilIzh3iTnNkKWYBpJ3e7Y1tGZsrBLdUEn72ootnxOQsb/7BszD4J88I0aEUU
 BU35YATAnSLpobhtZ2lcw2Sv9cPQdPlOhAW3rrChC7PDbhMDYyToC/b/UECCwdXPEthQ
 ez0yppPDph87vqS0M/jb/HVVXNe93IY3HiWY9abGKS9NBmIkYmq3a7rYSq7lrtgEg8MD
 AadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fy9SqTT3Pn6dnjUOO63fiY72ONZWC5VONbRFMJ3FRcE=;
 b=AKKOdXCRhKaWYf49Tavc6fNUnnQhoBEg2msfdd1AvWMQrHT0qE0nOtLYEfnuIjSKy3
 MytiOvoI4Tpiz1niVzDwOyTptNsTGIC1pxd9us6e6hr0OWZIujLuBeh3LsUz4hAD3iGB
 pKZsbPT9NxgJ5uEpha4/LMfR8VTnFLi5Po9A4zveSjkf+IvkFfu0j0utWDyxS495ZZJw
 b9dOUV5UhTlG+M+WmxcOdQ9SmtARsuIKkCR/79BiSb6DDGy5RqxFMwawNgIobtyYPkXk
 AItSy37B4BEOy+ouJAVipu70SzLBZDE8Kr5r7N4VW5OfqPMXmjU9hPfWlKCNfXkUeh7E
 5B/w==
X-Gm-Message-State: AOAM530iziUnI4FTb8QxFx0nQcjn0g/1EQZbhUGXzern954b54ggKFAQ
 dRQxQNUrVK2qckyZpnw/xpyC09dX4jA=
X-Google-Smtp-Source: ABdhPJwZj7y0U83TUCnOve8zdFimlXLondbECqMCeYkqM71lT/qWRctgHTUjErOMTmvHY3/uDGRFiA==
X-Received: by 2002:a17:906:240c:: with SMTP id
 z12mr10942774eja.314.1613780050256; 
 Fri, 19 Feb 2021 16:14:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r23sm5774296edp.34.2021.02.19.16.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:14:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/18] hw/sd: sd: Only SDSC cards support CMD28/29/30
Date: Sat, 20 Feb 2021 01:13:02 +0100
Message-Id: <20210220001309.2225022-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
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

Per the "Physical Layer Specification Version 8.00", table 4-26
(SD mode) and table 7-3 (SPI mode) command descriptions, the
following commands:

- CMD28 (SET_WRITE_PROT)
- CMD29 (CLR_WRITE_PROT)
- CMD30 (SEND_WRITE_PROT)

are only supported by SDSC cards.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210216150225.27996-3-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7adcb4edfaa..dd1ce0bdae4 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1284,6 +1284,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Write protection (Class 6) */
     case 28:	/* CMD28:  SET_WRITE_PROT */
+        if (sd->size > SDSC_MAX_CAPACITY) {
+            return sd_illegal;
+        }
+
         switch (sd->state) {
         case sd_transfer_state:
             if (addr >= sd->size) {
@@ -1303,6 +1307,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 29:	/* CMD29:  CLR_WRITE_PROT */
+        if (sd->size > SDSC_MAX_CAPACITY) {
+            return sd_illegal;
+        }
+
         switch (sd->state) {
         case sd_transfer_state:
             if (addr >= sd->size) {
@@ -1322,6 +1330,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 30:	/* CMD30:  SEND_WRITE_PROT */
+        if (sd->size > SDSC_MAX_CAPACITY) {
+            return sd_illegal;
+        }
+
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_sendingdata_state;
-- 
2.26.2


