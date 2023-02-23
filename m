Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBEF6A0D7A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:01:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyO-0000Ir-LQ; Thu, 23 Feb 2023 10:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyL-00008O-T7
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:29 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyI-0004jF-Mz
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so4436805wmb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mTbcs71BJ5fbDDQYM5nzbWXk07NL6w1/1OQA+EWPMg8=;
 b=grSE/Au5SikIWpyQtOn/NSdkUNhbK0DSXXQxsOy4y+X/CTLTLn9InrZIgKxoOqoZV+
 XVNByZAKRuSnI1MhwV1Y2OLCtkjHH2YlR+9wsnQpcAMPuSg25AYSfSTAWEooSs4qSnRU
 oKzV6fuKGbd+tJTRu9yN4MqwTCwcFoJQjF5DzfTDYWUc6kPgCFlOIiQrMdyf4mRSEh49
 bhFJXrLfc3oMQxrtVaQcNXGLHd84z/cyYk1n4BDvy/8Hatu/Z7TDGZwBe/NSoRxnh6LR
 6/rHKsuKPdbXDcyOGLDHSGKWyxe/Oc+FrJ0ZTya+qRU46Gej8QQ3j4xkq0TcnI5gYz1f
 Qsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mTbcs71BJ5fbDDQYM5nzbWXk07NL6w1/1OQA+EWPMg8=;
 b=AUO2zY0VSP11rlGoK3tim+JUUfvRqvgyO2I9Un1dbhAqPjBjnxpElcgso/fszWr6Yp
 Qm1oOlhA725IdZHQyd2u3adVn/H6HtyWrBkC3bmtdB7ncwMn9mvVtT+E56dj5GZHHlNQ
 3Syn+QQytxppFiu3YnjUbZ7xrNQ8i4msGijQm7qTqFkVmS07KFvS4iJR8j9dS/uLzdDx
 nweUj8FKC9o2KZH1f49hqLRYoCJ/wLVm5/aI3p5PX9KhxLj6IvmMXTUzecHx3CimLhHl
 FcPa8Ei1KLv+yjKnkC9umDHiem9ybI17ryI5+S7vA0YyyJQm/zjawHIQonvTl86oowzW
 KAyw==
X-Gm-Message-State: AO0yUKWf1e0+B5kN8nJnVXOE3MVKvmh94g9ESJFfzy6jTXb7mY/SN7Kd
 Hu63060TeU257zdHMFZ5BHIBxw==
X-Google-Smtp-Source: AK7set/Qd4HDhScV/cAqQc40IxLxdfj+3VKivhDDyO26idcEiW0ZL1J8fwMqWWltLXYdW+zkJvDaYw==
X-Received: by 2002:a05:600c:907:b0:3dc:573c:6601 with SMTP id
 m7-20020a05600c090700b003dc573c6601mr9639524wmp.36.1677167845123; 
 Thu, 23 Feb 2023 07:57:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a056000125000b002c5706f7c6dsm7259209wrx.94.2023.02.23.07.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:57:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 464A41FFB8;
 Thu, 23 Feb 2023 15:57:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 07/13] tests: don't run benchmarks for the tsan build
Date: Thu, 23 Feb 2023 15:57:14 +0000
Message-Id: <20230223155720.310593-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
References: <20230223155720.310593-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Message-Id: <20230221094558.2864616-9-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8f332fc36f..e9a67e0191 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -465,7 +465,6 @@ tsan-build:
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
           --enable-trace-backends=ust --enable-fdt=system --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
-    MAKE_CHECK_ARGS: bench V=1
 
 # gcov is a GCC features
 gcov:
-- 
2.39.1


