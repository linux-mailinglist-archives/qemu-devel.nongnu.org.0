Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF05E6AB9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:23:45 +0200 (CEST)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQrQ-0001ej-Hp
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBC-0002CM-7B
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB8-0005O2-P2
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:01 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v3-20020a1cac03000000b003b4fd0fe6c0so1682646wme.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=pWGWLI7V6s9hSnLclf2++UgbHO3xok2cYFgCGF9FY5E=;
 b=FcAK5RqGmh7IlaIZKmIQcWNWoElHC5uHTZ5wZI2zGScmuhTu1Ct4pb9VQfodKnf7CX
 DizxyzEN+6Yz7VljlYXN2FFAIds6rU324drKPVkRjmYjUwGcqI/cMxmvDjQBKwpi0JE8
 mZo85V1Sp/dyg/xCGzlQxtfzir4xgddxY4umSteIWBcXpgq0Zae6CNFT31nyIurYZFxf
 T/HKjCLzqznQxDL1wnMriuu6hihNwC9NYW+zetcyDUH7i83aZl0E8poGi7J1NEiIYK1h
 1QI1vwWRAfRVss7ptOLMao5OcSQ02/wzrI8QhfvY6WPM3UXEpxc2BUK9KRKSGSG7t+Pn
 VbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pWGWLI7V6s9hSnLclf2++UgbHO3xok2cYFgCGF9FY5E=;
 b=ezke81ZowlMH0qBjOhCHEGg139NnWE/GyNhEaI9B5RV4GZ539pmv7dmWRCxZTb65Rh
 /CTYquZvwZiwpP106OdsCKeZOVBIGClKyLjxSSJbPKrX0Fic2m8wBQhcZ+V8YP4h8fw+
 1xz0Eolh4wZBOOddlPCZTCrSn2yAA1mGME0ikQ7DKxEHu4F/cW9+XaU3mFRFgwB7fCAA
 00LQGFLioTFt9ktteEIM7UNRsIjstRdWdTdsk76sdox6w0ksmrLOJCe5DPpy6oit7KQ0
 dtkRLT6YQfUdOWGZ71xJ4APtT0A8DZdmoAG7L9BiR3j87oETngBnYA9daSixX7YxO8dC
 x/iQ==
X-Gm-Message-State: ACrzQf3sR98tgMn8FpAZZ41V3S3pO1fELsfL6bj3XX4YlQEEtTeOUefw
 8B88Aw4/Wr6Fl/8lptHuFH8oSZFygeq1Dw==
X-Google-Smtp-Source: AMsMyM6/tdjAEZLK+AwtjeCn3wt3t2H2HRwN9jvmIrwskFj1TvlcUd/LIhDxuypK5PiyRW2W5fGDiw==
X-Received: by 2002:a7b:c051:0:b0:3a6:36fc:8429 with SMTP id
 u17-20020a7bc051000000b003a636fc8429mr2936125wmc.78.1663864553607; 
 Thu, 22 Sep 2022 09:35:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/39] chardev/baum: Use definitions to avoid dynamic stack
 allocation
Date: Thu, 22 Sep 2022 17:35:20 +0100
Message-Id: <20220922163536.1096175-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-id: 20220819153931.3147384-3-peter.maydell@linaro.org
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


