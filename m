Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934AF6A6F5D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOJw-0000jP-Sf; Wed, 01 Mar 2023 10:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJi-0000bB-65
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:31 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJd-00011Z-Dz
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:28 -0500
Received: by mail-wm1-x333.google.com with SMTP id j3so8830919wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D9u8cdGfNTD+ql08VoEjefNIwphTAu8BlNDQo2Kgmc8=;
 b=iTjOYwk+RrImjIPi8QX2RORAUu92BhFxjS5wqDww0pDdElxZsjKMdZZj2xle68T/RH
 qPgcRYqXaxkheC0CNMcwiUUz2qtkxNL6fyahBV0gx/Ob51/9TXE/2bEb2pBQA5Q1WPoM
 4cRAbf9flPGj4lRGJvm4/0mXSKB8to4Vt/BjdI/9pV7YLrJlqFw9RaMQZavNYmbz1ZKo
 GeVpeh/MTPkdPseObSjbHSr204cw5mj1BQTviJ1PjnIjsfEokrDTuPL2hUtNLsQ7oxwD
 0RZ35fLK3ppGbXxzcpjOXi/rC7o61pjAnITg3aSjiPgLC4anK4JBNSpF2eEwWOF2vExJ
 xPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D9u8cdGfNTD+ql08VoEjefNIwphTAu8BlNDQo2Kgmc8=;
 b=jORNJVbGtwdHFgohQ9mN8I1xDIW1petE5RsxGJBQmYhwTExlqn/r771R7o89ZA/O3L
 jwJSRUYrFNCEFjwVHi+8L3AWi58hllmHTfjoZk5e9Z4pj5mQFu6LrXHikthF9MX/S880
 IeP63RsxM0L/GygEbuFhvCcFW20bgYAbr4JmRM2p6mKUjNxCZQsROE627MKFhvKAbkx4
 JtjE67jdvL6Uiw4L00n4Z1hhMPdAgVnFYyJkE9OjGfhV+rrcr/Zp//FXJGjOoWNNRF9R
 CzJdWJB33TMMUOf+Gms0z/H0qvbQg6J9mq8Wmyp8MOgX+m/hnuBvvPVEmDYFbOXzR7AK
 FzUg==
X-Gm-Message-State: AO0yUKXiM184k6BUhJJ/XP9kTf2FQMOKBEgHL1VlKzERfppikSvLi27M
 49+a6n3KqQGKaVajsfiymQEm3w==
X-Google-Smtp-Source: AK7set8gDm62CJkX7pmhxEqgxjay5Jaj3eU8F3raQ1KR7sJxejLqgsmRWPWKJN9NyWaMxAUigaSFtQ==
X-Received: by 2002:a05:600c:81e:b0:3e2:201a:5bce with SMTP id
 k30-20020a05600c081e00b003e2201a5bcemr5260351wmp.40.1677684260716; 
 Wed, 01 Mar 2023 07:24:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b003e2066a6339sm15726842wmf.5.2023.03.01.07.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:24:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1949C1FFC3;
 Wed,  1 Mar 2023 15:16:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PULL v2 13/24] cirrus.yml: Improve the windows_msys2_task
Date: Wed,  1 Mar 2023 15:15:53 +0000
Message-Id: <20230301151604.1948813-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

From: Thomas Huth <thuth@redhat.com>

There's no need to run a full-blown bash just to create a directory.
And we can skip the "cd build" each time by doing it once at the
beginning.

Additionally, let's exclude some targets (that we already compile-test
with MinGW in the gitlab jobs) from the build, since the build time of
this task is very long already (between 80 and 90 minutes).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230208103046.618154-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230228190653.1602033-14-alex.bennee@linaro.org>

diff --git a/.cirrus.yml b/.cirrus.yml
index 4895987da4..5fb00da73d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -100,9 +100,11 @@ windows_msys2_task:
       tar xf C:\tools\archive\msys64.tar
       Write-Output "Extract msys2 time taken: $((Get-Date).Subtract($start_time))"
   script:
-    - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure --python=python3"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j8"
+    - mkdir build
+    - cd build
+    - C:\tools\msys64\usr\bin\bash.exe -lc "../configure --python=python3
+        --target-list-exclude=i386-softmmu,ppc64-softmmu,aarch64-softmmu,mips64-softmmu,mipsel-softmmu,sh4-softmmu"
+    - C:\tools\msys64\usr\bin\bash.exe -lc "make -j8"
     - exit $LastExitCode
   test_script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
-- 
2.39.2


