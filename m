Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A15353BE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 21:04:06 +0200 (CEST)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuImD-00042z-KQ
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 15:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuIjS-0002bL-2Q
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:01:14 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuIjD-0008Od-9c
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:01:13 -0400
Received: by mail-wm1-x32c.google.com with SMTP id 7so341800wmz.3
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 12:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VdWpJhCktka5KOcldwrFhUo24hWqH7N7zrJHqQkbnLA=;
 b=Z8mE8TN9ydfSmtsUb7prJzC9RCS3sOIVBLFN1wrCeHOceU8LtdgpiQAbldAS5KUgrl
 SeOyOBbUCycqwXKQHoD5lN0R4fAw5hCLjlbbi7k5PCdWIN3aYAysfq8+XChGReUi6+86
 OmZ89gSilGbpmYwOlAVOCbHbmk+aNpIFGRWdAeaI6BsnkmSIQQSYa2hS+i6nP1PhlDXp
 T2wKQkkYTInfeLQTO6PL0wGoWI7VpWrIRgb6QlH89b7N0X0ssSDsaSdTarRbkcoYR0Ig
 V1nxSY2uMRfnUSsOJx7vPoVF19YPImom5cBrCyPSigqoWqmtFbaKJgrKvPLeyG4dVO56
 QKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdWpJhCktka5KOcldwrFhUo24hWqH7N7zrJHqQkbnLA=;
 b=696wyssc5HAfEqU8AG0xDws02GoSDdm8OIQDOcz4Y6KogN0VEAA/74To8hKnkFoVT9
 /g2wAKDvw1QrNpBZX1NJIWOJGBD7bYSnF9bUIhGLFfrt00mkRaVsTCgD5Mkiib900xg9
 ALkrEym/VrQkhxBV8/Y9TqLwQgV+eMYCkpeBOtt46BOzGwmG2MfgVt8KbVOualzJAvxL
 LCQlZry431MyLAn1p6mMm0LnFtt7HGZO5SNDm1jtGl6YAFjquw6EdrHU6r81Kr1PlFF2
 RrxjcPtltHZxT+aiFQxpCn9JKy1hyHCcZvoshPSaKHQHtIr1Vt3Z0k3IjT2Aw9FHUDa0
 RqpA==
X-Gm-Message-State: AOAM530tw7i9Gst2Co+X3RNYABVHe2FfkYKJbPUkCz7gB6NIqpPICO9Q
 H/A8zzq8xX5Mu+KUpmHoXP/NCwXBeevJEA==
X-Google-Smtp-Source: ABdhPJxv8GQjhgHapSy72z4YadZk+f0l3hnwVe5gtyd4uKulSKQkr0SvSD0Z2fxV0DHxJneSVeD+pg==
X-Received: by 2002:a05:600c:3492:b0:397:eea:5a13 with SMTP id
 a18-20020a05600c349200b003970eea5a13mr3617256wmq.108.1653591657862; 
 Thu, 26 May 2022 12:00:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a1ccc0a000000b0039763d41a48sm2507476wmb.25.2022.05.26.12.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 12:00:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 2/2] semihosting/config: Merge --semihosting-config option
 groups
Date: Thu, 26 May 2022 20:00:53 +0100
Message-Id: <20220526190053.521505-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526190053.521505-1-peter.maydell@linaro.org>
References: <20220526190053.521505-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Currently we mishandle the --semihosting-config option if the
user specifies it on the command line more than once. For
example with:
 --semihosting-config target=gdb --semihosting-config arg=foo,arg=bar

the function qemu_semihosting_config_options() is called twice, once
for each argument.  But that function expects to be called only once,
and it always unconditionally sets the semihosting.enabled,
semihost_chardev and semihosting.target variables.  This means that
if any of those options were set anywhere except the last
--semihosting-config option on the command line, those settings are
ignored.  In the example above, 'target=gdb' in the first option is
overridden by an implied default 'target=auto' in the second.

The QemuOptsList machinery has a flag for handling this kind of
"option group is setting global state": by setting
 .merge_lists = true;
we make the machinery merge all the --semihosting-config arguments
the user passes into a single set of options and call our
qemu_semihosting_config_options() just once.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 semihosting/config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/semihosting/config.c b/semihosting/config.c
index 50d82108e6e..3afacf54ab2 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -27,6 +27,7 @@
 
 QemuOptsList qemu_semihosting_config_opts = {
     .name = "semihosting-config",
+    .merge_lists = true,
     .implied_opt_name = "enable",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_semihosting_config_opts.head),
     .desc = {
-- 
2.25.1


