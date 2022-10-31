Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB360613780
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:11:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZU-00030S-HM; Mon, 31 Oct 2022 09:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYw-00009m-4R
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYd-0001Fo-Jg
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id h9so15962082wrt.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyZvGFNC4ORY7b96ucb5nmVpD+aksz6ZfUks+N0kj+8=;
 b=H85dux9LKFT3wO2Jp3yrY+zOydAcGo88bZ8nT8YAcAwcil++GIo1ZKGIDZrh9cPXxb
 lVo6SMtIv/RoMEmxiBCqs/pKfsiIoZ+KcYsRH//LMwweVnLXrZ2w3nv727ENJLeztUtv
 O4pnjTwj0lUmSMxqI4R2qI35RnmNDW5pTJO+zPhoFwUVdSX8W3tEbA/aHiD3kXpXpeq+
 2/g8xr47M/0Zwxc6t5y7tK+pqYtqqVswF74Da28Z03VtjtYmpvPqgxWSSKFvtwMuAnrT
 0ad4PMvj6ZQcHn5jgPxTCIW9k0+qR8V/8hJx1qpJYGolbC7+SGEM+N+AkQ3tuKxOHHJz
 1SAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyZvGFNC4ORY7b96ucb5nmVpD+aksz6ZfUks+N0kj+8=;
 b=shpFkM31pMlXZ1q0mTWh5rmrSYmQYa6D8doxp+gnKC1c/rtQXNTmNaZFlrEmqb+Ggj
 e/lyZGKY4GmN/02hHNZ3F/eXJjxrQdmLW5bYgX/y1M+FiZ41Ru5Ugq0Vkua7ZmPDtBNb
 oC2KmxUq9pofppsuH7vMBG7BzAQ6PCARVMO14DSsi2Nvn0P8OFG7wNlvcPuzyQ4suKfS
 KijjutM3o3A+umxWjNfxMIhUxgTsC3LSwuPXgdNbvtK18a2Pc/sCkwkRyKoO2mJcRrTI
 QF9+NpqrJL7SSkXJIrrjxwLZ1cdOS2ptYz75yEmaejyU71u+ryq+GXQ+m/4q0QWRB4jo
 0Bdg==
X-Gm-Message-State: ACrzQf0w32dxoTvRDagqXh2SeIyuffcInvyxbFoOvTud7V/YhEC0aGKB
 nwzQ+l2wFjghOVRjuGBiHUPHQg==
X-Google-Smtp-Source: AMsMyM54T9dCDq1+RJWE72Np5SxSPavoaqkQTXJa0AUiRf0W2gJNGjosoDRNhyUgXF/5n3jfGkIYdg==
X-Received: by 2002:a05:6000:381:b0:232:2e1:48e9 with SMTP id
 u1-20020a056000038100b0023202e148e9mr7905737wrf.166.1667221824756; 
 Mon, 31 Oct 2022 06:10:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n185-20020a1ca4c2000000b003cf66a2d433sm7153619wme.33.2022.10.31.06.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 494BE1FFB8;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org (open list:vvfat)
Subject: [PULL 14/31] block/vvfat: Unify the mkdir() call
Date: Mon, 31 Oct 2022 13:09:53 +0000
Message-Id: <20221031131010.682984-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

There is a difference in the mkdir() call for win32 and non-win32
platforms, and currently is handled in the codes with #ifdefs.

glib provides a portable g_mkdir() API and we can use it to unify
the codes without #ifdefs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221006151927.2079583-6-bmeng.cn@gmail.com>
Message-Id: <20221027183637.2772968-14-alex.bennee@linaro.org>

diff --git a/block/vvfat.c b/block/vvfat.c
index c5b1442145..723c91216e 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include <dirent.h>
+#include <glib/gstdio.h>
 #include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
@@ -2726,13 +2727,9 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
             mapping_t* mapping;
             int j, parent_path_len;
 
-#ifdef __MINGW32__
-            if (mkdir(commit->path))
+            if (g_mkdir(commit->path, 0755)) {
                 return -5;
-#else
-            if (mkdir(commit->path, 0755))
-                return -5;
-#endif
+            }
 
             mapping = insert_mapping(s, commit->param.mkdir.cluster,
                     commit->param.mkdir.cluster + 1);
-- 
2.34.1


