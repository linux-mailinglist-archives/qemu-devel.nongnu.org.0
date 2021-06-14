Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013233A6A8B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:36:16 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsodK-0008WQ-Us
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEp-0001mS-J9
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEZ-0000Sy-4c
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so13302144wmd.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLjCJA1aqkfuAtjVDAHVb/JY5jEizK36+MJvk9xH9xo=;
 b=sOHnibqLAtY0k+AaZOPcr56LH53hm/kKYM/IbNaxpF2sBeqyP/olbfO+Nl4SfMADIM
 kJwZw0eEpB53Ab2oy/5bod00E1rTVPncEIg9AmmDj3KP/djaMjK6xCk09oPMzSriAb8L
 CBKiN6+jeOqNwNCofAJAXcIOTnDifNqr2QchWM8oCTmCDXASxzsbWiBBG6poaNviWl/4
 Oh3V5LW0/YtnVRQaqqUndmsZBF0q9hwTkjYo0dLcKnezbXaPr1RlQLfGkrP+75ADh5D1
 DtcxE0ULQ0wFFX5N/fqx3Op/XwDe22Xs+v1T9ZRQ9tmcKV2Uh1ncoxy81yleNKwUgGT3
 qEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLjCJA1aqkfuAtjVDAHVb/JY5jEizK36+MJvk9xH9xo=;
 b=YkgkY2QzuIcUrHuug+r9JPyVWaWu9r69V8Srafe6tDb/1HCQ6faDhmmvtCjMBJHqxl
 EUf2X8KNsvm9EssyhwxG0EEqZIIfFf6KVOjfaa2zfVNaikKUi7vjaKSSVVwX9BDsdr9N
 kfm/wiukV1YeKxoL4POHDPbkyYuuTOrttiNFdKX5dzGLmBm4TOfD5JfbtmRcSJcvlA4o
 LNDpTACjoG40jUGgq22MpHITCsQYlD7ARfHGL4RzVsj37YTfCIcUK/YnfZULXWvmhZh6
 /wyeH3AyvqWifSJnW97OorMXC7W/qndPHF29qzLddukaQbgpEfUy/879q0+slQi4eri6
 NjKA==
X-Gm-Message-State: AOAM530Mc4Eb+9alavfRD0vabff0pKPkLcjQ9wJkWzvM9JvG3TXbZDmi
 nERPo+cWqeTdyuUE+uWdt5GQgg==
X-Google-Smtp-Source: ABdhPJxuVkm7YzvZaR3p/qjRyV1pYFu4TU33vm7w6sn5AwHlwLbTm5Isb4auizgZZLp5et0BXU/qug==
X-Received: by 2002:a05:600c:3b86:: with SMTP id
 n6mr17092888wms.50.1623683437698; 
 Mon, 14 Jun 2021 08:10:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 33/57] include/qemu/int128.h: Add function to create Int128
 from int64_t
Date: Mon, 14 Jun 2021 16:09:43 +0100
Message-Id: <20210614151007.4545-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

int128_make64() creates an Int128 from an unsigned 64 bit value; add
a function int128_makes64() creating an Int128 from a signed 64 bit
value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/int128.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 52fc2384211..64500385e37 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -11,6 +11,11 @@ static inline Int128 int128_make64(uint64_t a)
     return a;
 }
 
+static inline Int128 int128_makes64(int64_t a)
+{
+    return a;
+}
+
 static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
 {
     return (__uint128_t)hi << 64 | lo;
@@ -167,6 +172,11 @@ static inline Int128 int128_make64(uint64_t a)
     return (Int128) { a, 0 };
 }
 
+static inline Int128 int128_makes64(int64_t a)
+{
+    return (Int128) { a, a >> 63 };
+}
+
 static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
 {
     return (Int128) { lo, hi };
-- 
2.20.1


