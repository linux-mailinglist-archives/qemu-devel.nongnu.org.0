Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8537B590
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:42:51 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghdy-0001oO-Bh
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghZ0-0001ts-04
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghYy-0006fZ-FO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q5so2823176wrs.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2IUveWwI0J+7Ncapudv20RtB39QJD/A5pUhEcIazkKo=;
 b=d7u11Na1oZtz3d4gKsFXMxZABKeQIIL8x4dFAJu6Q65fmPXWzLzLYOTz8jMA+Oy1AL
 rvlW4L4B0HDq119hEzWFcA4upNAY2NjGV6WKCc1jr5a+wL7YxUuZPmuzgmiI5saAbsCy
 foWVkNBP9XbKCkZc1pOTUm4mfH2JxNui3a/4+wFHPM6irDw7ch/i/19MrWpvlNEDH/ZE
 gKO/ZraB6dHeV617hPyCv8fPJSikataNaBWCYaL2DEhS0YhSNPWQNa1jW8ht/xqP12dj
 +ghR7/0TBuzmv/EEuEhJ76ee/ZFFxhbmDj0JI/vCT+oQiRLTc/lldUb3OtEsZbLPOXSc
 ql7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2IUveWwI0J+7Ncapudv20RtB39QJD/A5pUhEcIazkKo=;
 b=njEsckH6iKZ9DD5NW7tWDtFO0iOAlcrnD29y5BihRz/TQEWEMvZqzTY1aJYHxm7si+
 5y7BTB7HpnU5Cx1st0IVxZPqPTNY/iAeFaN0XlhhSF/KBP0g9yW99drR/IjctALqZaUv
 DNl9oH1+oNw9ukOG6frnXVyeJ1414qo0eJeGGyg9YOJMB6QfdrN6xZPo/AmTDcA3fmhr
 FQflRt9dVl5Et8i/n8DiWFgAwwsxjiHWhT1HXszUUk+5guTW7iPgAXyD6FD0WNQ6BMjZ
 J6qrQfg2fo/ZgLvQu2lcY6GulFffUanrjGgb/D/h5JvrrulD+GazW8hKnVyWrQ9Yu22c
 CFYw==
X-Gm-Message-State: AOAM532FF0/aSdp7HAAaBQcXJXGMfLdwxu7lOfOPEXLoPt98eREuzur8
 khuKM6x/wCraXEQBS/nXYf4eEFTJB3gw/g==
X-Google-Smtp-Source: ABdhPJzBWZOeOFHeHCEtKZzEF4C4tQGRWZEUWvlKd/KU92J/vIXIYrw82n57rsVSBrE9Aj8QshOwVg==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr42321180wrx.211.1620797858849; 
 Tue, 11 May 2021 22:37:38 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f25sm29893961wrd.67.2021.05.11.22.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 22:37:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] gitlab-ci: Add ccache in $PATH and display statistics
Date: Wed, 12 May 2021 07:37:12 +0200
Message-Id: <20210512053714.3268162-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210512053714.3268162-1-f4bug@amsat.org>
References: <20210512053714.3268162-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a runner has ccache installed, use it and display statistics
at the end of the build.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index f284d7a0eec..a625c697d3b 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -6,13 +6,18 @@
       then
         JOBS=$(sysctl -n hw.ncpu)
         MAKE=gmake
+        PATH=/usr/local/libexec/ccache:$PATH
         ;
       else
         JOBS=$(expr $(nproc) + 1)
         MAKE=make
+        PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
         ;
       fi
     - echo "=== Using $JOBS simultaneous jobs ==="
+    - if command -v ccache > /dev/null ; then ccache --zero-stats ; fi
+  after_script:
+    - if command -v ccache > /dev/null ; then ccache --show-stats ; fi
 
 .native_build_job_template:
   stage: build
-- 
2.26.3


