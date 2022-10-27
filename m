Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED81610140
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:13:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7mI-0002NY-5H; Thu, 27 Oct 2022 14:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kE-0001KG-8R
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:47 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kB-0003KQ-TO
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:45 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso1866349wmq.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXW/Tz2FYHj+TG6WaYeDViQAT3icz4raiac9ciYbCHA=;
 b=yNli4DA+R+ExMNoA2PLnM0zQm5ljuYjkAN4rQczxeg32BUeBd31rt4a7lnea0qeFaI
 OOJM8xmoXHvDQRhpy7mp0emWrlsc9LOBwVDZRJjCGs17uR9Bhi0P+lP3I60hSN2zSVLR
 QzoqhUQVLJ4x23f6dTtzYCv2S723NA++ZguaKAGRVzYp1GS3cCxQu5yxPYJqkU8BI7PP
 iQYUT5UmqBr3mftgiDSC2NB21Bu3dpjEBnLGJDsyoFWF/Ye974V3IaVnrC4WBtkRkzAo
 e3qyUd6l6N+aUl7TQ4CMgIL5YwBnmRW/I6BrT0JeGzk5kRrkI6t8+Myn0oY4fD9db+1t
 Vb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXW/Tz2FYHj+TG6WaYeDViQAT3icz4raiac9ciYbCHA=;
 b=hN3+gty/V0C/6tP2zYXEK0YgySqJKtk62rfpHeHdV5wYPXPq5Jsy2H22B9okna3CQE
 YWW0wc6ikSYEmRvJ0RVk5db1/l9bgR3jlrsINLMIFWlstU2HCemwJBdnCW/mg40bRyr3
 hGE9zL0UjAhKGCyrA9PwZXTQYtMMjj+9hzUPPKWL79Qz31J2VGI8ujkC4e0tH9bLOiDH
 LYEUEdYP6De1fFLAGKILZuh7F9VIazX3NGR8n9fCe6L/6SZ77EL/IBV6iPvd7U65zOr7
 N8akBKMk6uMhs4m9pSOVf4T0Rab41BQiEmVYLVQUfVKivd1EY3899zQ1eH6CvZYgqFrU
 Bj/Q==
X-Gm-Message-State: ACrzQf2p4D/IIz7t5kKMVklfUTBdAMx7mKzW6V4sqHXH8VuJaf+IsHfr
 lUpCBp+WO9nb/Um3ip/d6L/6kg==
X-Google-Smtp-Source: AMsMyM4IIC8IR9UklHAFDbaQ2UwoXw6Oyl4eHWDm5VJuEAUEyv+uByyrkcHqGAkUqcXVH5suyHlIOQ==
X-Received: by 2002:a7b:c40e:0:b0:3cf:497c:c515 with SMTP id
 k14-20020a7bc40e000000b003cf497cc515mr6936923wmi.41.1666895800805; 
 Thu, 27 Oct 2022 11:36:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bn8-20020a056000060800b002365921c9aesm1948879wrb.77.2022.10.27.11.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A19AE1FFBB;
 Thu, 27 Oct 2022 19:36:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v4 03/30] tests/docker: Add flex/bison to `debian-all-test`
Date: Thu, 27 Oct 2022 19:36:09 +0100
Message-Id: <20221027183637.2772968-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson <anjo@rev.ng>

Adds flex/bison to the debian-all-test-cross container which was missed
in the previous CI patch. These dependencies are required by the
idef-parser patchset for target/hexagon.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221011173229.57909-1-anjo@rev.ng>
---
 tests/docker/dockerfiles/debian-all-test-cross.docker | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index 2beb077fb4..8dc5e1b5de 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -20,8 +20,10 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
 # Add extra build tools and as many cross compilers as we can for testing
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         apt install -y --no-install-recommends \
+        bison \
         ccache \
         clang  \
+        flex \
         git \
         ninja-build \
         gcc-aarch64-linux-gnu \
-- 
2.34.1


