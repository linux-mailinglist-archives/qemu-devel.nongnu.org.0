Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1122ECA35
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 06:41:35 +0100 (CET)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxO3C-0006D1-9X
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 00:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0W-0004X7-OZ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:48 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0S-0007yC-7Z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:48 -0500
Received: by mail-pl1-x629.google.com with SMTP id y8so2914524plp.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 21:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/5wKUycp8+J/TPqjX01ADm1mPwlsfaW14r1L66i18T0=;
 b=lwJ6Nmo4XxRiDUb19Nx0NBE5RSsAOVnZAZSzJNw8w/OdfMXoyXywAXaDoCk+zrXa0r
 4wVZnWz2S4Ck7Mvf5koyoJOtLWrhRIpcBTAxStysCwZkJwpcGCo/pWcmObQBTwc+Br2x
 LO9E/A7fvFVYSZbt3dZ1KKh2QtMidW/cak6SN1rAspcy6Zv+a2bekcsOpXhuey7bMjH9
 poIXcOQ539b+/6MTKHVpVCO1FTUz5pa+55o6AOYg4tbZ0G7WinJROBfrEUQDhfegXLNL
 a4+T6N7aRJzlNG7YdPp7W+BY5J0b8fRdxENXL+nvcV7O+LQnixkhaY+LonyEKBWNQ3bh
 803w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/5wKUycp8+J/TPqjX01ADm1mPwlsfaW14r1L66i18T0=;
 b=IrbvBItyWqYI45fIxkuWSz/Aki2W7cKYtPO5OoteyWv+v3vewY9cJ+mN0U+zJF0xU5
 jOSnwW8XZ59UVmMawj66kOBMEw4BLvfLKEUN5tyd4DARBQ1SQt6umm8H/cFpGhdfD/AT
 QFYNKOgzpCdRwUioRW5Ap61nl2gbAOTMpkR1gtsIdYXFydox3KavjepLDHZlH/fQFAo+
 My3odmuuJ+8kp17D4kL27vMXn7INtkBwg9po+59DD9hdXLPKaO7LVRhBfp5hH0jOO0U/
 MiWPeGl16KSPzY5h33bOIGAATFn2pPlnGgNlBqWGS5pzE9pSuuiaVBUmcMPdShCERhO/
 +UxQ==
X-Gm-Message-State: AOAM5319aJB48GD47wBnLqYhy89FELBGzsX3VsNQRn5IcQ5aGEuQXagJ
 KpudvRyymigSy1LGb9x1cVgNqhR84XgCHouw
X-Google-Smtp-Source: ABdhPJyWB+nzoRtuzx+mbN/EKL90dEIgqxMbLroCjh+lR738tOeCWJgzXNCjLOydSb/dL7MOIY8Xbg==
X-Received: by 2002:a17:902:848e:b029:dc:b38:98f0 with SMTP id
 c14-20020a170902848eb02900dc0b3898f0mr7828442plo.82.1609997922489; 
 Wed, 06 Jan 2021 21:38:42 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id y6sm7660091pjl.0.2021.01.06.21.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 21:38:41 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] cirrus/msys2: Exit powershell with $LastExitCode
Date: Wed,  6 Jan 2021 21:38:22 -0800
Message-Id: <20210107053825.2010-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210107053825.2010-1-luoyonggang@gmail.com>
References: <20210107053825.2010-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently if we don't exit with $LastExitCode manually,
the cirrus would not report the build/testing failure.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 62a9b57530..ff6adabd0d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -131,5 +131,7 @@ windows_msys2_task:
     - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure --python=python3"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j8"
+    - exit $LastExitCode
   test_script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
+    - exit $LastExitCode
-- 
2.29.2.windows.3


