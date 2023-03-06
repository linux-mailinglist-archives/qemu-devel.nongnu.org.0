Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90F6AB475
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 02:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ06H-000482-R1; Sun, 05 Mar 2023 20:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06E-000464-Su
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:14 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06D-0003Hy-3p
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:14 -0500
Received: by mail-pl1-x642.google.com with SMTP id p20so8611089plw.13
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 17:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678067831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wHs/bH1luqdLkjJy4I5mesCZM/XI8jWuxWxyW0Pam5E=;
 b=LBl9nwMwcKoTEF6dKIrBfuhWAA6evD6yzpCCbslSSyLZ9GI6JZc81J2GyKO6zW+3ET
 9/lsdOqJTb3ato93qYgznWB9Dpx8aU9c+NlosHTBDuRW/llBvE7V/Ozo3ghGjbUNvgtk
 WHN19ycyENZgmsUUI3UnQHYtP0J0jeq7iGFMqZWLLFNA37I0JiqWkAC02Nq/3D2SOJ4O
 vz3F5pwOtHaU5Q+2syQsqC36/Sh4Eo1+h9U7PhmYg8aStghjNmM81FrErfMzeo0sVZ3G
 BR+jtyVvP8PVQ1W1N9ZtejzI4K/wOOI5/Rll+RV0p63T4R1magsaOQwTQK+ze1enimi2
 uuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678067831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wHs/bH1luqdLkjJy4I5mesCZM/XI8jWuxWxyW0Pam5E=;
 b=ZlwO4knMCbjHaMoApOHvTkLiYa62lInjXrDO7uPp+4wuNHqORur4t3v2DsVv8gH1b7
 nWTp/X0BClPVI6KeA8w24Bq85R34nHhno96h9hJbbbF7BIRXhFuXSPbMZSZ2EiEbyo66
 /W5aPOjI1paXWcn/Ai4dzTXuV4tcR759iwwHsViW6sFUHufLhI4Gj6a6+9HZ6pph+GQ7
 xKD88uJfpFNLlZE9/IAwpKmvfvKvt+cKfsnY0sH/zsxGCqqcrNA1Z0fdiGSffPB6XAa2
 rmemy0ix6Sx9wZqaw3D85f/8UcHtRTf+dgGLqlAqos/k2fwbmnqLP0xpUBzlU+gjoFr4
 BWJw==
X-Gm-Message-State: AO0yUKUctY+JQt9EJ4sIP41lYi7jqL9dWGQ6263Lf4BHD1pVBhR4uLaL
 KOFbtRPeS5mhJMEOoZ02n6oW0x+M5nIgx73O5jKzzTX4
X-Google-Smtp-Source: AK7set8QlFSTIiWSFq608Gk2CrcSmow4ErWxgp2bK5pLRrA1SmVVJVDVNoijRLqJyVEZLHQ3CSUljg==
X-Received: by 2002:a05:6a20:3b03:b0:cc:3bf0:ed91 with SMTP id
 c3-20020a056a203b0300b000cc3bf0ed91mr8315557pzh.51.1678067831516; 
 Sun, 05 Mar 2023 17:57:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 g23-20020aa78197000000b0061949fe3beasm2921056pfi.22.2023.03.05.17.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 17:57:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 0/5] tcg: Issue memory barriers for guest memory model
Date: Sun,  5 Mar 2023 17:57:05 -0800
Message-Id: <20230306015710.1868853-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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

Version 1 was very nearly 2 years ago:
https://lore.kernel.org/qemu-devel/20210316220735.2048137-1-richard.henderson@linaro.org/

I didn't persue it at the time because at the time it didn't actually
fix the s390x-on-aarch64 problems.  I'm re-posting this now because
of Paolo's "missing barriers on ARM" patch set.

It was never very easy to trigger the s390x problem, but with the two
patch sets I've been unable to do so all day.



r~


Richard Henderson (5):
  tcg: Do not elide memory barriers for !CF_PARALLEL
  tcg: Elide memory barriers implied by the host memory model
  tcg: Create tcg_req_mo
  tcg: Add host memory barriers to cpu_ldst.h interfaces
  accel/tcg: Remove check_tcg_memory_orders_compatible

 include/tcg/tcg.h     | 34 ++++++++++++++++++++++++++++++++++
 accel/tcg/cputlb.c    |  2 ++
 accel/tcg/tcg-all.c   | 38 ++++++++------------------------------
 accel/tcg/user-exec.c | 14 ++++++++++++++
 tcg/tcg-op.c          | 19 +++++++++++--------
 5 files changed, 69 insertions(+), 38 deletions(-)

-- 
2.34.1


