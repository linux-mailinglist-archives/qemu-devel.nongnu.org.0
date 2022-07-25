Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02C58008C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:14:10 +0200 (CEST)
Received: from localhost ([::1]:53798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyqX-0003kK-Id
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiB-0000sy-Su
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyi8-0000Ey-Uj
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id z13so16112310wro.13
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTwSnZFRTEa2KBmATJIqMqf3rBKFb32A5FdFD315qZw=;
 b=a9pEPQ0BccKEbo3o4aw5pE66feGjwsfTdqNxNzwwLJPSeC9cZo2+Du6wCibdlZbkKi
 SVq/+Yl/ursEQy9wH/n6jccD7olbn05VZAPMj5ILtirMhj11EDb7b1zyWWRbI0U7W4hZ
 d/PqJt5kTl/899/ACH8ZLOByez327iTf6emrqsYg1JkLy4MwKdPnmpbS2effrEkKGIhN
 ttMjr9frp5Bw6IUV9H6RTETDWHXRS3rF8W7NzvLOtPcQeKXthyqp1a39OsanU6RNRq74
 //6DLkhFEjC79/N2n+C2jpO40pwhqXNCbqhn3jA98Nbz/WvFOyF6C5B/APtt5slAd9J0
 Oy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mTwSnZFRTEa2KBmATJIqMqf3rBKFb32A5FdFD315qZw=;
 b=nteWqKTm/kNQlYgnAFU3M8nOu9rG76RFy/k//IZEVIwpBHnlKbfQmeR8wFxcES10vF
 a8/Pjv9xM1+jr+VZHpQK9+utnYiXQr32Duq78ZYHTPPKFI5sOf/dHAu04laCLVALoK6H
 xTjANjYpjXkF5GTFCaAl8K+2ewg4azcBJm6UNcrAohgAt74CVY3uy6PvdoNoNTUUX454
 i5ZlEdJ0HisXsalaGiF/6lLrL9GBII67i+Q2+unEpsyNJIDBDqDnxfxkm24FfEOUG9sb
 l5gbpyy4XvnSy2uencbtAZyX9LwdM1GZHj28tIMEWgs09Vn0mPEMlRSdj6Scfn6YETDZ
 9BJw==
X-Gm-Message-State: AJIora+7Bo4CJBNN+FAbtA+1myKOPWQOWTxG85KsuH6a0GhbOdGGaoAq
 0pXR80SNKJXxqWUEoivuuf9eHg==
X-Google-Smtp-Source: AGRyM1sYKjcfu63fLhkeDHNPyPUNSQ29LnFR29xwNaGba/VAB50aykrIY3DxqLM6W8OUyIQ7MiRkjg==
X-Received: by 2002:adf:f747:0:b0:21e:8e2a:7cbc with SMTP id
 z7-20020adff747000000b0021e8e2a7cbcmr2278065wrp.342.1658757927086; 
 Mon, 25 Jul 2022 07:05:27 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003a3442f1229sm10926905wmq.29.2022.07.25.07.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3AFB1FFBC;
 Mon, 25 Jul 2022 15:05:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Bin Meng <bin.meng@windriver.com>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 04/13] .cirrus.yml: Change winsymlinks to 'native'
Date: Mon, 25 Jul 2022 15:05:11 +0100
Message-Id: <20220725140520.515340-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present winsymlinks is set to 'nativestrict', and its behavior is:

  a) if native symlinks are enabled and <target> exists, creates
     <destination> as a native Windows symlink;
  b) else if native symlinks are not enabled or if <target> does
     not exist, 'ln -s' fails.

This causes the following error message was seen during the configure:

  "ln: failed to create symbolic link
  'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"

Change winsymlinks to 'native' whose behavior is most similar to the
behavior of 'ln -s' on *nix, that is:

  a) if native symlinks are enabled, and whether <target> exists
     or not, creates <destination> as a native Windows symlink;
  b) else if native symlinks are not enabled, and whether <target>
     exists or not, 'ln -s' creates as a Windows shortcut file.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20220719161230.766063-1-bmeng.cn@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 20843a420c..eac39024f2 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -10,7 +10,7 @@ windows_msys2_task:
     memory: 8G
   env:
     CIRRUS_SHELL: powershell
-    MSYS: winsymlinks:nativestrict
+    MSYS: winsymlinks:native
     MSYSTEM: MINGW64
     MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe
     MSYS2_FINGERPRINT: 0
-- 
2.30.2


