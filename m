Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638002F36C7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:15:08 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNG7-0002HO-9q
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzh-0001dK-Tb
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzg-0006zq-50
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:09 -0500
Received: by mail-wm1-x333.google.com with SMTP id c124so2505197wma.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IzBnQ5MyuscpiNLypCkOojFs/hlxwbq1JP9C+1j7a7s=;
 b=MHGsccufrlBNi3k7ctS+fqmiVCwwqS0pqwbwzBB98G2ecF72kizgBnqCjExS9tBAwg
 45n0T5qWRY1PgpQcw0dGcHKY4bC8ZyfWNZfioQaiAb57jvTlKpZfqOklthph0TQe7Tu1
 QKg/Pmcywo0Fu8CegdeS5nT/yjkUcg/FKbu4uAMcGPq+10hxF7xCnXixbGB6Ay++2wDD
 ke0bBdcofgpjhlKegFg3sBMEx6AY013F08UQMbEE1Xkkd4Bamw8W0e4rLTMnQHIfxS8K
 x+8HTleV1+pPXFwmpWpTdpAAYvSqeWPpSaDjr39V33IxKof4KwNMBh6e/Z973D/bjDb8
 1n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzBnQ5MyuscpiNLypCkOojFs/hlxwbq1JP9C+1j7a7s=;
 b=RMjOTNCkM4iT+64IBJMaR8rDrJenFw0RHhgHxAQnsZr/DmyK2uJROclRR9YbzGGyKV
 wbefNMQ0ADOetJ3bLrg9SDLJ0HMZhOuAawYaIcSwa/NMr/0Zt8b37hfiQ3OmqJfhtC8M
 VVJNYs94vWcZE0r+zExyFXchZxPyhSiGdnp80XY9E35kZdY1fu4f16paY8Za9fgtYQXB
 BEQEE5NenMRKjS2S1HmQlU0FbHnNKJpz4VaE1uQ/70ltRQevEA/zA+SaOusfzxq9/uh+
 SiYQnFViLPEOlf0RDi35Bhf7xL16deOODcHE8qU2KVVPR7YlYzLWeyq9KtBkvTVyTdV+
 wjXQ==
X-Gm-Message-State: AOAM532UGdfSDomgrgLQqrsDA7BNZAv+WvCP0Ed1dkFEYRBoRSZH0JCN
 VTjVJWMBYhIfELylKTmUHCM31cA/rkEvgQ==
X-Google-Smtp-Source: ABdhPJyC84AeTFrvcl8CZq1ClXdVdNppiX2QjakJM1EWMDnNSx6I5GBz9qtUzFF4ubHAM9V7VqfZ7w==
X-Received: by 2002:a1c:2091:: with SMTP id g139mr160804wmg.133.1610470686001; 
 Tue, 12 Jan 2021 08:58:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] target/arm: Don't decode insns in the XScale/iWMMXt
 space as cp insns
Date: Tue, 12 Jan 2021 16:57:41 +0000
Message-Id: <20210112165750.30475-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit cd8be50e58f63413c0 we converted the A32 coprocessor
insns to decodetree. This accidentally broke XScale/iWMMXt insns,
because it moved the handling of "cp insns which are handled
by looking up the cp register in the hashtable" from after the
call to the legacy disas_xscale_insn() decode to before it,
with the result that all XScale/iWMMXt insns now UNDEF.

Update valid_cp() so that it knows that on XScale cp 0 and 1
are not standard coprocessor instructions; this will cause
the decodetree trans_ functions to ignore them, so that
execution will correctly get through to the legacy decode again.

Cc: qemu-stable@nongnu.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 20210108195157.32067-1-peter.maydell@linaro.org
---
 target/arm/translate.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5acd32e76a..528b93dffa2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5282,7 +5282,14 @@ static bool valid_cp(DisasContext *s, int cp)
      * only cp14 and cp15 are valid, and other values aren't considered
      * to be in the coprocessor-instruction space at all. v8M still
      * permits coprocessors 0..7.
+     * For XScale, we must not decode the XScale cp0, cp1 space as
+     * a standard coprocessor insn, because we want to fall through to
+     * the legacy disas_xscale_insn() decoder after decodetree is done.
      */
+    if (arm_dc_feature(s, ARM_FEATURE_XSCALE) && (cp == 0 || cp == 1)) {
+        return false;
+    }
+
     if (arm_dc_feature(s, ARM_FEATURE_V8) &&
         !arm_dc_feature(s, ARM_FEATURE_M)) {
         return cp >= 14;
-- 
2.20.1


