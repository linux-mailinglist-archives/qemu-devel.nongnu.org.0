Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E1632601F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:37:26 +0100 (CET)
Received: from localhost ([::1]:39322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZYr-0000Wy-JW
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZT0-00045o-AL
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:22 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZSy-0002ln-S1
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:22 -0500
Received: by mail-ed1-x530.google.com with SMTP id b13so956863edx.1
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3rJSXI8AKLVIYnCtIJWOvToJLkr6ghkaSVEvpGX+18=;
 b=jTKoJ0lvfiZizb6F560GJfaZ1eCMmwhe+ELpMZlsUiUgsoEDzJ/vqUw4A4CNdu9U7S
 po4CNJ6Bz/sYuC6gstdP+1Co/2CAAAL8LtYrHKOWRhIWAMO11MRr7HpR35pBDZpxNMZm
 pU9Tkcwr66+Dqwjr4Fq7uD4CwSK8pjN+ZbrC+MzTehfVI9/hZkNXHHMEg+0NdJpk4yI6
 2NPvffvB1hRfVXjpqOjUxGBi0wjXMctHI+INJ0iMr3CUpaoGb8Rhu3aOEirYzeT+ibJZ
 auySZ6Vc9nwK1OfMEnsZQlGfQvpcHdoK97Z/X/7/8BYIaSxbA1Xp2uEeenaM4GZfzk9B
 CzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p3rJSXI8AKLVIYnCtIJWOvToJLkr6ghkaSVEvpGX+18=;
 b=BB1vTJCobnBro9vs850g8qdmtm2zVklv4T0CFw50ZtPlpCWNnnt1zhq2V++8EIwlmt
 tQ6ZqvwnXXkTLVyGWTWAzeUXT+NJvAA63Ouccib4gyO4kyzpY3/Y9IfBMo+661mgAsVr
 vTPWSOJiYjXTi+tPJ5HchnLJifz1GLXlUBESdR3gZL2MCPkt2BZC8k3kQmgTNtI5edW0
 jORZG+Il78Dyj4Ay8IaNKZDGTwXNByIu5qfEiANqwYVCasZjcl++BAplr+vYcVgsfIrE
 Ky7bYR2xMYaD7g4L8ZdHjKdLchzhLC/BhVJmUvyY8di7QwPQ7s07WFOFS3EF56knTTk3
 YzJA==
X-Gm-Message-State: AOAM531wciYNRgOk71OxADqE9Yw5Q9KWxPCVGs/0CszExGDQRZ66gQck
 ZG92x5KsnWxJ8NIp7KoeQ/3KdFofff4=
X-Google-Smtp-Source: ABdhPJxSS5v8KX+4OVBvd7oJ3KYIqCieCUeJV2q8zyjBd/IiEM/ILE22dRPtmKoGphOrraI47fksxw==
X-Received: by 2002:a50:9d8a:: with SMTP id w10mr2260114ede.39.1614331878949; 
 Fri, 26 Feb 2021 01:31:18 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y9sm3899666ejd.110.2021.02.26.01.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:31:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/13] target/mips/meson: Introduce mips_tcg source set
Date: Fri, 26 Feb 2021 10:30:58 +0100
Message-Id: <20210226093111.3865906-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'mips_tcg' source set to collect TCG specific files.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9741545440c..75c16524606 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -6,12 +6,13 @@
 ]
 
 mips_ss = ss.source_set()
-mips_ss.add(gen)
 mips_ss.add(files(
   'cpu.c',
   'gdbstub.c',
 ))
-mips_ss.add(when: 'CONFIG_TCG', if_true: files(
+mips_tcg_ss = ss.source_set()
+mips_tcg_ss.add(gen)
+mips_tcg_ss.add(files(
   'dsp_helper.c',
   'fpu_helper.c',
   'lmmi_helper.c',
@@ -36,5 +37,7 @@
   'cp0_helper.c',
 ))
 
+mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
+
 target_arch += {'mips': mips_ss}
 target_softmmu_arch += {'mips': mips_softmmu_ss}
-- 
2.26.2


