Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1756515B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:53:07 +0200 (CEST)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IlO-0006W8-P3
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITk-00014r-UT
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:52 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITj-0004ys-CO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:52 -0400
Received: by mail-pg1-x529.google.com with SMTP id q82so1268419pgq.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2U8gGwGi459tJBiJfuXez6/qhKpO3scBOa8Znkp50V4=;
 b=i9rNdrN+8YtGAAVY8MC8WNSeKADfefcc+qHEHAz9IlmKekUI0U7Q4mM3OcdL85FGoc
 AD/SSzl25Fz+E7iiNm9wVRz2mhQo98GBgSMuXX7LmSWJ6QTHpmV3GewpTGJUvziHpczw
 MSfspMsMNX8tvQc1KJvFXqNU7kzs6HwfvoXI/bTTCHJp+oCZJfncAW3qAr+8SIrLskP6
 1I37P6w9L+7B8oaDxzfMxlFMe+Azpkeg3MZG4/YlM3VD6DiwtZ3SWPwqkj9AhoaITzaH
 x/UVlYY9j3KhAKL5HADKmIt2pj6X096r4EtSbPl0FMZEki+bUjDt+ymCjFx3PwrAyaqQ
 WxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2U8gGwGi459tJBiJfuXez6/qhKpO3scBOa8Znkp50V4=;
 b=Psbr8ywQV4/cAsakvt0v9c6Zwqj4KfDoulhRI432P4Nir6BMyH9CuigZsy6WorjuBF
 y2pomJ4of62zdRxUUuw1R8RzyZ3NlBes62JIDLj7bpXQ6J3/IS2o9Sz6qE4WkLgMF7UW
 XZYuRTe61KZrJ1W8rfXGzmpvEeEepytnlQLuP7Abs+K5TTwrmXADSCtXNfay1VWn0lV7
 3js/nWxyOUQWrN1BrthJGroBXvzLhm3EyPKjRededKUO+xV39YInjVaZRSSBwjkdZRl5
 UPAAbiQ9ThHOgRwLChZgOIFMrT2ainkdBftPZ7hO1Px74iRrejS6ra5ZHJjo3LD0bREb
 1Gzg==
X-Gm-Message-State: AJIora8v0D5UdcDNrJ/gEo9e3N8uDAu1+NBOqHGhkNpsEk9vxt3s1G18
 cYNNedRnvPoXEGz2fq9qhO/51C8NlyFK8dGr
X-Google-Smtp-Source: AGRyM1u783xJ6YUBxM0MRylBwZAtwtlEEeTX48aXeIGnT1FzC9simF+mS+CnltR3HwqWg0AHBKnqXQ==
X-Received: by 2002:a63:8c5c:0:b0:40c:95c3:8c02 with SMTP id
 q28-20020a638c5c000000b0040c95c38c02mr25371391pgn.419.1656927289624; 
 Mon, 04 Jul 2022 02:34:49 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 17/23] hw/rtc/ls7a_rtc: Remove unimplemented device in realized
 function
Date: Mon,  4 Jul 2022 15:03:51 +0530
Message-Id: <20220704093357.983255-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Remove the unimplemented device when realized ls7a RTC, as it is not uesd.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220701093407.2150607-4-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rtc/ls7a_rtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index 780144b9da..f1e7a660e9 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -461,7 +461,6 @@ static void ls7a_rtc_realize(DeviceState *dev, Error **errp)
     d->save_toy_year = 0;
     d->save_rtc = 0;
 
-    create_unimplemented_device("mmio fallback 1", 0x10013ffc, 0x4);
 }
 
 static int ls7a_rtc_pre_save(void *opaque)
-- 
2.34.1


