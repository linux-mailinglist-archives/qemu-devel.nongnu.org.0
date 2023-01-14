Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA266AEB9
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 00:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGpb0-0002Px-Sq; Sat, 14 Jan 2023 18:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGpax-0002PF-OE
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:05:51 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGpau-0000Vy-R2
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:05:51 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 q23-20020a17090a065700b002290913a521so8253458pje.5
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 15:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b+a/2lNYGJHj+1lsRYDGOwjtt5BG5Srn2sTC9/QHKU0=;
 b=eQxeZTb76SOPWBqnjG7ZMIptfhfsjivn71jjbnE6FCqRoXO2Ong8w3gYRfXTbpg/DG
 5QS3dvxQxh2D3UmAuiu7R1Wkl26iZph/7vV8S61uH2M10hJlHTqp9U8MPAZBxINvPTtr
 cIeSAuDaqTHqB3jEJJ0EqFtAF65sIkwI9Xa8hZ0pS9LPeyT0LX30EChSQY+vOylm9Cbi
 8M8WESCBZdO47LiIOSN6wozViA2AWvOEXAbu6xfcSib17xes1G47n+OjckaQZ7yyY6mm
 knm/FAoQbC4MdU7QtQtgsb/uHosnsVdLF2Qeyae1MqjdOmnrmk/yB99/YhBJ13GzJgcR
 h8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b+a/2lNYGJHj+1lsRYDGOwjtt5BG5Srn2sTC9/QHKU0=;
 b=EArQlPktqNOjQhikdWNBfQNBNtdE2mJrx4pqELcqplxNcvwnCi++l7HlUO/bqi+zcv
 HH3tn6VZ8JwYsZyHr0GlU5lz2pDHCkm6wVRRO10T2m2hkjbvwrZI145OJWhXvPHsNsp1
 9xfaiO7sS4Em9bP/cVSnVNdMK5ScnZYqkqvoF1pqxzpQK+RMxxNFT2bFgEacUGFfa29t
 djoo0IydKut4osGpBxnqxv3WM1gqTyOAQX2Ba+Il59lIc6k3Mx5LNHtYMFwnE7CWKx9x
 Mg7ZfUQ0R1WDuQkhxV3ONCuu1du+NO6SgiRx+5kEPRMngpZIQ5yxiXD6Q+r4/H5PaGMi
 ZEsQ==
X-Gm-Message-State: AFqh2kr0K5JAZg/7m/4t/wFkSSkCN96DTjdAfKS8UCVA0+CIgBkvZGD+
 LjvcEVFjo/ZJILKborYoO3tzOkO98GMqrgVB
X-Google-Smtp-Source: AMrXdXslOfU8jXdaAv2ttEmZu+42zKs/uhv+JUNUm/eBci6KE89oIUCnT5K/Yo5O5F2f3zvDeOWTlQ==
X-Received: by 2002:a17:903:214a:b0:194:4483:bff6 with SMTP id
 s10-20020a170903214a00b001944483bff6mr16384606ple.68.1673737547118; 
 Sat, 14 Jan 2023 15:05:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a170903244a00b0019334350ce6sm12331390pls.244.2023.01.14.15.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 15:05:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH 0/2] target/i386: Fix BEXTR instruction [#1372]
Date: Sat, 14 Jan 2023 13:05:40 -1000
Message-Id: <20230114230542.3116013-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Fix the instruction, and improve the test harness to better
handle 32-bit insns with 64-bit inputs.

r~


Richard Henderson (2):
  tests/tcg/i386: Introduce and use reg_t consistently
  target/i386: Fix BEXTR instruction

 tests/tcg/i386/test-i386-bmi2.c | 194 +++++++++++++++++---------------
 target/i386/tcg/emit.c.inc      |  22 ++--
 2 files changed, 116 insertions(+), 100 deletions(-)

-- 
2.34.1


