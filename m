Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A1B610162
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:16:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7nG-0002X1-P6; Thu, 27 Oct 2022 14:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kN-0001Ql-GG
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kH-0003MH-EG
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:55 -0400
Received: by mail-wr1-x435.google.com with SMTP id z14so3674060wrn.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxOg283PDRzw1JKCDvt6daLgqQYdA1dzevXBfcHGyeE=;
 b=wmLL495czepYmkyydFGd6Q9CqrIQLowE+DzTWKZyfiV8bctujX4+STGWczl0GSPKTy
 L/+Bh1lovsNQrskycn+Z25iv1fP5a0GcfAh0cpFWn5JT5y3W6kFNsPwg+bZDCn6LQt7l
 HrT+VmU/uSu3lGIrVxuj6rPbyvTqyQX4iyT9zdtZWtiNUBSXUCn8au9cXjPrR+FzYLO0
 PBgVHaqzg57Xco47hoA6LBl4g7YjCPHcyj+atYQqFO6ZSsv1jGuzFgJEyGho1V/feZnu
 cCwOJmqzH3XCblfwpFVs48ilbZwIEXkYLi24w/o955+QB64v0v31XeMm2fwHv/VsucCI
 9dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxOg283PDRzw1JKCDvt6daLgqQYdA1dzevXBfcHGyeE=;
 b=2gqcZ8jwkHFUoUWIpgc5EYa3ORCmst69nBGE+hkNA3B+s+yJ6AS0Zx1D3BariaThhk
 wVsMS9rPi9DAr99FNjdzfOWz2ozQ1VGKxUczB+RF0RKsbHLzTfzyw9r4GMSTLqfvhHJw
 QEh4Qe+KLs5fbV7t3XyQLwSGv3k6pcYfCTy8IbdCxeUA8XGbNZQ60cAanqk1UoiMyGII
 krKYkypOg0trJ1C7Y3Fbp+reeSQiRcoJyOzpTnu8B2fJVIHCXgNav7dAwjwZK232FdoB
 AuvEwikMuCWCn0kCyxWN7/DWA0787qOCWONmB1uMm0nSvZiPPK0U8mLgbBSUldu/23wZ
 A0gw==
X-Gm-Message-State: ACrzQf0jMt3F/cPvlxX+U59xabmVtmmpqV0kkT3vcUKxYdDRQqWw2xYe
 CdVQOdt6j6Y0KCLRk7zl6SPKNQ==
X-Google-Smtp-Source: AMsMyM7sd7nW7r8TLcIxYFGjPscr+gxtCfldaTwoKA5c5/+5EqKbQKqNX78BGM2WJsBhPlnk0CTIAA==
X-Received: by 2002:adf:f04e:0:b0:236:5d8d:8a1e with SMTP id
 t14-20020adff04e000000b002365d8d8a1emr19821045wro.392.1666895807917; 
 Thu, 27 Oct 2022 11:36:47 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a056000170400b002302dc43d77sm1915829wrc.115.2022.10.27.11.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8FE221FFC4;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org (open list:vvfat)
Subject: [PATCH  v4 13/30] block/vvfat: Unify the mkdir() call
Date: Thu, 27 Oct 2022 19:36:19 +0100
Message-Id: <20221027183637.2772968-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
---
 block/vvfat.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683..723beef025 100644
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


