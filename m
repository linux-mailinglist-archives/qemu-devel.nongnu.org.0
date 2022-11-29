Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6F63B6D6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 02:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozp4N-00023k-RE; Mon, 28 Nov 2022 20:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ozp4M-00023b-AJ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 20:05:54 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ozp4K-0005QW-NK
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 20:05:54 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so10683904pjo.3
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 17:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2yEcXUJZGlDLcZPWH8PxDhax/Of1uT+DjIIBApf6vik=;
 b=PRC/2e/YAiDgpP+7KNGRRO3Q4uDhMVjDkgTnz19+A5KT6QmUg32mxOGYwerHtrax6U
 1KskZXE/qQzt6m6G8QKh3gudWq9/PaOJgFlVNsLacdooA1UHBIEdJlJ4KBBVbGxvf9/q
 1xAI1w4iTdKspYR5jJiYhEvetYpIUeRav/Eg4G/EqJKBrQz1epMpSBpsGrpYt/FKwRxY
 21c+B+DUKVUY5+u9U/UENwSDxBwd7f8rpPvUmeLPy8wW8dFnyfHQSte+jlI4XN9AFU74
 G8NbqoQWP91OYoSwHJm44NTK82CWNIVL3wY9zub0df35yN8vLFMC5HH5Gws4hGyz5CkE
 EwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2yEcXUJZGlDLcZPWH8PxDhax/Of1uT+DjIIBApf6vik=;
 b=yASdFmRAtH+j6+/MkF1SeZRoY+l3RBsZT4+wVCHwO3UndJ8P0avKydtEni9JwTH13e
 2RaQq2+GnDFpb8mMrmBeoT5yYP7sHV9koxtVc9RO62zozvaadFPxDIrT6epsGuWKoJx6
 DiHz5VRc/LjlEdP5T46oGoXRfAwh2KUurlHlbsXbsgun/tpzD/hQzRNVmsj24jzniQnm
 YCsKZSGN0TTclUlmzjXynoUDdpx/E0h/O9QNWOsFbss3U2jgR5zDf2HJlmjtvgOc4yMO
 E/yli+dzgtv7hB5SAx8sf5QA2mYoTx6CKpMTouOi7Uq0ZeUGkv/eLf9i5C1ybRUQB6WX
 +fLA==
X-Gm-Message-State: ANoB5pkAYFDu8ziCz4LJLmlJJexwnVdaunKgM/XQaFlOScSHUEIes9eH
 dry3Fqor0jVOn+d78IH4Ys+gHiprY7KGlg==
X-Google-Smtp-Source: AA0mqf4kdDxf7ggq/SbFTek0CJxdXT1jJT3N/oaQfcCvJf7VsKKOOqF4ypOqLPNqyHksl5/X3MNuZw==
X-Received: by 2002:a17:902:7885:b0:17e:c0f0:96a4 with SMTP id
 q5-20020a170902788500b0017ec0f096a4mr35921743pll.80.1669683949278; 
 Mon, 28 Nov 2022 17:05:49 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:77be:da03:8c5a:e406])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170902650700b001896af10ca7sm7052163plk.134.2022.11.28.17.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 17:05:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pavel.dovgaluk@ispras.ru,
	stefanha@gmail.com
Subject: [PATCH for-7.2] replay: Fix declaration of replay_read_next_clock
Date: Mon, 28 Nov 2022 17:05:47 -0800
Message-Id: <20221129010547.284051-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fixes the build with gcc 13:

replay/replay-time.c:34:6: error: conflicting types for  \
  'replay_read_next_clock' due to enum/integer mismatch; \
  have 'void(ReplayClockKind)' [-Werror=enum-int-mismatch]
   34 | void replay_read_next_clock(ReplayClockKind kind)
      |      ^~~~~~~~~~~~~~~~~~~~~~
In file included from ../qemu/replay/replay-time.c:14:
replay/replay-internal.h:139:6: note: previous declaration of \
  'replay_read_next_clock' with type 'void(unsigned int)'
  139 | void replay_read_next_clock(unsigned int kind);
      |      ^~~~~~~~~~~~~~~~~~~~~~

Fixes: 8eda206e090 ("replay: recording and replaying clock ticks")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 replay/replay-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/replay/replay-internal.h b/replay/replay-internal.h
index 89e377be90..b6836354ac 100644
--- a/replay/replay-internal.h
+++ b/replay/replay-internal.h
@@ -136,7 +136,7 @@ bool replay_next_event_is(int event);
 /*! Reads next clock value from the file.
     If clock kind read from the file is different from the parameter,
     the value is not used. */
-void replay_read_next_clock(unsigned int kind);
+void replay_read_next_clock(ReplayClockKind kind);
 
 /* Asynchronous events queue */
 
-- 
2.34.1


