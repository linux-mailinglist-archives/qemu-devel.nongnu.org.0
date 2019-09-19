Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A67B8815
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 01:33:55 +0200 (CEST)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB5vt-0000Tu-OX
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 19:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39217)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iB5s5-0006Cp-MD
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 19:29:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iB5s4-0000iP-A6
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 19:29:57 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40970)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iB5s4-0000i5-2N
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 19:29:56 -0400
Received: by mail-pl1-x642.google.com with SMTP id t10so2301376plr.8
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 16:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=+1oeXQseKrei+GHbOaidjKnLfGpU8gMtcIAwTzhYn3w=;
 b=Wp1vSx0pcWXq2B/YX7BhgapehSwCo3wVfqzPoRnatNFECxxdPeg8hl0IMcyX7J9ehF
 TxoAlY8bSNIk8qXy6ClBqGlNGngI72+Z5tJ0ShqVuUNOQAumA0T4ROHH8tE3oSsY+81Q
 GUGKCrzFubNIRGwABTtThkIwbGrGz86A8JLcLw4YXLYskCi6GaxuAM618WdeZYfafPT4
 5ABx4E3nheFFggL6lch4JbZsXA9quzjUUjBrislYqCcgxByq+fSCWYXrSlqVp0DMFATX
 cq7vMzXtsDLLI1gXDx7R28KJ4NSdZAVKcZ3wz4uGNJANjypTmaStPDSljWUIspX7v1SP
 Clnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+1oeXQseKrei+GHbOaidjKnLfGpU8gMtcIAwTzhYn3w=;
 b=g9VblAXn9vUcJHdkei/L6cg386YSnU3WzKF1Cir7UxwyQ1Clwt7ByayU7eTIiiOPNF
 51ZmLS0t9QiEYNN/cNnOW5KWHWvgAPMO3/ulmeL49ICSsHTZDrCrp9I402nnxNA+q+1d
 UrkUESiMVOLOjt0A8HvzkHpR1JJi3WBJkY0oDvAgusu8aW167C6aH6t8dDdg6goE9WGw
 azpJrREGVMUAC/J2VcybYcQIit4YeakGqCMVkaAXbLclbSFmLaMSMtbRWuvR3uM2QLL4
 pFBdCCCBvz9oceqfLVtqsB33dlwuHg5AU3n9bbf9Cuw47FzdIbIkYmFUSfMnD5d1qtmF
 7gXQ==
X-Gm-Message-State: APjAAAUyqbGOqk7zI1KWLbl0xB7fKSRz8U+m7TFuhRURwCLF4qp8ooJJ
 uMywnnTxgIcBQgs5Lv5ifvizy/kJJYY=
X-Google-Smtp-Source: APXvYqxU/jMrGpkgzYANQIqjBCfFXSrE9rM0TplCW+xSuv147LXpStpGWfz/NentqXPnFRvcP5bYMQ==
X-Received: by 2002:a17:902:9a88:: with SMTP id
 w8mr854023plp.129.1568935794336; 
 Thu, 19 Sep 2019 16:29:54 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id h8sm103340pfo.64.2019.09.19.16.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 16:29:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] exec: Improve code for TARGET_PAGE_BITS_VARY
Date: Thu, 19 Sep 2019 16:29:45 -0700
Message-Id: <20190919232952.6382-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's currently a fair amount of overhead in the way we currently
treat TARGET_PAGE_{BITS,SIZE,MASK} with TARGET_PAGE_BITS_VARY.

We have assertions that TARGET_PAGE_BITS has been finalized.  Which
is fine, but the variable that controls the assertion may be assumed
to be modified by any function call, which means that we have lots
of duplicate assertions.

This re-arranges things using a const symbol, which allows the compiler
to assume that the variable is not modified across calls.  In order to
allow initialization of the variable during startup, use an alias that
is non-const and controls the allocation into a read-write section.

Remove the assertion for release builds.

Precompute TARGET_PAGE_MASK.  This removes a runtime shift and allows
the variable to be used as a direct memory operand on x86.

Size reductions vs master for qemu-system-aarch64 for various hosts:

PPC64LE:
  debug-tcg:  -32264
  release:    -44360
AARCH64:
  debug-tcg:  -33304
  relase:     -77080
X86_64:
  debug-tcg:   -6685
  relase:     -15597


r~


Richard Henderson (7):
  exec: Use TARGET_PAGE_BITS_MIN for TLB flags
  exec: Split out variable page size support to exec-vary.c
  exec: Use const alias for TARGET_PAGE_BITS_VARY
  exec: Restrict TARGET_PAGE_BITS_VARY assert to CONFIG_DEBUG_TCG
  exec: Promote TARGET_PAGE_MASK to target_long
  exec: Tidy TARGET_PAGE_ALIGN
  exec: Cache TARGET_PAGE_MASK for TARGET_PAGE_BITS_VARY

 Makefile.target        |  2 +-
 include/exec/cpu-all.h | 41 +++++++++++++-------
 include/qemu-common.h  |  6 +++
 exec-vary.c            | 88 ++++++++++++++++++++++++++++++++++++++++++
 exec.c                 | 34 ----------------
 5 files changed, 123 insertions(+), 48 deletions(-)
 create mode 100644 exec-vary.c

-- 
2.17.1


