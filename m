Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3159D3AE0B8
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:36:14 +0200 (CEST)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv56z-00027q-4r
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53s-0002Kn-I1
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:00 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53l-0008SY-Gn
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:00 -0400
Received: by mail-pf1-x432.google.com with SMTP id a127so1577832pfa.10
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h38+yrqYLEF8Qg/+ccdM2Tcru/YIUG4nfpAARgqgxf4=;
 b=HsavbWgh9WewKIU833VjpOBjbyIX8eTZj66A2oo++LE7Hym8C5kDAkEU5ce+eVpxED
 nOUtxUIVIUEAkJbWIl6WJdKX8cfdEw0/XQrsN/1uEHtaA0tsOF4U++MQWFIKf3DZ1o7e
 LsZKhb7eHaSjOhDt4/Uy3z7m3eUHrDEnUhi/HdzRYuGb2sYtFdsXq+C8Oi3+X5v+i2Fw
 NwoRo02QHunCsuKTQVdaIrvy/xu+UinAMJnNFfxIPunzDuLyKc6mVMxbg2p9J1iaxkvi
 jE16rDnaBt8dx8sXZPGyxMQ/LP418VgOGEmWCFui34cPs0Qit3iZf64WMsCrH6PS+jTX
 L45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h38+yrqYLEF8Qg/+ccdM2Tcru/YIUG4nfpAARgqgxf4=;
 b=gR3opwFS/TVvNSD5uDu09PgxwXmUQcIYDakqQCHGflI5+dW6io1sSMHZPKTTRwxajp
 NKlIjBy4cwxqReGh4faFsOHuPf8vOJen5SrXK7bsV3o7wIRg1Zym1FqqfpIFdXKZPtUO
 cz8FN5iJPQYwiukZEI/oxMZfVcBH3u8mPwQyskgQwZrz3KVjdw8gc5Sl10evIV4+zepP
 FtMUaewLl4JNvQctNbvmJ5Zvqb5D+OMgEJolEB0erxzOTbKG6Rm3l9bli0YIPvg+Ujaw
 6cO7r4LeyrFDBRWTNZhQCdhEmTlM9SZaHvFZdttO58qXQBIELligP195em+Is43RE3nt
 rK8Q==
X-Gm-Message-State: AOAM530ImMfCnGN4fcV5QiNrQS76rzB7AYjqF8RtlKmlb7fmxVHJ6OQA
 DUaKV3CgKVo2BUwLmMi/P5s+ITpYXHnNiQ==
X-Google-Smtp-Source: ABdhPJxkGjVNPZ8YxKsTOmsF7nnAA7jBduRYFGe5QrP7zzDugm/gaPfSmWnVHbI059Ewv4YGJ3zIPQ==
X-Received: by 2002:a62:f20a:0:b029:300:43ed:198d with SMTP id
 m10-20020a62f20a0000b029030043ed198dmr13394188pfh.55.1624224772317; 
 Sun, 20 Jun 2021 14:32:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] target/cris: Remove DISAS_SWI
Date: Sun, 20 Jun 2021 14:32:42 -0700
Message-Id: <20210620213249.1494274-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index f8b574b0b6..24dbae6d58 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -55,7 +55,6 @@
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
-#define DISAS_SWI     DISAS_TARGET_3
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3310,7 +3309,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                    to find the next TB */
             tcg_gen_exit_tb(NULL, 0);
             break;
-        case DISAS_SWI:
         case DISAS_NORETURN:
             /* nothing more to generate */
             break;
-- 
2.25.1


