Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A4F6A6644
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCis-0004RS-Mt; Tue, 28 Feb 2023 22:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCia-0002VN-Lt
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:24 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiB-0004Ft-P4
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:01 -0500
Received: by mail-pl1-x635.google.com with SMTP id z2so12535781plf.12
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=bBxUtMWvoOqoTAEEEAuXTY1Q0d+PLEm+Bn0B+dqRBWMlEzdZHmTnR4sQLfFQ+CUgHB
 evyabu+LjQjFEgnHFdPB54LRAQja9vSi85YznnB5OW+2XmFM9duPBQMCpTjzXPwwXGHR
 X76YWZokaWsb+z76dmlftfcI4y/2IVodZwe9rS5CjWWzJTb05UE80N9FzBF4qJlj3aB/
 votrkmieQKk9B4gVc3FfGRpyeqNJrdJXYowQxfLeU3GNvMZJ/IWPjyPdfFSkiyBH1liu
 faTbOTjGwz/2vy2hf3QP/izPlgWqYHnoTFNu6vXq1Lo2e9669kAmYdHsUewbpImDKirL
 ehzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=kOcugQN6WjMDBrhqWTd8SgsiBmkaJYouPTo0Gl+L2XpPz/SKMJV+fY0zxp6ljHkPS3
 48iDe1G8jbP7Mlu2CC8Xqr/cmSo+b2dNahbIMFZ3D+gXnlf7w3v/75XW3cfoNGHtTXZK
 PqF2m9mmqrFaEFjB/rr9oc+ujWAUw8ptTS+mEKKhdRgb0sjLeS+KZsP9NyDBiQ2O2xnW
 atg7mBAl0t0wyT3VXCPtB4SsqjKbFN7kK+05ZOKZvuLsD+DIE23kWvqFeK1FK23NoJWT
 VYFVJYemYQqxeEartjvOCedHfZaqrYdmEtEoXmcMCsu27c0zEPsHl5oKGMx1kbuzBVZu
 kuTQ==
X-Gm-Message-State: AO0yUKVnix6wjJy6d7xD4JoJ2be9UwWAqardXT7tvCFxKoXo2thLftEv
 0JZzUOvnqLfxIMSsrcMsRaXMLyBIu5yEOCwOhxk=
X-Google-Smtp-Source: AK7set/ktQUbw2j0rMuqv2slkPJxCaNf2fHa3GrV2TQfwwQhjSY88CuQ+qZzHk95CzP1OVGWDtFA1Q==
X-Received: by 2002:a17:902:ce8f:b0:19a:9434:af30 with SMTP id
 f15-20020a170902ce8f00b0019a9434af30mr6397696plg.18.1677639658450; 
 Tue, 28 Feb 2023 19:00:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:00:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 42/62] tcg: Add tcg_gen_movi_ptr
Date: Tue, 28 Feb 2023 16:56:23 -1000
Message-Id: <20230301025643.1227244-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 839d91c0c7..66b1461caa 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1285,6 +1285,11 @@ static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
     glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
 }
 
+static inline void tcg_gen_movi_ptr(TCGv_ptr d, intptr_t s)
+{
+    glue(tcg_gen_movi_,PTR)((NAT)d, s);
+}
+
 static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
                                        intptr_t b, TCGLabel *label)
 {
-- 
2.34.1


