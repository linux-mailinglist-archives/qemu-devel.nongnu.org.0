Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E5647D2F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 06:21:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3VnC-0004ci-C3; Fri, 09 Dec 2022 00:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Vn7-0004ZP-Oq
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:19:23 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Vn5-0008HH-Lt
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:19:21 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso4426848fac.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 21:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FUhrcrYdzCVbPW8+9GNoc0GazxctnfvRlBc3HPEhlPQ=;
 b=RGDZy5RuxfPkRQBsGoKPB87gLxrxuk0COnEVi0Un0A/MnQFrsSWq6A5Zh4RNAaaGfa
 DMU2p53Za2UGmmXsqwi1bME4doQvrs78zaO/MUpQwtoxkFvEqQ2HOVcGVAq/UJIriUdD
 yyO/3+KnHbFL6hmtbX9nuX3/mQ17AW8akreptmfkD/hLyzPJi33reygJlM47Ot18YyNZ
 BpaEorWTxMWMSCisAHg8oMq3ubxQzBYXHVf8aJnoRfy0zWzupO4StgP+QHIo6uRmgu0E
 xtn9Kb8YqVZsO9YmTWkFDVJXYr4Q9ai0fxBdciqXY5MtnliHkFe4RNFAq+crFPFoxDLJ
 YQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FUhrcrYdzCVbPW8+9GNoc0GazxctnfvRlBc3HPEhlPQ=;
 b=1NtMZstm64+4zhw/HDAq3G9hXa/TmkiXV0iNbi3uctTPYkkd3eOkHcRWjyBTcFySj0
 1u7Dn8MnFCs5XlnmTGIiGPDsuQQb4PYw7qpsJfc15srf2LOijz6fCmeyi1r9I0bk6bJm
 TRoe3btxMO3cEctd8PBwSgLR4/JGWf5kTGLRRLsedf/o+12NCnyGAwqry1mzXNxZxP4v
 faTsDeAWcdg8NHqjNeKMiIbS6dQBks9kiCVj6g7OwLj5W81y38TbfP5ZdXZH+W0HcqbO
 G7Y4qGNoAcUsfpExnBnpL1uTKMAYbSL5kpGORh49lK1cnR5aO15jppHjs0tCfnoe+Rut
 REUQ==
X-Gm-Message-State: ANoB5pl5RLJzRNbaXqnQn8XCNAujDFuhAljPULgAgNU5MDEGBcGdH+kq
 7YeedDD2NBIjKi29BcXHtWm4mJP65paGkijzgxo=
X-Google-Smtp-Source: AA0mqf4bunBlyfHteNVkTkQEI+QgDFuMyV7GHGCA8bY4gpNNZvpZv26Qk/LNHT9HhblRr1LTGuMhEA==
X-Received: by 2002:a05:6871:7a4:b0:13b:d04d:93ba with SMTP id
 o36-20020a05687107a400b0013bd04d93bamr2512357oap.12.1670563157905; 
 Thu, 08 Dec 2022 21:19:17 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:95e5:48b1:fe60:b74c])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a056830244f00b00661b46cc26bsm224657otr.9.2022.12.08.21.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 21:19:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v3 0/8] accel/tcg: Rewrite user-only vma tracking
Date: Thu,  8 Dec 2022 23:19:06 -0600
Message-Id: <20221209051914.398215-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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

The primary motivator here are the numerous bug reports (e.g. #290)
about not being able to handle very large memory allocations.
I presume all or most of these are due to guest use of the clang
address sanitizer, which allocates a massive shadow vma.

This patch set copies the linux kernel code for interval trees,
which is what the kernel itself uses for managing vmas.  I then
purge all (real) use of PageDesc from user-only.  This is easy
for user-only because everything tricky happens under mmap_lock();

I have thought only briefly about using interval trees for system
mode too, but the locking situation there is more difficult.  So
for now that code gets moved around but not substantially changed.

The test case from #290 is added to test/tcg/multiarch/.
Before this patch set, on my moderately beefy laptop, it takes 39s
and has an RSS of 28GB before the qemu process is killed.  After
the patch set, the test case successfully allocates 16TB and
completes in 0.013s.


r~


Changes for v3:
  * Rename page_flush_tb to tb_remove_all (new patch 2).
  * Shuffle code in last patch, remove tb_lock for !sysemu for clang.

Changes for v2:
  * Rebase on master, 17 patches merged.
  * Structure of page_get_target_data adjusted (ajb).


Richard Henderson (8):
  util: Add interval-tree.c
  accel/tcg: Rename page_flush_tb
  accel/tcg: Use interval tree for TBs in user-only mode
  accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
  accel/tcg: Move page_{get,set}_flags to user-exec.c
  accel/tcg: Use interval tree for user-only page tracking
  accel/tcg: Move PageDesc tree into tb-maint.c for system
  accel/tcg: Move remainder of page locking to tb-maint.c

 accel/tcg/internal.h            |  85 +--
 include/exec/exec-all.h         |  43 +-
 include/exec/translate-all.h    |   6 -
 include/qemu/interval-tree.h    |  99 ++++
 accel/tcg/tb-maint.c            | 984 ++++++++++++++++++++++++--------
 accel/tcg/translate-all.c       | 746 ------------------------
 accel/tcg/user-exec.c           | 658 ++++++++++++++++++++-
 tests/tcg/multiarch/test-vma.c  |  22 +
 tests/unit/test-interval-tree.c | 209 +++++++
 util/interval-tree.c            | 882 ++++++++++++++++++++++++++++
 tests/unit/meson.build          |   1 +
 util/meson.build                |   1 +
 12 files changed, 2653 insertions(+), 1083 deletions(-)
 create mode 100644 include/qemu/interval-tree.h
 create mode 100644 tests/tcg/multiarch/test-vma.c
 create mode 100644 tests/unit/test-interval-tree.c
 create mode 100644 util/interval-tree.c

-- 
2.34.1


