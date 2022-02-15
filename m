Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9614B618F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:20:16 +0100 (CET)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoNy-0000As-Q1
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:20:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKk-0006ZV-4K; Mon, 14 Feb 2022 22:16:54 -0500
Received: from [2607:f8b0:4864:20::1031] (port=53990
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKi-0002df-5l; Mon, 14 Feb 2022 22:16:53 -0500
Received: by mail-pj1-x1031.google.com with SMTP id qe15so16268458pjb.3;
 Mon, 14 Feb 2022 19:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tAoP+mnAnE0jgd63jz+bfWL9Y7pXsth7njDPvp8O8ng=;
 b=Oyg8h4HMc6Bu8oW5YSaLrUd3bzdsAwzNyEw7nSYokwawO/Dps749gPpCRxhC5cW05p
 jRNwTRikbEDjVfTy+xAPW9uCWC3j5NUgvlWdNbKeulVUDRFjyEX0s1Sen05p7sNwx+i/
 89yIGsDcsLAtHGFMzYHnyW8jngqJoNB19nyoEWQIKwpxq144Jz6i0DCp+iCt+BHeCQNW
 5vrvusufuVmTbnxA8HGD80YCcu3J1r5+17KjhxHCAtocdtcDeLhHeXN5bkW5HASOxRdj
 I+ykNN5lDZSbnhA4V9Qi+NlsciGB3z5gf8nPO4SwBgt/6Q+fUpXKNkGB8Yn3NV199a6F
 wc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tAoP+mnAnE0jgd63jz+bfWL9Y7pXsth7njDPvp8O8ng=;
 b=3Mu5COeZ7Yr+uijCJSwYiSx/oi1V7jM3Wj3r1mxaHEs283c2SYsMo8cct0yoBpvAgO
 +bs7Xph46CDFvEqX5u+jbLOT6Bf6KcNsA9Pi6KyzRplY1prUN+emIJXURWV9RGlmwppH
 oC7uF0tewytQcTQbbE7I5epeFLXO8yy1hpDaXjEXBLrPzezLpAWa8LJenHYWe/fWLD+K
 VuiSR18l6S5E4HSsO2SNdmxA2IYnDI8MjuQkvlJRXJ69Od8zfTphsSXYOSFuogi8dqgF
 Q6uYRFXO3FUSFVm7Waos29y8QTfyuIBnZv0dZ6WC1/kMLaMh/9A0TwQHFNbfoNTCSHcg
 tXmQ==
X-Gm-Message-State: AOAM5328iIvIr5cSHY0XAF4+LpATZKKYETSwWLnZvXlMBYBZvVH3q3hi
 rBTXQb0kzAzcaDr2ByOk+GznOehpVMw=
X-Google-Smtp-Source: ABdhPJz8qlEgXjaUZfaG6c91Zd/fa69D+ix0ArWd8HKBX2cbOnP+OCI5HpoGy5kV6x7mD9LRhgpVOQ==
X-Received: by 2002:a17:902:c111:: with SMTP id
 17mr2134002pli.96.1644895010316; 
 Mon, 14 Feb 2022 19:16:50 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:16:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 0/9] ppc: nested KVM HV for spapr virtual hypervisor
Date: Tue, 15 Feb 2022 13:16:33 +1000
Message-Id: <20220215031642.1691873-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is the rollup of patches in much better shape since the RFC.
I include the 2 first ones unchanged from independent submission
just to be clear that this series requires them.

Thanks Cedric and Fabiano for wading through my poor quality RFC
code, very good changes suggested and I hope I got most of them
and this one is easier to follow.

Thanks,
Nick

Nicholas Piggin (9):
  target/ppc: raise HV interrupts for partition table entry problems
  spapr: prevent hdec timer being set up under virtual hypervisor
  ppc: allow the hdecr timer to be created/destroyed
  target/ppc: add vhyp addressing mode helper for radix MMU
  target/ppc: make vhyp get_pate method take lpid and return success
  target/ppc: add helper for books vhyp hypercall handler
  target/ppc: Add powerpc_reset_excp_state helper
  target/ppc: Introduce a vhyp framework for nested HV support
  spapr: implement nested-hv capability for the virtual hypervisor

 hw/ppc/pegasos2.c        |   6 +
 hw/ppc/ppc.c             |  22 ++-
 hw/ppc/spapr.c           |  41 ++++-
 hw/ppc/spapr_caps.c      |  11 +-
 hw/ppc/spapr_cpu_core.c  |   6 +-
 hw/ppc/spapr_hcall.c     | 321 +++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc.h     |   3 +
 include/hw/ppc/spapr.h   |  74 ++++++++-
 target/ppc/cpu.h         |   8 +-
 target/ppc/excp_helper.c | 129 ++++++++++++----
 target/ppc/mmu-radix64.c |  41 ++++-
 11 files changed, 610 insertions(+), 52 deletions(-)

-- 
2.23.0


