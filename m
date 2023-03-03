Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C86AA468
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYDvx-0005Xm-O9; Fri, 03 Mar 2023 17:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYDvd-0005OJ-Lx
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:31:07 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYDvX-0007v1-U4
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:31:05 -0500
Received: by mail-pl1-x62f.google.com with SMTP id a9so4273970plh.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 14:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677882658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CuFlEA4wbZegEUo5KTq1q8A3JbL7JTNvQR+N4lW/vYI=;
 b=NOl87oQM5S+CKKQck0v3dAISVDR1FGIK+4PO7OOKRAHJg8gsRE8SisRpO6tTF+dbV8
 YIrB6SkyaQlV05yHtRB6gHdDj5EZLqPGSwIBflFzyJVB67FGrI95y+Eq1wT/P6KrbDBt
 wE4vbSrrBmx/kit7sSZfjpxq+o57klEstlqJ7Zswvsqi1gaimvyBvm4Huxg+ZKCSg2SF
 R3xIHh5ivBR5/XkXh3EqczGa/9H6j0u9wcQ6YSXt0jkbWswL50TX2ryq/ZL2W8OCzwag
 keRzS/LB+u+TmY74LBaVXGC0ToEybucpC7sxWcr9v0WCqdVsx1DeRQ5cbwZvW1n5Qpsq
 IL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677882658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CuFlEA4wbZegEUo5KTq1q8A3JbL7JTNvQR+N4lW/vYI=;
 b=3wtwSxtmU/MAHImFOuK+rO5hQhxLlKZTk4XeucPLZiFZ+DZM/4HOvnC/uW3PNsbN7q
 i0OCq3WH5dKGPPwXNlZAaL7L1ae+fOWm4N+lChzUmxihRRBHubH6JF5vWCnajV2Ay0bu
 3R5e4e4QOohH2Czs3Me82NdtALekWc7ysSXRFNDqnuTtxRYdhm8bglGz1sM0fT1mfe9j
 mA44v7tnBuWd+QBWyXdRWvA233jm0el/Nf1LR+ybLalA/ZLWibNMtpD/itdyFUs3cO5/
 TkLWfD28tO0m3jz/50bnh3iVSRER4PLNrlkO7vjuH9Yz8+ytHLx+0s2r90JQfSUV/Vee
 iQ8w==
X-Gm-Message-State: AO0yUKU/wBeK175Myb53fx0rbP0VbROl9zDwNNJiOyTyfTSsKQUZqnR4
 ukAabuPK/UJu7+LnH/lhTWhu6PwrH/NQkPIqpnNt7w==
X-Google-Smtp-Source: AK7set9/OYuHjKhIjuS9ZhWClDJ6mwPNaGRZ0Fq9u85jSYEhS5WOTzPYooKcFRN6dC25+XbbzTwpzg==
X-Received: by 2002:a17:902:e88e:b0:19a:8636:9e2c with SMTP id
 w14-20020a170902e88e00b0019a86369e2cmr4190222plg.57.1677882658301; 
 Fri, 03 Mar 2023 14:30:58 -0800 (PST)
Received: from stoup.. (174-21-74-159.tukw.qwest.net. [174.21.74.159])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170902b60500b0019a87ede846sm1963742pls.285.2023.03.03.14.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 14:30:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng,
	tsimpson@quicinc.com
Subject: [PATCH 0/2] tcg: Merge two sequential labels
Date: Fri,  3 Mar 2023 14:30:54 -0800
Message-Id: <20230303223056.966286-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Supercedes: 20230301142221.24495-1-anjo@rev.ng
("[PATCH] tcg: `reachable_code_pass()` remove empty else-branch")

Anton has probably seen this already but his patch now has conflicts
with master.  Rather than a while loop looking back across labels, let's
fold all adjacent labels into a single label, at which point the
current branch-to-next optimization works as is.

Perhaps I missed it, but I didn't see how to reproduce the issue
being resolved by the hexagon front end?  So I haven't this trigger,
but it passes the testsuite.  :-)


r~


Richard Henderson (2):
  tcg: Link branches to the labels
  tcg: Merge two sequential labels

 include/tcg/tcg-op.h |  7 +----
 include/tcg/tcg.h    | 19 ++++++++----
 tcg/tcg-op.c         | 22 +++++++++++--
 tcg/tcg.c            | 74 +++++++++++++++++++++++++++++++++++++-------
 4 files changed, 96 insertions(+), 26 deletions(-)

-- 
2.34.1


