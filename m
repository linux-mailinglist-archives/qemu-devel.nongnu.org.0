Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9FA5EA80B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:12:01 +0200 (CEST)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoq0-0004XP-TE
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR9-0004zX-RD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR7-000718-U2
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r133-20020a1c448b000000b003b494ffc00bso7566403wma.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jAtsRWHClbBcl4QfmGwx5Q+/sTundP2Bdpl7GO4sfLo=;
 b=ehpEI5eHr8YapkvfhPaxg+ndCp7hB5mNBJL/IGjBza1MeMuh+eON3gqaWFCJgSFd9L
 vTHby0HzS7kPVK2o0afO8209xhzj6YcpGrXQGss/IGF5ngFwe4AOAdv+9V1J5A0vbV37
 4w4IYr+9usZ0Vzu0kgS8xdvmqijirAVdUj54FejiUbaJX6/KGCwyrQO5FX7ZQIxrL6kI
 FmC/pZ+EzBCF0sckgHVngsjOVse8YIvY+qbEVSKVxhZVQceZcU7X6R2Y8NrHE6AqBkk4
 S5NeEZMeYTRpWWEeGisAPJ7SY8rVZuaKqCuIRXy4MX2qOTTXHLwzYDcBiUrUmFiyopsz
 Fp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jAtsRWHClbBcl4QfmGwx5Q+/sTundP2Bdpl7GO4sfLo=;
 b=s5yjE25Ob8QiSTPTyPvF7lc9FYL9dDfr/QWdzxfAx5kcaUx8j6pCORc67cgmcDQWID
 mKtnb0Pj6vm2nZ6qz/g+Dx7J5j+JsvoFcOJERp7pX3PM8kJSyM+5C7xQ1FK5/WLSiPHM
 0fKtMxNmre5B+ad2hS5PX3gOYCzdsXviwje1HqyB6BNwTMWMLg7wrEtKev8u1T1RC4Ez
 QO8HHEsCeOkd6Pm0JvvPj8LB5LRv8Yg/gwM0DGoMpjvi8wL3cP4Lysh9URYsKU+5NSE3
 4AJ6RUlt4xrsBJWlcglYTPa3Coi51Bf3CNDtZiXBDHvLZTJG5CDqSnH/YGrtqNEDTG5e
 vXmg==
X-Gm-Message-State: ACrzQf0Pv3TToM4Whvr+Ynr94qAKyeOa8NSvI30q227Vs4gA9INBNgmV
 mA0/hNyQHbVrYTlLH0vZFsSySu73CLSSpw==
X-Google-Smtp-Source: AMsMyM4VfCn7kaVhOTugVBYTvvZsTmpwuSriNpeQ49DFPWzTZScEoY0+43h4J1YCkhB5e85ptW5Bvg==
X-Received: by 2002:a05:600c:4f07:b0:3b4:a5d1:1fea with SMTP id
 l7-20020a05600c4f0700b003b4a5d11feamr15470804wmq.103.1664199977224; 
 Mon, 26 Sep 2022 06:46:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c050a00b003b4a68645e9sm11047665wmc.34.2022.09.26.06.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:46:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0B431FFBF;
 Mon, 26 Sep 2022 14:46:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [PATCH  v1 7/7] contrib/gitdm: add China Telecom to the domain map
Date: Mon, 26 Sep 2022 14:46:09 +0100
Message-Id: <20220926134609.3301945-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926134609.3301945-1-alex.bennee@linaro.org>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Please confirm if this is a corporate contribution account.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 434ef53afc..3727918641 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -10,6 +10,7 @@ bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
 crudebyte.com   Crudebyte
+chinatelecom.cn China Telecom
 eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
-- 
2.34.1


