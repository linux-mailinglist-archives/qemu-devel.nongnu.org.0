Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4FF6E98EF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:59:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWf8-0000CJ-5H; Thu, 20 Apr 2023 11:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf4-0000Ai-R9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:30 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf2-0007u8-1x
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f625d52275so700667f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006246; x=1684598246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R59KmhBE1ju4nQIU2ym/eqgcBqBFRDfoZfCOJrQ0/j0=;
 b=PNSk7vpvRGHBpnQCP1aCoMvZfMNYBAJdhDESsErI647MISQQD4f3m6gFG+mbL4JZuE
 603aCdF/Gw7uged1l9jfRW2OkstJXnX9rn4pliIx4xoP3O8Q6qcwqk3ZFNZaE9DDkLrv
 SHzg+qfC6U5EGkwJ7Mw/3iqW2mUeaRqjU9g0tJ4mIU7o0fuGxRoJgzQcmlbu/yxxbLDj
 7hYm2sV8QUVa3MwSYdKBE8d+AN1IMQyTsOKZndr4mQ8Rb13tWZZ5Dz3+6/l9Y1ne7hxD
 74uA90mDKSkaZHzERzZ7st/Jtyenw9MMq7/zRs/rruasdzvKyD5kl74mAlGRWbGGQiuH
 LZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006246; x=1684598246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R59KmhBE1ju4nQIU2ym/eqgcBqBFRDfoZfCOJrQ0/j0=;
 b=daIX7ci7x+9v+rxVt1AhPpM/N6UMDr37/ujeXDIyrl0og9PWR0JgnF6JcSHG9BmP6u
 NNHs6vVhEUoAIO5HIv5Be3qybumVtMl66wKolNACwBOZP00yEhVSyJId2NYfdVSXv9sg
 GQELx2688/5NWvHIHx94hby9j7lVhfkROngfkJEpszydsE7C436uXkjBtujzAHT+mmmG
 9MNuUYxpQ9K+tBHvKDupmdQUNRG+ISeieypjqYtmzOjmAnEhw4wT3buHitIj30miXdhJ
 fUFqigO6WbAOmBpVQ84dWrZNXtAouW8a7FixfLS4vNx7KPpTnNE5dJ09rGR9sys2Mnnr
 2igg==
X-Gm-Message-State: AAQBX9fgdQ2lqhoP3PPRum+Pd30h3/JDJ8sipecwZUKmpOFHFCork9Qo
 TIUkjAnV3itsQnSYlbKTOQO80A==
X-Google-Smtp-Source: AKy350Zqedf+9hxm6VYVn/l8/pG9scwjIqZUNdvMVdUp+AMHuTJd1X01IG9uP1SznoO0FIm7mG/4dA==
X-Received: by 2002:a5d:40c6:0:b0:2c8:9cfe:9e29 with SMTP id
 b6-20020a5d40c6000000b002c89cfe9e29mr1780944wrq.38.1682006245942; 
 Thu, 20 Apr 2023 08:57:25 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u9-20020adfdd49000000b002fe33e42c85sm2269503wrm.72.2023.04.20.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA6FE1FFBB;
 Thu, 20 Apr 2023 16:57:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH 3/9] docs: Fix typo (wphx => whpx)
Date: Thu, 20 Apr 2023 16:57:17 +0100
Message-Id: <20230420155723.1711048-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Weil via <qemu-devel@nongnu.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1529
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230409201007.1157671-1-sw@weilnetz.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/introduction.rst b/docs/system/introduction.rst
index c8a9fe6c1d..3e256f8326 100644
--- a/docs/system/introduction.rst
+++ b/docs/system/introduction.rst
@@ -27,7 +27,7 @@ Tiny Code Generator (TCG) capable of emulating many CPUs.
   * - Hypervisor Framework (hvf)
     - MacOS
     - x86 (64 bit only), Arm (64 bit only)
-  * - Windows Hypervisor Platform (wphx)
+  * - Windows Hypervisor Platform (whpx)
     - Windows
     - x86
   * - NetBSD Virtual Machine Monitor (nvmm)
-- 
2.39.2


