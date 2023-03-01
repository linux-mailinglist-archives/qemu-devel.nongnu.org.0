Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7126A6F2A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:18:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOCJ-0000Ew-1W; Wed, 01 Mar 2023 10:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBk-0008B6-5J
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:16 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBh-0007cj-BE
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k37so8847651wms.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Je6tHmMsXrx/D8pW2bDpgfBjKMVcTzo9CyJE47d842I=;
 b=a40aRi47JeD+hkOWZHV4njEIrarvuldyqEyTgCl4bfRu7Nbm522jqAESZfC+mGzgJo
 4bq6msVaHEs7ROuSLlSP/Vwxq9yS4WK2Y4aGj9D9DCJLmrcUbKBYbkOXBpYU98sAY7Vf
 ijXEYPzts/aNPndlyBfJTB0JUNjZKzFiT1BQsqZ7hl7tTp5mXLxQNg4X9Esp1UDIYOPI
 aYObWG+wBSdfOmE41Fp5idOELzXQ/wsMOAdMAmJSnrS4JpBiAvyYVCGUXvjIpvY6aCIX
 gi+qfO4oQKRzY77lcUvT+4CiCc0aJ3geQjVIP9/o3GadKoG+/LcYIKKJVJ4nz38weAYO
 Qg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Je6tHmMsXrx/D8pW2bDpgfBjKMVcTzo9CyJE47d842I=;
 b=CBOM35BMv45AOkl9Jl3cmT0zG6yanJ9aw9Rcfz+sOI0tKQ34r3aY9yjfQ5Um/lFl5R
 uY6yvyYRIGuTK4/h3BavhI1SfBX2kNJYfbbi0xSdNfkjlepZXohujkm5Po5BQxh9pgUb
 q10VRnMwggCbsSXPGgZWR6fqyymxZepcszMgrLnTwCoaND+unSQFD/C+buMh0svFEnEM
 AuG1CgjA9cTvDCIL5eP7z7cwEFFByZbj3NZdwFchDoD7epvbJ7eqAC7f1YEEEzXJxmIH
 9/GT62id7gl6T8felXBH/VRSnV9qI5pQ7Vx9/F1w+u+jel8khwa/HWfbGpKV9IlwcX3h
 XzYQ==
X-Gm-Message-State: AO0yUKXIs2U4Iys3iZ0J6QwGthHY9QMCA3CmpHQ9SNwoUAFX23hrrryx
 TQLd/RFg6bzdQ0reXILb5fkfLw==
X-Google-Smtp-Source: AK7set9Q31FDXZh5Pc/jZEtnBs2VV0elbVameADO1pU1fs/Qba472TOYU63rkNikRG0CVPNhQhhslQ==
X-Received: by 2002:a05:600c:444f:b0:3eb:1ba8:7cfc with SMTP id
 v15-20020a05600c444f00b003eb1ba87cfcmr5518288wmn.30.1677683771732; 
 Wed, 01 Mar 2023 07:16:11 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a05600c511900b003dfe549da4fsm21962851wms.18.2023.03.01.07.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6819A1FFBF;
 Wed,  1 Mar 2023 15:16:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 07/24] tests: don't run benchmarks for the tsan build
Date: Wed,  1 Mar 2023 15:15:47 +0000
Message-Id: <20230301151604.1948813-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

All we are really doing here is checking that TSAN builds compile and are
therefor a tool available to developers. The benchmarks are not
representative of QEMU's actual threading behaviour and they burn
precious CI time. Indeed switching to check-unit reveals many
unaddressed issues which have been logged at:

  https://gitlab.com/qemu-project/qemu/-/issues/1496

So for now disable the make check and make this a build only
test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230228190653.1602033-8-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index d903c42798..7b92767689 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -463,7 +463,6 @@ tsan-build:
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
           --enable-trace-backends=ust --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
-    MAKE_CHECK_ARGS: bench V=1
 
 # gcov is a GCC features
 gcov:
-- 
2.39.2


