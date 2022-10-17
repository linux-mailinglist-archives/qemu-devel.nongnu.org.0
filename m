Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB1D6017DA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:40:19 +0200 (CEST)
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVyD-0003Au-82
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVg4-0002qA-BW; Mon, 17 Oct 2022 15:21:33 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVg2-0002yO-9d; Mon, 17 Oct 2022 15:21:31 -0400
Received: by mail-oi1-x236.google.com with SMTP id j188so13231739oih.4;
 Mon, 17 Oct 2022 12:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhcWjXEdgwPTRqWuqebJmJ6aw6EMQMpb8BMqAdJTNV8=;
 b=EwwJTdlbazQAJ/MfqKhO9ZcJoFIc1wnGGJmyC9cCGca027fSe78jDZN8UDcdzBzYdV
 j+opjCQb1WomG+6jhJFrgznpHE7A1x0TJlXM3ls8xXZTwWigb4E4buhHIGlcYG39IFft
 /pd2PcyTIG0N7JyaWVbCkfrnPPrk8CNfZ+lBEj+SV2tYMs0J+TPTtwQOtwXYdJH/Lnvh
 Tb05dwATR6+REcqiyZgO7tDFY1r3J/5fyaGoUXF00q7Ym6zmM7xckAMjVueEFkssznp5
 CjpAhsFVIwFUUvAwXtnsIvh3UTxU0Hz+tUthDUdbXu1eDs/MdAoS0w9koHu3TM0C9UuD
 iJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FhcWjXEdgwPTRqWuqebJmJ6aw6EMQMpb8BMqAdJTNV8=;
 b=JskDv0SNtTqitn3zq//oMNErZWWy9bO+j5Vnpq8Di2eNc+eAdIbNSdRp6P+WYCtLu3
 rPAuGm4cmK+/X2HFbPD1MbcHDWZQWEmJmcdG+xpxjumvabQa+s1Cfgq4ASwNMQczB1/J
 JQ+HYPCF3NiGm3AcZYVwulcMnnn0jZ/mf47GpIawGj4fr2hqRTU0kp0CAhzvMll+2nhm
 DVTxG2yXFu1BwS+u+ixNqZQ2Kku/qwa3A4JZ3I14x+TyDoTdrthqdagR9MGCl24JaKjR
 EoT6U41m4eHYEfHmztKHKW8przZAQRScluS8YT+QMh9k0OLhMv00ElsKxbE3ICgZnqmB
 3KDA==
X-Gm-Message-State: ACrzQf2wMMQnFlXTNflj072jfROpjlsW8UzKC/WZlM+Ze3guIQT/VtNI
 SV/BGpoh8BGdJ5bf0Tp5nQPkRo9/Fic=
X-Google-Smtp-Source: AMsMyM45dQdYf9NaDi8YuRmRviO4vygWWfH6g8AoiFN1I2kci8NAfXJbb6fM85X2FN5cnhmkvpA6LA==
X-Received: by 2002:a05:6808:ec8:b0:354:4ce3:9ba5 with SMTP id
 q8-20020a0568080ec800b003544ce39ba5mr5747618oiv.226.1666034489129; 
 Mon, 17 Oct 2022 12:21:29 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 27/38] target/ppc: Fix xvcmp* clearing FI bit
Date: Mon, 17 Oct 2022 16:19:58 -0300
Message-Id: <20221017192009.92404-28-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Vector instructions in general are not supposed to change the FI bit.
However, xvcmp* instructions are calling gen_helper_float_check_status,
which is leading to a cleared FI flag where it should be kept
unchanged.
As helper_float_check_status only affects inexact, overflow and
underflow, and the xvcmp* instructions don't change these flags, this
issue can be fixed by removing the call to helper_float_check_status.
By doing this, the FI bit in FPSCR will be preserved as expected.

Fixes: 00084a25adf ("target/ppc: introduce separate VSX_CMP macro for xvcmp* instructions")
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221005121551.27957-1-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate/vsx-impl.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 7acdbceec4..e6e5c45ffd 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -810,7 +810,6 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_helper_##name(ignored, cpu_env, xt, xa, xb);                      \
         tcg_temp_free_i32(ignored);                                           \
     }                                                                         \
-    gen_helper_float_check_status(cpu_env);                                   \
     tcg_temp_free_ptr(xt);                                                    \
     tcg_temp_free_ptr(xa);                                                    \
     tcg_temp_free_ptr(xb);                                                    \
-- 
2.37.3


