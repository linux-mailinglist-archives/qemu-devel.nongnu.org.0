Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98167C9EF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:31:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Lb-0003Vk-R8; Thu, 26 Jan 2023 06:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LM-00026v-Q7
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:00 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LK-0003nc-NU
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:00 -0500
Received: by mail-wr1-x434.google.com with SMTP id y1so1439759wru.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oTohHyqKg48V4I8Jf7kpYgw+F5MogOoj2Z0HZPPA70=;
 b=a7pPh76/4tb6dAkwtCtdvIWGzLwFbUpJ1Sv1kvBKxQE9ubZ3uD+IcFS060Fdmb2COE
 hLnhxaCL2prK5kqpMKrNBt3XFCmxItU4Cgu9kTgBRY3SYqgjPKfF4PuZvm+neFuls6qM
 XKqq86H2azHIwZfh+vHfImu0BzxHRRX6cF6WiOYT5goOUBI0Sftr+6bXO/PY8uSVabY/
 GxDQZlKtSn/ro2bs7u2+ltbA05/elwROkJihR5CUmLoAw7qs8hFW5cLNNINq++gKRERZ
 vT5Hr6tvUCyNeZWBp3KZiShiPVNy5elpTf20ThfMrAnUG3+ZukYy79gcsksSF8KulMQx
 iesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8oTohHyqKg48V4I8Jf7kpYgw+F5MogOoj2Z0HZPPA70=;
 b=mbak9qs8lRsZzXVjli2fyEZm5l32i1quVRdFwrP8U5DllUzNfEprF72dzqcz1DKadA
 gyndD+9uAH+usnRa5kgJfy4DLt+SDurqCroty4TMbDQ+iQsdm01SSGvvmr2RhlRLvGJP
 29iMVJ57DW7+/8pHg4nMkdB/3LE+1MAFZ/ymWRN2jcR2LVVr65pxzowhsx4y1oz0s9ZW
 ORRn4eHDmiuNwHe/H2Xte9D4CavK8AJXEKowqb3bdVrXZENnuOnxZuEQ0G4GQfA9uuyq
 s4q6x3AVjspPqAaJLVyhI/0N8GfxfOkbvLUB1Msm/z4Qnhq/aahJvJ0maWpmVvsNh3wz
 8raw==
X-Gm-Message-State: AO0yUKXG4a1TdpBPKX+DBGzSBLvreUq+8sUQiOv6JhXs1ONCdQoYlrDz
 j/Ezh47vYffs3855TpsWLWfQIg==
X-Google-Smtp-Source: AK7set8MYkDI4+iS8r5EZXVtjQc93/BudHW+xeBsdqlq7UFHwO/fBGzAKfdsc+wKjHXJTSl+vmHhmA==
X-Received: by 2002:adf:fc8e:0:b0:2bf:ab81:c7fb with SMTP id
 g14-20020adffc8e000000b002bfab81c7fbmr9134025wrr.24.1674732177182; 
 Thu, 26 Jan 2023 03:22:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adff086000000b002bdbead763csm1044564wro.95.2023.01.26.03.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC4091FFBF;
 Thu, 26 Jan 2023 11:22:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: [PULL 09/35] gitlab: add lsan suppression file to workaround tcmalloc
 issues
Date: Thu, 26 Jan 2023 11:22:24 +0000
Message-Id: <20230126112250.2584701-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230124180127.1881110-10-alex.bennee@linaro.org>

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


