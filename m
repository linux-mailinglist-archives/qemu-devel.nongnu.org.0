Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E856687285
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:52:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNpm-0005yS-0k; Wed, 01 Feb 2023 19:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpj-0005y8-Id
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:12 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNph-0000OR-T4
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:11 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso4060115pjj.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D5hLI71ahPZ9W/StCPwUD9GIvdTuh2ILhzbSH+kVcx4=;
 b=GRVjBi5CPNPObopIcIuxiP55XiYY0xm76ZXIJkhrtYvhBWgN8yWnTAll5YioKXOX6F
 /zer5DcsTvTDQyN8q7KwQHrLxY2sOsXGefTNyZYghyvWTdzehFKL/Q9MsqEpSd3UJrrn
 rCCF+A/AVnNSWKIjTaryLhZCcs4fQP+C3zlJrkMe74DFv6J6MUCjWo0zLxaDcA9SqKV4
 OomPnkKtOQd+a4pN8zixfnY3iQPKkM/rqAiSfRd+BtoqBuk6s0XgxyXgyRF82aSpff8y
 OIKXjG8d4GlyKIx3ATJBV/jP2fkdM5feAYhEUD73R2uECFrWTtPKzv1V9NJgwGH1S+ip
 mmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D5hLI71ahPZ9W/StCPwUD9GIvdTuh2ILhzbSH+kVcx4=;
 b=BvM4wOXYGmpzluPLsQITfIBfL59XC8L2jrsv6LEUqZSPqpFDpA/0uQZz8vMfZ65xJw
 eI7xlbQJAdLfmVyfUAUXzFp96YtEeCltw0vOy/X3VpctRnLIfwpSw+SrgHDSmKdvuNun
 rXersMeXt7CGg1VEyaOi6k2pYlvxM6c9yeI8l2K7N/cn+0siEdnSYFYRjNNQmN0nR5o3
 ms2Eto6F4BGXZMNaXFX7SY9nxjd4ouv9hf/ptJ1a8XKOUBn7u8vrTKfT3wdz4UZ+JTw7
 HlitsptDQa9ZaBQaD/kN8dZc5cGtB9KryjFjYNK9V6hSbyfjQNYhPG9IR0SMbzf3v+0g
 gUng==
X-Gm-Message-State: AO0yUKUr6w0Rk6fK380SVmVK3gNGr3U7jnkZLVVNR2lFAjHu05rbx42w
 dGbJwd4XrN8o1lqKbtbGhYuJZu92cT7VPzcm
X-Google-Smtp-Source: AK7set+6jSJZLS6ytO5hIWfDNziTzbxY/qxVBDAjVVMLT5jmM/9Aj0EqwKl2bK9QwoAlIBK+E319Fw==
X-Received: by 2002:a17:903:487:b0:196:1e18:7df7 with SMTP id
 jj7-20020a170903048700b001961e187df7mr539042plb.40.1675299128260; 
 Wed, 01 Feb 2023 16:52:08 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 00/14] linux-user/sparc: Handle missing traps 
Date: Wed,  1 Feb 2023 14:51:50 -1000
Message-Id: <20230202005204.2055899-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Lots of missing trap code for cpu_loop().

r~

Richard Henderson (14):
  linux-user/sparc: Raise SIGILL for all unhandled software traps
  linux-user/sparc: Tidy syscall trap
  linux-user/sparc: Use TT_TRAP for flush windows
  linux-user/sparc: Tidy window spill/fill traps
  linux-user/sparc: Fix sparc64_{get,set}_context traps
  linux-user/sparc: Handle software breakpoint trap
  linux-user/sparc: Handle division by zero traps
  linux-user/sparc: Handle getcc, setcc, getpsr traps
  linux-user/sparc: Handle priviledged opcode trap
  linux-user/sparc: Handle privilidged action trap
  linux-user/sparc: Handle coprocessor disabled trap
  linux-user/sparc: Handle unimplemented flush trap
  linux-user/sparc: Handle floating-point exceptions
  linux-user/sparc: Handle tag overflow traps

 linux-user/sparc/target_signal.h |   2 +-
 linux-user/syscall_defs.h        |   5 +
 target/sparc/cpu.h               |   3 +-
 linux-user/sparc/cpu_loop.c      | 170 +++++++++++++++++++++++++------
 linux-user/sparc/signal.c        |  36 +++----
 5 files changed, 167 insertions(+), 49 deletions(-)

-- 
2.34.1


