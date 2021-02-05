Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F5D310CBE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:53:51 +0100 (CET)
Received: from localhost ([::1]:48292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82UY-0004YF-8g
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LT-0002jS-CF; Fri, 05 Feb 2021 09:44:30 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LR-0002SX-Ve; Fri, 05 Feb 2021 09:44:27 -0500
Received: by mail-ej1-x62d.google.com with SMTP id w1so12246510ejf.11;
 Fri, 05 Feb 2021 06:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VTiobrg06Kw2JYFRS+iUWcDIkvLt8aRr1C2BOmn2HFs=;
 b=LZS7OU9PLEL3wnLwvFERNy6JvAKSIiCAdy+xNn+oF4+zVnf+xyjHltt8vFbke76Bd7
 Hh2wGfPBvfMLbRZoPyYG87PSF4n69n8IiAws794SslNKP11Kf8+rJHniSyPk3W5vIAXf
 n0O9Qmm+iS594IcAe7pDzP9i1Yjl99VFiPFRJVypPPl6tVhWMpWokoYvV7K6h9Iaq0KX
 iRrEqDnc+lQFW27DItlBjk7BalObRKTV+6BLL/IOdHd5OX+nx8rNkKRH2bAXZJ5bA3RS
 dQ/elnXFBOFnc5TIg2eT2oTHI8iEUh+bZnyYL/4N3XFYfDcacnP3YUShwnUfXxY8GjeA
 2EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VTiobrg06Kw2JYFRS+iUWcDIkvLt8aRr1C2BOmn2HFs=;
 b=giZz8AL75TqzTFKdwCpb60DhPlVzAt9gG/wrtw/gZ1WFjOPcYh0/DSkOh92s4ReYE1
 zYf8LhKDOPmWM5vMOl/fHqo7vNtnFc7mUr1jzQ3EyilyZO1i+R4otjAgxwT4A6pTJSMz
 hvRk+bcnqnqwcieeeYe0VnZq3+QxKPOQfXXZAVacKq6jA58OsRlnxpUyYvbZUAX4HRYG
 XIrjyewwFZCro+QVRFwO1ZZjkgkTJq4jidqbBrlzYgmemJGM30KcRn4LS+QEgvN2Iajm
 c089s4c/iRjOt9vt5kTCFGRjtuv4ChY8Z4WdEL0YpvK8Hs5tk0F7xpXAcDjIa/XsTSob
 rYHg==
X-Gm-Message-State: AOAM5308ILT950ssgK9Ixpc2flD/t7Eefj0dl0Wr35+kYs36a2wdxT+O
 l0/Oc37BNqev3B6TAaOcoyMzbSv+m4E=
X-Google-Smtp-Source: ABdhPJzn7J0hDyTG5vX14Z/KHbNZg/Y+xN5SlwHgCMQaOTWc9v4REwqZidp/bCdhLwHqEP3drffJMw==
X-Received: by 2002:a17:906:46ce:: with SMTP id
 k14mr4448504ejs.480.1612536262018; 
 Fri, 05 Feb 2021 06:44:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x21sm3963731eje.118.2021.02.05.06.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/arm/virt: Display list of valid CPUs for the Virt
 machine
Date: Fri,  5 Feb 2021 15:43:42 +0100
Message-Id: <20210205144345.2068758-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Virt machine is restricted to a subset of the CPU provided
by QEMU. Instead of having the user run '--cpu help' and try
each CPUs until finding a match, display the list from start:

  $ qemu-system-aarch64 -M virt -cpu cortex-a8
  qemu-system-aarch64: mach-virt: CPU type cortex-a8 not supported
  qemu-system-aarch64: mach-virt: Please select one of the following CPU types:  cortex-a7, cortex-a15, cortex-a53, cortex-a57, cortex-a72, host, max

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7802d3a66e8..6ffe091804f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1830,9 +1830,20 @@ static void machvirt_init(MachineState *machine)
 
     if (!cpu_type_valid(machine->cpu_type)) {
         int len = strlen(machine->cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
+        g_autoptr(GString) s = g_string_new(NULL);
 
         error_report("mach-virt: CPU type %.*s not supported",
                      len, machine->cpu_type);
+
+        for (n = 0; n < ARRAY_SIZE(valid_cpus); n++) {
+            len = strlen(valid_cpus[n]) - strlen(ARM_CPU_TYPE_SUFFIX);
+            g_string_append_printf(s, " %.*s", len, valid_cpus[n]);
+            if (n + 1 < ARRAY_SIZE(valid_cpus)) {
+                g_string_append_c(s, ',');
+            }
+        }
+        error_report("mach-virt: Please select one of the following CPU types: %s",
+                     g_string_free(s, FALSE));
         exit(1);
     }
 
-- 
2.26.2


