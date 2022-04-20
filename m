Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD42508F49
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:18:55 +0200 (CEST)
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEuk-0005hx-SY
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEix-0005ol-UT
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:43 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiw-0001Gh-AO
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:43 -0400
Received: by mail-pj1-x1034.google.com with SMTP id bg24so2682119pjb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OUIcQ5zLACIhYX2zcEvzffhtx00mXb1YP/5lTmvaplA=;
 b=aK+ss044hIrbHPFycrlaZHSQllxWTmwHu+PL/6aLVb+nxPtBrqMOUOMEpIcHLwUSif
 51Cu7OcLdWR3teX6O8Aute/Acqh2hrI777tRWW/flQvSaaZA1QAD5MvaLlPEx737us9V
 g6PwldBWVtwaivQdzzqrsmUMFqnZJPQ2rKbMhZat49UIFx75gyy4zsKYPOX8oLwofPZ/
 RB4fJEbB24ZT6+clOFE4Cd4tNjRfJS4je331H3/s0GRCDgYFOxoyU2gNIe8XHWQDez/1
 p1CBesRcuvB3OFvQPc3gXkk8BMIunNeROIaLRJ3l1yLdAZJ44DZ/Z/Z6UcoKONTedQnp
 QkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OUIcQ5zLACIhYX2zcEvzffhtx00mXb1YP/5lTmvaplA=;
 b=WNr5TXx0zrqNpFLwjKTPjgw+nWp2b+MijeZ2wyPW2dl6BItPhL1+O5CnX+QJxHwU8i
 cmxb/42meFR8pHqC9aFZ9VJ2trO5J8eI37WSMEPWy9ER+1W93/h43bGdQQFwAGABQuGp
 ozBP5CD2OyfgFFolZ6yooDsFAVa9Oh3Go0vsfkKZn4znxssMiavdH+WfwUBP6+zkHUBo
 LWTaBYBNisrjsDy0J88kNfvHtUITUAbR3oJjIeM0c0394M5dFwMpZeqvwqclPFBhrFpR
 eBiV9ALGKqqCqslsS0uUDq/Rz3aNQ5sOlIGREFq/DQHrTD9mNnnQF9/019pWKp6ZKji9
 7h2g==
X-Gm-Message-State: AOAM531PpLqy31GeUR07Mx39c7C4Tz5P4DQwzBr53qDzO0qmIclo/IDb
 iudbuXlv2Q6gX+No+f6gEf5C994RcRkkGg==
X-Google-Smtp-Source: ABdhPJxtPcBtMsfX8vDP48IztBTpE2IG9+cClauCaxv8QvOmfcmq+aT2gwB4oo/F7Bj1YMEAc4pPwA==
X-Received: by 2002:a17:903:2487:b0:159:bce:4e1a with SMTP id
 p7-20020a170903248700b001590bce4e1amr12183733plw.4.1650478001099; 
 Wed, 20 Apr 2022 11:06:41 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/39] util/log: Drop call to setvbuf
Date: Wed, 20 Apr 2022 11:05:59 -0700
Message-Id: <20220420180618.1183855-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the log buffer is flushed after every qemu_log_unlock,
which includes every call to qemu_log, we do not need to force
line buffering (or unbuffering for windows).  Block buffer the
entire loggable unit.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-21-richard.henderson@linaro.org>
---
 util/log.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/util/log.c b/util/log.c
index cab0642a7f..caa38e707b 100644
--- a/util/log.c
+++ b/util/log.c
@@ -136,12 +136,6 @@ bool qemu_set_log(int log_flags, Error **errp)
             logfile->fd = stderr;
         }
 
-#if defined(_WIN32)
-        /* Win32 doesn't support line-buffering, so use unbuffered output. */
-        setvbuf(logfile->fd, NULL, _IONBF, 0);
-#else
-        setvbuf(logfile->fd, NULL, _IOLBF, 0);
-#endif
         log_append = 1;
         qatomic_rcu_set(&qemu_logfile, logfile);
     }
-- 
2.34.1


