Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DDA571724
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:20:41 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBD0S-0003bg-KW
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCfm-00069g-Pj
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:59:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCfl-0001IG-4N
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:59:18 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso7438202pjk.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 02:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8D+naDWZLCHEn9jSH25u5UsvgNBDEBh2df0ljLbC5x8=;
 b=u4e0Hv5Kg7MBRAfCMuwYwV0TjTaxj53Un2ahbzBKCHsEQe4MF5tYlIRBkoMJdCVCkh
 RWDhliFxYrOWgnb4FhY6pzUP6SQiaG3fSIMeSZFckB/U/YpWCwwrRteVHYaAA2XY0Tlp
 KCPOUPHq2fYxRef/oGsOZIYdZCHKKAegBwrAa88Au8zM1oAnnhSHAmgYHnEaEdqAs28V
 C+P65f6OOsCpIMJICHXL+KUTqzlYHEMVhJ+EXTZhb94kBAwgjPUKrob3ryMbJRv83hhC
 8HslKdsvqb6cqCrZFMuuPaCogVj6xh2V4fl/w9PkNqOrCvRecGmayX3LdHFEFU9UJR6O
 CsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8D+naDWZLCHEn9jSH25u5UsvgNBDEBh2df0ljLbC5x8=;
 b=BPgzdvQVucNYacHleNPjTHOAtZy87ujwF76PcDqlIKAzAyTlex+h0a01gYkL1937ZT
 SjLaEo2/kl0ZxABc7lQAqXLlyO8Dwp1fMU2bAwSPXqy9zH7pFfGFSMJlKqWMk/BTvq/q
 6waNi7Au7IdKWpyVJn/LHv05Puc6IQjCxcuCeBvdrrFqmKcRecORaMeJzxZk3j8/UZYI
 dAgSqrXaV8RIkfcKmoyzRY73U4ldpxLw2pGigooGTyTa7lahCo8cW7pFbh+K2+GTVH9u
 7khzBOnJMroVrIq99/i9VMzMf8n/GOysD/H1Q6sgycNYbkj3wKR1D2bzjTTEevxjdYY8
 E/Rg==
X-Gm-Message-State: AJIora89rFe3iA26V2MM97iXDqLrhNIW2v+iaSHoWy59xy0dQh2kwFj8
 8EBmj3oUxnYtWL1qsCJ5+GziIWwvQaokTDQk
X-Google-Smtp-Source: AGRyM1v6c+BU6MHu2dyk4nqa1pKZ5Ww5SSCBmhj2aSW+c3HW7CBHGvjJ6DxdWLULmBaFfcBVnViYtQ==
X-Received: by 2002:a17:903:244d:b0:16c:52f1:ceb with SMTP id
 l13-20020a170903244d00b0016c52f10cebmr6218083pls.120.1657619955094; 
 Tue, 12 Jul 2022 02:59:15 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 s18-20020a170902ea1200b0016bdb5a3e37sm6348990plg.250.2022.07.12.02.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 02:59:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>
Subject: [COMMITTED 3/3] iotests/copy-before-write: specify required_fmts
Date: Tue, 12 Jul 2022 15:29:01 +0530
Message-Id: <20220712095901.212353-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712095901.212353-1-richard.henderson@linaro.org>
References: <20220712095901.212353-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Declare that we need copy-before-write filter to avoid failure when
filter is not whitelisted.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220706170834.242277-1-vsementsov@yandex-team.ru>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qemu-iotests/tests/copy-before-write | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
index 56937b9dff..2ffe092b31 100755
--- a/tests/qemu-iotests/tests/copy-before-write
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -218,4 +218,5 @@ read failed: Permission denied
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 required_fmts=['copy-before-write'])
-- 
2.34.1


