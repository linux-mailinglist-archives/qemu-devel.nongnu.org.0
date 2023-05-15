Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2010A702885
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:28:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUJ-0004bj-BS; Mon, 15 May 2023 05:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUC-0004Xk-2k; Mon, 15 May 2023 05:27:20 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUU1-0002qJ-P8; Mon, 15 May 2023 05:27:19 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64ab2a37812so18406572b3a.1; 
 Mon, 15 May 2023 02:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142827; x=1686734827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=odlaEl9O6MDD9/bUH3sF5PNvEPDJSP6PZ+nY/sbB8zQ=;
 b=UKEaB449G5IhsKzfjf1qyFvaUJhZCAnxTLM7uHV/xvclXJi5DsEHqvFBVpcSkZ5KZr
 ZkOR32TtD83ZbyKraZpoq7VkXcFO78liZtAyVm4TZ3K+6O2OD+jQPdOcTWOnmMvx7fEw
 oFELqRCriTcEQqi8LJC5VBd8dm0TE9KU08CnSUw+9l1pZ4FvUa/lvBrotVgxBpi7B+hr
 ulGd4Lc5JkTgx7Gcvp/1soNtSRqPdripXH35RILuLkhefbxlIQhNCHenmd5yJFiJhK9+
 LL46l8V25emdb7zT5eGdbdiFKWzPXbrx1uU+mK+EItYlv49bn2nwX77v70ivrOl96xvq
 rKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142827; x=1686734827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=odlaEl9O6MDD9/bUH3sF5PNvEPDJSP6PZ+nY/sbB8zQ=;
 b=b5aqZTfTTdMB/6+zGGKkNT2Gs7gNNboJDQKSbFAC5L8yK61dD3e0zaVfxd3JIbIq9j
 T4/znSnunmIs63xSQ1xOijX09wnJ+TUif7QTFB+ooA4L9u8Z50ImN/3bXOlDW3Ql1u0w
 T2VA1db2z6IiUFE9K+rhz2uxhKSpAy7kZHBjiJB823oVni6nNYgZ/CrOgNkjTmr8CDhb
 26kNkeVUT6XrI/INOe1AK8Fpx/JNUOTW5Hrz8Xy9+zd8i0vZ2a0zNvOtEewnFQPWlLz6
 s4q6U3CGOXsjTwwyS3wK5j/me6hg6EF6lWelvkXvMJM00iGRZyqDtQNx6V0EwvKhtzE0
 tOaQ==
X-Gm-Message-State: AC+VfDzWrTthiJlnbxZkNwKil4bRLKFWHHsNu4T0KHTtWQTlwaPHLX5i
 FlfMvihp+0HeGkJMYZZKN7zFRySeeP0=
X-Google-Smtp-Source: ACHHUZ7VerUgsGfrfMhXjpVWshTlUlnbKfODCesRa30IFvrKVIqfODAOSutCOp+BFk5Ij2e9q/O7JQ==
X-Received: by 2002:a05:6a00:2341:b0:648:a518:4ac6 with SMTP id
 j1-20020a056a00234100b00648a5184ac6mr21404005pfj.14.1684142827435; 
 Mon, 15 May 2023 02:27:07 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/9] target/ppc: Assorted ppc target fixes
Date: Mon, 15 May 2023 19:26:46 +1000
Message-Id: <20230515092655.171206-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hopefully these are getting close to ready now. There is still the
question about doing better with adding test cases for all this, I
haven't exactly got a good answer yet but I do have kvm-unit-tests
for most at least.

Thanks,
Nick

Nicholas Piggin (9):
  target/ppc: Fix width of some 32-bit SPRs
  target/ppc: Fix PMU MMCR0[PMCjCE] bit in hflags calculation
  target/ppc: Fix instruction loading endianness in alignment interrupt
  target/ppc: Alignment faults do not set DSISR in ISA v3.0 onward
  target/ppc: Change partition-scope translate interface
  target/ppc: Add SRR1 prefix indication to interrupt handlers
  target/ppc: Implement HEIR SPR
  target/ppc: Add ISA v3.1 LEV indication in SRR1 for system call
    interrupts
  target/ppc: Better CTRL SPR implementation

 target/ppc/cpu.h         |  1 +
 target/ppc/cpu_init.c    | 41 +++++++++++++----
 target/ppc/excp_helper.c | 98 ++++++++++++++++++++++++++++++++++++----
 target/ppc/helper_regs.c |  2 +-
 target/ppc/misc_helper.c |  4 +-
 target/ppc/mmu-radix64.c | 38 +++++++++++-----
 target/ppc/power8-pmu.c  |  6 ++-
 target/ppc/translate.c   |  9 +++-
 8 files changed, 164 insertions(+), 35 deletions(-)

-- 
2.40.1


