Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5475F3ADB22
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:35:16 +0200 (CEST)
Received: from localhost ([::1]:54654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luesA-00015D-QO
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejs-0003Uf-MX
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:37 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejq-0003bC-N1
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so9823375pjo.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpc1WrheeU5iNPnwpSE6u7zT/0eX+9soFRaS06BemqY=;
 b=MmZxdG3VFzJYrwxXQxS6kQGjVu3v8j6Lc0WoXGnXj0lN8myoXPHEJYPlgEaPk30aAd
 nXMWgMlg6GY4k/nuxvhSNjSz8azECg1Iz0DAAuzkf5k4Sla3gAjRNR0Rcway22BRnnQs
 xSoOUkBEoaaAm1kr/fe7BxZvroEySADsbK4woo5PiyUvOEFbXWtztDL/lTiaV+j2RkVL
 0b+scJCef4ecZTaEfV9TIJzOIt2CKVqi9iwZoNOrxe9iuUmc6Gb6YydLF8I6crEgl5WI
 jLed3dY8N2du01jg0BVKKGyE9zV3ltqSkahrXAap8V+qoPsAwZfXUXZCtCeBLZshyawR
 dmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zpc1WrheeU5iNPnwpSE6u7zT/0eX+9soFRaS06BemqY=;
 b=q6pgOoOTEJWx6sKRQd2LhkMI6Ve0ys31urfIrekVcR3IAO1oOWGD5SS6ncq8bceAek
 MpWul2N2bUYviD/wI+H0zzTkoPYU9e6YRGTP45U/hkQElD02vgML0yxtzTZIxORUPwhr
 J3UfRPI9hl/AShwPRurElul4TtbIFFgCtHYxkWkY2vPp50vbdkQycPmSkwFwRrbVRUSt
 u8/JAHIxRtKKjl5nGwqbo43HimWXJbOLd1IUx4o8XhMIegjFW9jYetPov5Kmbs5I9ee4
 0R8l8QEnhvuiG1kL9qQRO/kHAXlx6a2Dz3mcYZebVLWlQskpS22p/lcGB6IVYQdahhhH
 gZaQ==
X-Gm-Message-State: AOAM53079BveoiHiS4sWBP4GzlzaRjq4ydtnIhq07F9ZLrWZQEF/KNjp
 pDu9L0dyOC2A36JDPqqXaRDbAbG1GKELYA==
X-Google-Smtp-Source: ABdhPJx6J2KCkHNz/yy/e5564SRkyuw58QutBIzsJcqbUI6O4c46wD2YL5XYCmkzylF6JD5v6/chjQ==
X-Received: by 2002:a17:90a:db98:: with SMTP id
 h24mr14283688pjv.62.1624123593511; 
 Sat, 19 Jun 2021 10:26:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/15] hw/net/e1000e: Fix impl.min_access_size
Date: Sat, 19 Jun 2021 10:26:20 -0700
Message-Id: <20210619172626.875885-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are certainly architectural 2 byte writes, as evidenced
by the e1000e_set_16bit function.  I also saw a 1 byte write,
though that may have been the fuzzer.

Cc: Jason Wang <jasowang@redhat.com> 
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/net/e1000e.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index ea3347fbb4..ad73e39ebc 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -185,7 +185,7 @@ static const MemoryRegionOps mmio_ops = {
     .write = e1000e_mmio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
-        .min_access_size = 4,
+        .min_access_size = 1,
         .max_access_size = 4,
     },
 };
@@ -195,7 +195,7 @@ static const MemoryRegionOps io_ops = {
     .write = e1000e_io_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
-        .min_access_size = 4,
+        .min_access_size = 1,
         .max_access_size = 4,
     },
 };
-- 
2.25.1


