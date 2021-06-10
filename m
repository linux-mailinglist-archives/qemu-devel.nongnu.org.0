Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7573A311B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:42:56 +0200 (CEST)
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNlf-0005nh-RI
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrNk5-0004GZ-DS
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:41:17 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrNk2-0008Et-DG
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:41:17 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so4090114pjs.2
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3o0KyUUlkHaNu6gO8VXfkzuymn7M2f2zy7YObLnIp5s=;
 b=Cpp0W8Yylhkt+yom9X8vrhtCQL9JZAuyUozXZjrJ/6k70i/7ph8L9CEBQHYGv/bHDP
 93OiQionbET21txaum+jnt0/67i9qt0Q1bwi0oQVW/OI/d8dTj2I226RZQtawaCIEgkE
 9aiKgivs+w1fnm9iCsjXZ6lWXTtppiyT9hI4MMtwfDlbKnuppBwIvrtRvDl+EgzJz06T
 CpU2On3L3CFagj5TnDP43wXJkP958UnQgT3xqMR++1YTa/SItJpxuBwv6NKx2ewOJYmk
 one3fbKm9jz/BMmWtxmiaf7OvIYuPouDpBCmWr5Yr9mogkGJLX2HTr4KKuG41oQ8MPib
 rxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3o0KyUUlkHaNu6gO8VXfkzuymn7M2f2zy7YObLnIp5s=;
 b=o+QlEqKpZiuNWYPY1Jdj2NJAsbd8ZyaK4NCwToc9Cqx2eYpGbrZ+MDc/UhARiE+b3y
 sQie2sb2wm3q9BUAjIg3/zvp3yPPF82ZW/TiEjT7ezduc+ViUOrRmYVAL7yh+0pr6jHy
 kp/xZATeABT5pKOUP7Ucczynoh+BJuWeXt7D/bkHNxZQTaNBrlfNO+E8z6MXLGZOGPd/
 FX1c2WE7n0H5p4cRFmneTDxyo0dJQq6XEsseyYOCW0ugXDlgNHJWeqe/cQ6aQx4ev/Pj
 yhvHp24KZ0dTFP6O0Wqzy0YQnUGA3LMdOT3mOK6W9/I3h0OHsrUJI3Vz1+XOiUkuAagA
 LJ+A==
X-Gm-Message-State: AOAM532M85I6zF+KoNR34trto6ozbeTqFQkCGnOFK+vGuKy15lGecSx1
 9cCMlIh2w130nhC1AL2SqoTKqEUBMsc7yw==
X-Google-Smtp-Source: ABdhPJxEgB0/L7HdoS8TnPVE3es3WSnG9ZUA5mn/Xt8738vVOXWMkayjpceAx/zV+nohEOFD4pmw+w==
X-Received: by 2002:a17:902:d4c8:b029:102:715b:e3a5 with SMTP id
 o8-20020a170902d4c8b0290102715be3a5mr5580393plg.83.1623343272552; 
 Thu, 10 Jun 2021 09:41:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id 92sm5162482pjv.29.2021.06.10.09.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:41:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Fix documentation for tcg_constant_* vs tcg_temp_free_*
Date: Thu, 10 Jun 2021 09:41:11 -0700
Message-Id: <20210610164111.233902-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At some point during the development of tcg_constant_*, I changed
my mind about whether such temps should be able to be passed to
tcg_temp_free_*.  The final version committed allows this, but the
commentary was not updated to match.

Fixes: c0522136adf
Reported-by: Peter Maydell <peter.maydell@linaro.org>
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


