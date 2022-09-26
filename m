Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61275EA7D1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:00:30 +0200 (CEST)
Received: from localhost ([::1]:37894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoer-0004ZN-Pt
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR6-0004sE-Qq
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:17 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR3-00070g-PM
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so3761245wmq.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rpfkmbKEH6QlU3adiBpPpIjfW0vEmzzTNbXqzAT/+Mw=;
 b=JO0MQPkNuOrRmcakdwtAZs61oIvIKiyTI8mB4Ud/VDq874kTU1bKwGwC0d7QiXv+SK
 i6ApTwBs2akblt0+FnfA/5rB4doTatLEQv25AQOukvLKIOYf4FGmpansxFniFlFhakCP
 Py+FxcBLDIRgY05XhwCu/b4fTQ6CCdIOx3z7Xfj/xiWu2bl9DpIwkrg0C2r5IoliosNY
 WyCI1rmr3kco//IyY5+oN/aieCNYUVVlo7WmC7LeY5o40YQGeCeHantcTytjy5tB2dQa
 QeUYU/Eibp9fregGUbH1f9xYEp+YI/i9eAa3/jmDgGuThhbvPkPqxYQcujNweGkj4cjZ
 ky3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rpfkmbKEH6QlU3adiBpPpIjfW0vEmzzTNbXqzAT/+Mw=;
 b=31AIl9OU8o3/bNiB9O8GDUBpc6s/wz5Xs6scIV8p0xGTM0Ilnv5uVxgDUr+0SqyzIY
 ZHcWTyq94QAJSvWTsJEijA7v13GCqKDVtSKQBqI76qCP/82ZAQtCAd0DkVnIcMe6rzHw
 Dx7n91X91HKr057x7moKQY/zf9f2V6SdUVCkZuZ1kQ1p7+txd4BS3dB+J3HZE14kmoVJ
 VSbc8V7je0Quhv9Xt57TQpCxyYnfbxCd0QQHg1wFGBtA2hD6ubnqMDxBzUfNumGudayU
 /rHFF98zpDDri76GGhg6RP23c/yY8axBY4hGEHYAYHq8wE/zN3Oqwxx/AzFRynHh16VO
 S4DA==
X-Gm-Message-State: ACrzQf1XVSr0RVJZYt6nTDTZqh/MhL6T++USYzHnVmO5nHO37zrLhsdC
 AbfJltJaLZvHfHRu3szFXXQOJA==
X-Google-Smtp-Source: AMsMyM5it3AGrF/0BpAhDjqCadgLKLH+LN5X8pE1F7gDuh2FV7SG/FrlElbnGEFJpq76TvEFfWJl/A==
X-Received: by 2002:a05:600c:34c2:b0:3b4:76f2:9c3b with SMTP id
 d2-20020a05600c34c200b003b476f29c3bmr21573201wmq.179.1664199972100; 
 Mon, 26 Sep 2022 06:46:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bn27-20020a056000061b00b0022762b0e2a2sm15661447wrb.6.2022.09.26.06.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:46:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44A771FFBA;
 Mon, 26 Sep 2022 14:46:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH  v1 2/7] contrib/gitdm: add mapping for Loongson Technology
Date: Mon, 26 Sep 2022 14:46:04 +0100
Message-Id: <20220926134609.3301945-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926134609.3301945-1-alex.bennee@linaro.org>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Please confirm you are happy with this mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 2800d9f986..434ef53afc 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -19,6 +19,7 @@ ibm.com         IBM
 igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
+loongson.cn     Loongson Technology
 lwn.net         LWN
 microsoft.com   Microsoft
 mvista.com      MontaVista
-- 
2.34.1


