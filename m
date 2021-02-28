Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CAE32753D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:31:01 +0100 (CET)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVWe-0005oQ-As
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPq-0005bi-NR
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:58 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPe-0007kN-A9
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:58 -0500
Received: by mail-pl1-x62d.google.com with SMTP id s16so8756434plr.9
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aU/KCKVa2SU1U8PQpzFTQgYauXXz+N+xlij7JLFYI1g=;
 b=zKgIOFahQwgy6IOU5DDM3U2miwmiLkjx/29S+LjB0+9n1ug37B0r98e+Fq4Z73B1gE
 AyIUfmC8yXfW9e6aJHIE84zgQgd6TuKgalQYNkSSvfrSymb8WwfhGkar2wH35eQmIQge
 OorpSJaBMzvKeuC/B3+5afWmVOgzdbEeP3wxM3J/j594t8ca5Ws8KUy5nNNUY5GhGtsN
 UZ7T4Udt4raHNjAQH2UCwlnBCkX5NBzCE9vuwnduVcYy+Dl3pU8kQ8qNEGxaoPYFOhNg
 DTroNQly/ACL2Q6HuNF1MJX6Tvm72yH+/RtFshiZJ8W6CYnJP8Up+Lpq2F1Ih59IsyF+
 AJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aU/KCKVa2SU1U8PQpzFTQgYauXXz+N+xlij7JLFYI1g=;
 b=gLs0S9Jep0RMgl2A7npA+fOWWgQfb0Z54BYEwpe08eSY8LqbhytvfpXh+88rtgM8Rj
 6PB8Z0Ql/UD8VOEcnE7JYloNvmwvYi+QLahJ8rLrw6MteTRIggPvs84CWYtWio/d6Y5V
 pZbkXzinBIfocKkkCvym2RfQ6xDMrcT3NK3lnEoEUHTfj7bbrnljJYTPITXxG0r/pi/o
 d4Gw/TYoJDqyZ+z4WlunJjenRQ1ZAk3C51/WKjndwArgJ5jVer6prbQtUGrtocGLnxZV
 u5sCJNZ1mrxTJdTOFNp+gYLjywogFDVioQkL1BfFfiWUGqNMveK0jav76eXH28k7bGel
 valg==
X-Gm-Message-State: AOAM5329GrYxQvWWMxjLBHL23PaeONupDly9fYKv99siZGDg2lZL7EtG
 YvoViJIwcEpciDYrPmcyfOo0DMM3TRZImg==
X-Google-Smtp-Source: ABdhPJxjWOI7uLbtX2KIuTC+NIS7ylHNcbyBrJ4w3726+3J2IGIkZjOnMMT/V42/7QJ4Z6+ZMJ881w==
X-Received: by 2002:a17:902:bd96:b029:e3:73aa:e14f with SMTP id
 q22-20020a170902bd96b02900e373aae14fmr12957571pls.9.1614554624117; 
 Sun, 28 Feb 2021 15:23:44 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/50] target/i386: Reduce DisasContext.vex_[lv] to uint8_t
Date: Sun, 28 Feb 2021 15:22:54 -0800
Message-Id: <20210228232321.322053-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, vex_l is either {0,1}; if in the future we implement
AVX-512, the max value will be 2.  In vex_v we store a register
number.  This is 0-15 for SSE, and 0-31 for AVX-512.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 79f987b2cf..3b7660a019 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -97,8 +97,8 @@ typedef struct DisasContext {
     uint8_t rex_b;
     bool rex_w;
 #endif
-    int vex_l;  /* vex vector length */
-    int vex_v;  /* vex vvvv register, without 1's complement.  */
+    uint8_t vex_l;  /* vex vector length */
+    uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
     int tf;     /* TF cpu flag */
-- 
2.25.1


