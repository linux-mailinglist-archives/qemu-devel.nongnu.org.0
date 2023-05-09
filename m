Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A86FCB5A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:34:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQHS-0004iO-7Z; Tue, 09 May 2023 12:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHM-0004g4-5Y
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHJ-0007Vx-Kq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315712406so216446005e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 09:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683650008; x=1686242008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ExpUnsutUcznaqEfCAYFk3vD9+opdFGnpzbfU0RjCCc=;
 b=bkm/5gD4rfh+ry6jaGyKlv7Ksw8Woirb0J9VjUTu5rc3bTZ8Qg/BPbiwbHNHI1I/1d
 cTcMGIKr9qdwrbTEQY3/4CVsAogEF/xpmeiSA2yUciZkraaQ9zuIUoLT8turd3a8GMyh
 ke47xx9vFO9tlk/ZsFPUzjoyaMxtKK5I6gTQ/hYnqB+EPSZ5HKkc6kB1YlWxLk/vIKXr
 rv9P1k3dVrLSjMfT9ccJi7ljje4hIukjDvEAsTc4+Zt2osOtkqRdlMpix5kSjGuHivXN
 pe/ASdCAtqZXMtJZTYIE0hL2q1V5MYJNCRrvPeIzBEM0109SmRbccLg9uQJV1Sf8ACZ1
 dalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683650008; x=1686242008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExpUnsutUcznaqEfCAYFk3vD9+opdFGnpzbfU0RjCCc=;
 b=TJdoKuojO9fsYnSv+s0s5qGogwQmtbkWYl5XZqP7tjr6tccXxLAreeaHVjWa4+4qr6
 YCuROdatiMiE2AYogQ7a7OtHMOt0z2PLDZgIbOQwH0Dhv3xMLqXzM4G1x66kKFUfSr6W
 o04PbrOSjsMMamKmW0vXhjw3/EpIoLPT8wsRET49kk/BVodowaqA0LXcGrJFSrgef6SX
 zKpjGdL0ERrLNa/rQRugHv+iI0u3wOtba4baYCeG22AV/AbELurT9z17RjfcgH8tsDZh
 h42amhrWOvII4Y3J/VVzoWbKQ1x5a1lXu/F38y37PkKLGq04l94nlwhxxX7ZRvRa7TeF
 MoOA==
X-Gm-Message-State: AC+VfDxBf15QwjKSIhAQMRPv5J5jQ7mK9EXpSfYvwKZl2w/isM0MdW0N
 9SqhSTyJXz34C8b6eWepWuM9IgUV6D7LtF7GpNhISg==
X-Google-Smtp-Source: ACHHUZ7WnbTdAUuUnlItvQrr0krDSf98a0tsuS/6Cv7Io+CWTjb3uO8IRW0iyrXK34c0m3HIv1s4bg==
X-Received: by 2002:a5d:4292:0:b0:2ef:d0de:e8a4 with SMTP id
 k18-20020a5d4292000000b002efd0dee8a4mr10523124wrq.25.1683650007836; 
 Tue, 09 May 2023 09:33:27 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b0030795249ffasm7393298wrj.92.2023.05.09.09.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:33:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng,
	philmd@linaro.org,
	thuth@redhat.com
Subject: [PATCH v2 0/5] Make the core disassembler functions target-independent
Date: Tue,  9 May 2023 17:33:21 +0100
Message-Id: <20230509163326.121090-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Merges Thomas' RFC patch set with part of my "build-tcg-once" patch set.
The only real change from Thomas' is to use uint64_t instead of hwaddr.


r~


Richard Henderson (3):
  disas: Move disas.c to disas/
  disas: Remove target_ulong from the interface
  disas: Remove target-specific headers

Thomas Huth (2):
  disas: Move softmmu specific code to separate file
  disas: Move disas.c into the target-independent source set

 meson.build              |   3 --
 disas/disas-internal.h   |  21 ++++++++
 include/disas/disas.h    |  23 +++------
 bsd-user/elfload.c       |   5 +-
 disas/disas-mon.c        |  65 +++++++++++++++++++++++++
 disas.c => disas/disas.c | 100 +++++++--------------------------------
 linux-user/elfload.c     |   5 +-
 disas/meson.build        |   6 ++-
 8 files changed, 121 insertions(+), 107 deletions(-)
 create mode 100644 disas/disas-internal.h
 create mode 100644 disas/disas-mon.c
 rename disas.c => disas/disas.c (79%)

-- 
2.34.1


