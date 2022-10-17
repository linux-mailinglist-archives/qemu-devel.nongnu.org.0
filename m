Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC606017C9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:38:14 +0200 (CEST)
Received: from localhost ([::1]:36766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVwC-0007Sc-Sx
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVey-0001qe-Td; Mon, 17 Oct 2022 15:20:25 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:40938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVex-0002k2-9o; Mon, 17 Oct 2022 15:20:24 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1364357a691so14382887fac.7; 
 Mon, 17 Oct 2022 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ic7dM+KcZGJmcI0F6TLz1/fbPC40ME5FUv0YiqqnwPg=;
 b=aTN4YVNvm7UuT/kWEOFFd1W2wO9aE10H1BHvXglVP5V98CBFK5aelFZYUzkQJDSQiS
 aSjagJ+jfmlh4pyK+7hxEAKarLES0SF6JwGBYoKwiFEr0QhgzxqDrXb7Oc9QiMwCBypQ
 w0zIgg9SZKX5eC+v8b4MCQ3Lb+u1zFnR22scK0vv4GwhC97u5/OLqBU6wPHFRBY7r+7I
 6vbgVObcUrMKg+ZXP1NYvnT4yo9i2k4BmNPTWrLGVp+446EAoYKzeakxtuYKKy1t8aIO
 YCl32uEtEfWi1Q2KTfgWRUBtRzWMk+bMz/8KLDON8FNMj77LjBzRnAqEuhp5ntci3pQx
 ss5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ic7dM+KcZGJmcI0F6TLz1/fbPC40ME5FUv0YiqqnwPg=;
 b=TfjUbWhXIA1YwZa9M5tX/t1Lt0s3+HHZbigNn3xj6rKKov1zeMYZbvatdaUyyhC7QQ
 Q6GowuLgMv91DkpaxQKSu4OUZebOxqtDj/23KmtBgsBBUt3v6UXbRrE7cKhZtWH122rH
 7HE/HBzZyMwusoOgExaNvrP7cCBR3a+YCzM1gFGaziOzeBmIcHFbFDZZ6EmmpIt/gIDC
 YTWVb49U7UzLY6zPL+zmUICcJnZWGcvxvCwTNx9HFSF4jr4n/58lfeEWJfmRliPZp7Kh
 7hp6JtRL2e3IG6tMB+4jYvDZVbRMuQh1XFqtGPm6Ug0iVuru22HGVQWsNRQoln93MBu7
 qoSg==
X-Gm-Message-State: ACrzQf0d9jd2ioEN4pXwqzw52mNaagoJi1WH2wKgUnOSzQ7h2U5HhHnm
 MQ8vwXx4MOBR0U/UmxLdr1rH87xTkUk=
X-Google-Smtp-Source: AMsMyM6Y43f7w8MFvcHep00VW7Yf2rHjPI7/srWUao1MmlkwJghD8qBpSfn6+wW3tZ6WybtfEQ8CHg==
X-Received: by 2002:a05:6870:3415:b0:133:197:3ca3 with SMTP id
 g21-20020a056870341500b0013301973ca3mr16471148oah.115.1666034421279; 
 Mon, 17 Oct 2022 12:20:21 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 02/38] target/ppc: restore powerpc_excp_booke doorbell
 interrupts
Date: Mon, 17 Oct 2022 16:19:33 -0300
Message-Id: <20221017192009.92404-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

This partially reverts commit 9dc20cc37db9 ("target/ppc: Simplify
powerpc_excp_booke"), which removed DOORI and DOORCI interrupts.
Without this patch, a -cpu e5500 -smp 2 machine booting Linux
crashes with:

  qemu: fatal: Invalid PowerPC exception 36. Aborting

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220924114436.1422786-1-npiggin@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 214acf5ac4..43f2480e94 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1247,6 +1247,12 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
         env->spr[SPR_BOOKE_ESR] = ESR_SPV;
         break;
+    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
+        break;
+    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
+        srr0 = SPR_BOOKE_CSRR0;
+        srr1 = SPR_BOOKE_CSRR1;
+        break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
         if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
-- 
2.37.3


