Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF53258167F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:33:34 +0200 (CEST)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMYv-0007qq-Q3
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMG-0006RZ-L2
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMA-00062z-MI
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:28 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h9so20667852wrm.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N6+ztaKWxKiaj7O7Q3eQxFwJtwwHvO1y0ZcflvRK1lM=;
 b=wNrUUwAse46VXkuSJN8mYTkeBG1xIHOQRiFbJagq9lof6c6db7UFjYGKpqdsiWq+lx
 jkq3rOW4M4jp5byJHbVouS1dbsqNO0eO+l39gVFaJ+Lr2F6b6whf5bblw2J0keFftOY7
 L3EAdnxiK1H6aKRcCSkiFAc+FYJmDRZAO8o8KnoVh3hmrYMRBuAoCMAHq2HkQQXg+7V7
 xYPmCbWlrRecp0+Lr1o+F1rLoNO8cLAPXfI//vubctRs80DMyVljOsv4/w/ERtyH/A1D
 uteu6p5r0Io39EgKMsyqOC2QoNm+4OjZqFCTM+lJ8Z5TPPgQ3MBIMtXK8CQtDO01OFod
 SQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6+ztaKWxKiaj7O7Q3eQxFwJtwwHvO1y0ZcflvRK1lM=;
 b=NKzT3ivQ/hHsMfpHA1WdE0xRJTyyn8Yy01FV4eIWW8sipAuIeYe9U1MAX3Xik2o6SF
 dPpw/uD3a48/Dd9SmVEgB0jtZNpkSfSx1k0v+rVo8EtpnDyCposr81A1SeeSTeH9u5pi
 33rF+/eztuC+C/YLeh2iBCPjFbuZhhWrEbvpWNregeMJls1H/LwnT34U2ouok4//A+Wc
 QX/LUTq78YY9hPeOu0pEP7laD1He9osR+koXpyM2A56wMIR3uBGcn45ASAezBNpiVbwG
 XuCEvxPbaEr2zb3x/FQdnfGz3tDr5++UnhwA2zcQqNLFaoZWSoDF8ghnfzYsRU9qfefM
 YAPA==
X-Gm-Message-State: AJIora844a6s8J61UElFsbNUIKzSan5XTdjeSibtP6QztPz82UFCRMi0
 G3Us5eN1WiPT2XcHWa8jNAMa53M5rzo2wA==
X-Google-Smtp-Source: AGRyM1ujMiGHh9zZ9cLExqYTeRCPz7/wrB/ggC4YrYqHtFMbA0KMJ/W5kW9UqzjEXk9nXCNel0GpVA==
X-Received: by 2002:adf:d1ef:0:b0:21d:983f:4b8e with SMTP id
 g15-20020adfd1ef000000b0021d983f4b8emr11595443wrd.334.1658848819277; 
 Tue, 26 Jul 2022 08:20:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] configure: Add missing POSIX-required space
Date: Tue, 26 Jul 2022 16:20:07 +0100
Message-Id: <20220726152012.1631158-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-id: 20220720152631.450903-2-peter.maydell@linaro.org
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


