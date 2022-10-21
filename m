Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E2607460
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:44:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloZv-0003fx-54
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:44:35 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHh-0003JS-Vl
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHN-0003Db-TM
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:18 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHM-0005nj-7q
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:17 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso2521955fac.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=aWiOU9Lx4T67eUdWLOaIHDq++pP1sfM8xexmNl/yN19xZ5pC4hJj9c2PvKaYbsPqoz
 TgZH1md5djTl/ecR0pHLf7UohiyVfzmRuwtfbdZCQxr96Hb1jlz50vupvT5FcBtpI0cp
 x2CLX/de8o1YgAm6rAYp2x6HfpBZKT/kUk/mjsEXo+J8ZtoqvfyHThaBYVf3qH2p+V2Z
 kEHFVILdD/zAkZNeYZieMdobq+raP8jj1pro4n4ReaSspQzvNgl703YYBuknvDwD/2+T
 2U1yw9ZG8zAF9nAfG8XZS3Dhb5i8GgON8bPfge+Q73iO7r+OSwM++SBt4OkLzomazX+H
 DHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=z1N6N2QnRVuhSo/tlXSM7AJRXhuS08+vv4I993Ytg9QZpq/Wsntp/w1kRCrdIthZhu
 Vfo/cOdveDAqNnA+yje00CIXo3iIT7knvZAz45yK2dRvGdaQAqpNj7Fc2mMokCtYYQr1
 pWTIUvQf2hDOScw6EIQmvcjZ48BZoDedTw699CHVQTOsJyUP4Q9N/nrGleA+6lqJsI5C
 wZqcUtvQ/sDPTa7x3iRdA/uqD0e5CijyFvxIcJzpwDyQ3phmWSFB0MUfWBPUcn28+H4p
 zCQiwVUEBEQlnYGT6EfOf+oJgZPrmY4kvVvpf9dSlxe/2xiUYFBieEum/M8cHt0cvNx6
 Kx+g==
X-Gm-Message-State: ACrzQf2inLBmE8j8RKY3wR7wKFpMKAy2ed+jgoqpr7lLkBXPzFfwJPZz
 kRKM171qro6hNyLKLkglATPArvffPRN1lgyy
X-Google-Smtp-Source: AMsMyM6x8efw6TeFrkwQUDLYbrRnoAOPla3z5qQFIsTxTV/yC5nnV7KU8508w3T+NF5F1D9ATMq/Mg==
X-Received: by 2002:a17:90a:4594:b0:20b:23d5:8ead with SMTP id
 v20-20020a17090a459400b0020b23d58eadmr55276401pjg.127.1666336624385; 
 Fri, 21 Oct 2022 00:17:04 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/36] tcg: Move TCG_TYPE_COUNT outside enum
Date: Fri, 21 Oct 2022 17:15:27 +1000
Message-Id: <20221021071549.2398137-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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

The count is not itself an enumerator.  Move it outside to
prevent the compiler from considering it with -Wswitch-enum.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index afa18986b1..f2da340bb9 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -294,7 +294,8 @@ typedef enum TCGType {
     TCG_TYPE_V128,
     TCG_TYPE_V256,
 
-    TCG_TYPE_COUNT, /* number of different types */
+    /* Number of different types (integer not enum) */
+#define TCG_TYPE_COUNT  (TCG_TYPE_V256 + 1)
 
     /* An alias for the size of the host register.  */
 #if TCG_TARGET_REG_BITS == 32
-- 
2.34.1


