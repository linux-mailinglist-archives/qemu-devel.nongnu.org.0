Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51239681D3F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:51:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc2J-0003HB-HG; Mon, 30 Jan 2023 16:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc24-0002mQ-Fk
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:45 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc22-0005hO-VX
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:44 -0500
Received: by mail-pl1-x636.google.com with SMTP id jh15so4051130plb.8
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNQ5cD41iWDDXrL/VUUAl3ccQjSxU/V7M1eUUGdE6wQ=;
 b=PELM8eSXwPeo0BVnsx2xPzvRG4ZmCLLqMpKKlXVpHGosdozFp0ZQheqzCJtxquG24H
 ItzCBraytg5ADp8JlHlMVbke2ogd4ECE+rT8bmm7wOJYHpw2h7ER4SMm3ERw7DwQb7lW
 5An4S1dRa7jN02I52fpEXr/8JVftWQOGab8ywxxolkJHW0LYBczjjt3O2fqZ1PQU8bjU
 ncZsSUcnbEI2qp24bs4VeXaa06ArSVcTodipQFe2F4w4MyUHItPdQiZOH+YLez60ePGt
 oD4Op1jW/PQD0jpTCT/xj93Hi10Exleae/P70MUs8fwLV9ZhF+0kGtJLlkIdPumQKzEB
 XBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNQ5cD41iWDDXrL/VUUAl3ccQjSxU/V7M1eUUGdE6wQ=;
 b=i4T2zdvW93z09qrHZU7kPVm6Xl0F70+ulM2KwWLzTotzUB443dTTDxEuxumV5Uv8lb
 7EpfiwsjAZj8zQZ374oeYtvD8+lGlZY4Rr0UyEgaklS4Jb22mklPqmsb9nVIwByTi/c3
 BRL3XNP3WrYHHI9Ph/GFmalMYfzQ+HEJ5cdgVCnreJqosuWOc9El4+gSIN+OyM7cx9t4
 TmCs8ztP3vYetZslYd9e2+f7yeaMoyPB+hFfcnlOtqArngVOnqEuVewOdoUrLtyQiWF2
 WJL1RWODYSHa+CYwtGnQ3wEfkK1wcdXKO8Epq7Ksvs8EGgHmjf64nyYrjrw08hysxDuV
 ittA==
X-Gm-Message-State: AO0yUKVm7CgqvGwXXt1U8K/5eKrTn2TtIDUEgF2dJmOTnMUliOT4YXjP
 h/+s9FRjrr6SyuKdqL2ubZeS7KfdS7S2zrU6
X-Google-Smtp-Source: AK7set/KkflpZYSTuQ5NzDLoJ/fOmND9BXl4fME85ePZkUFngGG8xVyWwKh+aB/qmKtvsu/OC74VtQ==
X-Received: by 2002:a17:90b:3ec3:b0:22c:1920:27e5 with SMTP id
 rm3-20020a17090b3ec300b0022c192027e5mr11015951pjb.41.1675115382179; 
 Mon, 30 Jan 2023 13:49:42 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v6 33/36] target/s390x: Implement CC_OP_NZ in gen_op_calc_cc
Date: Mon, 30 Jan 2023 11:48:41 -1000
Message-Id: <20230130214844.1158612-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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


