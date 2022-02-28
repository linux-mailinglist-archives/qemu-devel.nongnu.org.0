Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623864C757B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:54:57 +0100 (CET)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkEa-0002JM-Eh
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:54:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAK-0002Er-DV; Mon, 28 Feb 2022 12:50:32 -0500
Received: from [2607:f8b0:4864:20::233] (port=43532
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAJ-0007v4-1K; Mon, 28 Feb 2022 12:50:32 -0500
Received: by mail-oi1-x233.google.com with SMTP id s5so13902234oic.10;
 Mon, 28 Feb 2022 09:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rzmueRPm0t5lahZZ3XOoI/QZfiygf1QukvIl5O1pQwQ=;
 b=LQqjIwXpeibOeUpJPmLmbkt5ioXQu+8Y1Wjjm+eAiLK5o5oSRMqahH0OJjoLguqaa5
 Nq8i77dvFlhnjd+LqqWu7gQgpXNf+dQ8UTzr//fkovcJnC3ckVqQEwd0gfwN9SnDtswZ
 3cGC868BVYJ+CiEVnWnQeHLd4F+WUk6ORER1IkrJI5R81KW3E9nXICdCclfFeX99dKs3
 VEZEHsOPw6YVca525jPpm9P8PzwROvxPnIGM9sodt+r8Yj3cxmtYCdxg5nMH+rdygfq2
 taWDS90rpBHAxcSAjislP2PhZkZS0g7ohpRjB2bxHPc5Edpra4JFTiyS8HhMksWFfw+Z
 V7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzmueRPm0t5lahZZ3XOoI/QZfiygf1QukvIl5O1pQwQ=;
 b=BWGqtBqAWBNRzUnKl+XdVg6XUJLbaD3odP2u/rfDVOMr59GDIEtw1Oc9nVManTDhEh
 arD9w/kn48b7PKIVvjUkU+f+hHJxRh7GyTubHUCj1wJqyjYgEnvHiFCbuQsqCcmuh7rs
 YggqBqTexvtApmyeJ3uK4bsBOelB2tzF3PTbqwlrueM68QpzTxB1M0jQIr5zee45t1x4
 AP7kxxeMWrH2vvn1rfc1oJJ/SlsJ77Mg/Gpz//Fql8bc2ebN/N2X+kTrnXYUcU+j88np
 R3IZyBZxaQcgD4M764v1+TXTSN38ab8hR1oR295+TmzHAUqejpbVEAVJPfMeszLj31kz
 dLDA==
X-Gm-Message-State: AOAM532dlygPIGJbMEJOMEFiKh6UW6lY39v6QLro4RqnuJV2M4paoRna
 cEtwAiDTcsXIfeV0PI6iwZLtFrncFtU=
X-Google-Smtp-Source: ABdhPJzYP5SNRKq5Cgwc/7QpDTm4LXnGS4b9tHCUWMnYL8d3EjGPty/OaQXOxXp7wZx7/x5BNj+mHQ==
X-Received: by 2002:aca:ba83:0:b0:2d4:13f1:8530 with SMTP id
 k125-20020acaba83000000b002d413f18530mr9471998oif.169.1646070629547; 
 Mon, 28 Feb 2022 09:50:29 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:29 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/14] hw/ppc/spapr_caps.c: use g_autofree in
 spapr_caps_add_properties()
Date: Mon, 28 Feb 2022 14:49:55 -0300
Message-Id: <20220228175004.8862-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_caps.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 2773f9db9e..655ab856a0 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -930,16 +930,13 @@ void spapr_caps_add_properties(SpaprMachineClass *smc)
 
     for (i = 0; i < ARRAY_SIZE(capability_table); i++) {
         SpaprCapabilityInfo *cap = &capability_table[i];
-        char *name = g_strdup_printf("cap-%s", cap->name);
-        char *desc;
+        g_autofree char *name = g_strdup_printf("cap-%s", cap->name);
+        g_autofree char *desc = g_strdup_printf("%s", cap->description);
 
         object_class_property_add(klass, name, cap->type,
                                   cap->get, cap->set,
                                   NULL, cap);
 
-        desc = g_strdup_printf("%s", cap->description);
         object_class_property_set_description(klass, name, desc);
-        g_free(name);
-        g_free(desc);
     }
 }
-- 
2.35.1


