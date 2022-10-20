Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90360628E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:12:16 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWHN-0005Ye-Ml
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:12:13 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWEk-00032A-Qk
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7T-0004v6-3d
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:00 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:47029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7P-00011U-6t
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 t12-20020a17090a3b4c00b0020b04251529so2808470pjf.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ecyLf9UvK3GuacwmNTSkckTuqIdVcU8ZGXDLAydoDBw=;
 b=o4stW68Y/IxzsZyLqUNdy9LBbqwuPkiy8Pj/woDWkGLNU4phGdORjZQe3BoBHz1Ymj
 KKuNp7pNlMJJmla86QlcQYHZLS1Hfaa3M8lkJLLi3ccsQzyAY+oFJsYigSDKjXGqFM9E
 tObiLE8TWYHofesIGgaLcmUppOgY+lABfLX2kqpOotiTeRMIjfT3YA0bsYNyKcDHV6/c
 0SoF8OIuuGsWVGaxhPTy1mMOrrSE59tJ0/TOXn/1DLOstV2NGzJTDDSRY+odDZ9QR6mb
 5STbpzFr7GSzWUh7QnD7SaSdjCTfNWOXxe+IbLWpb2eie3QsbdGJGlBB70Y78nk30YrG
 774g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecyLf9UvK3GuacwmNTSkckTuqIdVcU8ZGXDLAydoDBw=;
 b=Tt+xANfRLFQ7Iq7NOom/CTBc/hmiqsfasuDB91zHpwOzryYu9zUmqc0OvxF8PE3MVT
 QIEX7u5xBam6BwxKMiTeAu7M3amKe4SgzW1ztKk9s88uHcK/J8hlEG+9H+0hxW6DroIP
 P9ix1JX3y1LAqJrIEhJmLLpyu01lzM+9vmVYGf+H63i0G4rTCZhUp/AMeKhcROTy1VFc
 eeTsQM8zWb6byuMH5VLpM8/7swXijOM09PLw1rq/Z1/q0GvroY/dyoj/tmZEdNyRANki
 ZiDJ2Bs9GkStz3d5mwYCTUl90I38/D/BR1cSWiMipP+hK9p5WxQ/9CP6euyHtBoGN2SW
 vBFA==
X-Gm-Message-State: ACrzQf3P8P4ZCcsXE7m7BoNX07Y8/5DWuePM27N1DLeRZfJHBd1ht/uO
 7Tj+Tdbm1r/UOVwa3Zw9t+BHEAGBAebhdIQv
X-Google-Smtp-Source: AMsMyM52nL6i9X4yuf9TUByizx+LGnMytjZuY7VcjcfQFSfxUl2Bx8E0YBn2hZ3+AOao7COPe5j2tA==
X-Received: by 2002:a17:902:f541:b0:186:4b91:4501 with SMTP id
 h1-20020a170902f54100b001864b914501mr13545414plf.171.1666266825819; 
 Thu, 20 Oct 2022 04:53:45 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/31] tcg: Add temp_subindex to TCGTemp
Date: Thu, 20 Oct 2022 21:52:21 +1000
Message-Id: <20221020115242.2301066-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record the location of a TCGTemp within a larger object.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 1 +
 tcg/tcg.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d207bc47be..afa18986b1 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -456,6 +456,7 @@ typedef struct TCGTemp {
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
     unsigned int temp_allocated:1;
+    unsigned int temp_subindex:1;
 
     int64_t val;
     struct TCGTemp *mem_base;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6c4f949c85..135d9a9a0a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -927,6 +927,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts2->mem_allocated = 1;
         ts2->mem_base = base_ts;
         ts2->mem_offset = offset + (1 - bigendian) * 4;
+        ts2->temp_subindex = 1;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_1");
         ts2->name = strdup(buf);
@@ -973,6 +974,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->kind = kind;
         } else {
             ts->base_type = type;
@@ -1091,6 +1093,7 @@ TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
             ts2->type = TCG_TYPE_I32;
             ts2->kind = TEMP_CONST;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->val = val >> 32;
         } else {
             ts->base_type = type;
-- 
2.34.1


