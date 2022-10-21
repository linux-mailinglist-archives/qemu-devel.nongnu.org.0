Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072860755E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:49:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpaj-0001Qq-Tk
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:49:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmVH-0004W0-JS
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUf-000443-S1
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUP-0007qW-7V
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id f9so1572980plb.13
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uvsSfRao/JteQKdyw1PRyjy+hQuSwq6uVDsvRSMSe74=;
 b=tzJnFZGbjbMtvqQ7e6cFvFsf9t9nGYaa50GXEmMERtc7Pkg5vLcJbVC5vneOypQC70
 SVpOfk+0HLeM3YQch1ioPHfqu18KInDQRMzaDK0QjPG9QRyVDAdiCTL2xgWJSBvezlfr
 Fe0sdo3MncssMjEOyY1S4k59rv57creXvNrGQg9prEBx035hfk32aGw+h+Jngh3KKUL8
 /r9gSaDSg2kYxGsEKvibf4NEPqt8duW929uawmaBOu6wOTjalUh6FShSob5lJmuZ80xQ
 yPoTJ1Zksbn+YyDd5tnIuJuwgljlQWbDuqbDgwO7K2Wg6p7435lKNID+E8Wr2FNW/cwP
 tyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uvsSfRao/JteQKdyw1PRyjy+hQuSwq6uVDsvRSMSe74=;
 b=75U3TIK72NDbvqPYfQtK6yCUDG8udLxub3gZJl0u5twwCZfpznrztSTZjt4eUJWBOD
 W8R5gZ4yrah8XPfK4Y2EDu88AENJAIAeIdtxmzG55efh1vThciDOXeZoeOYsYTJkoO9L
 9tkUJvPt203bBYuMRJ6RA0fLghb2cLgevHQUOEAgs/SYzo2aEHVvGQAjeKdtbUrWbKem
 vrWbZgCyCkZnDYwFoyQ3eShkxnFs7jxzDORsx8ikZ1p+7b9t9vE777wQil9nn0go3cps
 Qwr1OkNILaKdZfMfEKPp8IwCpAVb2LzuO7lUoYlSfsg/XFtua9ybYBnrhY8JyffJsVLE
 +9ZA==
X-Gm-Message-State: ACrzQf2KhsikzS5915ZVlpRVIxdb4W0p8FKvT2/ApYByjLXO/ztqC2hu
 g15ggMg1lPeG4ELdM8h3mjpbt/SUIShpx32K
X-Google-Smtp-Source: AMsMyM7MjTJeklsTQXFXqKwg435S/znYsge+AnYnDmtwdu8HmqpIRrdSHVIsl7GAN1t7NRnuwBHp0A==
X-Received: by 2002:a17:903:246:b0:179:96b5:1ad2 with SMTP id
 j6-20020a170903024600b0017996b51ad2mr17767096plh.37.1666337443701; 
 Fri, 21 Oct 2022 00:30:43 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090a6d8900b002008d0e5cb5sm1042721pjk.47.2022.10.21.00.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:30:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 0/9] target/s390x: Use Int128 for float128 and retxl
Date: Fri, 21 Oct 2022 17:29:57 +1000
Message-Id: <20221021073006.2398819-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removing retxl seemed like the easiest test case for TCGv_i128.

I don't quite get rid of retxl, because it is still used by LPQ,
which will be convertable directly to generic tcg ops once I'm
further along with the main improvements to atomic operations.

Tested only via the little test case, but that was sufficient
to show a bug or two with TCI.  The insn-data.def patterns look
quite regular now, so that's a pleasant outcome.


r~


Richard Henderson (9):
  target/s390x: Use a single return for helper_divs32/u32
  target/s390x: Use a single return for helper_divs64/u64
  target/s390x: Use Int128 for return from CLST
  target/s390x: Use Int128 for return from CKSM
  target/s390x: Use Int128 for return from TRE
  target/s390x: Copy wout_x1 to wout_x1_P
  tests/tcg/s390x: Add long-double.c
  target/s390x: Use Int128 for returning float128
  target/s390x: Use Int128 for passing float128

 target/s390x/helper.h           |  52 +++++------
 target/s390x/tcg/fpu_helper.c   | 103 ++++++++++-----------
 target/s390x/tcg/int_helper.c   |  64 +++++--------
 target/s390x/tcg/mem_helper.c   |  25 +++---
 target/s390x/tcg/translate.c    | 154 ++++++++++++++++++++++----------
 tests/tcg/s390x/long-double.c   |  24 +++++
 target/s390x/tcg/insn-data.def  |  58 ++++++------
 tests/tcg/s390x/Makefile.target |   1 +
 8 files changed, 264 insertions(+), 217 deletions(-)
 create mode 100644 tests/tcg/s390x/long-double.c

-- 
2.34.1


