Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A23D3E3E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:11:36 +0200 (CEST)
Received: from localhost ([::1]:56424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yhz-0006Jm-P4
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybR-0001Az-Ie
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybQ-0005hJ-14
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so3911360wmh.3
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qR3NWABVW0+Wr5FOyZVCMscu1HpiGKS3MKXHGh9X5Rs=;
 b=aCYauQwRtKybSRMbmTJFS9IIR0huBvLRPZibxzxKVcsLwSidaor8PhhmlHOYDUpvKg
 ZUqXro6i620mJjaTiswb7ciBmPlMcMFw2ZDzLhNBZrt5v8X/9r9RNsTl2gRgckBwHgQ+
 HICUgiOqTxZUEVu3cK0c1QRH298+5JTAkCagqv2NNBrQhHr5AwnodXtWyVoYunzRoFUB
 3U/8+NGLw1IVa3cSLp6n60t5T7wNxJ2Hqo1C06uiLMKoBhyRdNDj787AJScgeCINd7pj
 xeoH5eEzuyUScNY4Ebtu3mPwILFEwHAcdoZ13lehM52ubXWtq0yD4Df2gndL5r+xU+7i
 nXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qR3NWABVW0+Wr5FOyZVCMscu1HpiGKS3MKXHGh9X5Rs=;
 b=IC3lngpkmkve5SZiyWj572VE3exmW7fZeo5M9ZSqYwUmyH44aYe/gCZ8P4kiyjU/Bd
 0tdQkIBZrWiQhn8Onk9v6GwfgMFoCHiwrkxv15nmjJX6KwhfjUrajIBhwzKzcFC+6RJ3
 MtwrZxzYEiccYOaM8/OFPRmEr9nNdcvci40cXmztRRt613d8YBlajENvguESbdExBhyJ
 7OYBAw+KvYlo0/XbC2SE8tyPvyrk/83hDW+7L+D7Iz1uRGwPLIIqKVEdBkVUmgxKjChY
 HZwavdcu7JPEy+qAKqqWh1SSNkM7m52SBCTPcSNOJaxRTq/x9E0WEZnd5+OnVU7MtcQZ
 KuBQ==
X-Gm-Message-State: AOAM530EBnwzsqzS03+CZIZAi9K36TOJfhMoFOYdXiA5ySnEgKi/hy42
 QDztsmJeS3WSbHFZ1FlHZ5IYaw==
X-Google-Smtp-Source: ABdhPJxmRe3PeyMozZl0bGR3JJdhQXFs00EZx9kz7yFXBC7duBd1e6kHgz/9k8D5hsJPuUFRwjIN0A==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr5419137wml.59.1627059886626; 
 Fri, 23 Jul 2021 10:04:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c15sm27855055wmr.28.2021.07.23.10.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EAF2C1FFA9;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 19/28] contrib/gitdm: add more individual contributor entries.
Date: Fri, 23 Jul 2021 18:03:45 +0100
Message-Id: <20210723170354.18975-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Chetan Pant <chetan4windows@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also ensure Li's canonical gmail address is used.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Li Qiang <liq3ea@gmail.com>
Acked-by: Chetan Pant <chetan4windows@gmail.com>
Acked-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210720232703.10650-20-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
index c6ed215e68..4792413ce7 100644
--- a/contrib/gitdm/aliases
+++ b/contrib/gitdm/aliases
@@ -31,6 +31,9 @@ pbrook@c046a42c-6fe2-441c-8c8c-71466251a162 paul@codesourcery.com
 ths@c046a42c-6fe2-441c-8c8c-71466251a162 ths@networkno.de
 malc@c046a42c-6fe2-441c-8c8c-71466251a162 av1474@comtv.ru
 
+# canonical emails
+liq3ea@163.com liq3ea@gmail.com
+
 # some broken tags
 yuval.shaia.ml.gmail.com yuval.shaia.ml@gmail.com
 
diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 9b6406e624..f816aa8770 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -31,3 +31,6 @@ jhogan@kernel.org
 atar4qemu@gmail.com
 minwoo.im.dev@gmail.com
 bmeng.cn@gmail.com
+liq3ea@gmail.com
+chetan4windows@gmail.com
+akihiko.odaki@gmail.com
-- 
2.20.1


