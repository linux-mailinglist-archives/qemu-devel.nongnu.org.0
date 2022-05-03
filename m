Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD1451900A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:23:55 +0200 (CEST)
Received: from localhost ([::1]:33136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzzu-0002gh-0t
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nlymW-0001HK-Aa; Tue, 03 May 2022 16:06:00 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nlymU-0008Q3-Kl; Tue, 03 May 2022 16:06:00 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h12so15888775plf.12;
 Tue, 03 May 2022 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rB2t5tn1inP0ifvr+a75qrs1lXFqufxW9vylkGaycJc=;
 b=g1/LTu5/2E03HFNfOJGT+JwoCFa5eB71EX1lHtKoCDlQi+EKRJ29RfKlAA5tVEu7/e
 nX8sgfvyl1ODox4+UVC4RMiZ6o/JNQdThHfFxyYTM7xs8P5HVhIe/m0vcduBXbozJW3W
 fLejTlNglbESNTW+M2uHK2HLS3VYda0PHI010VKhJc9EvEHYFYQi6lueckxWL61Nwor2
 z28hYqyKYWyDE+7HByb7mZTPLTWg/QkdqhHZLzkF1QrDA9stlPcWC31F8JOK7eON06SF
 10pmbqjzjuLClPutlFbvqja23bxyqhZhVvzaxdoHGm53GS4wyJAzBnSmKL8JzPjYh7Mg
 OZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rB2t5tn1inP0ifvr+a75qrs1lXFqufxW9vylkGaycJc=;
 b=BBZ6VSlofXa2bK087hmIx32bpEl4mwx1NZiMSSrOTeDc0hPmFN3ZRcbZaDZKbruNvS
 21du/KWCWuzWL18T260gmukVrfzoUKi2JKD7izL8u8Ba9mPaH65IW2HSPxu9AboptD7X
 Pqj0mgzDeI0Fdy48+RCZM5zg0pCDUSTV3ywLl99NPZhJSQcID4ywICDKBF0J65t/QiMy
 erBDmDs2ma/x1Wpi/H8gYz7v4vRmFlZHFM/joAn1LLpjkMVYthzvVwBwdAf/gE7y/sJ/
 NFW0QKGqFhsYqSyGjy53RvgHu4+BaKsTuoHGjPfYgQnXG7gywMAbyYInR++HpDSw+bxK
 OjsA==
X-Gm-Message-State: AOAM531cKdOHyqzBYjx2ybUUy3jmdVmryjzQ+czHuP5soFZaDx3OkMvA
 +7wmPAdBe+THlB6G7ALagW49RwxCNug=
X-Google-Smtp-Source: ABdhPJyZLAwJA4OTIMhOabcTaHwSgZg429dTPfZHTEErnf3usLKOh+csLSeZVOFW68HtkQyEvShx0g==
X-Received: by 2002:a17:902:f78d:b0:14d:522e:deb3 with SMTP id
 q13-20020a170902f78d00b0014d522edeb3mr18442424pln.173.1651608356145; 
 Tue, 03 May 2022 13:05:56 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 q26-20020a63505a000000b003aa8b87feb5sm13670148pgl.0.2022.05.03.13.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 13:05:55 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/2] cirrus/win32: upgrade mingw base packages
Date: Wed,  4 May 2022 04:05:23 +0800
Message-Id: <20220503200524.1868-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.36.0.windows.1
In-Reply-To: <20220503200524.1868-1-luoyonggang@gmail.com>
References: <20220503200524.1868-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 7552d70974..20843a420c 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -12,7 +12,7 @@ windows_msys2_task:
     CIRRUS_SHELL: powershell
     MSYS: winsymlinks:nativestrict
     MSYSTEM: MINGW64
-    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-04-19/msys2-base-x86_64-20210419.sfx.exe
+    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe
     MSYS2_FINGERPRINT: 0
     MSYS2_PACKAGES: "
       diffutils git grep make pkg-config sed
-- 
2.36.0.windows.1


