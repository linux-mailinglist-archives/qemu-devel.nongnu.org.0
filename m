Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D3440A91
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:23:27 +0200 (CEST)
Received: from localhost ([::1]:43002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs4k-0004kA-VX
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpm-0003q2-Rz
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpk-0004sX-H4
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id s13so14467671wrb.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OfIDcUaHl1YMEOQAd+ZkSpOLG2BS5BHqKSe+gt8Sd1A=;
 b=gtFPsvX7lV/2G4XmdKGgicdldsQE1DUaHWa2X+lCuhaSA2NFs+kC1LpAAk/j6kauyr
 GXtsUmPVEJ41IyOvF1uu3ZXFyHA9wGv6it5FvU59IqkYa7qIFFQNEn5r8BsXNKD4B3SB
 Pj0gL/5G19g6yD3a4kt1nuJOb/QeUgw9i2Nc3CGzIQR1VSi0/epg8Osd0E7fQBcQvB/Y
 0J3fWmcT/21YhsGLbVhmuUR+Ilg+e0nmeTV5alAmSmV5UJnVClN+oJMItKqsXR+dqj01
 /OC3zZKv2mJQSGYtnZp4FMLaaM5vuHZ/xA3vKzWVfnC22FS+DViukcHzS4vJzoNWUeHO
 U91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OfIDcUaHl1YMEOQAd+ZkSpOLG2BS5BHqKSe+gt8Sd1A=;
 b=sCg2rxFfaHWHAKnurwsAquwB2gKKr7sLSkZvcNi/U/3JLC6EBhsCo8lurBT4vdqQ+C
 iZrCgpdiZwGe8CoBSWpLc1OiXIsm9iwHaPSZAnp4JkdNjjg7YpuEKrjkUUQE5TM6IOVb
 eNYGAp/Wq1FUp0EOZWX6bmKRCr3ystnObWZW4qUV1R/i4mbC+VTyHD6Jsbj+M+pQwDdS
 xdjjYEx2UNLjDWbIei5NoOeimGeMpxEnlkllcGHsT5lCVSgXWx8uw1LPbrPfYdjpDEQp
 5RSbXEuevR2xULDXwDr2OwiJUMLlraF/LazhnefXOwEqWPwB69iYzUJ1t9G6UWEfNoZi
 YEow==
X-Gm-Message-State: AOAM531D/+gl3Y6salsfuHdnJKG9sPWFiHJYbUzxjLSbyHosDydaI9E3
 IVgxNLz515cL7OGlXfo2QFT9oVFAvbI=
X-Google-Smtp-Source: ABdhPJx7yRSrsgG1BHrOPtVtwEcXZrh1Eandb5GMhZ9jwm1iB2Ep0tYzT6oFyZdYs2BCPDFsxvQOVg==
X-Received: by 2002:a5d:5646:: with SMTP id j6mr23245989wrw.320.1635613675186; 
 Sat, 30 Oct 2021 10:07:55 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 e18sm7241717wrs.48.2021.10.30.10.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] hw/intc/sh_intc: Remove excessive parenthesis
Date: Sat, 30 Oct 2021 19:06:05 +0200
Message-Id: <20211030170615.2636436-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Drop unneded parenthesis and split up one complex expression to write
it with less brackets so it's easier to follow.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <a48e849e5b803a952ed15a2502cfece2bde68934.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 1a2824f8e0c..416581dc07a 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -23,7 +23,7 @@ void sh_intc_toggle_source(struct intc_source *source,
     int pending_changed = 0;
     int old_pending;
 
-    if ((source->enable_count == source->enable_max) && (enable_adj == -1)) {
+    if (source->enable_count == source->enable_max && enable_adj == -1) {
         enable_changed = -1;
     }
     source->enable_count += enable_adj;
@@ -68,7 +68,7 @@ void sh_intc_toggle_source(struct intc_source *source,
 static void sh_intc_set_irq(void *opaque, int n, int level)
 {
     struct intc_desc *desc = opaque;
-    struct intc_source *source = &(desc->sources[n]);
+    struct intc_source *source = &desc->sources[n];
 
     if (level && !source->asserted) {
         sh_intc_toggle_source(source, 0, 1);
@@ -163,7 +163,7 @@ static void sh_intc_locate(struct intc_desc *desc,
             *modep = mode | INTC_MODE_IS_PRIO;
             *datap = &pr->value;
             *enums = pr->enum_ids;
-            *first = (pr->reg_width / pr->field_width) - 1;
+            *first = pr->reg_width / pr->field_width - 1;
             *width = pr->field_width;
             return;
         }
@@ -244,7 +244,8 @@ static void sh_intc_write(void *opaque, hwaddr offset,
     }
 
     for (k = 0; k <= first; k++) {
-        mask = ((1 << width) - 1) << ((first - k) * width);
+        mask = (1 << width) - 1;
+        mask <<= (first - k) * width;
 
         if ((*valuep & mask) == (value & mask)) {
             continue;
-- 
2.31.1


