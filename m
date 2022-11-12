Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691976267E0
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 08:57:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otlNt-0006A8-PJ; Sat, 12 Nov 2022 02:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otlNo-00069h-GT
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:56:57 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otlNm-0008BK-Jd
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:56:56 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so6523255pji.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 23:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C+IVczPK1NNpHrvMuAE6+Vq0yrAS2+1zbxmQrXIiH6Q=;
 b=cqtMmSnhVUFc6E/Af7TC6wOC+zs39mLxPTf4riOr7x4q9jX0QlYQ8jmrtUrXc1mXb8
 /mQbNnk4236VOCNetnCghL7bXSFis3D14q/uxIn594IQmyKN3lNtZfL92LQcnVQCFa7w
 seyTP+Yncet5Lqarkqkux7icvAfUctzl9B3d2jK/ml66kh2m0Ix1ii1vmyVInHtrjsnb
 hnHZoPxHUG+0To+dbWcCPI9aRTdqOFuKR9hClaIAfXEMSob7U2+NQzken4PK4y+cUMRu
 eRuWOM/zVmMGVJuusjUzePQC9BCTAth7QcEvUKQ2VoNvr5HzAzrGVRe0NzCn41W59ycw
 +Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C+IVczPK1NNpHrvMuAE6+Vq0yrAS2+1zbxmQrXIiH6Q=;
 b=TaYFcHAng0V+sC+sEf8Pzd5ZbY9TQO/TyYFXRWBafMpsZ/fxcrWUcuKhXPj3KlP5LE
 SEMkrIw7ptQbsGQt+KbOPtFnp7kAg8N8qotVEyOK1gnOwHJNsA4MbaEd60UOIHEJIkRE
 zBWBiE0AQLy1nivSqsaH2yLQH6iAC5WuVllSsFkZYJvJ3F8oKKr+oRPJy2Ec/K8CELKu
 d2EdrC10XQpCiJ5lUDIXrz+LdhQ8FhZ8JoZqYWxx6PNGd4nhQAcM1+Bi9K4Hn8I8bs2o
 6CygxUTpZVK1t6v9meSI37whaA/7asUO0PN5o517NeiDDi08Swz87MmpZcDufoRm8dMj
 4HYQ==
X-Gm-Message-State: ANoB5pneWpvF0PmYMV5CflFZnZgRnNFomMOdPqX7kmT/xYI1hsH67wsY
 RAi9m5AQAEPNocU9Q14u+Ak+/g9OKy2Ua2mm
X-Google-Smtp-Source: AA0mqf5o41+/zlwINV58j5+UVrDxLudVAgafMCu0Mo2aBPO+0jtT8rM+qV4tBq7UfTMIDNzeAGFwgw==
X-Received: by 2002:a17:90a:5e09:b0:212:d299:4758 with SMTP id
 w9-20020a17090a5e0900b00212d2994758mr5473504pjf.120.1668239811524; 
 Fri, 11 Nov 2022 23:56:51 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a17090a71c800b00213d08fa459sm2743062pjs.17.2022.11.11.23.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 23:56:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH for-8.0 0/3] target/i386: cmpxchg8b and cmpxchg16b cleanup
Date: Sat, 12 Nov 2022 17:56:42 +1000
Message-Id: <20221112075645.2850679-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Use the new common functions and avoid rolling our own helpers.

r~

Based-on: 20221111074101.2069454-1-richard.henderson@linaro.org
("tcg: Support for Int128 with helpers")

Richard Henderson (3):
  target/i386: Split out gen_cmpxchg8b, gen_cmpxchg16b
  target/i386: Inline cmpxchg8b
  target/i386: Inline cmpxchg16b

 target/i386/helper.h         |   6 --
 target/i386/tcg/mem_helper.c | 126 -----------------------------------
 target/i386/tcg/translate.c  | 126 ++++++++++++++++++++++++++++++-----
 3 files changed, 109 insertions(+), 149 deletions(-)

-- 
2.34.1


