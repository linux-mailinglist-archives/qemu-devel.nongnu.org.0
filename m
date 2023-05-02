Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07FF6F49FF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:58:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvCB-00052X-Ra; Tue, 02 May 2023 14:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ptvCA-00052A-6i
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:57:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ptvC8-0002Ar-Hs
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:57:49 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso43565745e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 11:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683053866; x=1685645866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vndw2eMh0yfeEeXEe2QijYmw64Ibmm18Jr5KHQSTkwg=;
 b=H9JVvHpr+Gi2tcJxdtd8JJHc9P8Y+17r53kYZugJOTq+EKNUxyseK/+8IGwzFpHr66
 d22LpCsiGMSN8AIpfbxyqxoIlmbe+sepAlSgwsxPillKpVLA8EGC5dAHw3IMXFxwxejR
 TlyklhHEbYcGSdqzI2iAunPcEO+SVg5CuK3t64BcDDM+vT0A1YH+7vclzgScXmdxms7a
 Thd7bBATAznUBvPH37I0Dm0vijtnBshcBOf4L9uruSP9EJcX7VzAlG4GidORmNLRjd/W
 6O7yyIhFs1gwYpjIsym1LLaaYSrasypIDV+E3nt8ArbR4ITjGl0GGvzdGdI0iot2E9ID
 oKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683053866; x=1685645866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vndw2eMh0yfeEeXEe2QijYmw64Ibmm18Jr5KHQSTkwg=;
 b=PBvi8kjQUkrWa0WQSatCWaYR54/99RM8GixNbqTCUz42625BU5gytxcTUWtDmC87H8
 prbEbbdrJXPwUABOtd/vDpdM5bdL7SOd79RGAFxLUxOA8m+XKpTkyR8nMFnT29spJh0Q
 SLDHw+m9BHcorQ8XopzNvh1qVU3rqwYkub1HiVP9syObMrd51mlLDgm9NOIYIA9NkT/f
 hAUzsFugr/iybg1Dyg1GwTI65piZkdOy4NTxCR+ohpm1gJYbohMgjVSXT9cqlkv0NFsz
 b//v+lQXTvxNfDT6ADQAtJaNkL00TeL51bp6yheOA1M3uHJ9yq6wHhURlSdM514KW0yC
 AmKA==
X-Gm-Message-State: AC+VfDxYcilIhHO+Bin7s//oaOhrCtu/0VSxkG1KvPkQ8zcqoAx1yL/T
 9Cvpefp7EyGSEAJHq1kIkpjpNXVw0Bs=
X-Google-Smtp-Source: ACHHUZ4bFRE/maZDnUvlfnh/XXES59TIPwoq77XHt5oMAJNW12K8SOgtfm+cHErCYc9Kyxz0jyhBKw==
X-Received: by 2002:a05:600c:2046:b0:3f1:9503:4db0 with SMTP id
 p6-20020a05600c204600b003f195034db0mr13098687wmg.13.1683053865722; 
 Tue, 02 May 2023 11:57:45 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b0030633152664sm4002354wrt.87.2023.05.02.11.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 11:57:44 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 0/3] OpenRISC updates for user space FPU
Date: Tue,  2 May 2023 19:57:28 +0100
Message-Id: <20230502185731.3543420-1-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series adds support for the FPU related architecture changes defined in
architecture spec revision v1.4.

 - https://openrisc.io/revisions/r1.4

In summary the architecture changes are:

 - Change FPCSR SPR permissions to allow for reading and writing from user
   space.
 - Clarify that FPU underflow detection is done by detecting tininess before
   rounding.

Previous to this series FPCSR reads and writes from user-mode in QEMU would
throw an illegal argument exception.  The proper behavior should have been to
treat these operations as no-ops as the cpu implementations do.  As mentioned
series changes FPCSR read/write to follow the spec.

The series has been tested with the FPU support added in glibc test suite and
all math tests are passing.

Stafford Horne (3):
  target/openrisc: Allow fpcsr access in user mode
  target/openrisc: Set PC to cpu state on FPU exception
  target/openrisc: Setup FPU for detecting tininess before rounding

 target/openrisc/cpu.c        |  5 +++
 target/openrisc/fpu_helper.c |  4 ++
 target/openrisc/sys_helper.c | 45 +++++++++++++++++-----
 target/openrisc/translate.c  | 72 ++++++++++++++++--------------------
 4 files changed, 76 insertions(+), 50 deletions(-)

-- 
2.39.1


