Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1547E4F9B12
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:51:34 +0200 (CEST)
Received: from localhost ([::1]:57658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrpc-0000p6-Pt
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrlz-000730-Q7
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:47:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrlx-000314-RX
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:47:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id c7so13887484wrd.0
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+NXXJZJLZnxQ9an+f42U4NqOGgJkQdJhnpEvmUDUw2w=;
 b=DFv7U7RhE/TVm5ZovbHW5LIIIxpI4n31GbZjAtJ7Lw8Mpz4pGi9ZtkBx0+FRgLkLpZ
 97wsSGFC3CNP4ZlxGk2an9nF0bMv8bxFl7eRY67yXBK/UZ48ACcKOOQMWkwdiy3jjdBT
 dlDt3+4z/KhF0/Jsq7sCvlG5r/44sGVa/YrdpGCvQp8mr8d2/pLkHibnHpZ/uk+9gOAt
 L3L6WFnezzwDQA8omJq7EIt14xI9VryR6Mkk3wvijNn3CYIGYiq2mvQa3yABkyhkgQT1
 WYwM0eTHJSeM30ei72Ek0TVRqct6ngOE5CakgrKmF40F7WLXdu8rxyLrtdyY4veo238m
 MJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+NXXJZJLZnxQ9an+f42U4NqOGgJkQdJhnpEvmUDUw2w=;
 b=nJMjSiABoq+JLMNlREfkeFw6bI6f1bdN/qJhTsM6gBRPfXZnbXa9miyPFWfsGoKugU
 JgY9zvs+ymkAABI1buAw5KzxXLuEc32DxBOuyhKLZTFfLl7cSfz6+M0MSXO+4tX9YmJl
 xQ/1vp4WtJfmJAl6mJXKmjVPHUe/O8w2t/W9QNLHjE/iIA6L9vJtxF50KXV75A6xRnrP
 RSdOY8uPfnv0TzdR3dvczRMjJgnHRNpXjjF93nMM/K5Lc9xnbOMfxTVtXJcp2UEt/iBC
 Nx8i0juhszAPhzSLAUIyvPs2zv4vVuARiLr6MeVs3p/u6apEYdeNFRUGEeJv6mg3sfRy
 txmw==
X-Gm-Message-State: AOAM532tXxcaJKKxKGZiR/nmgGhY2uIE9G+o0rDbBDQbJ3OcN1Rd8zgc
 3CyuJ0ifKFY7YTRrWvcmj26/IQ==
X-Google-Smtp-Source: ABdhPJxGY8AHZFFVXIfKDxdTVwRkiXOIwUFFMFPmV1zpRYHjrTKnVw5iUHrBEwXNdwWZZDmbex6wzA==
X-Received: by 2002:adf:f60a:0:b0:206:1201:e223 with SMTP id
 t10-20020adff60a000000b002061201e223mr15427049wrp.712.1649436464259; 
 Fri, 08 Apr 2022 09:47:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c4ed000b0038ceb0b21b4sm13320496wmq.24.2022.04.08.09.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E48D1FFB7;
 Fri,  8 Apr 2022 17:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/15] testing, docs, tracepoints and cputlb hacks
Date: Fri,  8 Apr 2022 17:47:27 +0100
Message-Id: <20220408164742.2844631-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In anticipation of the tree re-opening soon I thought flush the
current state of my maintainer trees. We have a change for testing, a
couple of documentation updates, some refactoring of disassembly
handling and additional tracepoints for diagnosing cputlb issues.
There is also a hack for speeding up UEFI boots which I suspect will
never be up-streamed but may serve as a prompt for further discussion
and more refined approaches.

Currently the following patches need review:

- accel/tcg: add heuristic to invalidate al TBs in a page [hack!]
- tests/tcg: add memory-sve test for aarch64
- accel/tcg: add tb_invalidate_phys_page_range tracepoint
- cputlb: add tracepoints for TB invalidation
- cputlb: add tracepoints for the protect/unprotect helpers
- disas: use result of ->read_memory_func
- disas: generalise plugin_printf and use for monitor_disas
- monitor: expose monitor_puts to rest of code
- accel/tcg: add tb_invalidate_phy_pages_fast tracepoint
- accel/tcg: move trace events to correct location
- docs/devel: drop :hidden: and :includehidden: tags
- docs/devel: add some notes on the binfmt-image-debian targets
- tests/avocado: update aarch64_virt test to exercise -cpu max


Alex Bennée (14):
  tests/avocado: update aarch64_virt test to exercise -cpu max
  docs/devel: add some notes on the binfmt-image-debian targets
  docs/devel: drop :hidden: and :includehidden: tags
  accel/tcg: move trace events to correct location
  accel/tcg: add tb_invalidate_phy_pages_fast tracepoint
  monitor: expose monitor_puts to rest of code
  disas: generalise plugin_printf and use for monitor_disas
  disas: use result of ->read_memory_func
  cputlb: add tracepoints for the protect/unprotect helpers
  cputlb: add tracepoints for TB invalidation
  accel/tcg: add tb_invalidate_phys_page_range tracepoint
  tests/tcg: add memory-sve test for aarch64
  plugins: extend execlog to filter matches
  accel/tcg: add heuristic to invalidate al TBs in a page [hack!]

Richard Henderson (1):
  plugins: Assert mmu_idx in range before use in qemu_plugin_get_hwaddr

 docs/devel/index-api.rst                  |  1 -
 docs/devel/index-build.rst                |  3 +-
 docs/devel/index-internals.rst            |  1 -
 docs/devel/index-process.rst              |  1 -
 docs/devel/index-tcg.rst                  |  1 -
 docs/devel/index.rst                      |  2 -
 docs/devel/qtest.rst                      |  1 -
 docs/devel/tcg-plugins.rst                |  9 ++-
 docs/devel/testing.rst                    | 38 +++++++++
 include/monitor/monitor.h                 |  1 +
 monitor/monitor-internal.h                |  1 -
 accel/tcg/cputlb.c                        | 16 ++--
 accel/tcg/translate-all.c                 | 38 +++++++--
 contrib/plugins/execlog.c                 | 96 +++++++++++++++++++----
 disas.c                                   | 43 +++++-----
 disas/capstone.c                          | 73 ++++++++++-------
 plugins/api.c                             |  2 +
 MAINTAINERS                               |  1 +
 accel/tcg/trace-events                    | 10 +++
 tests/avocado/boot_linux_console.py       | 25 ------
 tests/avocado/machine_aarch64_virt.py     | 51 ++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |  7 ++
 tests/tcg/aarch64/system/boot.S           |  3 +-
 trace-events                              |  4 -
 24 files changed, 314 insertions(+), 114 deletions(-)
 create mode 100644 tests/avocado/machine_aarch64_virt.py

-- 
2.30.2


