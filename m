Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF36DC7BE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 16:16:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plsHf-0001DF-IR; Mon, 10 Apr 2023 10:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plsHe-0001Cn-4I
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:14:14 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plsHc-0000Sx-Aj
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:14:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso9421733wmq.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681136051; x=1683728051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EDUr0McT6NiQ4OIps3CevtawlpOzEV5YKFfNxKiu6mA=;
 b=liKYzmainc5VEB6a4y6fuf8s4Ghws+Y2nYZqggr6MbdH889z27jRq/poLpoxmj7Cs4
 xKCzEw2iXNVgaqL+ASYw8GuulTvdT0deSrKgGJ41Yx95DcG7CyLovQYEj/4qEQ3AONQb
 aIxTLCIKO1LoK5UA3SKwVWhNZKPLjw+lFtXhG+wnX92HnAAgzY273rpp++yld/JzMknM
 slzp+hmMlcDptIE9nBkJ9/jTdtF/cEvP2WVc3FSpy7kZEi8eP8ojMiM0g+LkIA2Atn/8
 pV7KYnoE6W6MJnchxI09yCsn4H/3TGQpH8aJUYJOpFgJMTfDayEWGLLf6i0pN2THEfAS
 XmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136051; x=1683728051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDUr0McT6NiQ4OIps3CevtawlpOzEV5YKFfNxKiu6mA=;
 b=Dlfj+Fh9zUE8e2dFmjyXkmH2X2XJJH4C7671dHs80LYmpWeZu15pQZKw7RJBxFEdpg
 Q1XKQ3YyThfyYJCisQlPDH2UPgig9QVbHKxhciLQ7Ln5GoxFbEqsqqYo6eQBcvUqUini
 x/E8+aPY692lmJyrQ7EHIkRc8pk3D4fADlMTYdjUHWBxRmtbmnQmTQYvEj7enRwq0W5t
 MQDnGDxRFMIuZMn/wB5xl+yaLjd+CY5Do3kCc1jBoZB60lTUmPb9vSCfEoPv//Ca3KWL
 HbwHKcHx/zLY7WE81CQvU3y1wovRRIHmToMAZ71N/cuDqeaZnahuxv6LyV0fhGvqn67C
 7KZg==
X-Gm-Message-State: AAQBX9ebEsYxPhbtQEznzBC/vzk0CGnpifJtWiPwu5miiocTTmVsXhfH
 MZ/BwimQhg9pC7+k7rTo0DchfG4bizaiMR7waME=
X-Google-Smtp-Source: AKy350Zt8dWKTfQNp1imKToJViryDPb5Q72uOLg8h95P1UAtLbKtcO+1NgREvoRlsraDqjqcQp0GOQ==
X-Received: by 2002:a05:600c:2148:b0:3ed:f9d3:f95c with SMTP id
 v8-20020a05600c214800b003edf9d3f95cmr5029210wml.19.1681136050870; 
 Mon, 10 Apr 2023 07:14:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a7bc389000000b003ef64affec7sm13793060wmj.22.2023.04.10.07.14.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:14:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] target/arm: Copy guarded bit in combine_cacheattrs
Date: Mon, 10 Apr 2023 15:14:08 +0100
Message-Id: <20230410141408.3564269-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410141408.3564269-1-peter.maydell@linaro.org>
References: <20230410141408.3564269-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The guarded bit comes from the stage1 walk.

Fixes: Coverity CID 1507929
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230407185149.3253946-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 58a6de09bc9..6d72950a795 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2576,6 +2576,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
 
     assert(!s1.is_s2_format);
     ret.is_s2_format = false;
+    ret.guarded = s1.guarded;
 
     if (s1.attrs == 0xf0) {
         tagged = true;
-- 
2.34.1


