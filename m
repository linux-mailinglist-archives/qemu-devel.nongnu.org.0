Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6628A0FD
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 19:29:17 +0200 (CEST)
Received: from localhost ([::1]:33918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRIgF-0001v8-UQ
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 13:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIdV-0000Ki-62
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:25 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:32919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIdT-0003q3-N3
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id b8so460572wrn.0
 for <qemu-devel@nongnu.org>; Sat, 10 Oct 2020 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gETh5/Gck0bTQVP31ZR4AiV0ecmQtPxoBf6GwvczWOs=;
 b=iI1HoX+YZZdHeu9yNUFeeX/+y0NDPSiOXplkKT3YYlRqP8BM/oJ7Nupak3enQioODa
 aOFVPw0RR1lKe4G50Qj44zIJnAVYzRqc4SkTcI8QL65BP5qzwxV3tuKK4fLUa8+10+ph
 VpbrM9e19vHtJFoUu6eGZIE16CWrlcQuJocJ+Gg245B7HhZzH6W46X7ky5B1JZsQ/h1m
 /ngTjCVFtQb7Le4ZGtn4RMyaLaNeb95Do0sVg0MfMeHcvZi0i/9I+j68k9eJVB+ThEfQ
 5DEPq0w+zZt1VMNQjnwgPv2UxEgX1cc3Y8WWEBZdob3xGSrdh0Q8EW0xJ8m5jGHZDush
 Ttlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gETh5/Gck0bTQVP31ZR4AiV0ecmQtPxoBf6GwvczWOs=;
 b=MBf0cSeyKLhjyctMptOLY8u301juLnYVHIk29swsr7b2eOMatX8NW+sH++4QBZP1Ld
 2kXoYqG4Ce3CMbU9FBiBrs97BNqdGNWiHKnQimlpRpjZqHjKQSFXsRCscTJjxpgkxPv4
 27C+owTu5vq8uQBBtZ0SapwD1CRVFPAms1+d90hdBQ4NVApRdgUHL9jB2k2QzQxFv+ae
 XlyCWNMp62SkwO/qfRdnIDc60zvpwvyOtF6Br5gKPyltkbLdhOS80ypiiHc9nmxrLoS+
 NY3N0n3NY48//IQ6LafUEPfRS11HWPY04t/naFEfZ//wuU7QxsUlt0hrmWGNN/32Xupd
 7Dzw==
X-Gm-Message-State: AOAM533MjJIfWhqfogdKP7pPdEG51e5JGo6UvJehsNTJtk24Km9F8k/F
 fJOTwPdr7JN5TlJH+jnfIVK/4Hej/EE=
X-Google-Smtp-Source: ABdhPJwKhmFKDk4ukX2yk58h4kOzGiduNDVAXZx1ib6Re0lZQFj3f/YfHiM5o8cKnVhFgLvyrpAa6Q==
X-Received: by 2002:adf:bacc:: with SMTP id w12mr11547986wrg.66.1602350782061; 
 Sat, 10 Oct 2020 10:26:22 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id i11sm16786068wre.32.2020.10.10.10.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 10:26:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/20] util/cutils: Introduce freq_to_str() to display
 Hertz units
Date: Sat, 10 Oct 2020 19:25:58 +0200
Message-Id: <20201010172617.3079633-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201010172617.3079633-1-f4bug@amsat.org>
References: <20201010172617.3079633-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce freq_to_str() to convert frequency values in human
friendly units using the SI units for Hertz.

Suggested-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/cutils.h | 12 ++++++++++++
 util/cutils.c         | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 3a86ec0321e..4bbf4834ea5 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -158,6 +158,18 @@ int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *result);
 
 char *size_to_str(uint64_t val);
 
+/**
+ * freq_to_str:
+ * @freq_hz: frequency to stringify
+ *
+ * Return human readable string for frequency @freq_hz.
+ * Use SI units like KHz, MHz, and so forth.
+ *
+ * The caller is responsible for releasing the value returned
+ * with g_free() after use.
+ */
+char *freq_to_str(uint64_t freq_hz);
+
 /* used to print char* safely */
 #define STR_OR_NULL(str) ((str) ? (str) : "null")
 
diff --git a/util/cutils.c b/util/cutils.c
index 8da34e04b0b..be4e43a9eff 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -885,6 +885,20 @@ char *size_to_str(uint64_t val)
     return g_strdup_printf("%0.3g %sB", (double)val / div, suffixes[i]);
 }
 
+char *freq_to_str(uint64_t freq_hz)
+{
+    static const char *const suffixes[] = { "", "K", "M", "G", "T", "P", "E" };
+    double freq = freq_hz;
+    size_t idx = 0;
+
+    while (freq >= 1000.0 && idx < ARRAY_SIZE(suffixes)) {
+        freq /= 1000.0;
+        idx++;
+    }
+
+    return g_strdup_printf("%0.3g %sHz", freq, suffixes[idx]);
+}
+
 int qemu_pstrcmp0(const char **str1, const char **str2)
 {
     return g_strcmp0(*str1, *str2);
-- 
2.26.2


