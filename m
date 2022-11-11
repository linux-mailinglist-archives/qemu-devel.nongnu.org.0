Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE28462555F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:32:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otP6W-0001PJ-16; Fri, 11 Nov 2022 03:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP64-0001DB-UR
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:09:12 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP63-0002Ii-Gm
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:09:08 -0500
Received: by mail-pf1-x434.google.com with SMTP id b185so4271053pfb.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0uEIIAwIlygIi/iWJgYmQ9lT4rDcl/Je1wIA0KuoKxU=;
 b=dWS/kFJmxvGPPRCC/yUX/vlsTDYtpL5tdFGtzczSyCYpgGoqCwbf3CklCeEt2aSfeV
 LQWHh3VRM7mQIIn+JEuGu9n+70Ne2UYQv/E83tfkTcS9nWkj/nn5ffeawefPk2ffdADZ
 9tCw3Q9p6H7YYLMQwDS2cjpxrKlMeHoCSwFzk1IFkrUdwOjQYITV8KjQqv65TbY1odPD
 AoBaLTdj/Zcvy4rtRdJAozrLAO/IXhxy/CHCiUrNM2v80Zqy2x5dZdtwJAYf9AmsO0/u
 oRpgtQhVn6zB8zNgYvyyZhpqf+ejANx/+uw9A2IlabZzigp8fG8eMlUW+Qr8/X2GGfrG
 LgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0uEIIAwIlygIi/iWJgYmQ9lT4rDcl/Je1wIA0KuoKxU=;
 b=qqdGWgE/7Q8JGE92m1W/70d2iU+lljo+HLAYlgRQjvJixLRPISJA+2AqcBWTSCzzeb
 r9skosLbanjIuSbAlnPokNUosc3lQQSqp+oIY6qazzUXU3xi6iwmKSjO1eRusbetImTB
 3eCe1IAZJk+4MTmpiCMOcfQBdfwGEUYYekaLUPjanTxfVPZ9OvFj694Al0qSeDai7BXi
 duITST5gypVSUZrt5OvIvEHYWRllFAtBYFYK6xB90vtlrDZLwp5S755M8v2IR4BTE9uD
 g1OSjurgdaa03WvP9wp8WidJCQepKI5T0w5bbiNJZNQqIleSgsMhsWh6Wh4Yu9mOryEj
 VB0A==
X-Gm-Message-State: ANoB5pmGRqTRwOIr+Kpm6EYt1l1ywGAaOx8Qfyv1wp3V+92x0gnABjut
 nx/HszJtfSjbosTrvthqRPTdb30Z0PZU9EQT
X-Google-Smtp-Source: AA0mqf7nF8NwFYHPeUpywypzeVoRRQW4aFmKQKQD1mJy15DUQCcOvTRPKgUO2UZRJCxBtSAuRIGDSQ==
X-Received: by 2002:a63:1211:0:b0:435:2b72:cf0c with SMTP id
 h17-20020a631211000000b004352b72cf0cmr702114pgl.283.1668154145089; 
 Fri, 11 Nov 2022 00:09:05 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00186a2dd3ffdsm1046341plj.15.2022.11.11.00.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 00:09:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	david@redhat.com
Subject: [PATCH for-8.0 v2 13/13] target/s390x: Implement CC_OP_NZ in
 gen_op_calc_cc
Date: Fri, 11 Nov 2022 18:08:20 +1000
Message-Id: <20221111080820.2132412-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111080820.2132412-1-richard.henderson@linaro.org>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This case is trivial to implement inline.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 480c89dae3..f8a6f29d9c 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -625,6 +625,9 @@ static void gen_op_calc_cc(DisasContext *s)
         /* env->cc_op already is the cc value */
         break;
     case CC_OP_NZ:
+        tcg_gen_setcondi_i64(TCG_COND_NE, cc_dst, cc_dst, 0);
+        tcg_gen_extrl_i64_i32(cc_op, cc_dst);
+        break;
     case CC_OP_ABS_64:
     case CC_OP_NABS_64:
     case CC_OP_ABS_32:
-- 
2.34.1


