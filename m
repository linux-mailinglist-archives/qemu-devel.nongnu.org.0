Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA139581B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 11:32:14 +0200 (CEST)
Received: from localhost ([::1]:58906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lneHN-00014y-0D
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 05:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lneFc-0000Bt-3J
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:30:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lneFa-0001ul-H2
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:30:23 -0400
Received: by mail-wm1-x334.google.com with SMTP id g204so2627135wmf.5
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdlgysxYEM+cNA08m1V/P6QdwO1YLgLDxz3bSWOD2Z8=;
 b=rC1q0uer/GN3XwLpAfgXZwoNbGGzjWLluF+IbRLeHS8UquXALOTUbd1c2G/rTK/ezh
 4qWEAw0BwTgzbsfuiqQsNGguNcmHnq3k2M3GhedsuSCv3QijNbhUlW2rsKWOBGpptAcu
 /PO1B/1xLfNgywvItjrZXxij0xybJTHpYrSm071CbH27vG7bsy/MfAhgXCBKmRZj8DGT
 q+UrDLpm+ot4dd6QI+KeZ7xWi1wxmHMBbnewJo4XE1oxxvVOH3pgiXbIC/A5sQH1T29n
 e7QWxB22Jz0XdBdkR583yNmDtjo3TK/Qk530ooLh+sTZIi2BUKmLl8Y6awbZM+GYWuIG
 xvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CdlgysxYEM+cNA08m1V/P6QdwO1YLgLDxz3bSWOD2Z8=;
 b=WXUP2Ux0z3aiCBxynyXs5o4X3XAFPYaOQUe1/pwSi3CgD40+hftg42iStY6nCbfXMZ
 dQbTYJohiqcIIIgEmvf7CatT4X3lPVvpLkC1nWs3JKlsZ7AmiQO8qAEdK1JQnbm8fCV5
 KnQHoLKZWc5EirfFYjS3LKHtUxYtm4ELihQuiyLs6WY0sc8ZEDd6qZ0V5rMaj/HGbOpd
 RyWFy0NwS7tAicQNOvoGgisl7kCCNpSpjw8zqLcU4bJXXVP6L6xsfgWg/+tk7124acsd
 Cc9qmhdvG6DMVWuSqD4Tq1Xi4DfF0WeP/MgZzDu89gS3Y7gfcAhZe97+MxeqG76UHvU1
 xtvg==
X-Gm-Message-State: AOAM532/SJslHErQ1eGo8H1dWy6CZQIC9Dz5ZcqzbudgGJhb1ljljZhK
 lBwlmwnqFq8Rz7JwmuT5mN9juJmDI1DhoQ==
X-Google-Smtp-Source: ABdhPJwLwWtJhx2t4F/ASu9hn/zM3gNB8vLOb7FfhQBy7vcFxU1wgIiTryL7FAx23rwZi+u+3YpIjw==
X-Received: by 2002:a05:600c:c7:: with SMTP id
 u7mr3112214wmm.178.1622453420603; 
 Mon, 31 May 2021 02:30:20 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id v132sm231232wmb.14.2021.05.31.02.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 02:30:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/nios2: Mark raise_exception() as noreturn
Date: Mon, 31 May 2021 11:30:18 +0200
Message-Id: <20210531093018.1641599-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Marek Vasut <marex@denx.de>, Jeff Da Silva <jdasilva@altera.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sandra Loosemore <sandra@codesourcery.com>,
 Yves Vandervennet <yvanderv@altera.com>, Ley Foon Tan <lftan@altera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Raised exceptions don't return, so mark the helper with
TCG_CALL_NO_RETURN.

Fixes: 032c76bc6f9 ("nios2: Add architecture emulation support")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index b0cb9146a5f..9bf14c128ed 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -18,7 +18,7 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */
 
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_RETURN, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(mmu_read_debug, void, env, i32)
-- 
2.26.3


