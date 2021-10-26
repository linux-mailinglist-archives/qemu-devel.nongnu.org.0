Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1556543BE31
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:53:49 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWGK-00021d-6C
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdO-0000Co-Bq
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:34 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdM-00037k-PI
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so642977pjb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQKY6BJo1TTNoM3ikIZAZY/KG7wYR8GP1IgW1gGuVbE=;
 b=D9bed8+Bv7QW750LuqHNFDCiWjMZj0S+E8wv7HNGm4J9paEgVhlMqtwe6TQkRIdP6A
 Saql+mILJGdNH0JoEQ7HyOqDcJzLZ29pyDq11A4xbQtNb5WKtp5reQ9iBGuA1qgDHPdk
 bKwrK06IaBdwjnJHumONWuGdTutH0/xlqlStXrEoJR7vgAG4zFVdlFfqdkFELxoliWQS
 QKsXuM/I31ajy1ovrBivtMNo7PRrWmYImm5opRPXYq0kAO4JgjDJBAcgQKPcCG7ParzG
 kW6izN0BifTTkWCGam/wiqqz8wvF4Q9dIg92x3H98dhuoqQj5G96vJmBCfodTXyV+syl
 ui9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQKY6BJo1TTNoM3ikIZAZY/KG7wYR8GP1IgW1gGuVbE=;
 b=NOMvGjR61sxQrnJlO4Vzs1aY9YZlxPwSHRmVi5abkeQMcfME7q+XTFB5lxtmza5EAK
 TS1Ym0fy+AiIyAzHUtTBYsoFNFpGtjK3EtMlevorhNIao57ntk2DJDuqraw+YoY89dNg
 g9PEQUlD+j8CrV3p+Yo+N3kqvRV9n6T+RLvT/HZtXFWFz9dFBcOmfJHHVit+It3TUO2Y
 Cvr1M0l3y0j3Rhf5Nq7L0NOwxAvlvHMLnY2vJCg5Nky/WbuUeima6DlWaD3o7+Hnfnd3
 RbRw8rLFcMMPv/cVIEPRPu5/nHphCTuCcx4KLwqvdEcgKgzVWrRnlJCMI4pPVGc8FHTP
 oxqw==
X-Gm-Message-State: AOAM531WkxHYJpgBHrhK8pRTV+rP0LVZ6hFCKRNcI/j6j+OsIDdVMWQd
 Amt0kIYKJuuUJZS9Qnnl52MK4g2O8Xinvg==
X-Google-Smtp-Source: ABdhPJyInjy9uM5PUsA/MP5JdxYE5GkLp9o3qqk1xJM/qUke7JiTf9mB36/pQEKgLsvOO/VeRdSUQA==
X-Received: by 2002:a17:90b:2246:: with SMTP id
 hk6mr1993031pjb.116.1635290011026; 
 Tue, 26 Oct 2021 16:13:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 49/51] tcg/optimize: Propagate sign info for setcond
Date: Tue, 26 Oct 2021 16:09:41 -0700
Message-Id: <20211026230943.1225890-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The result is either 0 or 1, which means that we have
a 2 bit signed result, and thus 62 bits of sign.
For clarity, use the smask_from_zmask function.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 311d9779f2..515087876c 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1729,6 +1729,7 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 }
 
@@ -1801,6 +1802,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 
  do_setcond_const:
-- 
2.25.1


