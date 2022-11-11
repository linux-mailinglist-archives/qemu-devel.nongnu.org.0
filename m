Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C0625D98
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVRc-00075L-TI; Fri, 11 Nov 2022 09:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRW-00072s-Cl
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:42 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRT-0007wS-Hb
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id w14so6773668wru.8
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0bUaw8dD9ywC6S/a5dl4BRNFGfCaE47JrvKC4nt86Q=;
 b=sIG5iSMC/omS9k1NJKAw5LBpio5CRXti6av7czKWEtxG+GPka1zuKgL/RwjXb7YHDL
 W29dLwrIDXABGqamAVAYs9w1aQ2QUXWDRoBm0Qes+6ohkyEUXoLAdb3nKxvWFuUk8Z5F
 xwg754ePJbrSQall5Fj/lEYpmktclvQxbvbF387tn4Fi13BeIRMqN2um8DGR3X9+cxHc
 6zNifyiuE0/grvVogzBqB9Ne0mI+h1bPPCggiLNDQX1S1U8B1gCCaXadvaG2HOE3DpEg
 gxHfZRuY1BFckcNTZHSi/kue1J/MBpwlze8pF1+fDoM5FB2O6X/J39/H7h9iQMcCr8aW
 uchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0bUaw8dD9ywC6S/a5dl4BRNFGfCaE47JrvKC4nt86Q=;
 b=O/lkgw3xkoWjBQAxHgZgHS+K8Opqu58bRZCTe36SWSlt/vDtfNO6spQopm6Ef5xUuk
 FZAf7Ugb9yPh2Q1jFlAIafhDSqn2i/E3/EQZvvrmV/Na2b2PgIZw53mToBlNwC6BmuGZ
 BNhnzWTyQTUWR1KKXou/032qgEgwIxPrhCgKhgr7oooTKNjhA/2WYw5ZB6Sy8yZKkL/V
 75TTf8nYIGJK1pK6UJ35zrxugOzHqQ3LkjM7II7TzfT4X1mBMjF2VWOoJKCowFG2wLG2
 SIusylbnmwZAbODT16WMMqc6VLTN1jhVcLMofCaDFAGEU39mn0tfuAnurLq1I4YpPem4
 wP/g==
X-Gm-Message-State: ANoB5pmrR2S1I5koCevNeEbrWwBQlwAqxgoEgi39bxHmXTLG3TezEYmJ
 X+WvltsgFOU3SKf0fdydltu6Vw==
X-Google-Smtp-Source: AA0mqf7vUMI2bGdl7zt4PDfv1FGWkSpvP9xpuy9phtlkZGYPUrK407i7IT+uMKPZg8sjk676k3GYDg==
X-Received: by 2002:adf:db4e:0:b0:236:bad6:44df with SMTP id
 f14-20020adfdb4e000000b00236bad644dfmr1390631wrj.489.1668178535683; 
 Fri, 11 Nov 2022 06:55:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c2f0800b003c701c12a17sm8502540wmn.12.2022.11.11.06.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:55:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 911ED1FFBE;
 Fri, 11 Nov 2022 14:55:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 06/12] docs/devel: make language a little less code centric
Date: Fri, 11 Nov 2022 14:55:23 +0000
Message-Id: <20221111145529.4020801-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111145529.4020801-1-alex.bennee@linaro.org>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

We welcome all sorts of patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221012121152.1179051-3-alex.bennee@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index fec33ce148..9c7c4331f3 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -3,11 +3,11 @@
 Submitting a Patch
 ==================
 
-QEMU welcomes contributions of code (either fixing bugs or adding new
-functionality). However, we get a lot of patches, and so we have some
-guidelines about submitting patches. If you follow these, you'll help
-make our task of code review easier and your patch is likely to be
-committed faster.
+QEMU welcomes contributions to fix bugs, add functionality or improve
+the documentation. However, we get a lot of patches, and so we have
+some guidelines about submitting them. If you follow these, you'll
+help make our task of code review easier and your patch is likely to
+be committed faster.
 
 This page seems very long, so if you are only trying to post a quick
 one-shot fix, the bare minimum we ask is that:
-- 
2.34.1


