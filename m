Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812876AB479
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 02:58:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ06M-00048c-9E; Sun, 05 Mar 2023 20:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06G-00046N-1F
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:16 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06E-0003IB-GY
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:15 -0500
Received: by mail-pg1-x536.google.com with SMTP id 132so4596372pgh.13
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 17:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678067833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/1/w+4tCdZdhSP9X+tt6DrDGtiinyr2Hzdz5vlpulU=;
 b=mcF5GPkMR+E18ihieGu5KHIdv49TWmzsHj/+e1nCFODTvepOamAp+HI+jcVywrOanW
 LVP13pl6WPlPaQ95a2Bx0wdf3YkDe9kTmykyDWX4qboMKW7BXOqjlx+x2ijlA3OAWI/a
 DYVCC912KvoGRLJKqP+f92lnt6hod4Dctl6rGbJNcom0zepzD/oJr9lIITAyPPJgy2m4
 VPeeOwbsyDXEaZzuwm47MqmfNmMUs6VHAihoLvhKpZxtVRabbtRwZoT1EsHU3h2XchqI
 eTusr+6+8tfRyrxxP/b7GQgEhF9+yXv+3q4PayDTzB5YwyDkOy6CloQm4fEoZgT2V0gr
 bD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678067833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/1/w+4tCdZdhSP9X+tt6DrDGtiinyr2Hzdz5vlpulU=;
 b=PFp6eBQXQ5Hcoab4fIRtT9zxyc639JB14ux6AELluGXySuX1lN5XczkATEhPLZA6XW
 e8t/CaeZ+yovIQcgrgSdgpShFMWoT3mLME+qjB+SiTSMqB61XXk1pp3yrK+mFhft12qa
 NCEvKirZzTmlyNDcW4TBgKg5cV3CmwRbc9Kr/cHwzac+XJAzCqoLay/rk33wpEWFIeND
 zQFxCFMo3JCzNTmRGym6t1SUnwRu0axWDWlMkBqiWm9I1J7SwzjFR2K46iWoV31GvM3n
 b7DaJG1T02/43h9dzz07GcE4yBIgVm9bGpD3Ja+IB0BZtM/H/kgw2mUna7hSwiiWNLds
 3f6g==
X-Gm-Message-State: AO0yUKWEdzsJ/d/K+lV/WHaFiqdbWVvjdxEJUB17FsV7x1+9oCXZNU9x
 pInSLnlR2SRylcCly//KyKQTZ0H7BsBCUhoKof/K0g==
X-Google-Smtp-Source: AK7set/RfJ58G+L7ejkydnnPhJtfusvKmqn2m3m5pv5SK22NCViuxjbtJFnd34iRhhfcHVo5MhkMRg==
X-Received: by 2002:aa7:9525:0:b0:5a8:ab87:eda with SMTP id
 c5-20020aa79525000000b005a8ab870edamr7615732pfp.20.1678067833237; 
 Sun, 05 Mar 2023 17:57:13 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 g23-20020aa78197000000b0061949fe3beasm2921056pfi.22.2023.03.05.17.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 17:57:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 2/5] tcg: Elide memory barriers implied by the host memory
 model
Date: Sun,  5 Mar 2023 17:57:07 -0800
Message-Id: <20230306015710.1868853-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306015710.1868853-1-richard.henderson@linaro.org>
References: <20230306015710.1868853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Reduce the set of required barriers to those needed by
the host right from the beginning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 75fdcdaac7..2721c1cab9 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -107,8 +107,13 @@ void tcg_gen_mb(TCGBar mb_type)
      * (i.e. !(cflags & CF_PARALLEL)), however, even with a single cpu
      * we have i/o threads running in parallel, and lack of memory order
      * can result in e.g. virtio queue entries being read incorrectly.
+     *
+     * That said, we can elide anything which the host provides for free.
      */
-    tcg_gen_op1(INDEX_op_mb, mb_type);
+    mb_type &= ~TCG_TARGET_DEFAULT_MO;
+    if (mb_type & TCG_MO_ALL) {
+        tcg_gen_op1(INDEX_op_mb, mb_type);
+    }
 }
 
 /* 32 bit ops */
-- 
2.34.1


