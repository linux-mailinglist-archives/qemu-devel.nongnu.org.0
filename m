Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECE069A267
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlP-00006w-Cb; Thu, 16 Feb 2023 18:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlK-0008UX-J8
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:02 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlI-0008Pc-Qc
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:02 -0500
Received: by mail-il1-x12c.google.com with SMTP id m18so838346ilf.10
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvM91y79wsNlj247LVT9SBZIPzmchHvn7spP1Bu6T5s=;
 b=7k5QiAXq0ticqh0qUPNXOHL9z7p0sH33VJy//mIRmfuaX9ldG4uRgveEjGno+0J1r6
 B0wAg9Fp3tmuJF64/RTZDh7iH2Y0SqLTG39eQ7d+38yuXbetTXlGV6yuFNOlEK9KnCEI
 qkk0P4DCgUmGonrk4fkicyr9ovtugtQw2ove1qmE9KcIipk790SrG7yq3RUaztq1kLB6
 lP9nheqFqEWzrW7atmFlbtWc64uvUZfIlHWITSpeghOxYcjGgbHfpvHQFUBjMkJEwwBx
 dQR0Ig1D3RuYNZlTd0E3+ndUJWc03cO2N4KEFfM6Zgx3pwzjhu6PExb5cywsDmXYRrkb
 npvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EvM91y79wsNlj247LVT9SBZIPzmchHvn7spP1Bu6T5s=;
 b=1F71MNLfc57Lo3phgmy1dtYyPgrk9WgIjJkHyFQCjLazZnU/fYGynbrtVwYQkoSt9q
 YMVYFtibblrYi4ab1hRSgh8SEJ2h8ESGqMA4R4OCIgdu8StXpGmQOqPRYqf4y4UaORlN
 yh68DKR52GfUmMen4aRnKFfK+XDNSu1Xpu0+GoYL/RXZtpVNuirOFkgfCvIs5P98Wyob
 Tvx1igO0mbtzhqMzjpmb8sRZAdjHzGeo82T4xFBvcxFAPN9AKYg/qEk9PK+xNyIqaO96
 iJUhUp+Wmt8pgPi1LEkB3y4S8O/La8XB6j2G7z/r30by1lZ600IHCdkoq50GS0ILAH5t
 /2tw==
X-Gm-Message-State: AO0yUKXqEp9Il4k8vrmFJ2+aX2kPpY1iM4GCAa3pKw+xrXlEEFDBLm2z
 2wGzcbXHZscAQIGuIvuvlOx+Qoeas/FRmJPi
X-Google-Smtp-Source: AK7set+2jeVeS8E0fpEov3XM8ov9lY6os41vEyxDbuZHg7pFdrVftUYIvzjeY/jBqXkPEwp72ZKMKQ==
X-Received: by 2002:a05:6e02:1e05:b0:315:4b70:8370 with SMTP id
 g5-20020a056e021e0500b003154b708370mr10223697ila.9.1676590439866; 
 Thu, 16 Feb 2023 15:33:59 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:33:59 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Sean Bruno <sbruno@FreeBSD.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>
Subject: [PATCH v3 05/11] bsd-user: Helper routines oidfmt
Date: Thu, 16 Feb 2023 16:33:47 -0700
Message-Id: <20230216233353.13944-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Stacey Son <sson@FreeBSD.org>

oidfmt uses undocumented system call to get the type of the sysctl.

Co-Authored-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Co-Authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Signed-off-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 9b84e90cb32..1bf2b51820e 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -107,6 +107,38 @@ static abi_ulong G_GNUC_UNUSED h2g_ulong_sat(u_long ul)
  */
 #define bsd_get_ncpu() 1
 
+/*
+ * This uses the undocumented oidfmt interface to find the kind of a requested
+ * sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt() (compare to
+ * src/sbin/sysctl/sysctl.c)
+ */
+static int G_GNUC_UNUSED oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
+{
+    int qoid[CTL_MAXNAME + 2];
+    uint8_t buf[BUFSIZ];
+    int i;
+    size_t j;
+
+    qoid[0] = CTL_SYSCTL;
+    qoid[1] = CTL_SYSCTL_OIDFMT;
+    memcpy(qoid + 2, oid, len * sizeof(int));
+
+    j = sizeof(buf);
+    i = sysctl(qoid, len + 2, buf, &j, 0, 0);
+    if (i) {
+        return i;
+    }
+
+    if (kind) {
+        *kind = *(uint32_t *)buf;
+    }
+
+    if (fmt) {
+        strcpy(fmt, (char *)(buf + sizeof(uint32_t)));
+    }
+    return 0;
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
-- 
2.39.1


