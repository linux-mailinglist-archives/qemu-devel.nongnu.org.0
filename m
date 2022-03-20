Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C874E1C78
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 17:05:58 +0100 (CET)
Received: from localhost ([::1]:48422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVy44-0008Jv-Ui
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 12:05:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyg-0005Kb-Br
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:24 -0400
Received: from [2607:f8b0:4864:20::635] (port=38506
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyZ-00065h-RM
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:21 -0400
Received: by mail-pl1-x635.google.com with SMTP id n18so10800915plg.5
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 09:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yhh4sFg0bDLMvOPTjjQVPvn99Ktxc/5tI5PIsH/3Bms=;
 b=PsDjk937FNm2yZf8/kZb2Tm+0cZdV7zCDQ40360ke25nTqK09Ch9AGSThTB+kq0jZx
 lED5S9OFnK/YEh0nvsQtQwPnkDUAkPZMJnAgAvImKc5N0pzONohp+F+NWBZmtbXtc78j
 3eh8bAW6Jq4Oid8WxprLbXfftfzWBLTq5Jq6kh7SxJfJ+sCX8Fz/UTIbM1LOxwuZ6kqY
 AbnOW3zouHdGnJUx5VJ0EnkIBZh28RiXiWEIKrklaDMRwmlnHR4F/AQW3OMapfhvwnNp
 oQW3ro1qiqzkuDLizwuNuvPfGJ0kW8cDKZAqFeC8B4uQ78kCocSA9hNOiFoD7+SrylQD
 GkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yhh4sFg0bDLMvOPTjjQVPvn99Ktxc/5tI5PIsH/3Bms=;
 b=wF1sD9RGhkJeU85wQTmnFsdZOvLaftv3GtEpo9qNMPxaICOL25d4sWJKDZZN4H+WqF
 Cy2Ft4D5oW8OO6KMRLbMFJrSJqAzf5dIibt78kDtD4jrp5t8Fx+dp89H32bU3nBMQVk1
 RMH/BVrQRm3Q4BPegr/qbra3puPnTYQPOeoaKXyIvIbjhAPcG1cYQgbUWNwjHOJJDXU5
 9lklIigcGnfwDx2nHjvYfMTiaJTuuCh10PE0WEKIsOeWFf/zPnltWhSVN3fVmOGJdX1G
 jfn4TPiaaloMrUdVtaygP+k/RRdKwAC+YznvC74e/QdUxA8PvXS/JX6+nC7XaaS4MT1g
 RNHA==
X-Gm-Message-State: AOAM532PNK7bUAHFEi4LcgdxJTgjHVAxgJUtD0XYFbF3ccarvepCF3uW
 TvY+Y8KIGq+immzMuewBlxlq/Kj8ap79og==
X-Google-Smtp-Source: ABdhPJzBloYj/9KRAuTTXd3+dK9T2SRJsqLTkmTTJY+nLtCmxd70aeEYb3jg6VyfQfgDp5ryy21ofQ==
X-Received: by 2002:a17:902:c242:b0:154:4f3f:ec6a with SMTP id
 2-20020a170902c24200b001544f3fec6amr2231761plg.121.1647792012682; 
 Sun, 20 Mar 2022 09:00:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 j23-20020a17090ae61700b001c6bb352763sm6590099pjy.52.2022.03.20.09.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:00:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] linux-user/nios2: Fix clone and sigreturn
Date: Sun, 20 Mar 2022 09:00:02 -0700
Message-Id: <20220320160009.2665152-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two syscalls are the reason that the generic linux-user
tests were failing, which allows us to re-enable the tests.


r~


Richard Henderson (7):
  linux-user/nios2: Fix clone child return
  linux-user/nios2: Drop syscall 0 "workaround"
  linux-user/nios2: Adjust error return
  linux-user/nios2: Handle special qemu syscall return values
  linux-user/nios2: Remove do_sigreturn
  linux-user/nios2: Use QEMU_ESIGRETURN from do_rt_sigreturn
  tests/tcg/nios2: Re-enable linux-user tests

 linux-user/nios2/target_cpu.h   |  1 +
 linux-user/nios2/cpu_loop.c     | 29 ++++++++++++++++++++---------
 linux-user/nios2/signal.c       | 17 +++--------------
 tests/tcg/nios2/Makefile.target | 11 -----------
 4 files changed, 24 insertions(+), 34 deletions(-)
 delete mode 100644 tests/tcg/nios2/Makefile.target

-- 
2.25.1


