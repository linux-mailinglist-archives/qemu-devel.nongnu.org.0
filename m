Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355FF2D99E4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:26:54 +0100 (CET)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koooO-00045S-9H
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSO-000242-4q
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:08 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSG-000406-Vz
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:07 -0500
Received: by mail-ot1-x342.google.com with SMTP id j12so15758533ota.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UM21CD1mNWN7mJCqUB/udHXRZq9uSUYW+rGuZNQcpWU=;
 b=mmYnb0iurTs3YTRolqgx0ntpwaogURR1wm85OK6tz3yxSeYjRy3WeK+sOWvQbCCRke
 CZ+dIANJHXj2NDAvLNYLaPMWR9bO58cujfI6i6DmAk2lfrhkVuvw1o+w0JoNBYK6TpPW
 JmWqo33aM4ioC9y9Fsl3+mPHm2UjFFFGSQxPL2kZJd3yFEclGNM4RGlqzMcEPDlx7pMD
 0owaT0Oe+nfZWFYjBJql3Ii4q1pa0oS/eRpimU/M17v+Zjcx0A70GaXx/dFnXEHU9xUp
 Km8PBHLQVn05oPSWxHEyGPgKf8SOA3lMI9nPwowglZZS3dkG2BH/cllaCbSxCl79wEfW
 md+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UM21CD1mNWN7mJCqUB/udHXRZq9uSUYW+rGuZNQcpWU=;
 b=XJRv9vnCozvO3v/kT3BLH93VQ4cQeeIqsosabL4iNvl+V4SJOBY5JrZNTcFWjk1XKF
 3sje16Rw/QmRjzkpK90eWFjVkYUNUqqOewyg6O0PHchzmHUJ9QuRCYKgHoKm4p7rf9vj
 C6xUJzH9l2Mu/Lemh/7DGhhL61YiEP81ooWTwJqnoyn4J7Bj3x1bU72RRBYw8MQz3rPj
 GYNW5FrutVm3z1x2BZ+tRjOnp6VTp5htMsBNb6EjhWAlJLVHS2rmtgX0tMxe/7GDDl/X
 HcRMChzNHPQsH+tqgQTM+yTg8kPspZQPeMUlU716P0dvN3F5urKxhmjklOjUKO5/5qVT
 EVhQ==
X-Gm-Message-State: AOAM530CFk8A9e3Wc8OfwMH0rVd9lunmyqsho2aijH0QEXNhA1XdEa64
 vZhdo92EyBiQFb0GqLwoCjl/40I23+MAGDew
X-Google-Smtp-Source: ABdhPJwAgWPT3ctTc6HKMYguxAxRogT/zguOKavelLPMMXuXOcpQcVDhUFgXlVE2p1xA1Q7RULSDtw==
X-Received: by 2002:a9d:650a:: with SMTP id i10mr8081997otl.341.1607954639138; 
 Mon, 14 Dec 2020 06:03:59 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/43] tcg: Introduce tcg_tbrel_diff
Date: Mon, 14 Dec 2020 08:02:57 -0600
Message-Id: <20201214140314.18544-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 67d57695c2..90ec7c1445 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1141,6 +1141,19 @@ static inline ptrdiff_t tcg_pcrel_diff(TCGContext *s, const void *target)
     return tcg_ptr_byte_diff(target, tcg_splitwx_to_rx(s->code_ptr));
 }
 
+/**
+ * tcg_tbrel_diff
+ * @s: the tcg context
+ * @target: address of the target
+ *
+ * Produce a difference, from the beginning of the current TB code
+ * to the destination address.
+ */
+static inline ptrdiff_t tcg_tbrel_diff(TCGContext *s, const void *target)
+{
+    return tcg_ptr_byte_diff(target, tcg_splitwx_to_rx(s->code_buf));
+}
+
 /**
  * tcg_current_code_size
  * @s: the tcg context
-- 
2.25.1


