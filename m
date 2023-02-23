Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13D6A0D6A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:59:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyW-0000o4-NG; Thu, 23 Feb 2023 10:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyN-0000KH-Qy
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:31 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyK-0004ko-TG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:31 -0500
Received: by mail-wm1-x333.google.com with SMTP id p26so9309847wmc.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5fsqVCJzyU8Zu1hd7YxbL1fFqIKEFqPvKFe+eNwWlZU=;
 b=TuzNjlHTo4iHXdy8b6ZGBS/QLQ2jiJ5abHiIR+5u+4YqAWJ+d6fQkrcbRCraDA/g7a
 NIrJPgzq5PxElX1Rg7gl73vS6C7Vvj/JUrrhtDX55FxYbVLE6uP14MVUHvRHy4ruacA9
 RAzdfbzT0T+23gLeqoJISqAFIJtNiwosKmTMH7yNaWS33fQBK34UymgQEAYXlOJd4S0a
 DIYkcbZ0T7m4P5yllyXzbxFfzL9ffoGRZhnXSy2O+LLsQ6c1N0IbTz/C9dzSemct/X78
 foUaE+WnW51lWVXPr4z3OpuOctM2hQcxSRDntKRpVWGLpNkRCsxS9Paa85BsZqND2T56
 oVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5fsqVCJzyU8Zu1hd7YxbL1fFqIKEFqPvKFe+eNwWlZU=;
 b=rBQ8l4VBVfE8p1snG+pQMzaJZ0kaQLQZj31t/7w6zn5/KfkJNJH0enEJDqpbpoZ5Ki
 KevEjxNBT0CHPSUCmpPPbQtbafQrqRZM53YmRzcrI65dlObX7CY3XK9rIqckbEkbsuSs
 EGoNTE9AKSn48vsDT4a5Eo+ywU5IxdlOdLwMG0sKK/mH+//GvePaWBSJyQa4m1bjEtBF
 ARvgR6l49jm2GjJc9P9EYHrKrwftDKxQDGghfgRt/NI2EgkeiLsQ1DOXa0KfLaBDj9l+
 SmO05FQLC8tnQf60O5ja2SMIGllGnADNYdrccXnUXBPCJXcWxMoe1ZQ3PqGPituYf6+r
 wt9w==
X-Gm-Message-State: AO0yUKWPlKzT51MBhnM7ld1izTqDZEpZcqgyrfxJNRer+sodfjhrkIn0
 I93nO6CSBZuOF2g/IsgZY5F+nBtMzZwt1U2Z
X-Google-Smtp-Source: AK7set8UxMwn0NG3maORCvlavTUb1vWydXqGKjTXp2zXWZ+L7z0tqup066YEupOCETNLTQdubLzR2A==
X-Received: by 2002:a05:600c:2cd8:b0:3ea:d610:f062 with SMTP id
 l24-20020a05600c2cd800b003ead610f062mr645127wmc.30.1677167847116; 
 Thu, 23 Feb 2023 07:57:27 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003dc47d458cdsm12930248wmo.15.2023.02.23.07.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:57:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F8521FFBA;
 Thu, 23 Feb 2023 15:57:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PULL 13/13] cirrus.yml: Improve the windows_msys2_task
Date: Thu, 23 Feb 2023 15:57:20 +0000
Message-Id: <20230223155720.310593-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
References: <20230223155720.310593-1-alex.bennee@linaro.org>
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
Message-Id: <20230221094558.2864616-15-alex.bennee@linaro.org>

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
2.39.1


