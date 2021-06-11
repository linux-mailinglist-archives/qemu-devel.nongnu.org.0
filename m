Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D63A4B68
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:49:19 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqtr-0008Rf-04
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmv-00036f-Su
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:10 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqms-0002mj-BA
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:09 -0400
Received: by mail-pf1-x432.google.com with SMTP id h12so5700133pfe.2
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DEGK7taWTLgaAQxBCsJBdKV8XPOvsryzrwUIPNhMs30=;
 b=RDS9NXO3+DcqOqnv2DsN5MNdOijH1reVjSyDyGV8MktpCEEGOPAwucFlVtC19IDmAW
 FL1sl2e1JhDY7W0DXQ9sGKIpjP6+E6DektVlBkeCCJwbDCh9befju9zMSA1a4p2jtwHy
 0iwnUOLaRvWubB1t9eMjxYGTOBBBkhGsECQQK6d0mCl9dobr2dIqIwPmyNuzrPpM5YXX
 dft3jLUr2V72/4Wc40pCZV6Y2F7LRGS+8+TGWyDc3Tv89GTl0OljILyWMxeQ/hn79oxv
 x8nOMBA5tO+vwrRe7XoEaC1m28A6LGKyTZukcDkOVkRVi5xxDiHj/mQM/Ds/9c2pmtqF
 zpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DEGK7taWTLgaAQxBCsJBdKV8XPOvsryzrwUIPNhMs30=;
 b=a2epc9UG0VfUH4WQYr4puLGrn+OJ4CPO8oo4b8pfPlzSQLKMjJBab3u9tI0QphWjZx
 HcpXwFxd/ECEuQPdeqym6Qb3MB3Hq6DmmracXRdAQrnVb6UrHMW9T3/m6Hgexcbzikxl
 Vyzc5amz16ztmqrQ75xozIQWvtAOjGwxlSl/NUKZEQ95jRSxc3yxDgyEKQuv7FlXK0yq
 eCswplFePXf000+B6w0YGl3rvBwjscDFcVyiBCyAXFNu0ma2QY5F4cMdet/6I2WdhB0M
 vCPh+J1BKLdwcbyJFLsuiZYDiaG6wPYnGxDhlO+FlyJYFv+DrHvdLGVO/yedxa9n3Nbd
 BScw==
X-Gm-Message-State: AOAM532g/dpgIkxGYPEnoTB6EX4Af4AfpwWSg+VOdUTtj1BoSfJ92zjw
 lrm3+PWHFyTie/P5+5mL9QprZykRzB6rxA==
X-Google-Smtp-Source: ABdhPJzwKqtshEhhB2FKzA13ddWLxNnGtObVE7eWS8aAD8pVQrU0Xad1qxMBoQ9Rc+T7rh/EnVkiRA==
X-Received: by 2002:a65:64c8:: with SMTP id t8mr5969601pgv.96.1623454924415;
 Fri, 11 Jun 2021 16:42:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:42:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/34] tcg: Fix documentation for tcg_constant_* vs
 tcg_temp_free_*
Date: Fri, 11 Jun 2021 16:41:41 -0700
Message-Id: <20210611234144.653682-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At some point during the development of tcg_constant_*, I changed
my mind about whether such temps should be able to be passed to
tcg_temp_free_*.  The final version committed allows this, but the
commentary was not updated to match.

Fixes: c0522136adf
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 1d056ed0ed..064dab383b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1095,7 +1095,8 @@ TCGv_vec tcg_const_ones_vec_matching(TCGv_vec);
 
 /*
  * Locate or create a read-only temporary that is a constant.
- * This kind of temporary need not and should not be freed.
+ * This kind of temporary need not be freed, but for convenience
+ * will be silently ignored by tcg_temp_free_*.
  */
 TCGTemp *tcg_constant_internal(TCGType type, int64_t val);
 
-- 
2.25.1


