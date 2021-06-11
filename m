Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9733A4B60
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:47:12 +0200 (CEST)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqrn-0002y1-UU
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmb-0002FM-Ni
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:49 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmZ-0002XY-SA
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:49 -0400
Received: by mail-pf1-x42a.google.com with SMTP id s14so5672478pfd.9
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xdsc1hH1Evyr3+MMvXt/sFiU8GAdG4NN+6ZZZYHh5K0=;
 b=LZukvZrw+g3QI7xBmOQwwO/VMu4n+W2Sjs9nti+wuDdYxYxz1lAsO/gaElZrjiV9RJ
 Xck+eneXgmUfhfP5J4F24uB2cfI53xVYiG6/Dr57bPuwbwiv/Qb2Okb8Xqga1Ae47hj6
 +PX27QPXaR+qkyUt6b4hy9gQpF/kgSvc53APQSukBvRYDnApBfVqLi/PXVMjAaJX+C4B
 rwYqXGGtxnoFHRbxQzJ7c9vKsesb/VwoE3jZ7392roIlrpDdJeyPvEErwJOKZxQy2DMQ
 QTK/d+UIHNQ7vkccuLxE0o5R+d4fMvDd//3taetdCSB1TOgDxTVyccNQQcEH2djF+Wd6
 kNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xdsc1hH1Evyr3+MMvXt/sFiU8GAdG4NN+6ZZZYHh5K0=;
 b=OTgzMrlIef4zV7h2CTuX+rFE8L5phABIBU8y+Q9jo4IEnI0xVmwMpPg1HykhLXLoK7
 rsukmEFUmi3pQvIPoISKOt77SYuluENPvKUi9MsVP/jWDe9lhS/OHSVk4JeUztEPLk8T
 S8a0atw+OP8InWqFs3KtNxMEbdd7WCAHydLS+fpog5w1isH6OwOwSBVQMF6BMiNqRm6t
 7bxXQswyiATks6noUblEzCOTdbAJFhpX7aBAMs2mvKncaFnsqMw+lezvdRg4OTsUtRYW
 7tTdkzuYzspo1UzGJHYIWI3B1bQPBTVx9Xt7xrODYxkbKa7yHNR4qlQWVLoH7lKGS/pM
 WmPQ==
X-Gm-Message-State: AOAM533F50y5bG+msMgs3bJyMxcMm6BOWNcH1CRqxdmI6OkdZ4szkfgW
 mmFT12Nn8i+k9K43xNzTVfuouoCHLNSFtw==
X-Google-Smtp-Source: ABdhPJzvLoek1XuyPyb7dukw+UWShyAI1tLugQnOi2TIS+RulN1OHGANqhWfbddyJegxgZ8JLdKcFQ==
X-Received: by 2002:a62:687:0:b029:2ef:be02:c346 with SMTP id
 129-20020a6206870000b02902efbe02c346mr10701294pfg.51.1623454906508; 
 Fri, 11 Jun 2021 16:41:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/34] meson: Split out fpu/meson.build
Date: Fri, 11 Jun 2021 16:41:12 -0700
Message-Id: <20210611234144.653682-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build     | 4 +---
 fpu/meson.build | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)
 create mode 100644 fpu/meson.build

diff --git a/meson.build b/meson.build
index b5b2cf9e04..a2311eda6e 100644
--- a/meson.build
+++ b/meson.build
@@ -1968,9 +1968,6 @@ subdir('softmmu')
 
 common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
-specific_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'fpu/softfloat.c',
-))
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
@@ -2001,6 +1998,7 @@ subdir('replay')
 subdir('semihosting')
 subdir('hw')
 subdir('tcg')
+subdir('fpu')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
diff --git a/fpu/meson.build b/fpu/meson.build
new file mode 100644
index 0000000000..1a9992ded5
--- /dev/null
+++ b/fpu/meson.build
@@ -0,0 +1 @@
+specific_ss.add(when: 'CONFIG_TCG', if_true: files('softfloat.c'))
-- 
2.25.1


