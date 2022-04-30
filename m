Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12A6515F67
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:05:48 +0200 (CEST)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkqXT-00029z-Mg
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqUH-0008ES-JU
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:02:29 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqUG-0001BF-3T
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:02:29 -0400
Received: by mail-pg1-x532.google.com with SMTP id i62so8755067pgd.6
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7cRNMu6Nnszsz84vz8H4accAPiJUTr0e9bbgSJIp6pc=;
 b=TiQB/kGMNlspo7TH9xYrJX9iheGGbvSvKKQFRhiJvQKb+mIJbaqpycV+aZ9Kw4Ir/B
 BMIMjTZ5VB9yRT99JFyXltrMYt6EUza9WcwDU/DxLBlM1JdD4AKwebdPO4A57oVxm1Z1
 skXLUdjz95cSxTAm2CW0krEDa/n6zX9Cr8oadYikdNhne7hn0ISkKeKoT5DGPhcC4E0M
 qm62AjPjxjwE85xTosmTdQzE7J+EgLKfQk9PWQwU5MwSkKqjF4FeDBexa1NwDhH9EGF7
 c+bgEnAhfMNf+FpzkTTjTZUAy/zFN54tLo7JM9Ab3LE6QRioI5NWj9QudDmgmN13Vtsl
 wvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7cRNMu6Nnszsz84vz8H4accAPiJUTr0e9bbgSJIp6pc=;
 b=z9FcykYf91/yyvCI4Yy3/RKHzaHxzWds7RXscA8gRNUS7+PhZoqJ+62f0F5Brs1yLl
 RjqCE2CKDZDnf4UVeO88xKFhMpvD5uB22n94h910sCVhZ99A5PhxzYYqQ65LoyW7ULtl
 QDwqsBjTBO6bhtTwMql/o6LLSxhMVH1vrZGxVMwzwcMmPD/ck43VgbF78MZKvZZRkoE3
 7a5wR3JiQE3lfQTEqgGMfEQOEg/KQq0Jp8+on0zFAEG5pYfTrznn/QlPC6oCpUWwZsBN
 zoyMjbCrfHVe2dSrnAD1Bh32y8DgE52fs/w0AMhyA9dZRHjelWJfD6SGV6wDZpBLaFyo
 FauA==
X-Gm-Message-State: AOAM533/ip6URmK8e8GwqCtNr9e0lgVp0e3sb2NqJUE3WvlpfQgcrmMl
 nnEs68TvP19+en/qd+4/dzywZgou/PqTwQ==
X-Google-Smtp-Source: ABdhPJzuFBH4qpmG+ts2gao23129IEqCEO1M3hS5D6Nxka/eGws/tX/lqgW4lPPGrY+GHC85bpJO4A==
X-Received: by 2002:a63:5b0d:0:b0:39c:c393:7e7f with SMTP id
 p13-20020a635b0d000000b0039cc3937e7fmr3817396pgb.16.1651338146562; 
 Sat, 30 Apr 2022 10:02:26 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 j10-20020a62b60a000000b0050dc762817dsm1753826pff.87.2022.04.30.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:02:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/m68k: Enable halt insn for 68060
Date: Sat, 30 Apr 2022 10:02:23 -0700
Message-Id: <20220430170225.326447-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While looking at semihosting, I noticed that 060 does have halt.

Then I was a bit surprised that it wasn't being disassembled and
thought trying to exactly match disassembly to cpu was a bit
frought with peril -- one also wants to know what the insn was
*supposed* to be when it raises SIGILL.


r~


Richard Henderson (2):
  target/m68k: Clear mach in m68k_cpu_disas_set_info
  target/m68k: Enable halt insn for 68060

 target/m68k/cpu.c       | 6 +-----
 target/m68k/translate.c | 1 +
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.34.1


