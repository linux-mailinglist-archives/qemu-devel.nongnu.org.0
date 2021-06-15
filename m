Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682183A8451
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:48:01 +0200 (CEST)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBIG-0000QW-69
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEt-0005ou-Rp
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:35 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEa-0000uj-Gm
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:31 -0400
Received: by mail-wr1-x432.google.com with SMTP id c9so18861664wrt.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2FN+DLCkRaewYYSAAvTveP7CUhTuCt0YRLwdFHpiWrg=;
 b=SwOZcToum7CpXllqNqZaO2CK3e5CMxqWfw+SGK3oRnN82zGIw6074AOVKYoOAgKgL6
 +4gpEkln+B7GbiaBC2dK+7Kt5x+20Sot4jzu37fh3UCA1Z/n1zj8RXTlCn6lh7g0QTv2
 YvCOS7wDDwBzaelaLlWaGOqnCpHQSqbSGKEqSQi4z7MRNe1vKzCZ2eUapHlhrIp0Z7ur
 wfQHP1yeigPJ9OJFbcekIlZxnqROm/a1tbwcBg20VUPISwoR9ytsrEyZTE531rlLGqxr
 FtooJVo3lD1KIeUWiOyjYk584ngdZu5LDgj5JCjRQleKxG5vqTrME/8pWUvhu3YZSCGV
 vXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FN+DLCkRaewYYSAAvTveP7CUhTuCt0YRLwdFHpiWrg=;
 b=l1Cecaic3CRKXq47NFLcZlqYSNFoEF22Z9JHOLARvVCmwyWvq4saBsUAqVxxEVcsFy
 tuhQhLDCt8H9HeonVQ7mJt/X9YFeLyPpNf3YtEGBNGX6zXWAUCky0iMW47IuUCtFStw8
 AthqivMJvROTAm8rDgOoohBrCf/aAGj17Nlix5rwpwkQX+2aq1W1WJNiJ1EL9WGO5xEU
 eQW9th5qwNwlcvKZ5ySnfYbw02gP1h2yOgpyCoNBORl3sraVk9BrIfcTYE0Iz5GHExmc
 eHU7Fs8FTR2lK1XwYXwyJP2esA1LXfHikJmamHN8+SveDpVpzrzfoY6re9DQlhiw6rXb
 tbDw==
X-Gm-Message-State: AOAM533WWOjatrdHvTa0Q6QWPAhsfUTF42OkkwAHSn7qSf16fjYr6HdQ
 sV3SuvgtzBk5FrDe5+KuGgG1TNui93JGVg==
X-Google-Smtp-Source: ABdhPJx7CQTFmtXejD7c5dXSeogwDWgt9V9SJfGqBpE+EMsCM80AkYGrJlSCiLdh2B5r7hprEuNgMg==
X-Received: by 2002:adf:ce90:: with SMTP id r16mr26696426wrn.146.1623771850334; 
 Tue, 15 Jun 2021 08:44:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/28] target/arm: Diagnose UNALLOCATED in
 disas_simd_two_reg_misc_fp16
Date: Tue, 15 Jun 2021 16:43:39 +0100
Message-Id: <20210615154405.21399-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This fprintf+assert has been in place since the beginning.
It is prior to the fp_access_check, so we're still good to
raise sigill here.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/381
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210604183506.916654-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8713dfec174..2477b55c53a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13234,8 +13234,8 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x7f: /* FSQRT (vector) */
         break;
     default:
-        fprintf(stderr, "%s: insn 0x%04x fpop 0x%2x\n", __func__, insn, fpop);
-        g_assert_not_reached();
+        unallocated_encoding(s);
+        return;
     }
 
 
-- 
2.20.1


