Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41876AFADD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 01:09:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZhLc-0006fs-P4; Tue, 07 Mar 2023 19:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZhLa-0006bl-U5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:07:58 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZhLY-0006JM-Td
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:07:58 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v16so13877132wrn.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 16:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678234075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DkaId6AtwWP2ObACPU3FmZXE59O1U8IPJlFt48x/qyU=;
 b=DL1ev3wVzbtzpn1RO7rbD+SGqwOnW2L72X88b5Efx6us76nwapTuhr7PkJW91Nb02F
 qjE5+yZU3q3SuBheh0XMon1pxMSY5/6rzlLJnVVTIw1wxOM1YWzjMIc8QssFOtg8pXhk
 3ObdGn/n+pQtJyrCgGK1as6ZbIXpwHCB/uSpbnPvWLj6wYJKzIJbMosp+yC+AKQy6ZP9
 2uiPFoL/nw9k+Z7lOxTdoNnlG/hse2yEsCyCkEpF+ynGrVGsmhufoyVx/A22srb0Gs1q
 uanar+C3heKt+0HChjo65/4LH6YiiUwsSQl871IvIWmq3rpDcAZKOG2jAILhRmJxzKhF
 D+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678234075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DkaId6AtwWP2ObACPU3FmZXE59O1U8IPJlFt48x/qyU=;
 b=46GqIkgNSYgrS7GoEVhbThg+ZDlv+5Y6Ui4mbNyI3XQglXnBmoZMsYXlmbYo2y7Qkm
 3f/RqbP0gSVBjhwFZqRUOR4v0WmIkj/zfj03uyNJ+D2en6SKbp9XQODhdF+B5opIUmSx
 dZ8+NzWR0PrCprw3jXcVsRiO7junA2yJHSo4EGkHMHLx9nIsIY0ya1WAYA5nNLXqetXJ
 tlGJC7CQoUdwFdwNpPJfNmOy2/2f+DzURPeIE7taUy8QSqKlzk0hH+OGP/OKEx4oo9J9
 zMomjYms8fGZAhTGn2lnZdGdliNyQh9kwLIUBvZM8s/qXo6KRSXQBm2KQyzap2b8LdaV
 m5gg==
X-Gm-Message-State: AO0yUKUdri1SOHUp/cHqwys9I17dvJcnciNp29wOkYoATDxMWDxNA19V
 63LbuGRmbwG3+V1Jums0L7wzYSlGBIkHn38lHwo=
X-Google-Smtp-Source: AK7set9qdwnMQ8m56MOWP2ffFlo16PWzP93/Jn8gwGs12cg8qaTADlJzbaGaCc7G0GsV0HIJcO/wDw==
X-Received: by 2002:a5d:4ec4:0:b0:2c7:169b:c576 with SMTP id
 s4-20020a5d4ec4000000b002c7169bc576mr11474188wrv.56.1678234075002; 
 Tue, 07 Mar 2023 16:07:55 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d63c2000000b002c8ed82c56csm14085204wrw.116.2023.03.07.16.07.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 16:07:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 1/4] gitlab-ci: Remove mips64-softmmu from
 build-without-defaults job
Date: Wed,  8 Mar 2023 01:07:42 +0100
Message-Id: <20230308000745.56394-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230308000745.56394-1-philmd@linaro.org>
References: <20230308000745.56394-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With the introduction of the MIPS virt machine in a pair
of commits, all MIPS targets will require libfdt.
Since the 'build-without-defaults' job is configured with
'--disable-fdt', it won't be able to build any MIPS target.
In particular this job triggers:

  ../meson.build:2809:2: ERROR: Problem encountered: fdt not available but required by targets mips64-softmmu

Remove 'mips64-softmmu' from the job TARGETS.
To still cover a big-endian target in qtests, replace it by
the s390x target.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 44b8275299..4897229f1a 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -526,9 +526,9 @@ build-without-defaults:
       --disable-pie
       --disable-qom-cast-debug
       --disable-strip
-    TARGETS: avr-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
+    TARGETS: avr-softmmu s390x-softmmu sh4-softmmu
       sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
-    MAKE_CHECK_ARGS: check-unit check-qtest-avr check-qtest-mips64
+    MAKE_CHECK_ARGS: check-unit check-qtest-avr check-qtest-s390x
 
 build-libvhost-user:
   extends: .base_job_template
-- 
2.38.1


