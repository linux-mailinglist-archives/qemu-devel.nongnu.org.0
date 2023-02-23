Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CAE6A0F03
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:04:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFx0-0004FF-Pl; Thu, 23 Feb 2023 13:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVFwx-0004DB-50
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:04:11 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVFwv-0003ge-BI
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:04:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id q16so1029892wrw.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 10:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sjx8qemthi2gczKZs33oNBUvyHLW7OlV+znLsf/nNiE=;
 b=d7gL99UA+hI6KlOuEv5/kfmbvkDSXG2TwGBIJRilGeZFQsHmSWM4LJhkAOrs8sG77H
 5+VbYkfE5GDbA62hahz8NDUa0EepWhscff0LzPtxyk6DPRVguZPqkh43OlVTVvKEYkLz
 859vR0yxv7IbWN4zqrnZDFL9wugW1syGKeS/cV6opv2AMpWioAqYUOOxWN0apcYsYkEx
 BMDZXY9GVtGa+ACnXoVO4uyzVC/WkSaCSdj8okAeRXPsOnyIPc7IQ7ZYZt55f/DfO0fa
 IbcpIYMADJEHRxY9mhnjaxxjQ2Gg/EGkaUcwqKF29ROTersF5xm+WJiE+mWVqhbDeLRt
 19qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sjx8qemthi2gczKZs33oNBUvyHLW7OlV+znLsf/nNiE=;
 b=RAaBjQjWynisGAbST2/ADx5T3Vqp6v86Vh/D6sO6elbZc4pPAfT8Wypzf1n5RzTC03
 E9MHXFOmZCB14qOgJ2PkxhCzTcXrYU5IXuD1JytSVPdpJHGveSCEIsseoym/qS3BTg4I
 uqaEMHD3ZOvU5k2hpWK2Qs/dXbPav5v+lOCBR9Rk8xhCe/ewU7UCIQQZseFVlA5WrmMz
 rjGveI9j/bdO+CRN8s5ylZt5UK5edP5Y8VtMbkEAMYWnDYfwpzpcOGFWgdRbBGXkPlDC
 CmVknNUBgF9+cFIXyEhVvRliCLcjrmJctVZypypfxG95fvmC2at5UMaAJvelcQ9eSchL
 jUog==
X-Gm-Message-State: AO0yUKUBsDbaGUwZSZ33ihZuV1Q6lgiB7ujvPRD9TCAqU22L92/AQ8B4
 Usz/xjBf1w5gbctr5DPzW6UU3rX3z492vn+6
X-Google-Smtp-Source: AK7set9wNKZOC63yUO8D125sjax6TB8J8Xkib12cSEQGA8w1bdjgRdpU/JHZlteOfcfRXOrbdK/XfA==
X-Received: by 2002:a5d:5f03:0:b0:2c3:be89:7c2b with SMTP id
 cl3-20020a5d5f03000000b002c3be897c2bmr10931585wrb.14.1677175447633; 
 Thu, 23 Feb 2023 10:04:07 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003e204fdb160sm99118wmb.3.2023.02.23.10.04.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 10:04:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/3] target/tcg: Use TCGv_i64 with tcg_temp_new_i64()
Date: Thu, 23 Feb 2023 19:04:02 +0100
Message-Id: <20230223180405.31836-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Missing review: #2

Although on 64-bit targets TCGv is defined as TCGv_i64,
clarify using the correct type for tcg_temp_new_i64().

Since v1:
- Added alpha patch (Ilya)
- Also use tcg_temp_free_i64()

Philippe Mathieu-Daudé (3):
  target/s390x: Replace TCGv by TCGv_i64 in op_mov2e()
  target/alpha: Replace TCGv by TCGv_i64 in gen_cpy_mask()
  target/sparc64: Replace TCGv by TCGv_i64 in gen_op_multiply()

 target/alpha/translate.c     | 4 ++--
 target/s390x/tcg/translate.c | 2 +-
 target/sparc/translate.c     | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.38.1


