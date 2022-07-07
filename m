Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC22C56ADCE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 23:38:10 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ZCL-0008DP-V2
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 17:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4v-0000JT-T6; Thu, 07 Jul 2022 17:30:31 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:42899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4t-0004hW-Dv; Thu, 07 Jul 2022 17:30:29 -0400
Received: by mail-vk1-xa34.google.com with SMTP id r184so2731286vkg.9;
 Thu, 07 Jul 2022 14:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vUo+kam0edsqNjfYKT4YrUA41QbVirwtKsGpf4GPc8g=;
 b=n3jJZsLeZO+wwUTpaJhAnYK8siCUGiyL+FIJZwmh74TC0Cfagxx41l7UCAqG41Dd/3
 C+zqXZsjzYbe4O4i3BaynTt8wN/MJgXBvDmKAv4Pwmj3qG3mn3FuVTYIH/PlcsPI4Rkl
 mcQSZQMYmpTK60IdwbfEfvVr0rtq2Wy4/3N5vSxnkpwxqzzm/sVwo7GoFn3JzcVsl/OH
 2YvJicOAX2+S6WAItHWrHoaSYxLxpa7U+9rr7zB2Xj7vAEagHed8AD78PWaG1J0y/FsF
 zbxrNc2GMOCuGF8frUvhtZi3PxPeyqvUaurXQIYkTtyD0dt60MjFvfFHVoWwqXA8gIHr
 1XtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vUo+kam0edsqNjfYKT4YrUA41QbVirwtKsGpf4GPc8g=;
 b=aBStZ1z0Id/eVWXqwMClLKqZl4cJIyO2ndv89kROzclKZ3GrCnBOo3prppLAdbFDly
 LYukTSMwfmcmxVS4tsfyZFxG5A5gy2r8zm7ZXBzb26gVBRxkU539THz6HrzSPJoPZOs7
 BSIup2FwKuRkvmBxX0h6tBI1Wa4cOUkMWkIMVdq4wIKICidQbxKKEHEuioyNTzshkNTY
 O6XNQVdKEmGgLIwVlMBRA4d5yGfU5mJth+FEg5Lb8x2fG2y42JiTjgXhvj47jhWJpxt1
 09QX2TLLgeRKkv9hXVqIdUbM7yIB65MaMx4AHwY4MiUanzenOkRc5Mo9TuqP37R3XTY0
 qlsg==
X-Gm-Message-State: AJIora98/SRhSi8lwuUEimBh+TznfNU+F2zjX/whQS0spvZKubVYFL0V
 C8pZG/1yAltcEQmZpEhOu+r8nXXbIVU=
X-Google-Smtp-Source: AGRyM1v/dlnIDfjBzC1004sjJLgfBXWN8DsP3fP8dm00R1EkZtrais5l12Hdp1Nct2GF9VYsrMqy3w==
X-Received: by 2002:a05:6122:25b:b0:36c:5f1a:d94b with SMTP id
 t27-20020a056122025b00b0036c5f1ad94bmr28116546vko.31.1657229426039; 
 Thu, 07 Jul 2022 14:30:26 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 66-20020a1f1745000000b0036bfe74006esm12122103vkx.31.2022.07.07.14.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:30:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 3/4] target/ppc: use g_autofree in kvmppc_read_int_cpu_dt()
Date: Thu,  7 Jul 2022 18:30:14 -0300
Message-Id: <20220707213015.552104-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707213015.552104-1-danielhb413@gmail.com>
References: <20220707213015.552104-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa34.google.com
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

This spares us a g_free() call. Let's also not use 'val' and return the
value of kvmppc_read_int_dt() directly.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index cf4610b6fa..37a312288d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1932,8 +1932,8 @@ static uint64_t kvmppc_read_int_dt(const char *filename, Error **errp)
  */
 static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
 {
-    char buf[PATH_MAX], *tmp;
-    uint64_t val;
+    g_autofree char *tmp = NULL;
+    char buf[PATH_MAX];
 
     if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
         error_setg(errp, "Failed to read CPU property %s", propname);
@@ -1941,10 +1941,8 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
     }
 
     tmp = g_strdup_printf("%s/%s", buf, propname);
-    val = kvmppc_read_int_dt(tmp, errp);
-    g_free(tmp);
 
-    return val;
+    return kvmppc_read_int_dt(tmp, errp);
 }
 
 uint64_t kvmppc_get_clockfreq(void)
-- 
2.36.1


