Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FB341C581
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:24:54 +0200 (CEST)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZZt-0001Pl-Ny
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZI7-00076w-CT
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:31 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZI5-0006Gk-J3
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:31 -0400
Received: by mail-oi1-x234.google.com with SMTP id t189so2790451oie.7
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxfPZ7H57dcm7rNQ+f9pWEPpiqUmhBqRaotBBFRVjb0=;
 b=duCHCXaHJUtA2SEMwqZKrJXZqWrsAz+Ay1RWsWOWtboCEhd9PbuaNKAYLl21mE/Ul+
 sLF5GDJFtYid0Wiqfcskn5ObFOMDILyLJtlzTjxZoOe19xWuVcXOuwmJxryy03nOGYCi
 c8sy5zYH//fQ64N0NSZ9PJIQkRJ/aa9Bg3TL2Ncd/aB42ny1pZxf5222APqLWhtXmPj7
 sGHAMOTecc48hk4dTYM1LssxgeJWNed1SK/yHTURshD/RQq/tTHxLWDTfzE4B8RgiclP
 0UovcmiQ6sU/SDs6vDuWMTEFzdbYZldgPl1fymtL4nuvJ1xxpMZ/l8QfLwhJmYxDgDNE
 6+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxfPZ7H57dcm7rNQ+f9pWEPpiqUmhBqRaotBBFRVjb0=;
 b=i0AhHkJD1ylW/lu6ju5meGWw1fl3uCY3y6pponGZqy+TJzLpEhAvQ4p7q17tOVnlZs
 zTaiPxNzjgBxuTd5CMtp83x3eSjs5zbd7w/c0SewLtEGCxK6ouZt5+XT7Itxrinz/GMg
 lSSgrGeSdaG3CfZUc1bDZFY8tbARh0fNSI19AjIbPiPAUUVaMegQ+P3JeVC/aN5aRMmU
 8I8qaaRGOOimzx6yHpkqJYnul9aPGBGjODUdpJUG7i3+cTrXMHniTzp/5jCz/YGwfe6y
 DdnKCYug719/7ih/CuRTn3oe/guzqWX12byvlYk7YF8MTbpQzL5id5VdUs+1OnlOM5Tr
 jXdQ==
X-Gm-Message-State: AOAM533FBZtlnfg5wyS9+8rncRK0GAjBm/jILtFEa0eZWFrdpqKQkdAX
 Kvo2FeCqDwpvIF/K5CBDNjmTeC9a/YNBnA==
X-Google-Smtp-Source: ABdhPJzzk/yshoFRr49E6i4xD7+5XT1IxhAZ34QS+8nTmQ+/eMLIPivMRQu4ZY9XbK4nn4ovZFVW3A==
X-Received: by 2002:a05:6808:180c:: with SMTP id
 bh12mr7956316oib.78.1632920788466; 
 Wed, 29 Sep 2021 06:06:28 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/26] linux-user/mips: Tidy install_sigtramp
Date: Wed, 29 Sep 2021 09:05:41 -0400
Message-Id: <20210929130553.121567-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The return value is constant 0, and unused as well -- change to void.
Drop inline marker.  Change tramp type to uint32_t* for clarity.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/signal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index d174b3453c..64072779b9 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -87,10 +87,8 @@ struct target_rt_sigframe {
 };
 
 /* Install trampoline to jump back from signal handler */
-static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
+static void install_sigtramp(uint32_t *tramp, unsigned int syscall)
 {
-    int err = 0;
-
     /*
      * Set up the return code ...
      *
@@ -100,7 +98,6 @@ static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
 
     __put_user(0x24020000 + syscall, tramp + 0);
     __put_user(0x0000000c          , tramp + 1);
-    return err;
 }
 
 static inline void setup_sigcontext(CPUMIPSState *regs,
-- 
2.25.1


