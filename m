Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4DC6A660C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCf6-0001zZ-N7; Tue, 28 Feb 2023 21:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCf2-0001Xe-0a
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:44 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCf0-0003It-Dp
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:43 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso293658pjv.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tz+a4Q6N19bIal6FhX5yvIe/tqM68mxKR4SimMfJ6tI=;
 b=g1MqyZMuNfROBeR6DDchfV9MT2uAXGBxgmYOtxkKlRXVMFXjYFr79fSSMdWJI0bKFj
 i5ZyN4+xMw8Cq9yqPlXdO7yP3pVygiBsbIWyYCeSvWLocTb2nYhxjiGsv9es0v73BnTS
 Zih11zgmICiuyFpdBeS9OwGHsTYIeSW7aADiXTBVkpkH0VwxEu4wtQ1HHcTl+BnZ7aCk
 7d80y4/0O7n5nsyrHp3LOXB/ZFmcwAsILGj3nVjybtGtXgYr5aV44PsBLTnzLrX1yUeZ
 U+WiNioVGZL/BT4vRuqC0/Ca3b+aIahW6s6l5ScXKGN7n2WOXRBOdrZsKgzdQyCzutEy
 sKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tz+a4Q6N19bIal6FhX5yvIe/tqM68mxKR4SimMfJ6tI=;
 b=Yc4hE2m6jHC7BX+tO/kdsN9hsz2FbU8JPBUFzyxPwi76X/Nc9T/tFjzpJw139Mdhap
 hjHbHdTNGsoPYVGcmZJFqlELsmb5WGZ+0h00FUWBZ0DSOJTo91QQ5wjK49n4+kZCiT1d
 nbRkxS8NOAEXSqLM9K3m2tzfSI0BgfCkuG7Uwy3qobnT9GTXEq8q1DUj/t7lt9L+Pp60
 sOWO5apdFS3cTxHHsd4GNRpSSlW2X66zmFPqYY8jY5x/ryt0KNlIfCxx/HWtpJZcwg2X
 P3WHpmVtifPdqZpxdv4AlSqHwwzeSxvHskdcPSQt2T2h5JIUwkprz0mm/lhXKsLPn+qt
 WWEg==
X-Gm-Message-State: AO0yUKWdiSBkpV4/EQRJLhsuK0HSnCJ4nj+9qdKw+8VuXRloZ6sGB/TD
 T3uCcx4LGkjyZLivPuqDtXg+s3tdwRfi9L5sGAw=
X-Google-Smtp-Source: AK7set8OwhEb2mEBO9ZxMmvxyn98cKUHlN0vzKcUsX1kPFiyVifoYiFjSVinFfh8vF0q3j3unAbCiA==
X-Received: by 2002:a17:902:e542:b0:19c:b7a9:d4a4 with SMTP id
 n2-20020a170902e54200b0019cb7a9d4a4mr6220255plf.37.1677639460981; 
 Tue, 28 Feb 2023 18:57:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 32/62] tcg: Adjust TCGContext.temps_in_use check
Date: Tue, 28 Feb 2023 16:56:13 -1000
Message-Id: <20230301025643.1227244-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Change the temps_in_use check to use assert not fprintf.
Move the assert for double-free before the check for count,
since that is the more immediate problem.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 9822c65ea8..855e4cc537 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1374,16 +1374,14 @@ void tcg_temp_free_internal(TCGTemp *ts)
         g_assert_not_reached();
     }
 
-#if defined(CONFIG_DEBUG_TCG)
-    s->temps_in_use--;
-    if (s->temps_in_use < 0) {
-        fprintf(stderr, "More temporaries freed than allocated!\n");
-    }
-#endif
-
     tcg_debug_assert(ts->temp_allocated != 0);
     ts->temp_allocated = 0;
 
+#if defined(CONFIG_DEBUG_TCG)
+    assert(s->temps_in_use > 0);
+    s->temps_in_use--;
+#endif
+
     idx = temp_idx(ts);
     k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
     set_bit(idx, s->free_temps[k].l);
-- 
2.34.1


