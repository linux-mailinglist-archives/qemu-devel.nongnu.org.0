Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E482F38FA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:37:54 +0100 (CET)
Received: from localhost ([::1]:54460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOYD-000336-GR
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWW-0001Kt-Ka; Tue, 12 Jan 2021 13:36:08 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWV-0007Ma-4N; Tue, 12 Jan 2021 13:36:08 -0500
Received: by mail-ed1-x529.google.com with SMTP id h16so3452689edt.7;
 Tue, 12 Jan 2021 10:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0MM0ZvXm81S3gxFhlsST007qT204dpEehr2O4ofqxQ=;
 b=KjFZd81utKeR/XF08XMBeTVS9v7vUehzuq1k00/ZDOdHUVHbexNITTyQzD8t9rnSLI
 RU3252frLzqIYQB3voniiNW+NJfI7NA+68e3c+ZcpPtOaPF1ZIZmJnFc5EreipzHs0KN
 AS3PvI/ukfRcgkE9gWQrBOQxMVr0+QCOJq295MUREv8TEqcc8FeKat9gvYfYffg+jmW8
 t/sBZJ6GcEvlTZlr2J34IO1VJ+OwAoxpGa2MKlHTfGy5nngPsbyBncpSzC/qZnm4BlUr
 9fWVahkQ+b3s2mPXWn8Ck5TNSd8IP4euMjv8w47TNvIkKtPUTWWALx2fTOvk1jftc3TY
 tA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R0MM0ZvXm81S3gxFhlsST007qT204dpEehr2O4ofqxQ=;
 b=MbdwDwYPma1NPjjv1qggLE2fL6BjmwJDSYHAN6+WLXmztJXuUUMt+gmidvrBWPMEH2
 GGEH4U8u7MH2Z+jLlQF3C8gmJKEZxzk7uF1at75EMqcE9uvJNT23zzj5L5wE1zb1s6ZN
 mTxv/nkxZx884ythKHvMo59to1n79u0RknBLAGpI0YXOXLnHotsC9oyxSiH/7O9JS+kv
 VJ3rCXobWswvGIT7o3hNcL7eEZt8HlDS+TviksPIThlkcKP67AQKUUvyGDOD0YVivWry
 Yaed8Yl+XA5Xa+QTV+UxF+gGvpTSxIvNdGfEWgBRLTwixOnD4dyM0c2e3uFtgVpp7R/H
 uLDQ==
X-Gm-Message-State: AOAM532M9Mj2VVCcW0chPhy55vY3tfFUePPwun1LKBG7/qzk1zN3RlKs
 +FUtszERGJtRaMAJXjJrMEcJaxmF77Q=
X-Google-Smtp-Source: ABdhPJx3CqJDao2pbNTliZ/mlAU1Sgl2f2xIQ2UdeyLer7cPCC4f/IRYkdl/W7uAQA+9WD6KPU/pcA==
X-Received: by 2002:a50:8a90:: with SMTP id j16mr364550edj.334.1610476565506; 
 Tue, 12 Jan 2021 10:36:05 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id bo20sm1862004edb.1.2021.01.12.10.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 04/11] hw/ssi: imx_spi: Reduce 'change_mask' variable
 scope
Date: Tue, 12 Jan 2021 19:35:22 +0100
Message-Id: <20210112183529.2011863-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 35ab33c0511..bcc535f2893 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -303,7 +303,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 {
     IMXSPIState *s = opaque;
     uint32_t index = offset >> 2;
-    uint32_t change_mask;
 
     if (index >=  ECSPI_MAX) {
         qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
@@ -313,7 +312,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
     trace_imx_spi_write(index, imx_spi_reg_name(index), value);
 
-    change_mask = s->regs[index] ^ value;
 
     switch (index) {
     case ECSPI_RXDATA:
@@ -357,6 +355,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         }
 
         if (imx_spi_channel_is_master(s)) {
+            uint32_t change_mask = s->regs[index] ^ value;
             int i;
 
             /* We are in master mode */
-- 
2.26.2


