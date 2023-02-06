Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1968C6F2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:39:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7Jj-0004nA-Bw; Mon, 06 Feb 2023 14:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP7Jh-0004mw-2G
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:38:17 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP7Jf-0005U7-Fz
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:38:16 -0500
Received: by mail-pl1-x636.google.com with SMTP id e19so5380603plc.9
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0q60s5JtYRzXWJA/mIjLMUaaUnLiACsxKZ6xNlH4bSU=;
 b=JdVrbWonCJsy1p9wUrXL5OU1r9tvHan5Ctu2rkutwDbmfdxgnnDN2rwpzVWp1nSHwS
 r9GJ6JAM5NWHUMUaCG6+AkcNX63JfCAwPhjKKHFB4DHVsbwemQ1q6FLSnKsCDoZKo2kz
 Y7Po6tunvcx1jel00aiNnIDwhZM392dOxVhFfQLi4vownmqXUEaOnQV5HpUevJ11bGk9
 mvGXEW/5pvQa4m0FmHCDqdAUBwEuCEqYR9NC5/Kbh3U7Q7X3WKg3iNzQbqsHq4WthnpK
 Zs1eLJ0gwz90C+jhuBKZsKZP+s2NeXpnEipGGwblhQ/tQ/Z5An8YvteQIy8Ct5mW4OWz
 YBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0q60s5JtYRzXWJA/mIjLMUaaUnLiACsxKZ6xNlH4bSU=;
 b=kOwmeEuGwOnILcOJanznS6oDcKwes9HrtoDgSvG5QmI/4dEGtTD9QNxl7aNRv3hKFQ
 xkyVTuxB9oa7ZovBNi7EU70k8DHhiyrTvBldh0E0300zPxzvFZBxx3dCWRIrRC1pmU7X
 Iy0R1HPhXsk4MbbljQ3Q6QexQBM8Z0XndFToAVNhIZ9GtHiAFN9D7Tt6pA6w16R39gOC
 TXxLo0B1wq2Qvoisnw/c+sfft28bPPMW8jCDcqBOHNroZN30Y1Co2e0lAPKShppjqqwB
 hnBNGyMA9u2UHS2CmoXSKdX2XPfys+CYCVOd+dZ7+qrppq+9EqWK7zghVd06ItACMMjl
 PRug==
X-Gm-Message-State: AO0yUKXvGwoaLpmWhtAJ5H9VMG79biq8B69aL2UTxeFlIolpJG3et3ON
 sVGNpZi028IMmlrIYePZXEayQxJPUpiwBje+0PmHgA==
X-Google-Smtp-Source: AK7set818nPC1QjEB5GXE2ukyyMMWEGwKieqb5A6WKm7Lqk0CECSMnaWwtxXgr54sT+itYZ0Q/QAaQ==
X-Received: by 2002:a17:903:1cf:b0:199:1f42:8bed with SMTP id
 e15-20020a17090301cf00b001991f428bedmr725616plh.12.1675712293429; 
 Mon, 06 Feb 2023 11:38:13 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a170902780600b001929f0b4582sm7190058pll.300.2023.02.06.11.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 11:38:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: sidneym@quicinc.com, mburton@qti.qualcomm.com, bcain@quicinc.com,
 mathbern@qti.qualcomm.com, Jorgen.Hansen@wdc.com, Ajay.Joshi@wdc.com
Subject: [PATCH 0/1] accel/tcg: Allow the second page of an instruction to be
 MMIO
Date: Mon,  6 Feb 2023 09:38:08 -1000
Message-Id: <20230206193809.1153124-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Curious but true: two independent reports of the same issue within
24 hours, one with an x86 guest and one with an arm guest.

Neither report included instructions for reproduction (and both seem
to be with complex setup), therefore this is untested, but seems simple
enough to be the proper fix.  It matches up with

    /*
     * If the TB is not associated with a physical RAM page then it must be
     * a temporary one-insn TB, and we have nothing left to do. Return early
     * before attempting to link to other TBs or add to the lookup table.
     */
    if (tb_page_addr0(tb) == -1) {
        return tb;
    }

in tb_gen_code().


r~


Richard Henderson (1):
  accel/tcg: Allow the second page of an instruction to be MMIO

 accel/tcg/translator.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.34.1


