Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37D336891
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:26:51 +0100 (CET)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9AA-0001Nh-6w
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95f-0004ep-T4
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:12 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:41408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95Z-0001J8-Ie
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:11 -0500
Received: by mail-oi1-x232.google.com with SMTP id y131so18360268oia.8
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WjgWEUKMGfZOQb1lvpL8VH2dhbBkx98443ZCMCCi+VM=;
 b=dC/y0W1LvIXGR3ZgiUt3HQqVPYIX6nixkE0ToxOeC+TtXs+zL2L3RrAJJv2snwHhXW
 C8pXKFDOfkMOu9C5TZsjlEWdHpdktGtSPGXMg5MRI1vYCilBigjkJxN3WHxHCmTgK07z
 Y2ytwz5w4LEd/S+23GGtKpvyPupTOa2rpHkCRIYGspaX2cB4sdPHHZjSnZw71fhfG27s
 zBjAc3vcp9TrcYA9EAIuyoBVGheo5Slgm3vAZExvUmr4upKcQ1jYHJUcFYAj3sxueevb
 U8yIMc/L9mjwuqRZ3504dr9YgEu1/u3BwUUYtnbuSXmyo44r4ZmEKtng6PtwN8GboL4G
 WnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WjgWEUKMGfZOQb1lvpL8VH2dhbBkx98443ZCMCCi+VM=;
 b=uhYn+Am+AGXuLqXl9shnJnbN147mBxyFB4glTjVCxeaK/DKgev+k9sCLRJLkYwwruI
 ZesD/OOWkhDdGHHl9A5hv59yOYF5073+qxy/v3ONh7UKPRsyvRGPEAh7IjwuvvtYtRZP
 KbL+jOx1Vo9u92ZpvkvY/9Rs6QS+NffAVwumc3VukfUa7CH5a/znqXvrihFEMd+PVW5U
 ti1swG7cwdrLH+5IhQq2Dk6k2iyls7AFKJ70KA+AbrCzs0sAbkYTq7NJckH58N1488k5
 mdK6YirbccwHjNniWZwPpArMMlKtQ9cANaKd9Ub6KVDx4HQ/apfS/0Zpmq8bEksdSum4
 7RYw==
X-Gm-Message-State: AOAM531gV0gFDPOegQmHNMIx6hhL4HC9TVT1lLHFmQYy0jRODQhTNQxH
 mSfkrs74UyhE1182gQToHcqQs6C5cGRcOiBb
X-Google-Smtp-Source: ABdhPJzR19o8YBepVZBIwZ7o1ox7XnMnKKCSbYZ7oGN0yx/29FJ+8pJ47Q6rH5Udx8lJ5PUTRMfi7g==
X-Received: by 2002:a05:6808:b21:: with SMTP id
 t1mr4327886oij.35.1615422122152; 
 Wed, 10 Mar 2021 16:22:02 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/26] meson: Move disas/tci.c to disas/meson.build
Date: Wed, 10 Mar 2021 18:21:32 -0600
Message-Id: <20210311002156.253711-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no reason to do this in the main meson.build.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build       | 1 -
 disas/meson.build | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8bc472ddeb..f884a62682 100644
--- a/meson.build
+++ b/meson.build
@@ -1937,7 +1937,6 @@ specific_ss.add(files('exec-vary.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
 ))
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c'))
 
 subdir('backends')
 subdir('disas')
diff --git a/disas/meson.build b/disas/meson.build
index 4c8da01877..b7b659bf88 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -23,3 +23,5 @@ common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: files('capstone.c'))
+
+specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tci.c'))
-- 
2.25.1


