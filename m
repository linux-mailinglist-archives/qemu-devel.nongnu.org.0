Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB3D67A0D9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNcP-0001cE-90; Tue, 24 Jan 2023 13:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc9-0001Vn-LO
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:45 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc0-00065R-U0
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:45 -0500
Received: by mail-wr1-x436.google.com with SMTP id m7so1049459wru.8
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ckg71MG7SVvhUWMlWrtuql+u6S+Ri9y1vJzFG4YdetM=;
 b=YIIlosIR2iH3qiNbMT45pfdzHQ9siMNQZK4biAzBEpT/rVoA4+vlSpnIt6N9+Ss86f
 Oy5uVRm3VBTSNG/61Rt+Nx/mbcyeG1SLtpI1HHmVzJ2DH8b5e0FjmLt9dWKJdp6wRs71
 q59dg/sXrV92X9v14wGxt933syissuVBl3DdcfPbTfFgUtBdfepGFnwAZKtBzdRXzRH6
 hX2M9QfEn9BLOxRCKJvP6uHiGxTSxzbuWUVYrI1mpPChkS54hd5svnd4kWv9pqY8lO5k
 JWMb6pJ5Mor11Ni2AN33bNL/cddmRQsezlCoeo+H8C5+OeenjcY2hJuOI/IrWKYAO4JD
 pP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ckg71MG7SVvhUWMlWrtuql+u6S+Ri9y1vJzFG4YdetM=;
 b=IZNSlxzL9qmQ4ukb2tj/z0JAYePinfVcUTmBuBuMnSpPjFqVkk+innjuNwtlcEtMCG
 kaKxaTFZKIuM5ijYw6zUFf+7PvjgyoC8NYSVlnxCrEn1iGmL/9jA0ZEaXQoUM4Xpkz5F
 6OSWdluSydcVVvXvZN1BDWr6gap7m1L+pbunZICYnDV/uEmEoNSagNRAH9FBjnpe32VK
 juiJUOERKdOJ2UEiNH4TWvPSJAL7c1LH4/dpvkkHLqbkMO4mj1NviS3ifkj+Oe59MD2/
 RZ4pWXIQO1p4xXIIMKjDPYaWpLg6IpqTBR6RcGHxilH5NPT8SU+dgQ2N9tKfYdMXPFW1
 hRVA==
X-Gm-Message-State: AO0yUKXOa1m3AzFAaEJC/fhBUOEoPFsJ5GyNmMP2lFQorkVo8QUUKZ4Z
 fGlYDNjjBOIBc+6SV7WM3Wfr+Q==
X-Google-Smtp-Source: AK7set8zzKig890uk5aXnX0XWLnpIK/WeZOC9UI9j5P3uQIDQhMjaYBaYz+ktErPL+ce2mGSfxF0fg==
X-Received: by 2002:a5d:5712:0:b0:2bf:b106:9f9b with SMTP id
 a18-20020a5d5712000000b002bfb1069f9bmr2511814wrv.10.1674583293695; 
 Tue, 24 Jan 2023 10:01:33 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d2-20020adfa402000000b002bdfb97e029sm2471549wra.19.2023.01.24.10.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 834891FFC1;
 Tue, 24 Jan 2023 18:01:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 09/35] gitlab: add lsan suppression file to workaround
 tcmalloc issues
Date: Tue, 24 Jan 2023 18:01:01 +0000
Message-Id: <20230124180127.1881110-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

The up-coming upgrade to Fedora 37 will bring in libtcmalloc as a
dependency of libglusterfs which confuses our fuzz run. Rather than
disable the build lets use LSAN's suppression mechanism to prevent the
job from failing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/buildtest.yml             | 1 +
 scripts/oss-fuzz/lsan_suppressions.txt | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index f09a898c3e..9a6ba1fe3b 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -511,6 +511,7 @@ build-oss-fuzz:
     IMAGE: fedora
   script:
     - mkdir build-oss-fuzz
+    - export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
     - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
       ./scripts/oss-fuzz/build.sh
     - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
diff --git a/scripts/oss-fuzz/lsan_suppressions.txt b/scripts/oss-fuzz/lsan_suppressions.txt
new file mode 100644
index 0000000000..02ec0a6ed5
--- /dev/null
+++ b/scripts/oss-fuzz/lsan_suppressions.txt
@@ -0,0 +1,2 @@
+# The tcmalloc on Fedora37 confuses things
+leak:/lib64/libtcmalloc_minimal.so.4
-- 
2.34.1


