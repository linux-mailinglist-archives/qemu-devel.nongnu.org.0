Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1C33C0D3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:01:33 +0100 (CET)
Received: from localhost ([::1]:40178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpeu-00084B-Gu
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLpcB-0006lH-3A
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:58:43 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:37388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLpc9-0004MV-G0
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:58:42 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so5371534otr.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KUgxjWQ77+Jw26A5E2dK9Y6J+511lV+n9oG7cF3w+1A=;
 b=UyCYBD5/yLCWF0sQE6Sf0zwGPJHUiVITULxnu8pWiX1OM7UqL33c6RK9hxBem5kact
 tIdbgxQj8QjYowm0ZgQw4EoNKlWGM7P8GaAFHKe06a4IFKpssPSG2tV8JJXoBitfr+dQ
 masfsfTlwBGwJKhifim5R5NYUEdEQnBsfHFvXS0b12NDIrFG2WNG8fWHNtTHH0M1JsQ0
 gpuBgin0yYXthOab8PPePaRRqtcfjyzskDSeOpzRxySOsh7g2I1kejgZzkMt6NJ4IMHH
 Fhd1xrA5rMnYG/1i/EZURXZCVLG7hQw15BiAIznAuck/SLtizeseCwiy+HnsRPu2VIso
 h20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KUgxjWQ77+Jw26A5E2dK9Y6J+511lV+n9oG7cF3w+1A=;
 b=fmLH49QnYZ1HxZGNRc5ZhWqT6C2E3lInTVt765yus5/mFf/G5txtpuW4SOOIbyR+9L
 rgUJmudng4CRMCy1w113We6gr2NNv8GBc1fzfheYEqVZ82rFxJB9ms2VPCHXY6toVWBn
 bauLytEP5j95he8m15MIyS4Ot4M2H/yH6UPEzatQo95WaIUx/i+gte7GE51C0TxtLxA1
 +4FvFpLd4+GlR3W4OwDfkUlZ1CiCoS+kKe3q6BTsIYoKLfZYHgX1H1vYgUfxYyjFmRxq
 Bc5RZea/eDSZBZFy4nqmcr/pchBhaIExkzkU8F0AtAB5MhhfX5zCPMsPE5KM/KO7dnk3
 E5yA==
X-Gm-Message-State: AOAM532UVxnN9ehmz+6WrsIMGi20eh44hK2TcXKxOTrChPSlHhZn76fb
 awimmFxmfx8vA/fMIbQYV+n0/jBEpJmtUzr0
X-Google-Smtp-Source: ABdhPJzqWFs6npLEzn7hZvSYcXDlCi8499+K0oH49UbVAIfoRFgXmTCqg66qOPPbm2CByb8P2cHASw==
X-Received: by 2002:a05:6830:15d2:: with SMTP id
 j18mr15105034otr.75.1615823920009; 
 Mon, 15 Mar 2021 08:58:40 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h24sm7278548otg.20.2021.03.15.08.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 08:58:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] Fix qemu_strtosz regression
Date: Mon, 15 Mar 2021 09:58:34 -0600
Message-Id: <20210315155835.1970210-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Cc: philmd@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supercedes: 20210314234821.1954428-1-richard.henderson@linaro.org
("utils: Use fma in qemu_strtosz")

On second thoughts, using fma isn't the best workaround.

Let's just do some fixed-point arithmetic and compute the exact
result of the multiply.  This makes overflow detection simple
and obvious.

Round up from 0.5, because.  This fixes one testsuite failure
and causes another, so amend the testsuite.


r~


Richard Henderson (1):
  utils: Use fixed-point arithmetic in qemu_strtosz

 tests/unit/test-cutils.c |  2 +-
 util/cutils.c            | 50 ++++++++++++++++++++++++++++------------
 2 files changed, 36 insertions(+), 16 deletions(-)

-- 
2.25.1


