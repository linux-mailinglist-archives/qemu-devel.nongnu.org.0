Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6888953BB75
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:15:53 +0200 (CEST)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwmYC-00039B-4M
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmVo-0000JF-L8
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:13:24 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmVl-0006CV-WD
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:13:24 -0400
Received: by mail-pg1-x52a.google.com with SMTP id y187so5012554pgd.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pUmdC3xdEpG3uLAArNyfZRtGFvPgvzahQwuoK5N5fKU=;
 b=HLvCvSogigM1pnqBze7MNbTZOFqJnMnf+BK8LeqmiWzfM3blhx5gGuYBKNjCNSUReY
 XdEdyO4mw9Ahm0bgFIvtLYdCUvRI784C+GGW9VtBG+fuzorGn65TDVEcACD8F7JNQhN8
 jnwcbwd72Sn/8WxZC6IqLe9JcTnm9FyRLiES/DIh03twG77oD5rttPD7nmfk1cH7Drua
 aupp5uZoUvk4n0ds9zYWjqVhcH5YQer14pq0lCnEZvn4BER2mDIo1aCPXpxUfixzwGER
 TcyQRY9idgsoScwT37Qq1ux6HfIOMoxybdKSo8ByvBKuPQ4qF/SK2uPw91TO+K77IVfh
 lcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pUmdC3xdEpG3uLAArNyfZRtGFvPgvzahQwuoK5N5fKU=;
 b=7dt02yF52WdgK1uZNHOKGY5GJNgodh4b2Gp21FQLvf5oaIQycn74vnx747XFswmr+A
 /6JC3O1WjvuniFUImxOAXH47xel4DCHSv3UtSr6hS3la3GWEzI3wkyW59BNaPlx8qKP2
 p2gGjVObYdRxpK90ZQpRIwPv/OEy7NuxEM6obHjaJyNF1TbgsQVC2Aoy31cs4xlW3p37
 9kNpnnhd5EyX/pn+f4uZh2UHUFfqYO2mX00YMsi8/t0hZXSRizbuS5JP+LUWrQWif98h
 VKQ6tdvzh9H/w/QytK7xls05ZWo9F7k+DdDe6Gs8RaMAUGcY/FGvIh6kht9bIUAbq0i6
 AwDw==
X-Gm-Message-State: AOAM5321IBPGwCtMFMgWAbxmBQeHuCpwpV7O+R4ZsTJVwLoDSJXv1AZJ
 189hVU9nIeQ8W3Pk1hmZRhUymy1ReIjujoN2
X-Google-Smtp-Source: ABdhPJz0NvXc3+RDZqDpqCimyWpdOKaSQgpeWx9+RViX6c0212XewNQ4ZsNczkqaRC+Z2bkV5vtlFg==
X-Received: by 2002:a05:6a00:1690:b0:517:cc9e:3e2d with SMTP id
 k16-20020a056a00169000b00517cc9e3e2dmr5670986pfc.0.1654182800778; 
 Thu, 02 Jun 2022 08:13:20 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a170902820100b001618383483fsm3625159pln.224.2022.06.02.08.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 08:13:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>
Subject: [PULL 3/3] tcg/aarch64: Fix illegal insn from out-of-range shli
Date: Thu,  2 Jun 2022 08:13:12 -0700
Message-Id: <20220602151312.477967-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602151312.477967-1-richard.henderson@linaro.org>
References: <20220602151312.477967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The masking in tcg_out_shl was incorrect, producing an
illegal instruction, rather than merely unspecified results
for the out-of-range shift.

Tested-by: Joel Stanley <joel@jms.id.au>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1051
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 61e284bb5c..d997f7922a 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1261,7 +1261,7 @@ static inline void tcg_out_shl(TCGContext *s, TCGType ext,
 {
     int bits = ext ? 64 : 32;
     int max = bits - 1;
-    tcg_out_ubfm(s, ext, rd, rn, bits - (m & max), max - (m & max));
+    tcg_out_ubfm(s, ext, rd, rn, (bits - m) & max, (max - m) & max);
 }
 
 static inline void tcg_out_shr(TCGContext *s, TCGType ext,
-- 
2.34.1


