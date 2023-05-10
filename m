Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B06FE1E8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:53:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwm7H-0002zz-Lk; Wed, 10 May 2023 11:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7C-0002yd-Ib
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7B-0004Sw-0C
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9c9so33362185e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683733947; x=1686325947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yO0lJpgF4bxb9JIrXyqgIJaE74H5nyDuFci0XzHl5t0=;
 b=NJEICtStHnwFtX9KXwne0YPKK8XP/Oa1peCtQWTEmqu8WxEOT37vPbqtcbHfMvY6/J
 MYnp9Bw/7adEjD1yNTDVbE3PTOb/gWCzwaCEbxnRUAl0Mp5ZI5kpnU5HrJuP2EpfR1s+
 m5oP1KX4CWwjQ1YhKqebHkgUkGNY7U6TsosrbdpjY4jto9Xjz645xAOXWTct54RK1eTv
 FTEiqNYEywJE3VTKkbLUOvihsgyov0OdURd+2ycXyE3o0Tol8TqmWNXNtGipw6mNCQD5
 eeWd9FVwn86jWffUxsUGAmnCjjutNYQe7viLdC3qWhRdU9ZUNBbCGC9J17t8gayxg7eI
 VZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683733947; x=1686325947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yO0lJpgF4bxb9JIrXyqgIJaE74H5nyDuFci0XzHl5t0=;
 b=NvzWFKVLOuLHcmq8cojfOMV0bf+0XmMBWhEJzCQw2keL3KANkvX0fFLCvCd6aLbzoS
 Ch/iXNZ1nPweOoz0NFsmFYJYcuaNYq8Tkrx9JVABDYlPUHGNVW39MIpw1+G8KXZD5vEE
 CgG6nUM5qVIszpR/et2Upk8++TfEnaT2xUJTL4SzP2hgsg0ma/x/Z25iRH4xe/3+5I9i
 k0vPaZjrmVM9R+VYwMk6mIS68AakcG/OFku04yqpNIVsBDxzFEPLIYgJWd+saQlvmHTv
 5Q+bHXd8typtdjP/9QbIMJhJKm4w2pdEl8cTawhzpt+MAmpnq9fndaboFpWvYkupiqK9
 CmPw==
X-Gm-Message-State: AC+VfDwPIKQCC/uwHVbfkhHjqRHT5ctlmhQeggrwi0VLQNcjk+RqtkoB
 PFgJLqQDKiiT9So8go5S4vy1S+dJ+cD4WlidOdmH4Q==
X-Google-Smtp-Source: ACHHUZ7S7k8b4doH3F0aCfPI6Zlv+gIu8RYTjoEhxQXSq8UGuyWqweLYT5tS1GnE86y5JB1oAlWiJA==
X-Received: by 2002:a1c:f60a:0:b0:3f1:76d0:8bb0 with SMTP id
 w10-20020a1cf60a000000b003f176d08bb0mr12048337wmc.36.1683733947213; 
 Wed, 10 May 2023 08:52:27 -0700 (PDT)
Received: from stoup.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm23157946wmk.35.2023.05.10.08.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:52:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH v3 0/5] Make the core disassembler functions target-independent
Date: Wed, 10 May 2023 16:52:21 +0100
Message-Id: <20230510155226.647756-1-richard.henderson@linaro.org>
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

For v3, adjust how capstone is included in common_ss.


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


