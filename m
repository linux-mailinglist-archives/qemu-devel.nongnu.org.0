Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033AE584E1C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:36:13 +0200 (CEST)
Received: from localhost ([::1]:46530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMPk-0005aN-3G
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA3-0002Vo-6B
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHM9x-0005sZ-Qo
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:19:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so3808201wmb.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4rzYyOyefgD+FFgRWQ2ANlZ3iuspDOKuCWBXcKDEb8=;
 b=rEzMREBiGFmJmh9mOGgHt+hyaauQH2/xi1890csC02z0C4ry13xZ1ch64qXJ0CTOQ0
 zBpCCf5jQp4juRCF+WhtCmiFtWfr2XhAn+N/VTM1QuETMd8PHEFCXQIv3VQPwMgL1BmY
 TViVxMN5JF9fVa6w7w9rcQ+3Dijs+cwmHJTE/VSGcvyR2gjohRGsNpkRjIsH68xM8SQp
 Cb05AuxxuG6BigyNWSEy4lD227tBnj4LWUn84CmILAgaRMWyyra82MH8SY6oLDBGM++U
 vAb193N3lTCfmhIbFMR40akcAYpEzgdcMiU1+d+iXvRbrkEubtCbe+mUULKMwiSKqaB/
 +EOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4rzYyOyefgD+FFgRWQ2ANlZ3iuspDOKuCWBXcKDEb8=;
 b=hKMdzZfrhUaOuoobuKGBHIW7pg+2JaiecWqsGuFcCuFqNMqGvoZ/26ITkLarUfgkKB
 JPQnNEbTG5SgOOhKnQBINejTTNUaJp0gt1ZmiRxkP63u8uSYeUAKM+l6TJPW/JKLjINy
 av2dgxg3Ss3FzXtxkJI8Lp4f/HTgxzqNq849xkLcNH57hRDgpvkTrfVwCptAI2zK2khF
 YYQ5Vi8SEJLcJvn/7C7rJrbbEez4U9hVmN5ucwoHBcFxhLX5YmqW7eg8SB6lSOvOpcq6
 XTpeHJkUCzZR3BOI37j8KnPoIE+MWzetfzI1mLKIWdJtkN4Z4eEqe/M91i7hK9gVLI5p
 px6Q==
X-Gm-Message-State: AJIora94Ixz1hvNFWGfyJBlm8taNJdLlFhh71/Z1L07QpaKcYHTgCkrZ
 ZU3vXFLIcNogD6GG6hbw3mhl4Q==
X-Google-Smtp-Source: AGRyM1tEZBoGC00S5vZVpuf9HCT71V7/iuoowtoYlL9DOLeysAEW8Si/nnGcD0LZqLCgqm6HsW4ZdA==
X-Received: by 2002:a1c:2981:0:b0:3a2:ffe9:945c with SMTP id
 p123-20020a1c2981000000b003a2ffe9945cmr2173934wmp.38.1659086392490; 
 Fri, 29 Jul 2022 02:19:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a1ce905000000b003a320e6f011sm3822090wmc.1.2022.07.29.02.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38FCA1FFBC;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 04/13] .cirrus.yml: Change winsymlinks to 'native'
Date: Fri, 29 Jul 2022 10:19:34 +0100
Message-Id: <20220729091943.2152410-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Message-Id: <20220725140520.515340-5-alex.bennee@linaro.org>

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


