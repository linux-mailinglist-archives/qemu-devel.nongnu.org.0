Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213585EA7E3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:06:13 +0200 (CEST)
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocokN-0007k8-Vd
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR4-0004s5-0n
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR2-00070I-6g
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id r7so10344990wrm.2
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CTldvCQaKxwlLmL8A/sQx1/5TyEmeWoxuOgRVNbsy34=;
 b=tD5WkY8dke6IBnm+GSjw4egFxpw/Q4ghuIs3AiM6ND/0rpseNfOKHlOp9KMNyHEWa/
 MGzUUkYwxEXWP8Xym9qAnP9gmwlpHAXnTvWiPs1baoLX+u5aX6oQ9X8uBmYoMEvK/IHg
 6/BsNq7VQgWZGP654sjiP/Y5veaM46QL7RwbEVsOESVAmKbUnA3jOSNQp4f0vQFkRv8/
 d3zpHsIO50fPmERZ2PuY6ggXXLadyrC4TdXKfVgRJ/4Gkw/3bmH1xrNdwNgsvqsTg/cP
 aUoUtf8hy96gbjXCYL4LcrVXpCbqvwYJcLkj2NRRT7CBudHs3Rx3QnCXxAM/9ob9fp31
 dN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CTldvCQaKxwlLmL8A/sQx1/5TyEmeWoxuOgRVNbsy34=;
 b=J2bD9X5+meFpXngM5Ov9QJ8Wb0Y4lVaL6Q3Z2U7GttLZyfSgHgZuWX2w2KEX9VCF1Q
 QpHd4i6PJ3/3GGIQfKJ300BCoWs2H/jif6wUglsM7H2uvXiPoEc0XuNikSHqf3wCSLw8
 LMjoWvYbKIFsYp1RyTwfWuAc2DVz+hCvbJfHSgYqOfngXPBUueAmXw4hj5GiPlHFu7OA
 VaOok7Ox0b8P0nyXDAEAqA1rjCDRpNNGAn4XY+LcfKW7dQKhqnrQRHc3xbj5KcBxaNzQ
 HTg+MpbAm4bgEDOTtpDVDWPRChRyyclmZhRQcUPTTE7u7dJHeTfg1XDXJzi4vslPgorr
 LDcg==
X-Gm-Message-State: ACrzQf3FdcbubKLTRH9LvDnrY2aHCrkg3bVe3etpY67uIILbS3X8G4bj
 auXyTGTJZqagtQfbuFlq22lVyw==
X-Google-Smtp-Source: AMsMyM4nvUUUwsmgSb0d54BYIsQC3WXPpDIno8L33qEnL+qg30GICq0QtK/GodJkAL79/E58dZfXnA==
X-Received: by 2002:a5d:4bc3:0:b0:22a:4b7a:6f60 with SMTP id
 l3-20020a5d4bc3000000b0022a4b7a6f60mr13407294wrt.549.1664199970648; 
 Mon, 26 Sep 2022 06:46:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b00223b8168b15sm14201965wrw.66.2022.09.26.06.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:46:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F5C21FFB8;
 Mon, 26 Sep 2022 14:46:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Safar <simon@simonsafar.com>
Subject: [PATCH  v1 1/7] contrib/gitdm: add Simon to individual contributors
Date: Mon, 26 Sep 2022 14:46:03 +0100
Message-Id: <20220926134609.3301945-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926134609.3301945-1-alex.bennee@linaro.org>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

Please confirm this is the correct mapping for you.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Simon Safar <simon@simonsafar.com>
---
 contrib/gitdm/group-map-individuals | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index f816aa8770..d5b05041bc 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -34,3 +34,4 @@ bmeng.cn@gmail.com
 liq3ea@gmail.com
 chetan4windows@gmail.com
 akihiko.odaki@gmail.com
+simon@simonsafar.com
-- 
2.34.1


