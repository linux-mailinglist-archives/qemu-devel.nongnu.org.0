Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6583792A8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:26:58 +0200 (CEST)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7o9-0007Vr-CM
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7ke-0000oO-ET
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:20 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7kc-0003jE-Ja
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:20 -0400
Received: by mail-ej1-x629.google.com with SMTP id n2so25116887ejy.7
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbG+Q6JY5l/CMiEysJmM0J9wPNN84EDj+3HMZXO10xY=;
 b=llylqKabZlczpDE8yaQti2o/wGmO/NljXNzE3sZMa5V6gH11lpDVJ+mG5Fu6W2mgXJ
 TmCWTDzu+wo5cbKttaancmQl6trdaPEL4hVo6IETY7in1erR0PY9dOSZyFlQ0do+MkyT
 BQqQC6C9D+5ePlYaFG0oRm2t4adma1i+ij9PW132vW44eO6Q5wBdE6Q2+msMV+BIz+Ax
 /AhvIVAch/Yv8Ja+eKJNKIimrVOzw57JKUhCgw8mcZMrbCr9PMZWVPl/lV/SXWHupGfn
 Czo6azhpgdRnsrEnhLO/mMaz3tOZDaBAHAjXFyNho/xViLp7gz6f51mNWlFuaWO9VRos
 0S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dbG+Q6JY5l/CMiEysJmM0J9wPNN84EDj+3HMZXO10xY=;
 b=WKbbzr38Xwl8SPx4M/xn7UMUQ4DYvLUMBT1c2teFTTPxKvCMKkEWGbMzABqJdnv87D
 nRDSPWGuBFL6CuqdB0hUH6ASmfd8uPYVVeiYWXFkn3PebUM1twwHV63Y+dpBl6WzGEmF
 AOQizNSpOByJ2ygAbBwugwP5QB1v7kc1RhsHnCDNr2LN0JWZtrGkN5tXVG/2Nadmj0XQ
 HuJVci13Bzb6q8sSAgwNtLU0KxGXnz/342AMERdfNRnyL9tIkwsZbjRjXAV+jkufr7KS
 PtpaiF1UkCiZyykRA3TBoosEzBAQujylfgYUQxZrDSjpcWwEje/cBtapMpigxerRZSjL
 MAoQ==
X-Gm-Message-State: AOAM532p+s/F5V9XafN0RWQGYzP/LG7m4dX3MbFjXtSrkU7syJ6G2xpc
 jOHO2hOiDg/DlZtwc01fHGLXKvih9VPitw==
X-Google-Smtp-Source: ABdhPJxTE5r63hf8eI7wZt/uYaOiCPyEGr1/XyPgXSbJs/98USNILoTAnMp6Cve1iaWQz9nWGwicTQ==
X-Received: by 2002:a17:906:33d8:: with SMTP id
 w24mr25870972eja.28.1620660197029; 
 Mon, 10 May 2021 08:23:17 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o25sm3952961ejd.70.2021.05.10.08.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:23:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] gitlab-ci: Add ccache in $PATH and display statistics
Date: Mon, 10 May 2021 17:22:54 +0200
Message-Id: <20210510152254.2543047-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210510152254.2543047-1-f4bug@amsat.org>
References: <20210510152254.2543047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
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
 .gitlab-ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a33e51bf453..d9a0252c54d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -21,13 +21,18 @@ include:
       then
         MAKE=gmake
         JOBS=$(sysctl -n hw.ncpu)
+        PATH=/usr/local/libexec/ccache:$PATH
         ;
       else
         MAKE=make
         JOBS=$(expr $(nproc) + 1)
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


