Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01635294296
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 20:57:14 +0200 (CEST)
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUwoq-0002iv-IR
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 14:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUwnL-0001lh-24
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 14:55:39 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUwnJ-0004EQ-AL
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 14:55:38 -0400
Received: by mail-pg1-x52a.google.com with SMTP id h6so1652624pgk.4
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ejb8wENXUr5gHpYWIRThZiOAOIBcQwSYYKXSOTrn/80=;
 b=JT9ZQFwENQJPzAHoaujsx550ApCxetN3yFw52VF5IsbyDXU0UsrUlrj1bu3Qgmgfq/
 BYQPtKpeMj7wCwzcK/ZnVgKcPemy163LDgYSTcUjKsedM9QZUme77/JhDHahVXBdavnC
 7twlCJFNy5xnHWjwAUN5+w1aXRakaBipC53Y9rMI2m0nUYyCP0ikv0YHjPUBYm2eNy6j
 l1C5llJW9Q+m1s8SnEDN/eo8gsxjMw33+RhOmlQRTXI9/Xrg3vYlU0JgklZqvdHGKRZG
 7H1lLdtWGvmYkoTz8x7BbbG4OQOC+CxO6c0S4TLOb3QFu7HMkR8Nc+84f8OprMT2UF12
 kfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ejb8wENXUr5gHpYWIRThZiOAOIBcQwSYYKXSOTrn/80=;
 b=RqC9iR/83MH3vcRgzqw7Lmvjofh8FvhM7uhVTpyXXAvZrOfG2SiYq0K3eIThnln009
 sFhGWwnkrvdBD3WH1oG+PoejKVaY7gpYihEK+uHJ3IvWhY0QZhAaoWfmEbLwCdxdEdTC
 5poB0hn0+3Gpt/JSRYYckqM75yPLGHILMYNe4u6th7yJoBGT4ca35jYwIpV2L6Fqgycg
 N+dwMCv3CNT03mlgafH9pVHfdg4G4lgwdTSqnhumOtwMWlnb7z7+Ze6Ju48rXGnINJ5W
 WdMUM6kbP+9aVb+cSZ9PRn2ESBp1Jl1wJxM5WKetxZpcyvdD78Q1/Jc/4PvSsMPOGl9p
 tSOw==
X-Gm-Message-State: AOAM532XivpoAEUABSEjAyNkOu4/gYhulQW7KQ2SzI3gaor3cqJ39qkW
 7vrd/5ZOAv+jD94Tb/GbNTqtKN5bCJDF3g==
X-Google-Smtp-Source: ABdhPJzm9O2vVNvjJld1ujVzAFtH8DSDBYEojj47Trc2hPUP18qldrYPe9C0Rdw5GplJGhLA2NwBfg==
X-Received: by 2002:a63:504b:: with SMTP id q11mr3761539pgl.17.1603220135283; 
 Tue, 20 Oct 2020 11:55:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y22sm2988962pgj.27.2020.10.20.11.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 11:55:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] target/s390x: Improve carry computation
Date: Tue, 20 Oct 2020 11:55:29 -0700
Message-Id: <20201020185533.1508487-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While testing the float128_muladd changes for s390x host,
emulating under x86_64 of course, I noticed that the code
we generate for strings of ALCGR and SLBGR is pretty awful.

I realized that we were missing a trick: the output cc is
based only on the output (result and carry) and so we don't
need to save the inputs.  And once we do that, we can use
the output carry as a direct input to the next insn.

Changes for v2:
  * Add a few more comments, and enhance the patch descriptions.


r~


Richard Henderson (4):
  target/s390x: Improve cc computation for ADD LOGICAL
  target/s390x: Improve ADD LOGICAL WITH CARRY
  target/s390x: Improve cc computation for SUBTRACT LOGICAL
  target/s390x: Improve SUB LOGICAL WITH BORROW

 target/s390x/internal.h    |  11 +-
 target/s390x/cc_helper.c   | 123 +++-------------
 target/s390x/helper.c      |  10 +-
 target/s390x/translate.c   | 289 ++++++++++++++++++++-----------------
 target/s390x/insn-data.def |  76 +++++-----
 5 files changed, 216 insertions(+), 293 deletions(-)

-- 
2.25.1


