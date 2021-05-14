Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD1380CD8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:26:05 +0200 (CEST)
Received: from localhost ([::1]:53452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZhU-0005w7-BB
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVx-0005xe-Gh
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:12 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:45761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVu-00073y-7B
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:09 -0400
Received: by mail-qk1-x731.google.com with SMTP id 197so28987579qkl.12
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3h7I7fG248RECND44leECmVPoKr2IUswvnOcmS9+8lk=;
 b=bV+3v2nQKXBPgBF1aBMdV00ikK1P3JaR16hHVoRswPPufOroZRmdn+UeIGdaKjO9aO
 oWbiKP9zJSVnpJYi8aeF7cxNReEYbB1VQmHxMDrcxD0PpEkyKNKV/gvYLxn0BkFdgUQY
 SVRQJRduMnMwJmc3l4negKMFFd/2K/CMhXTeJny3IqdHmZlX02FSgfcanl3PvN4DUWZC
 EMPTHAACqHEFd5KcS1eDrR2wLCs8ereVeo53yuUTrHHBb+ONHMKu26+ty3bpmPUyh+nJ
 L6kGebsCqjZa/rlevCSPKrVF7wTMMYcH/MOGfFnvcTRbd1hN7DHXnIuy/gRICuPj3lER
 pFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3h7I7fG248RECND44leECmVPoKr2IUswvnOcmS9+8lk=;
 b=bhkqWov9Cv8bWIfAhdGZ4Xu5/Uc+3V2v8rlcbTNv4sjtV/guUlhB76LjUHD3om6Gi+
 bZVPOsoZlPMZQi8+tcsbDVYPPEvF0mNnZvCxbJupMA1UNuxlJ//Nn25JEFz0YzpgtNwz
 VphIKKY1caLNTogijG0zNwqYjAFC8b6FoanwgiZDmkHQufFX0PgU+TTp+h+ISxgACjmV
 eUPhSHbjrr05YpRvRZeYHsOgIo7r1MwFYZQuGWXVds5yaEqVBtsxiAn1I8ymt4W1ALpR
 1viUpgrfSuzPkCaBuzWs3TgerESaLPT7tpIC2Pi8Oy6xne8Zjye6cwINZ9/LUts11jxy
 CLEg==
X-Gm-Message-State: AOAM530eDKV+11xhAXbZUhPiFhdwj4TqVEtMoQnBFhwLRTvrYtBh3FJ7
 WY/OYZl54qT8r+Xs0IOPMuF2QfQtNXGoSiKMZxQ=
X-Google-Smtp-Source: ABdhPJy2O5dhFy+daiz5zNbCKy/UZOhVcHhE+VfkIwopmS9S5sU36a1VBHZZ4UiE0Stb2WjoVRoGPw==
X-Received: by 2002:a05:620a:14a5:: with SMTP id
 x5mr22854026qkj.143.1621005245424; 
 Fri, 14 May 2021 08:14:05 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/50] target/i386: Reduce DisasContext.vex_[lv] to uint8_t
Date: Fri, 14 May 2021 10:13:15 -0500
Message-Id: <20210514151342.384376-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, vex_l is either {0,1}; if in the future we implement
AVX-512, the max value will be 2.  In vex_v we store a register
number.  This is 0-15 for SSE, and 0-31 for AVX-512.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 61c0573c2f..1367e53e4e 100644
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


