Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A95367A5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:46:29 +0200 (CEST)
Received: from localhost ([::1]:41928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufun-0008Ti-0B
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecT-0003jV-3y
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004Ul-Mq
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:28 -0400
Received: by mail-pf1-x435.google.com with SMTP id bo5so4999869pfb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PyluT6inHqv6Zl3kXLrQsZnM77T6sYeGqwfjZJp9s3k=;
 b=lPaTkLFtxrRye6OvJnUjeY+q/a4WCIGEbmPaqlCFmMUFUMEY/kMCFtUgcrCIA/I6sp
 k3sqLyEO+yLuMbs9tNyz+NtjnW44yCIHEO1OiGQGoQNbdyQjBz5r514rCG10vj9kSVm+
 6kPy5A1zSzDgZuJI0IGsrLVAgJgRZe7uUOykgASQalPcil4iijscgdKlSgvW6sIWcQdK
 lOqUKQt3hMDS2lIbXOuoLG5NtRd1FtQ87NLf30vuE5eRwrx2Qg2NnhORFFXrUimfct0d
 ZLN7XrC5sWyhRDR5hn0i7ht76tM9Ao9U8p9V7W71egGq5M6b1XhoWuJbGKduJ0/nfszM
 UUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PyluT6inHqv6Zl3kXLrQsZnM77T6sYeGqwfjZJp9s3k=;
 b=7H6k16VTzFYioc6l7TeXNVawhgPVwemhRuYn6blfCW9raevGEegHKlqqEOBC7t46+8
 CQp/zlDRoeefm+DzeZW/p8B4wgvSHyKTQSbb4BWTswr7QIEt1dYE0qsJH1E1VCt4lsvB
 LgAlNkpHw9ZwEGo+FE6S+LObPq0bYU4Dr52UAre88I07CSs+aep1xGC5R/wvIbvfUaBe
 u8MuRN84LYH6XP9BJKTWIR/u7ywUCdgrdxXJPV44dUxWmTvrIt2Nlc1F+fCDlsz6J3Sa
 h0jAyBRpLwgBXFvWvYv9tOzJgtSkaVwd4o3j3DA5sHelkbDzijnswFwPZStHpWo8VhlT
 QFJQ==
X-Gm-Message-State: AOAM533C6UflPZXpAJf1deuCMjd5fYdRyZfhTixRH59xEvkeBh8x+AIA
 n6iil8O91shQ/n5LgS8NRXisyH74O1FHZw==
X-Google-Smtp-Source: ABdhPJyhLZvwteaO+gaP5dyDXEYgWfs3gHAipKWRbrxMc+6bBa+2Ab+qplFi92zcygHK8M2aFs9Chw==
X-Received: by 2002:a05:6a00:8c2:b0:510:98ac:96c9 with SMTP id
 s2-20020a056a0008c200b0051098ac96c9mr45008343pfu.18.1653675796749; 
 Fri, 27 May 2022 11:23:16 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 074/114] target/arm: Use TRANS_FEAT for ADD_zzi
Date: Fri, 27 May 2022 11:18:27 -0700
Message-Id: <20220527181907.189259-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 83980f5ee6..6b2f235e4a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3254,10 +3254,7 @@ static bool trans_DUP_i(DisasContext *s, arg_DUP_i *a)
     return true;
 }
 
-static bool trans_ADD_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return gen_gvec_fn_arg_zzi(s, tcg_gen_gvec_addi, a);
-}
+TRANS_FEAT(ADD_zzi, aa64_sve, gen_gvec_fn_arg_zzi, tcg_gen_gvec_addi, a)
 
 static bool trans_SUB_zzi(DisasContext *s, arg_rri_esz *a)
 {
-- 
2.34.1


