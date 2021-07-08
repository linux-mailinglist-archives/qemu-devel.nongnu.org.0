Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BAE3C1ACB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:01:58 +0200 (CEST)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1b9h-00013p-5U
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1b67-0006Y0-1a
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:58:16 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1b62-0004cq-DQ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:58:14 -0400
Received: by mail-pf1-x436.google.com with SMTP id x3so3066934pfc.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gppYG5Ouldb/pnbePYI5Qy07GDhe1hhSfhFE/pu3Mls=;
 b=EzCQo9lEp467s+p34yc/gYJDCWpipfpodbsAf3FI0BiYm3jtoINoKCZkPqND257aXz
 DIDkQzwXmFI9C4p6toalfoNiazsYOO1UoVpdicfXPXP9D6oBIO4rQFpr212pwSRyzPmN
 YsI1dqgjhRlc0qIHUn1S0vsVWJ2Ke1ikJt8+RGNvk1glb8M5wD/HQfrN2rEMx5dqTgJ6
 zp+QMsyMLOlKYlnnqRr5fEsNNTDteokO1N1dBpgq7AbkL/QRYE5A+pCBzRMXSnLAGAk4
 JA2dOIScr4mkvTSfOInSz6+o1/9CNmDFqBSq4FDpl0p0bxm3X08rQLbyx814OqoSOMJ3
 lktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gppYG5Ouldb/pnbePYI5Qy07GDhe1hhSfhFE/pu3Mls=;
 b=W8HTGQWUOrSIbLhd5PyF6frzyRvgCBb7BXiW7ZIxSOv/Q+1FK3RXLi9a5lkdlS4QjE
 EOvKedfs9nY9dLsycQm/uzPNVugwmru7jnDLpv9rDbH14l5JGLHCfLDMIrloans4WoPM
 GZlsJHEbOrGAIwvWa6CKU8rNBCR/ScJLAOdMhOGsCPctRvQ3G4OQANLnwLIx7Orw5Wh0
 G99FHXqVN5BUkmj5dlq5ivOipHp9GHoSgOVdrCFtu5b7v8Mm9qjYDji2fg74qdVYfSjF
 tUVD5yA5atnHFmGjPtZYiNT5pwHt/QGH2Y4RxXUtu63yo5JW8ICka8GP2VEr8VVDQLFn
 w5lw==
X-Gm-Message-State: AOAM530vNYdSTrPYmHVHzOBhXexnRNvb25aYMe9xiyuII+DKBUYX6JxG
 VjLI1Y/Et/zTQl1b9V4Vs63KFaVWJcYiiw==
X-Google-Smtp-Source: ABdhPJx2PyWJU59j/eOEPMoZzpJPsoMhrJivyiydHQ5GRK+ONSZTmiPZL+BqDWWOO61FOBXHxExNww==
X-Received: by 2002:a63:4b49:: with SMTP id k9mr33301607pgl.87.1625777888800; 
 Thu, 08 Jul 2021 13:58:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z5sm3757000pfb.114.2021.07.08.13.58.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 13:58:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/hppa: Use tcg_constant_*
Date: Thu,  8 Jul 2021 13:58:05 -0700
Message-Id: <20210708205807.827147-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Replace use of tcg_const_*, which makes a copy into a temp
which must be freed, with direct use of the constant.

r~

Richard Henderson (2):
  target/hppa: Use tcg_constant_*
  target/hppa: Clean up DisasCond

 target/hppa/translate.c | 99 +++++++++++------------------------------
 1 file changed, 27 insertions(+), 72 deletions(-)

-- 
2.25.1


