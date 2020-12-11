Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917BC2D6D44
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 02:23:03 +0100 (CET)
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knX9C-0003ae-JA
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 20:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knX1O-0007P7-NX
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:14:58 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knX1N-0003FE-6s
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:14:58 -0500
Received: by mail-ot1-x343.google.com with SMTP id w3so6817621otp.13
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 17:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wVvF6x3OiQJye84q4NWJA8wFFM48PlXHmUL0DkgkdC8=;
 b=MCxRwZq74KLdDhKZQhtWtqFEUl8UFi9qyciRbfW83QrwCuuVTowizd4jbv7bBjXlWU
 t2NxlFbwwdZ6CKPqu7F685L/RldH4Atp7HidM9rV2c+asSROq2rTZuDZi2LbIGMGHtyw
 eTbblahFlnJGrDWPBmbdhErCAwgVWS6zaSHHi4RGh2/K1Dz8UtEnYLLE5hX+JZ5tBJvf
 acB4dNm0sNtso/Oo4HM8fEtPHDEXMEWaZ7eTwTKf5ekRWKY2PpkCSe5si5KVpXt1ZgCQ
 qLv+49Az0jFs8fwuQlZK98NcoyzLwTog7g7z+UAM8xGTPxHVrq2r3pHl30D3PI1dgz3D
 fZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wVvF6x3OiQJye84q4NWJA8wFFM48PlXHmUL0DkgkdC8=;
 b=ENMzqd0tzYKl4eUUCXEdSXNrH8R6QmqavlNBS/apecJASVbzTEOGZRu9+QujBPG5bO
 wzwl+jal/7M4lPwsyPmiKSGl8PUG+uS4WskHkPTv9f0Tur0GCbbVfePirluVFRja4+EQ
 m/6zCSmTuHwp9pK52NdQPMawITAp60TXrk+X0jzFm8K64NHcA66sZqPVqv1E6XdAKL0T
 AbSJVwOhCgbna4h5okiz3pFMtDy16f8LsqB1WxPJnUWGs2kqtpoxIog5rKu6Fa53qMdc
 sWwQBdIOtSBcYln1TBrkGd5kx01sCR1b0vUigQD2UlGAWZoyYG+vxhVs0XBCwz5C7/Kn
 MwUQ==
X-Gm-Message-State: AOAM531926+KdY8iaRLgxnsm1A2L5YaJZEFabB+hyG0B7cM7KIWXw6Td
 YqLheh7fZ3H0bqoGwiaHdkfuSuYPIV/sjebO
X-Google-Smtp-Source: ABdhPJxRuk4D2bMfH45FfWp3NA1J4LXNrGn+l6jo4kiRw1ji1VXw6iyut3utUmDMFxBEyi83wfmeNQ==
X-Received: by 2002:a9d:2287:: with SMTP id y7mr7840897ota.137.1607649295717; 
 Thu, 10 Dec 2020 17:14:55 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h93sm1495135otb.29.2020.12.10.17.14.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 17:14:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tcg: Eliminate scratch regs from i386 backend
Date: Thu, 10 Dec 2020 19:14:51 -0600
Message-Id: <20201211011453.475155-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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

Eliminating these cleans up the backend a bit, allows the
code generator more freedom to properly place the inputs.


r~


Richard Henderson (2):
  tcg/i386: Adjust TCG_TARGET_HAS_MEMORY_BSWAP
  tcg: Introduce INDEX_op_qemu_st8_i32

 include/tcg/tcg-opc.h     |   5 ++
 tcg/aarch64/tcg-target.h  |   1 +
 tcg/arm/tcg-target.h      |   1 +
 tcg/i386/tcg-target.h     |   6 +-
 tcg/mips/tcg-target.h     |   1 +
 tcg/ppc/tcg-target.h      |   1 +
 tcg/riscv/tcg-target.h    |   1 +
 tcg/s390/tcg-target.h     |   1 +
 tcg/sparc/tcg-target.h    |   1 +
 tcg/tci/tcg-target.h      |   1 +
 tcg/optimize.c            |   1 +
 tcg/tcg-op.c              |   6 +-
 tcg/tcg.c                 |   4 ++
 tcg/README                |   5 ++
 tcg/i386/tcg-target.c.inc | 138 ++++++++++++++++----------------------
 15 files changed, 91 insertions(+), 82 deletions(-)

-- 
2.25.1


