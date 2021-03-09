Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B634332C24
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:32:41 +0100 (CET)
Received: from localhost ([::1]:50754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfHk-0000CS-Dc
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefW-0004cb-PO
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:10 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f]:40117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefV-0001Bq-1I
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:10 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id l5so3141262ooj.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W14unbYsNxQ1Va38g+npA6Ct860YaOiFCU0ExYMrSII=;
 b=esD8E35ZJqmJeIWUYcoLpnvh5fT950Ojq4nVPtntQ8u8Di+bwpvSpMEt+LIZipAXj8
 INigbQIIlKUIudUPpoJGb2hhf9fx+HvIQcPYnU0pjqphFzDQSkCWr50dfTABFUG3kQXL
 JJWnabYsxd90Gc2Vd7HImtnV6046eckNL0U74YrXl4oNS6tg96hnuhlDgYYpHPnCr3yo
 azhCeSPdNPMr4u/KXX3ybGM8A1ScgcYkqKK0E5+rFX4Fxqh5liO+ZJzfZ7m+b8xXYCsE
 CdECEI4orWLjLnBBQwzc38EOOH1L7Va4afQN1seJ7cKOKx538J6xdf8xLcPPTCTIONmL
 bXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W14unbYsNxQ1Va38g+npA6Ct860YaOiFCU0ExYMrSII=;
 b=aqo5c+rqPl2Fx8v20Rws48IKZ7fJrmB7bjpAwF5rOryJWJSBs6wEmmGhw5KRVaEMb0
 DQHddPUmo4A/MKX78SCmvdlcIAC9F02j8cSXFA76C+fG7mMOMw9qdYP+iy9Win1AMw4h
 4M6oyZHKmcge68jdZnn0sijXqbUFif7Ao3NtAvxYtcQfi+MuHLvHzXUA6PABnrwVYAJ8
 QRtxBkVGdJbEdq2fJDTVql4aUk2pK9SI3zgd0dOh64B7ivpPNRKw7Bqh3SeM071JWWfv
 bnw5Vlu+Vz2F/wD9XJJVxlbbhg1MNDVhuL1NHfly5Lh4x65DI07CepKzvVO9sUhGJZIA
 JS5A==
X-Gm-Message-State: AOAM532rrN8lIwoI8uV505H5s+EE4w5dT33AI6qxA/CnB+iHLYWNSp6V
 Sac1SXP1mjgLNTl+wI/61/1Kc5JCEhKLjC6I
X-Google-Smtp-Source: ABdhPJyPz/6JiOsB00tepMobuAYWqENwXA3l3HRCNuXCVH4Uiovke5F8XIe6YYrRoaEIiQVbQiZ42A==
X-Received: by 2002:a05:6820:129:: with SMTP id
 i9mr22618434ood.80.1615305187750; 
 Tue, 09 Mar 2021 07:53:07 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:53:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/8] target/arm: sve1 fixes
Date: Tue,  9 Mar 2021 07:52:57 -0800
Message-Id: <20210309155305.11301-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Three of these have been hanging around on a queue for ages;
the rest are new.  The WHILE and reduction bugs were found by
RISU triggering an assertion on 384-bit (vq=3) vectors.


r~


Richard Henderson (8):
  target/arm: Fix sve_uzp_p vs odd vector lengths
  target/arm: Fix sve_zip_p vs odd vector lengths
  target/arm: Fix sve_punpk_p vs odd vector lengths
  target/arm: Update find_last_active for PREDDESC
  target/arm: Update BRKA, BRKB, BRKN for PREDDESC
  target/arm: Update CNTP for PREDDESC
  target/arm: Update WHILE for PREDDESC
  target/arm: Update sve reduction vs simd_desc

 target/arm/sve_helper.c    | 107 +++++++++++++++++++++----------------
 target/arm/translate-sve.c |  26 ++++-----
 2 files changed, 73 insertions(+), 60 deletions(-)

-- 
2.25.1


