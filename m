Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9350B6BA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:02:52 +0200 (CEST)
Received: from localhost ([::1]:44732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrzv-0007lv-9k
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhV-0004SX-Fy
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:49 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhT-0003cH-Tv
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:49 -0400
Received: by mail-pg1-x530.google.com with SMTP id k29so7110558pgm.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0N/NbCZ9oznwg/tR3/DJSoxnseZf1s3iStz7vVYP/F0=;
 b=oDXgxUsPlV1C1sFivD2cIn3x6YhFJW2Cad+E6v5JiexjxzA9a2i9oCZqbZJ2RXvD9H
 VZ5XYB1ViFnxJTFmCo5lr01tJUMXDuB1A5guVopQYDLQFMXJhTBazwDpMyYKb6+oys0p
 hPY+SBuZ+ju+O+aeW/LDeyQ7gJUSfpWyps/chXjjO0NDeb59cF+ZEKWB1Iiq4SaJTerK
 RhIjFRWPo3xoPAq7bxDKF3idxkcRlZtU3ShQgO+rM2qnhNEopOwAPf52mltUjWH5BMra
 50NOjDPJY8YtnRtGiNM0lPOfytHxzOZmMSKzFYioeGXThJL3l1KIJvxRBs1+bUydUFYz
 txcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0N/NbCZ9oznwg/tR3/DJSoxnseZf1s3iStz7vVYP/F0=;
 b=8JS1C/rqsbLMPK72YxWpzG1KFq2MfmY7h4WWTFRjj7zKBkddjQrCrE8HkqZWGBe30s
 0McG9uq2ChP0PjO0m+zndEVuusTHbiPGpPAs47Ph/0qDA8tp+YwIIBfku9l4gn66uvKW
 HL/kyLpbWTL4GEUu1M2vNv9WoMRrNJSsN/rRrKS1oW5iN8VbMOJuj6EJBOL0GgbgKfVm
 Pc+FY1HcTa3ismbQsbHRTonhjgpoeTrmBIkfTqN6QBUnEKriFJInzSnVDKOTm2wk/m4V
 Tm2J9DZdkGtjob5PAIb0xX32mmjuHHbnFR8wBBrViSle1CpGdhb5P3/pFMjxfAzOLRrt
 gK8A==
X-Gm-Message-State: AOAM530Phs4NpFv6CxKCfp5iUp7r7X2XkrkrkeceehLFz+PHn6rebhIQ
 YX+eQA/GT8b2Q792gP/pnXjcZCW5JqE=
X-Google-Smtp-Source: ABdhPJyFGACEzObUN7OFZ3y88aM4tSS3rKtZKjn2f16Z5u9cERvqC944SGdsQc2ggT1q1pw+XXFrXg==
X-Received: by 2002:a63:df4a:0:b0:399:460d:2da with SMTP id
 h10-20020a63df4a000000b00399460d02damr3502436pgj.315.1650627824836; 
 Fri, 22 Apr 2022 04:43:44 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm2706519pfj.79.2022.04.22.04.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:43:43 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] target/xtensa: use tcg_constant_* where possible
Date: Fri, 22 Apr 2022 04:43:25 -0700
Message-Id: <20220422114332.374472-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this series replaces tcg_const_* with tcg_constant_* in the xtensa front
end.

Changes v1->v2:
- also use tcg_constant_* for PC

Max Filippov (7):
  target/xtensa: fix missing tcg_temp_free in gen_window_check
  target/xtensa: use tcg_contatnt_* for numeric literals
  target/xtensa: use tcg_constant_* for exceptions
  target/xtensa: use tcg_constant_* for TLB opcodes
  target/xtensa: use tcg_constant_* for numbered special registers
  target/xtensa: use tcg_constant_* for FPU conversion opcodes
  target/xtensa: use tcg_constant_* for remaining opcodes

 target/xtensa/translate.c | 171 ++++++++++++--------------------------
 1 file changed, 54 insertions(+), 117 deletions(-)

-- 
2.30.2


