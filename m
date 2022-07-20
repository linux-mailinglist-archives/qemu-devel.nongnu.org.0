Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8DA57B998
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:29:58 +0200 (CEST)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBe9-0006zX-DC
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBav-0002MT-QO
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:37 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBau-0005Bm-8i
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id a5so26589028wrx.12
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YO5oI71pbWpf1Cp3bbqdXyUqFH5RPgviSgLa1og9xxU=;
 b=YMi3r6Mgx9Su24p5f+ikpi0yRxA8+WW1IaOAUxP5RBZ3riNLssWNheTRcRjq5EcCZO
 Py5oYh3HOzKPcJ/2z473X5OCTeUiGAxAN7R9jTz01onvDaA0eOuf031LH1piiU1bfnEY
 LvdtG4ijYX7wqQ0jAP/lZFq90p0BN8EIB5Zll8Fwz2bpiZQ3/fqSeoarAbB0B4t1i3c+
 S/z6IKqJG5oafl7mfCBHx7+MIO4FfrolZriMQeK+Nw++q9JKAxgFcagCjpzdnRWjqTLB
 tiBpEWLzZdJYu8RMNL2ybI9kW4d9dwO8hEdhHEIoljz5f338j8Z0hwr84vFHyoV66WU8
 8EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YO5oI71pbWpf1Cp3bbqdXyUqFH5RPgviSgLa1og9xxU=;
 b=600aJItoqzvBdGDVW585KH5RzDoDxZEOevX7OsTCNdexMQVWT1RPJwJmY32t9buAWh
 zhRzUY4CmOz7qbt0EcNDknLXjT6PlhsA53p8MUQNxCaJek2JggAreBo3kyl3yrDXZUPL
 kf/uK4nbfVZnMSZvjqGPT7LuCrcH5PM1SdPZ5cX+cCy9OfgyTj91CwUlv0VYFNu1FFsP
 YYwQnGyKI7tmj+pceX96RXN3jsS4JzdtYqgj1p0hATpZn1o8diP9fbogLnoIx+zmDDxc
 MQ2y6ZQRyY39AIUFF8PcbjQzeMYT3H/9rYNuMmtHwgf1uphByi6G37i0c5QzbepyUuD/
 mA7A==
X-Gm-Message-State: AJIora8aROTCfaj6vqw6TDCmiTiP+dHo6YFnqGtEWZye6pVYcVPUXgRh
 gvHXmXh1UYC3K/0gbqNbw/LVoAd96vXMWQ==
X-Google-Smtp-Source: AGRyM1sheAM6XTtDMsO2nIU+8mz74ej7RIWIIXfbXE2PVtHx+rnYjnfG+n8e9drw9kSG/HHalP1Qzg==
X-Received: by 2002:adf:f108:0:b0:21d:7f0f:22db with SMTP id
 r8-20020adff108000000b0021d7f0f22dbmr30195610wro.187.1658330794841; 
 Wed, 20 Jul 2022 08:26:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b0021d68a504cbsm16395987wrx.94.2022.07.20.08.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:26:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/5] configure: Add missing POSIX-required space
Date: Wed, 20 Jul 2022 16:26:27 +0100
Message-Id: <20220720152631.450903-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720152631.450903-1-peter.maydell@linaro.org>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

In commit 7d7dbf9dc15be6e1 we added a line to the configure script
which is not valid POSIX shell syntax, because it is missing a space
after a '!' character. shellcheck diagnoses this:

if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
    ^-- SC1035: You are missing a required space after the !.

and the OpenBSD shell will not correctly handle this without the space.

Fixes: 7d7dbf9dc15be6e1 ("configure: replace --enable/disable-git-update with --with-git-submodules")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
David Gilbert noted the OpenBSD issue on IRC -- I have not tested
this fix there myself.
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 35e0b281985..dec6f030346 100755
--- a/configure
+++ b/configure
@@ -2425,7 +2425,7 @@ else
     cxx=
 fi
 
-if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
+if ! (GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
     exit 1
 fi
 
-- 
2.25.1


