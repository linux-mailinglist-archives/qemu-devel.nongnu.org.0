Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AD2663146
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:19:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRp-00038Z-Iv; Mon, 09 Jan 2023 15:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRm-00035x-Sd
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:42 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRl-0007Z3-Fj
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:42 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso14033461pjt.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tP7Xom2Zt041mpQlzbnt0w/L44IFCyA/KWlistDO3Do=;
 b=mByDq8hwLU3Om3nGJt25BUZN6UySoAtTpuy7mrshYYd6K0DgW06OWnw6hz45jx1qak
 3JEWxlpIz/+aN25vHtk/DBB8FN5mmdnjvgVI+jL6vzflVpdwE452E69MwYWT4Gc+JaVh
 0sT052tArgDTzyUCix1UNffFQoNkyHOhXMNzKs+QZ+Ym94de96S2LYNKGiFrTiVJC5qk
 BNHR1DRMH0k7vXbipLMnkrqgVwVwul7goqQTDldGlQNG63615Imivj605gDudWqMxOCt
 SwZZHQI1sqdD6fIzgSHuaTkT7TCuukyTRznjVAvwXUwm9F6sZUG7M+CamZMS4VwPofEW
 zn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tP7Xom2Zt041mpQlzbnt0w/L44IFCyA/KWlistDO3Do=;
 b=R8dhLWGz9d9xXAoZLjdJ8IdHy5J/RoOCiPOV6uO1ELe+5oZsV5UpmOHwnhTX/eug6R
 jcDWfdHFLACc1/Bp1TrFAq+UtqSyRKbNOlPXM9NvFCPlKegljVjJAS4buBoqytkfMfy2
 tiIrQaflRLZGBP8qQLYpxv2SYOkiS1vTng/s91qDH+rScnm4X8J+wmnyn5z+IzUmfAgE
 60wlJ4rHUMeT/+JXWE4OZEXOgT31aDzXf+XXVJXQjl6zfKHLU72JntQKfj82fdME45Jv
 LvZN94nlSeRbCX91i1PlJfmHGnFhrUyBZryjcogoyDSf9KFs0CyLdeA1qsOYg2UwR6H+
 kW5g==
X-Gm-Message-State: AFqh2ko3OYfftZN+oet3ZV2gW8r7HS/FRa8igIIRQRvdMebZLTPW90IX
 zA1e7ehuwETAm7ztu6bUCDJ7P9/9T1ZVSfY9
X-Google-Smtp-Source: AMrXdXtxE1GDDgw3JOyCNBb5ZiGw/o0ekKW+Y9i9nHRI98IzPiYNCdAtK0br4u/6/Az204ha/hH1bw==
X-Received: by 2002:a17:90a:7605:b0:227:22d1:5947 with SMTP id
 s5-20020a17090a760500b0022722d15947mr2399460pjk.45.1673294919748; 
 Mon, 09 Jan 2023 12:08:39 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 16/27] target/s390x: Don't set gbea for user-only
Date: Mon,  9 Jan 2023 12:08:08 -0800
Message-Id: <20230109200819.3916395-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

The rest of the per_* functions have this ifdef;
this one seemed to be missing.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 56e1259dc6..b84b0062ca 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -384,7 +384,9 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
 
 static void per_breaking_event(DisasContext *s)
 {
+#ifndef CONFIG_USER_ONLY
     gen_psw_addr_disp(s, gbea, 0);
+#endif
 }
 
 static void update_cc_op(DisasContext *s)
-- 
2.34.1


