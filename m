Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CA73EDCC6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 20:04:42 +0200 (CEST)
Received: from localhost ([::1]:54676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFgyX-0004fJ-6W
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 14:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx5-0002XP-CA
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:03:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx3-0004bK-Mg
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:03:11 -0400
Received: by mail-wr1-x429.google.com with SMTP id q6so13316901wrv.6
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICREgosjl79r6d8x49A4C7JTGWN+7MdRwms8enSQfIA=;
 b=ux77/2C6mjdNp/vUo9iYF2vIDofnpaPnJlapq3TvgwfCBJ9iVEmYSCYHMJbCay5yQU
 HGolHPdnZ4Uo9s/jA1Jyil6aYE6SUQsnGnVQzYzire46u0l9toN7y6xOxVShoznVfYU/
 c1y0DwzPttR88lVWnTVItdQjdutLUXi188c0sjJj2HexDv8vEy/qqeiUXsUnmDRmQcZL
 nbwW6fQHxCLeF8N4ijD1ribguvJcll1rFbE21vele+CroxBZiiDSL1NhJvXLPLWOgj+P
 5enD81xaWFj12HLwP987S8Jd+DYFf2d3IvgzNB/BB41Bgm/1EQLqkHcrHzxTpzNUX11v
 eygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICREgosjl79r6d8x49A4C7JTGWN+7MdRwms8enSQfIA=;
 b=ilRL+1MPXxeGIRlyxOF+GLy61huCZnyYjgNhm/mW6YPipAfdMLH8IOtHZKW87F1wdO
 E6eDKBQ09uZqiiDNRvTQlWkgilRcsTh8Ozz3a5YV2R9pLdNYFq/ka9lx9zpNM3T0Vjoq
 auYJJFHIFrKeevrZJZlEzuStSTkGWrW0eiscViefzIBYFNfBEa/YSZAjZs1vQJ9O0Ujc
 ZXthvCJdmt1L0z+26Ia3/hPY/8Hp2bIg9grHFItMXN7QqBBu6+tsl0ecof8+b0NNVM3x
 4UzsXYC0iYs2xser9t5wJO+HXkxSUoQWEdy7jyJPtg+QGJBhYrJ3tu/GSOtnasAp2huK
 cFwA==
X-Gm-Message-State: AOAM530ui6CRb+NFehxnHy5sdG91aOUVChhuP81S12BjlzSB5CSAx5vS
 lLmCkMTub532xM5p7aJTVgKBOg==
X-Google-Smtp-Source: ABdhPJw1uuz24sDFOephvww8Sx0s8y22bms9h3rlc4SfnLMQDGbrv+oKEooLE8wGdHyLoCTd1m2Gbw==
X-Received: by 2002:a5d:4311:: with SMTP id h17mr19849245wrq.263.1629136987625; 
 Mon, 16 Aug 2021 11:03:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u16sm240053wmc.41.2021.08.16.11.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 11:03:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Implement remaining HSTR functionality
Date: Mon, 16 Aug 2021 19:03:03 +0100
Message-Id: <20210816180305.20137-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was going through some old todo items from years back, and one of
them was "implement HSTR traps".  We actually already do the
interesting part of this (traps of coprocessor register access), but
there are a couple of small loose ends: v7A (but not v8A!) defines
HSTR.TTEE and HSTR.TJDBX trap bits for trapping various bits of the
trivial Thumb2EE and Jazelle implementation.

The documentation for this is in the v7A Arm ARM DDI0406C.d, section
B1.14.10 and B1.14.11, but the summary is that these bits trap from
NS EL0/EL1 to Hyp mode for:
 * TEECR and TEEHBR accesses
 * JOSCR or JMCR sysreg accesses
 * execution of the BXJ insn

This patchset implements the last of the HSTR functionality,
just so I can cross it off my todo list. I don't expect anybody
to actually be using this :-)

thanks
-- PMM

Peter Maydell (2):
  target/arm: Implement HSTR.TTEE
  target/arm: Implement HSTR.TJDBX

 target/arm/cpu.h       |  3 +++
 target/arm/helper.h    |  2 ++
 target/arm/syndrome.h  |  7 +++++++
 target/arm/helper.c    | 35 +++++++++++++++++++++++++++++++++--
 target/arm/op_helper.c | 16 ++++++++++++++++
 target/arm/translate.c | 12 ++++++++++++
 6 files changed, 73 insertions(+), 2 deletions(-)

-- 
2.20.1

