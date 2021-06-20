Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8383ADD36
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 07:27:11 +0200 (CEST)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lupzC-0000WW-B6
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 01:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxs-0006z4-P5
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxr-00085L-0E
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 t19-20020a17090ae513b029016f66a73701so3183729pjy.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 22:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8d72e/7mpgky1TrMmCutOQ2CUSvsPa/407Od/fhTZSs=;
 b=gx4LudeGcu8RA1y3Unw06HybQAvx/YDqHEhzpXFSrKDwFJFns9MZROk37HeW5JsTpL
 8jE9EcC7lf1Zn0QiVhXUGpLFbTwc7gWT5eC9zDUtW0CAogV6iTDIlUv7fmd+zQdO94+x
 Wvq0ARFVOQpx//xV1UUpGea+i62KiahSJHGTE88CuTszSZOb8cjy4ddUHGy5E5H8WOib
 gdBM2HQZ6UQiah0YlTGJg4e1SBF5bwHSy1+71K2O7C6YRAPW5rhSOXJDdOoISZyN9osn
 DiSaN6lau7911nYY3/5qpbmDQApckXYF+WdRlZypD1wGugHuFQlSER5Oc0LmqHFHTARL
 69Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8d72e/7mpgky1TrMmCutOQ2CUSvsPa/407Od/fhTZSs=;
 b=Uq5y8NqoDao0DfWM5EOlu4cryi4t6Awajj7Kd4fwm1aBcZEtwrq+24kr56Nh3uJhkG
 yzYNFK0b+drIvjStSz/DqLfqk0OaRyrFhGQw97cM5MfRKQLM+tKg84KDyKyOpq3V7bCK
 6fqh/WbIx2XlB14WzpJEgBNaRwZh7luNsgDh9P3+MD1O8PDgRMR45kmZtotC5WkQMpsU
 6gOBhOiOrbcjyJgpBotbYT8RGUXF+1MzQWpWabfCTiyQsKeRyGGrSUx1a8NjH5zhVpO/
 MixpuMqff/wT8Ji+cQya29SpY+ucuxKZVcOfDZl79XWpZPh5YbFJoVsuOX0NV63uKPNl
 BFgg==
X-Gm-Message-State: AOAM531K7B8dJKTTIxzy10YQWeed0fcqo277iHx860bZcqQ0JlMxzrwN
 o9shazRsIC62JLyudX9D7UJaAOvcZkop8w==
X-Google-Smtp-Source: ABdhPJymZ5bXripIndsrG/h0VO9+9FdZPfiV5rUW5ZT6P7e9O+HfqxsxRQfUHZzXGQtmTWib3hHgiw==
X-Received: by 2002:a17:902:a60f:b029:11e:62b3:e454 with SMTP id
 u15-20020a170902a60fb029011e62b3e454mr12170048plq.51.1624166744795; 
 Sat, 19 Jun 2021 22:25:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm11409741pfh.103.2021.06.19.22.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 22:25:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/nios2: Convert to TranslatorOps
Date: Sat, 19 Jun 2021 22:25:36 -0700
Message-Id: <20210620052543.1315091-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've reached a point where *all* targets must use the translator loop.  
Do that, plus some other obvious cleanups.


r~


Richard Henderson (7):
  target/nios2: Replace DISAS_TB_JUMP with DISAS_NORETURN
  target/nios2: Use global cpu_env
  target/nios2: Use global cpu_R
  target/nios2: Add DisasContextBase to DisasContext
  target/nios2: Convert to TranslatorOps
  target/nios2: Remove assignment to env in handle_instruction
  target/nios2: Clean up goto in handle_instruction

 target/nios2/translate.c | 258 +++++++++++++++++++--------------------
 1 file changed, 128 insertions(+), 130 deletions(-)

-- 
2.25.1


