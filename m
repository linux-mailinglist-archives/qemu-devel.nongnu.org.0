Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C415EA919
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:53:29 +0200 (CEST)
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpU8-0004tp-24
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR9-0004yG-Dn
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR7-00071M-Ic
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id s14so10399089wro.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cS3jqtNeBvP7+F+7NCFAohEwzN43BVIK74CXYaHgJwE=;
 b=O+MS+kXG4f0E4AvG4olV1/yEZe/uDbWZqeCw5FV0vPiyygFzBLYPXBiAC1kNZ6ANW9
 AjPvgZPINXTBSEwB6BmF1CwU6k9UKQL63vGi0giJYXvEv3EWxoDxebpByGUmmpPa5IfF
 Uy2mimGfqfN5vTah4M5byw+Dfj0pFtUkM1zgYXZvSaQtOPWYn1gq6mlkyOgk/yqsRdE4
 b71UT143An1aipTlAW/TFjXQhEpFzkZ670Ys4wH5W5wxSff+Gg6WLeQySHVGKe1hVGF+
 ka6AvXVO2aFXGO5GrmvemJ1JS/MY6BT26bZC4ymouUXZ/ZtOr4noVti49sMbva9uuC1Y
 BvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cS3jqtNeBvP7+F+7NCFAohEwzN43BVIK74CXYaHgJwE=;
 b=FG+3FJu+LRqZgTvq5k8GHAdnYbs52iDJUVlDsgU1CrgN9sLWmx/KwH3LLfZLFA7RmP
 m+Pv/kpdhMdDxNM9NdXZB9tH2QAM00tmXIufI6c5ZXiuOyA9sU4AgjK6V6wbQa60WlCg
 pwD0CNf3+b8684KnbIWgOkcvT/AdaySaoHmuTIl8eA9rSfsObiksMaoxQF1vyQkTMkp9
 n+FhgefgaipAv3fzhfrMAk1LRhoqdLgJDSb44MuCSPqrLcYv7MnK2v2FWHmn/jQOupzu
 McdumH+PQCSxNHmlJu9Xgh7zhhXiqm3XQiiuIt8DJUrnREArGy0/0GdwcVi6rNrc6HKY
 w/tA==
X-Gm-Message-State: ACrzQf25foquPh4KcVwMtgw9B9IO1n3yG21r0RIA0TnlL5It79LJg2c7
 MUTRawMZAAtp3NBtZgcKKBJF8DvddKCR8g==
X-Google-Smtp-Source: AMsMyM5YIZjd+ay53Xz87IGYzktRGTdJqZi1FF5Upvpubq5Lw6UMTccFYt9CIvRIl2J2ZcAxKQxlwA==
X-Received: by 2002:a05:6000:1861:b0:22a:bb41:886d with SMTP id
 d1-20020a056000186100b0022abb41886dmr13350252wri.661.1664199976171; 
 Mon, 26 Sep 2022 06:46:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bv4-20020a0560001f0400b00228d6bc8450sm15874359wrb.108.2022.09.26.06.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:46:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8669A1FFBD;
 Mon, 26 Sep 2022 14:46:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH  v1 5/7] contrib/gitdm: add ISCAS to the academics group
Date: Mon, 26 Sep 2022 14:46:07 +0100
Message-Id: <20220926134609.3301945-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926134609.3301945-1-alex.bennee@linaro.org>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

The English website (http://english.is.cas.cn/) in on a slightly
different domain but has the same logo as http://www.iscas.ac.cn/.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>
---
 contrib/gitdm/group-map-academics | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/gitdm/group-map-academics b/contrib/gitdm/group-map-academics
index 44745ca85b..877a11e69b 100644
--- a/contrib/gitdm/group-map-academics
+++ b/contrib/gitdm/group-map-academics
@@ -19,3 +19,6 @@ edu.cn
 
 # Boston University
 bu.edu
+
+# Institute of Software Chinese Academy of Sciences
+iscas.ac.cn
-- 
2.34.1


