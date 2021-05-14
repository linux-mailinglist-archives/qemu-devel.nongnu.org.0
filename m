Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC6380D23
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:31:09 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZmO-0005ek-8W
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVy-0005xg-6u
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:12 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:47055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVs-000736-Cv
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:09 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id w9so15570070qvi.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKAsDg7GVQzLhI2lK4v6K+FuJ6KEsAjk5VhFqfZ3xoA=;
 b=qxkmsA2bW3PsUNC/26VeYzBdKEWLESujzbCk+8hYC7Jlb6ySkYyiTF6+dUGIOu5jOY
 AwB/548F1gQse9aMddXheOsSJKlR53xhl3EimcAyxVfjx+yePs9QxCpYrt5DRHth3oIc
 9N8Z99CwmTjnUmBbRe+0CTJADU45xp6pcRoQbf+JGD3/l6OLpQ63DWwY4Q3y5NOa/D8A
 xkoS4VrhAbT57P6ZJgjycJf3AcuDZUBXhJTcRnkU3dPTO3gvQbyGY8uc8zlIKKuvlQLO
 c32cU3YGltSGhz66xiSjINYkLVpr+nx05qogjiF4Uuj3a0EmUJCQvBaTo7kSjLlw3e5H
 XAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKAsDg7GVQzLhI2lK4v6K+FuJ6KEsAjk5VhFqfZ3xoA=;
 b=AY92W5SsxJ/55+e6xi2YC4Inu/x5tG78vB2hPeKaVhx8u0E8Tw6i9IE4fRtC4zPyh+
 ntPkb2IwfDqbU3ZdNw+s3y/6hQB1kUh8Wn+qpGEg5T/OfknOySSUdDi92zDQTHcabkZn
 eOQ1QJnLHABkC1zVPpCDngFmxxoVs559yzEIVGK8VI8ynNCQgptidFGKdpV7VL4m4C3s
 46e1iAzkkQMkc2fWXl73BYkXwnv2OclNjFZIuql2fBrH+ChHOEssEQFFGqe539DANOP4
 eAgvE3YQQ77US7jnQpwFKOVqyW6/6MwXbaS8+f7c7/BP3RcSOd05dV6DVQKPl0hFAFzS
 38RQ==
X-Gm-Message-State: AOAM532KR5ZUcX4UXmeChX8mdIQWFsk3r/QtYJoJg01k9oUjqH399C3p
 AIjs/PeW4NtG4MOscgL01+NXg1nlnPu79hpCvpQ=
X-Google-Smtp-Source: ABdhPJz0zyGylfvLInwuiPlhbEsEM8arqsLB6W1UdAMC68bgkXj7Z6+FwdIGaaZEWVsIfNgtqOSJUg==
X-Received: by 2002:a0c:eccc:: with SMTP id o12mr45998314qvq.59.1621005243626; 
 Fri, 14 May 2021 08:14:03 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/50] target/i386: Reduce DisasContext.override to int8_t
Date: Fri, 14 May 2021 10:13:13 -0500
Message-Id: <20210514151342.384376-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The range of values is -1 (none) to 5 (R_GS).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ca7f0a8cf4..44a28858aa 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -77,7 +77,7 @@ typedef struct DisasContext {
     DisasContextBase base;
 
     /* current insn context */
-    int override; /* -1 if no override */
+    int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
     int prefix;
     MemOp aflag;
     MemOp dflag;
-- 
2.25.1


