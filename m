Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183F64D9AF7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:18:35 +0100 (CET)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU68I-00023T-5f
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:18:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62y-0005wG-Tt
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:05 -0400
Received: from [2a00:1450:4864:20::530] (port=39472
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62x-0000bB-EL
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:04 -0400
Received: by mail-ed1-x530.google.com with SMTP id g20so23907465edw.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzMDYUXwDDwlG4SpxxXHsBTj5sex6Q71sYg5sE84cVc=;
 b=lfzEfBuM9Ej1WA6upPQWAS4NlSszcx9Z0RdBChsDPUDf9dQZRhSPzricX9DPy35p48
 mOt2EaibGRw587ySef/7/CkqreTabwTMC2z57yulWTcN0A/NkmBGPT+vgTzn5MzI9vvx
 r9xhHXR1nRs+RWK/T3RJTNj3QicMLxdsFe8ZqB0Ki0NJpep/Kvsz3b1snglLar/M4/Fd
 EpKQHGhkn1iaKqXsCKS7BGz2bsah6hm5z2zwuFoXGc/thhFh0fO64CtfH9nPO7/yXDwZ
 ghbrOa5QU69hCkbDgLaUSYm6gGcahPWyRjnPHFDg2Ab9Pm4QNQnnmspa/CK7nW2nSGHh
 BqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzMDYUXwDDwlG4SpxxXHsBTj5sex6Q71sYg5sE84cVc=;
 b=m8AUJC4Gveq1PLwwhk2ufsfglGma86MkT5ndjLZHodwHHc0cjHaJUWAvqUitIy527S
 NeWuJWoECgBaabl8i5r+2/OKtAprCdcHB09zImww3ZZLqZ3Y/Cz8rbfhwm1e6yBk+Fc5
 TXPUdvA6vizlD+oHvmGHykoJaluFw6WA6FfwFi10BT4AKveNbL9bieS2+BAVpYO9eL8r
 KMShiQoHtRdh98RG6upcda5abS74l4dIVbYdi8+p+QHVKwFCAhwz6B+XOhAA0UwtaTge
 f/CS7e/MKYUWZ/+OCQa9uPP0WW8hkwTbtz+9k4zah9bTeuZaW1KEpL0z2Y1x07SCGu0k
 o1hw==
X-Gm-Message-State: AOAM533Fujt9k4jblSTeldwr62pdv2l2R6+Bk2MRgf1Dis9isyWt9q6P
 D3++cy5oCJGoNbESKfA6iJZbrw==
X-Google-Smtp-Source: ABdhPJxrEyfooQ9ykvTHrRlPSwZUvVKGsrBXQhzlQJYLHBW1RM6EaaSvSUPb6y4YGep8YpcnMilwjQ==
X-Received: by 2002:aa7:d553:0:b0:416:4dfc:126d with SMTP id
 u19-20020aa7d553000000b004164dfc126dmr24924401edr.213.1647346381968; 
 Tue, 15 Mar 2022 05:13:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 w10-20020aa7da4a000000b004161eea5ae7sm9477228eds.40.2022.03.15.05.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E21601FFC0;
 Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 8/8] gitlab: include new aarch32 job in custom-runners
Date: Tue, 15 Mar 2022 12:12:51 +0000
Message-Id: <20220315121251.2280317-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without linking it in it won't be presented on the UI.

Fixes: cc44a16002 ("gitlab: add a new aarch32 custom runner definition")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 3e76a2034a..15aaccc481 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -16,4 +16,5 @@ variables:
 include:
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml'
   - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
-- 
2.30.2


