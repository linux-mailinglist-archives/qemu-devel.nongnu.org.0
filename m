Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0669D2E9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:43:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8S-00078K-WE; Mon, 20 Feb 2023 13:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6g-0004fS-BR
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:49 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6b-0004Fr-S9
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:44 -0500
Received: by mail-pl1-x629.google.com with SMTP id p1so465188plg.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qoDF/rY8HtyNlykYqkZFXY86Nrt61o0/K7nWThd7Dr8=;
 b=hvKZ9EHh3oPRQ8HtkJH8ytJZqi/cJDNPCaK2KZLK2NinzQ9qrd1aY9Cc++A7OTy7GH
 xICeDYLv60x4XXBV03p1BNVnlvciDNTMRNBUdkk5MrPvEaCB818AJSgBhP2FsaZZB4Wa
 C44MJtW+0pFKVLvHALyO8YZfex2rPJyf2hIeOU2ufRP2gNdtyRIhHSjFbyOVH7MZ/evI
 20D+nC4OXOM+yN9bma+rdCXkGRlV1t0dGYeHL4721NQqzivSTjDZQ9w1qLHv3YuYJPUn
 fEvGLva+/zKOvyROhCKbVb8cl3qsPPxHatc7gQlUtt2LaKJ0QIUlDuBkvrXcGF0yQifF
 eBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qoDF/rY8HtyNlykYqkZFXY86Nrt61o0/K7nWThd7Dr8=;
 b=vIKbql3XcQax+xWcoSirptMwS7UHKB+c2fKF0uJuDiR4nHP3qVRfxFJOaJbKFLiVR+
 5TskbHTJ1l0DT6Ay5hb2/unto2R9246pbQESAX4ZbI9XMCZIyeHsM1Mh5kQ+TDBfDotw
 zdNwgPRwPeygnArxdaoFpV+d+TefvdpKJLaiZ9C+w44p7/2WVdaB31jU2MhlPJ3gnGAs
 SlHtAfnGHx3bQilNykFCV9l77Fa5gtNTYmOQXJceC87RNs0CjgkPfMdMC/vCL775w+ji
 fGU4IWhduaBsYHINprxFSOv9MnyT43eL63m2kUNzcghtLs3BxplaezyCxyRd7jT0SwJT
 3lVg==
X-Gm-Message-State: AO0yUKViZJHU51mNSZV59BNrxLvBwHoQcT27XUPOQIdM7+b7jFuey4QT
 PPEyc98YaOJyuqCb855p2U0RkA0Z2xEVjzRubVY=
X-Google-Smtp-Source: AK7set8oNSWzu+7eh7aewscZlq6l+T40a+DJZuevyYgXuscLAgolsGkz9F2kzWWeLJzTCkr1wdZd6w==
X-Received: by 2002:a17:903:32cf:b0:19a:9686:ea8b with SMTP id
 i15-20020a17090332cf00b0019a9686ea8bmr2131952plr.28.1676918499833; 
 Mon, 20 Feb 2023 10:41:39 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 24/27] target/s390x: Fix successful-branch PER events
Date: Mon, 20 Feb 2023 08:40:49 -1000
Message-Id: <20230220184052.163465-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

The branching code sets per_perc_atmid, but afterwards it does
goto_tb/exit_tb, so per_check_exception() added by translate_one() is
not reached.

Fix by raising PER exception in per_branch().

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221130174610.434590-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/misc_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 576157b1f3..e5015daf07 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -618,6 +618,7 @@ void HELPER(per_branch)(CPUS390XState *env, uint64_t from, uint64_t to)
             || get_per_in_range(env, to)) {
             env->per_address = from;
             env->per_perc_atmid = PER_CODE_EVENT_BRANCH | get_per_atmid(env);
+            tcg_s390_program_interrupt(env, PGM_PER, GETPC());
         }
     }
 }
-- 
2.34.1


