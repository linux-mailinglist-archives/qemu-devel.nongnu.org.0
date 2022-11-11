Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A7625546
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:29:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otP6A-00015a-R1; Fri, 11 Nov 2022 03:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5T-0000zi-29
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:35 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5Q-0002DP-Rn
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:30 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so7138592pjk.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=opzHySzfd4h+h3v2676QIsaK3Qpg3HvBCwh7e/m6JPM=;
 b=yLi2fPcY1FYflyKGhTFuo3R8sJBxYoTgQ3BJQwgMLOnLmBf+gS40amshrau9Os6UtM
 FAMlsjRr27LEzufoal4ebGZLUBiHMSdFem68RixBnNu3frMAWEYF20/NOYfPJ/Aqf+50
 e/YMQ2xzQXsXKm2I7eXUuv5XSGINA4KEj7emHjBcsJIhJodJBwuJl7cyUEGQuwjy8p9B
 nA2jjkgXqJvj/fy+D7oN5zthvn9rp434AWbBoWKgj/udDmkKPWhldAdKGMeY4tfGcJXR
 G0wLtwuqmZ+yPtIE/hB5dqT80T6Mhj/mCRMbh/69ph5ZONKOix0RyncbwPb9U4laXId1
 liDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=opzHySzfd4h+h3v2676QIsaK3Qpg3HvBCwh7e/m6JPM=;
 b=he+yDoqrTk4STNfphdZRsq0G88aZgYtB+DslX1suWSXXfixFQPAOwcy9jJVejSQn7G
 GkOrCZ+/5K/jP51DKeLWVqZrD87dq5HhfRFkAs6uzjqS29+qKvSdtMb7eFlCp4z/TgVg
 QzbmxmvFGzURbGhcq+o/DCjhzvsDEaCr5BN5WLHgRgQfrzAcWUMzjrExdXRdz1RWSrPL
 eV6iM2b4NSK/OasQcCmPCXw+Y1uXib9QLrxHQeG1ZwhPdf8RMUYkMkt3p1xyUzqx7GlC
 G8vCBS/TdvSlDqQxCHFi0V6DJYySiTlLGBy1Tqm+BhmVuHYT+speTiCLmcO8iyNzr60k
 7Cjw==
X-Gm-Message-State: ANoB5pkwb/+07dUgL5liesIO1RSY7ljCHsywaMOVu/08Q9NIOhxLp7q1
 OdMrE5rXqHH+atP6Xcn/U3u+t4fRimpZ1gof
X-Google-Smtp-Source: AA0mqf6NXwTYH1WuJsPGPuq1hBWvpRTsIZW93HpcUbOkNNUqEiRLjx3rMFPVFw+m+B7eSfANcLkDJg==
X-Received: by 2002:a17:90a:9e9:b0:20a:df72:e61f with SMTP id
 96-20020a17090a09e900b0020adf72e61fmr750467pjo.87.1668154107119; 
 Fri, 11 Nov 2022 00:08:27 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00186a2dd3ffdsm1046341plj.15.2022.11.11.00.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 00:08:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	david@redhat.com
Subject: [PATCH for-8.0 v2 00/13] target/s390x: Use TCGv_i128
Date: Fri, 11 Nov 2022 18:08:07 +1000
Message-Id: <20221111080820.2132412-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Changes for v2:
  * Fix the div bugs found by Ilya.
  * Convert CDSG
  * Improve CC resolution for CDSG+IPM.

Turned out the best testing so far for TCGv_i128 was CDSG,
especially for 32-bit x86 host, where we have only 6 regs
available for 13 parameters.  Whee!


r~

Based-on: 20221111074101.2069454-1-richard.henderson@linaro.org
("tcg: Support for Int128 with helpers")

Ilya Leoshkevich (2):
  tests/tcg/s390x: Add div.c
  tests/tcg/s390x: Add clst.c

Richard Henderson (11):
  tests/tcg/s390x: Add long-double.c
  target/s390x: Use a single return for helper_divs32/u32
  target/s390x: Use a single return for helper_divs64/u64
  target/s390x: Use Int128 for return from CLST
  target/s390x: Use Int128 for return from CKSM
  target/s390x: Use Int128 for return from TRE
  target/s390x: Copy wout_x1 to wout_x1_P
  target/s390x: Use Int128 for returning float128
  target/s390x: Use Int128 for passing float128
  target/s390x: Use tcg_gen_atomic_cmpxchg_i128 for CDSG
  target/s390x: Implement CC_OP_NZ in gen_op_calc_cc

 target/s390x/helper.h            |  54 ++++----
 target/s390x/tcg/fpu_helper.c    | 103 +++++++--------
 target/s390x/tcg/int_helper.c    |  64 ++++-----
 target/s390x/tcg/mem_helper.c    |  77 ++---------
 target/s390x/tcg/translate.c     | 217 +++++++++++++++++++++----------
 tests/tcg/s390x/clst.c           |  82 ++++++++++++
 tests/tcg/s390x/div.c            |  75 +++++++++++
 tests/tcg/s390x/long-double.c    |  24 ++++
 target/s390x/tcg/insn-data.h.inc |  60 ++++-----
 tests/tcg/s390x/Makefile.target  |   3 +
 10 files changed, 462 insertions(+), 297 deletions(-)
 create mode 100644 tests/tcg/s390x/clst.c
 create mode 100644 tests/tcg/s390x/div.c
 create mode 100644 tests/tcg/s390x/long-double.c

-- 
2.34.1


