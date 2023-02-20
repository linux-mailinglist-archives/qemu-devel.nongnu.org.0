Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A669CBEA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:20:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU64I-0002Bo-OK; Mon, 20 Feb 2023 08:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU64G-0002Ax-KA
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:18:56 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU64F-00073G-4W
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:18:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p3-20020a05600c358300b003e206711347so883033wmq.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31e2czA0rOGt43Bpx9OSiR8m8XfJzcMSVoea56a8oA0=;
 b=o3H45KjQi33YhrADQ3PSYhHFTq3lQ/v8Na7lQAOfMfXgMyBCNyUqWAwFXFv4560l3I
 xp+9Ixk97yl+KCqxAbSxTsKOYkKdY6M4hPZPmpClW9qoYcoEKjvIRV16Wg3s8Nw42qPC
 4K+PP0y3jghfaEAsX8xeBplbLX9L1IKPebrSIH3TRpXaUxEKNO7je6N6MfQTV5b6N4OI
 EMu269sS86o+/YPUF7MCllsX4+2PX93j2/Xq0H2IT/gMrQZ2GfONwpUHhWdV5k1/sPTy
 bYNCYTHXW8RU0S15o+//ZcldYMFC+rUy6lmrxf5cdHd4m8bMtccTICnGupcMpQSQGdT4
 VZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31e2czA0rOGt43Bpx9OSiR8m8XfJzcMSVoea56a8oA0=;
 b=JLp6DpBjvbHU8Iokix2qdCw7cLJ9RtKCHcVvR3KaP3Qw/re3XcZXdsHLyFSD2f1/LM
 xiJkvm+jixys2B63191N6+lgZNdGv/BFUyyi71npU02zkX5w5z7KqX6VnusGBOLW5WFa
 0+p+C9/dZZgrK/dv7P1XLpwAaLRnIvh3Q9nQqQEAZXU/671UbmN/F/ERFym+323gb/42
 GrnqwKxYh7rmF8Ynamyw4PE3yr411CqXXmTp91GMozmM3x6yanUho3McnWZm18O3FlgK
 pd4r7jL2Oj64M0mFKIG01f7rOy/fkmmcqC8IjdEy5iM3tbYbJuZzwn6DKKWByrSTvIUb
 PUxA==
X-Gm-Message-State: AO0yUKURsRdVTmZCvQ5hbJ3zXFJzlMBNR1jLOA2gbMN5hK3nNVsmtIkF
 Be+FtcokZyV23FdWycx6y+ds9ePWeKIi9WQp
X-Google-Smtp-Source: AK7set/qiWeNcECGnwKpvd8pbVV1yB5mlV2OUss0IoHS9II/Nzbn4Uq8/oUQgdwlJqP/uB8npm+UOA==
X-Received: by 2002:a05:600c:a294:b0:3d9:fb59:c16b with SMTP id
 hu20-20020a05600ca29400b003d9fb59c16bmr661015wmb.36.1676899133320; 
 Mon, 20 Feb 2023 05:18:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a7bcd04000000b003e00c9888besm9315268wmj.30.2023.02.20.05.18.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 05:18:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] hw/audio/es1370: Avoid forward-declaring ES1370State
Date: Mon, 20 Feb 2023 14:18:34 +0100
Message-Id: <20230220131837.26292-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220131837.26292-1-philmd@linaro.org>
References: <20230220131837.26292-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To avoid forward-declaring ES1370State, declare ES1370 QOM
definitions before its use in the chan_bits structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/es1370.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 54cc19a637..ea76c9a734 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -256,6 +256,9 @@ static void print_sctl (uint32_t val)
 #define lwarn(...)
 #endif
 
+#define TYPE_ES1370 "ES1370"
+OBJECT_DECLARE_SIMPLE_TYPE(ES1370State, ES1370)
+
 struct chan {
     uint32_t shift;
     uint32_t leftover;
@@ -278,7 +281,6 @@ struct ES1370State {
     uint32_t codec;
     uint32_t sctl;
 };
-typedef struct ES1370State ES1370State;
 
 struct chan_bits {
     uint32_t ctl_en;
@@ -292,9 +294,6 @@ struct chan_bits {
                        uint32_t *old_freq, uint32_t *new_freq);
 };
 
-#define TYPE_ES1370 "ES1370"
-OBJECT_DECLARE_SIMPLE_TYPE(ES1370State, ES1370)
-
 static void es1370_dac1_calc_freq (ES1370State *s, uint32_t ctl,
                                    uint32_t *old_freq, uint32_t *new_freq);
 static void es1370_dac2_and_adc_calc_freq (ES1370State *s, uint32_t ctl,
-- 
2.38.1


