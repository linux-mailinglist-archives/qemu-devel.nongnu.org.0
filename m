Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9A468AB5B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:38:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUW-0005Pa-KK; Sat, 04 Feb 2023 11:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUS-0005OQ-TB
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:15 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUR-0002bl-Am
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:12 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso10293792pju.0
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNQ5cD41iWDDXrL/VUUAl3ccQjSxU/V7M1eUUGdE6wQ=;
 b=kzbSD3MwZ4d4oG8Hkyf/l6jj/pFpkT6pUg204da41TVc+h4bNPKY242MM+e75RqVRr
 jml/O6kTny84LLDpNhPfUFaBYp3gOF1CNttmU2WNbCrKJBAGNd+dwM9cmX++RgpftbeJ
 noV1ooaFZj31ZQHbFIg8Hjew9JBZ1c3Vfsa9PgMeCTH5M+SniXaTQgHqM0/0CD0vPeH4
 ik1+Tk2220LzX7SAcE6BfbVdljUWrTB2GIEDypvI0pOyxisZuV2gvLzd75JSAWl/opTb
 jJ+0Jhs+BbDkV0fE9i94RijcW69tr2HYIJbyijStCz25FBVx8l2ZqtjZ6qI9rSyWrPo8
 onqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNQ5cD41iWDDXrL/VUUAl3ccQjSxU/V7M1eUUGdE6wQ=;
 b=tvCtLZaf2fnkKu9WbP1jJXp9LR0CMCdH4Rw2Mk/h1FfF0OPLAqDAQ/zA3nYz5NGLo+
 1rgXy3kBvoQCy+yZNoVLPY7/rLhK2J5lZQB9O0EkIgGB7vBEqWoUaiLGOx43ZGh4CSca
 RGAYAoJr3K7tTdRuWnB2XsvFmqJezcJUSiASyPR85dxBVk1gIsjckHgQHDMZJd8I/Mhn
 exv0sRO7w4qnych/c+/XHnyiqbugCdkp6Gr9DgcfHOEKwJCAhSBUXma9niempKTV1zwI
 Sq5r1jFrM69ZlL0t+CcM6TK2qhAd2tEjDV3UK7RlkVAsWttf7FphfMPscaKNtAAZrq06
 m70A==
X-Gm-Message-State: AO0yUKWf5ixA+Z0R4+VuIEDHY/QleH42p2JJlUTW1mz0zIwCmgaP+Jpq
 WUAmLV5LUSecU8OMmFJ1+TpI0tMY4KtpWpyA
X-Google-Smtp-Source: AK7set9lKPgbecyOAjTc0wq+oqryXDUdlEYQ2TuTH4ufP3EB6DOtppRw9cTMmvPCvGFGeJhbTItq3Q==
X-Received: by 2002:a05:6a21:1707:b0:bc:9f82:93a6 with SMTP id
 nv7-20020a056a21170700b000bc9f8293a6mr13948844pzb.7.1675528449942; 
 Sat, 04 Feb 2023 08:34:09 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:34:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	David Hildenbrand <david@redhat.com>
Subject: [PULL 36/40] target/s390x: Implement CC_OP_NZ in gen_op_calc_cc
Date: Sat,  4 Feb 2023 06:33:06 -1000
Message-Id: <20230204163310.815536-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

This case is trivial to implement inline.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 9ea28b3e52..ac5bd98f04 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -625,6 +625,9 @@ static void gen_op_calc_cc(DisasContext *s)
         /* env->cc_op already is the cc value */
         break;
     case CC_OP_NZ:
+        tcg_gen_setcondi_i64(TCG_COND_NE, cc_dst, cc_dst, 0);
+        tcg_gen_extrl_i64_i32(cc_op, cc_dst);
+        break;
     case CC_OP_ABS_64:
     case CC_OP_NABS_64:
     case CC_OP_ABS_32:
-- 
2.34.1


