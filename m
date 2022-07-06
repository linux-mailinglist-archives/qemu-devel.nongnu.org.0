Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF935693B3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:56:55 +0200 (CEST)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9C4s-0006ER-4n
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMR-0000kc-Nn; Wed, 06 Jul 2022 16:11:01 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:33742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMQ-0003kB-5q; Wed, 06 Jul 2022 16:10:59 -0400
Received: by mail-ua1-x932.google.com with SMTP id f10so855721uam.0;
 Wed, 06 Jul 2022 13:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9cXm17hTCi1TjgvbOEoM4gJUV/KdXNe0jzMbUsvlM0=;
 b=KhGo/+u9rqeY94QVHxntfin0r2IHRd2qfImYggA2KCkOyntIWDryc+Q7Fxg4vyuR8m
 OG/dswupfQsl6nv/iw5wL3ZDECKcnfqisn8Ux7zRRz8rhDnVmuH/veGeb08LuCIQQvBp
 MSHrhXBOXj9w0//LSwCsScULLxo0S0mH/pJ/jSNr65xn8LRDvg3Lxh+xO6ZR7fWvWYOS
 J0bS/j98RyzzSbdvig5ASr871secd0xKAcmLQNTIeEWkX4GPRJurSI0hQCwRed7DnunC
 ViTRQmRPsRScLAV9vwGF4NCu/WRXUXiiJAPBteowMYrXZRukcNnzujbpNAxqol1QtASc
 zLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9cXm17hTCi1TjgvbOEoM4gJUV/KdXNe0jzMbUsvlM0=;
 b=bZBlcwscHcf9z/2A/fGm/ZA8gPaLne0p4v0+FBRlauxLIL8akhORg8HkmZ/8LpBh2J
 +ejidVw1023VG6CMe5Tx3cM+d2JOdONNa+5/TWdbJAl3C5sP8QxClkZSeomkdZFgEX4V
 IIUpQspQIKiFSwre9paQIG1x+MfqyDJpyEbpSTUytfD3mNp3tHbKtNablBUwiEW4fmUv
 58wVfR48cR0PaE8wRKk/jAmJufFZg5p8afmtktacKhdHDxLiyPvoHPxbB44I4urwpyAn
 FU516ukyhgs7CDSQntDAIxwm++C0rjQsWUgW/13BYlU29n37F8QXtPXcH8AChNZCkYYB
 4rpA==
X-Gm-Message-State: AJIora9TxUlSlgHXexT+fStidDFn5K6obKKKuC8MJ+2m4oLS2ckaKduO
 BaAR59AGRG4erC7lQupBsB80GMOUbVI=
X-Google-Smtp-Source: AGRyM1t8DyRac5FSXljopHxA6U9frtop3l7/xlMi23HjYsSnggv0ERX8OOf20ZXPTHuQYRo/0HHEXA==
X-Received: by 2002:ab0:7501:0:b0:368:97ec:fafa with SMTP id
 m1-20020ab07501000000b0036897ecfafamr20047219uap.5.1657138256864; 
 Wed, 06 Jul 2022 13:10:56 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 33/34] target/ppc/cpu-models: Remove the "default" CPU alias
Date: Wed,  6 Jul 2022 17:09:45 -0300
Message-Id: <20220706200946.471114-34-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

QEMU emulates a *lot* of PowerPC-based machines - having a CPU
that is named "default" and cannot be used with most of those
machines sounds just wrong. Thus let's remove this old and confusing
alias now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220705151030.662140-1-thuth@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu-models.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 05589eb21d..8538493061 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -917,6 +917,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
 #endif
     { "ppc32", "604" },
     { "ppc", "604" },
-    { "default", "604" },
+
     { NULL, NULL }
 };
-- 
2.36.1


