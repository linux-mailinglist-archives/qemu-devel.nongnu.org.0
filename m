Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8C6FE13A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:10:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPQ-00071N-Dg; Wed, 10 May 2023 11:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPG-0006tV-9p
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPE-0001WN-2k
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:06 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3078a3f3b5fso4633721f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731222; x=1686323222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bi6q95XWM7v/8dPiRPP3xYbfAZs5w7vK/PdVdbh8T8o=;
 b=ocoP8cljXOAFVS2OflqMUfudWhl6XVA0joTt2IL5zICcidTbh1K7Hs0oUnwcv2FRYA
 SvdTUGK6ZCkXQHMdBsZv5Jd3TVarcH30NtTIbgjJdR6wFEh566r40/e78dKGWiu1zo11
 tERo43DxleYewUP7OC2tTkX8HemYaNyb4V/CSsJ0d6o8z7ef9F/oNSLYRoyOvodGLcUr
 HebEogWABt7HG+rf0TT7trjAuGFHssBDbBIAXhZ/DMhg6BjUFIroL7rBMnfYEw4xFArN
 QV/ugNm03nBK7fd5+RcrmyRxgfJbTX29Kh55wdXPhMHxGaJgkAhCVGWiwWNAF9nx/3ym
 k3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731222; x=1686323222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bi6q95XWM7v/8dPiRPP3xYbfAZs5w7vK/PdVdbh8T8o=;
 b=IpczVT7NbBKejDPRLJ2QmO949X6zKq8n6hQM5pEO4uwT5/pkwFz0Z2gY83/Ux+3AQh
 ZHCktGHmhYFoOt6F93A0+TMdiyYwiNo83UHzCiwoozXDJBTUHS6iHgRZMhsp7/4g/tv9
 tyPY960V65MrOaqT8jhwzuhA7fn2qRisU4mCvGYwpj1r49ouIS+mFlJHKxZg092F/Rb9
 rYOh+17p9lPCkJAZYAfWu2rgucS8QxEf2rxvyw/7XwAPyNDxrAkwqXetZS8Kd5A3zXBv
 i3JGgcgehazPhHKfD56jS6O8bhMLaTLE6Z3FE+14pYxmm0ar0eIRgdOvegH4ZsPNZEaB
 b2ew==
X-Gm-Message-State: AC+VfDziZ31qU+cqza9390ADmDq8dWTRKfIbZInVzGnNR2mNRPSCN+u0
 Y3HokYYoYdPQSajLznbWV/aIFA==
X-Google-Smtp-Source: ACHHUZ6iWyniSL4/DvrZn4YuvVEaGrFz8taaXGvaqxABAud7baYyDM7AW5LAoAWXVZhBahIOTpYnlg==
X-Received: by 2002:a5d:63c8:0:b0:306:2b56:d268 with SMTP id
 c8-20020a5d63c8000000b003062b56d268mr11620523wrw.15.1683731222431; 
 Wed, 10 May 2023 08:07:02 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6212000000b0030796e103a1sm9409080wru.5.2023.05.10.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:07:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 441661FFC1;
 Wed, 10 May 2023 16:06:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 6/8] gitlab: enable minimal device profile for aarch64
 --disable-tcg
Date: Wed, 10 May 2023 16:06:56 +0100
Message-Id: <20230510150658.1399087-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As this is likely the most common configuration people will want once
the --disable-tcg patches land.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>
Message-Id: <20230503091244.1450613-21-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index f8489dd3fc..374b0956c3 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -145,7 +145,7 @@ ubuntu-22.04-aarch64-notcg:
  script:
  - mkdir build
  - cd build
- - ../configure --disable-tcg
+ - ../configure --disable-tcg --with-devices-aarch64=minimal
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-- 
2.39.2


