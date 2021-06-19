Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39BC3ADB14
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:28:18 +0200 (CEST)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luelV-0006CN-W1
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejo-0003OD-EG
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:32 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejm-0003WI-MG
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:32 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so9823316pjo.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NWIeCUbRHGCfzgM7LMzjNcSGXmhgsuGa3Cc9fbqMvqo=;
 b=M2mmhNSNqfPgPDKhrwOWj47dakRWeRyX99EZJAU/Q5B23ZHR/LEZwQ/5+GZgRfzApl
 WWnXz/AwcySqOc341xwMiJg3Eym47kb71iQzQPL5nDaPfO6lh9h9sWU50imyX6rYe0m4
 YACNMwgoZqNmAoKbYXWtfSDyfxtwh7U+3nbbtLs5TP2s7Mo6rqEYck/y9LNS72may610
 avOYMzNu2gAzIFk1dmHMgSbhriNg9Hta0kZeN7uLBkXfK1BOZBMDWgWlMNDJi49M8TrX
 PGmTmtGekvm+6pz5jFY2cS5dsX8kV6x+0p2H3+EiTrSjltRQ7sZE5tGvbjttlflT31lz
 rA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NWIeCUbRHGCfzgM7LMzjNcSGXmhgsuGa3Cc9fbqMvqo=;
 b=kIL/WelzQK1a04QWB4b63N+ADSZTVKx6JqN9ciIuDxNrs5VT/HVfROCY3VxB4ZLp57
 ZptxxD43Vdi0OiKEXUAEH3f8eum0dcE7aX/aJrYdTQDOcmBIJrXD+Kq1dZFQ231l0zR+
 PpJ4/M3br9cU9O7ry1PeN6ZGzM/3FsfDb6EmAL05gPRj+vbapyVD89b87XoMmiUWX95m
 Iq1dHgnFai1E5/M6SlD8GQcsU0NYXfvMFT7Qc9blv0hUWb27GMHzdq9cpwIWrJPCRp8S
 lgAPCfR4eyGzATMb/5Ckd0ejl4vrBTd/91+9ovSDjJIL0x9sloM4Dw49QdbmABrasYE8
 5OVw==
X-Gm-Message-State: AOAM532vZV60jrOAsUZUay23QxdxixYgL4wTnSKzqpy8JSRc1cyQQmDn
 i605NmSCuO427UK5TDVcd6l2VdQVKfzFCw==
X-Google-Smtp-Source: ABdhPJz8Co1fsxiL1l1hOx4jmuFQEwBFZaKNb2X4Y37FvguLsTLC0+ChHt52IimHA94vCHPMaJOi5A==
X-Received: by 2002:a17:90a:86c3:: with SMTP id
 y3mr3799882pjv.150.1624123588217; 
 Sat, 19 Jun 2021 10:26:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] accel/tcg: Fix for #360 and other i/o alignment issues
Date: Sat, 19 Jun 2021 10:26:11 -0700
Message-Id: <20210619172626.875885-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Short story is that the first two patches resolve the observed
problem, by completely bypassing quite a lot of code in memory.c.

Longer story is that we should either use that code in memory.c,
or we should bypass it to an even lower level, so that we don't
have multiple locations doing the partial-read assembly thing.

Patch 13 exposes a number of obvious device bugs via make check.
I'm sure there are more in devices that are less well tested.

Patch 15 has an obvious drawback: it breaks the original #360.
But it starts the conversation as to whether the check in memory.c
is in fact broken.


r~


Mark Cave-Ayland (2):
  NOTFORMERGE q800: test case for do_unaligned_access issue
  accel/tcg: Use byte ops for unaligned loads

Philippe Mathieu-Daudé (1):
  accel/tcg: Extract load_helper_unaligned from load_helper

Richard Henderson (12):
  accel/tcg: Don't test for watchpoints for code read
  accel/tcg: Handle page span access before i/o access
  softmmu/memory: Inline memory_region_dispatch_read1
  softmmu/memory: Simplify access_with_adjusted_size interface
  hw/net/e1000e: Fix size of io operations
  hw/net/e1000e: Fix impl.min_access_size
  hw/pci-host/q35: Improve blackhole_ops
  hw/scsi/megasas: Fix megasas_mmio_ops sizes
  hw/scsi/megasas: Improve megasas_queue_ops min_access_size
  softmmu/memory: Disallow short writes
  softmmu/memory: Support some unaligned access
  RFC accel/tcg: Defer some unaligned accesses to memory subsystem

 accel/tcg/cputlb.c | 147 +++++++++++++----------------
 hw/m68k/q800.c     | 131 ++------------------------
 hw/net/e1000e.c    |   8 +-
 hw/pci-host/q35.c  |   9 +-
 hw/scsi/megasas.c  |   6 +-
 softmmu/memory.c   | 226 +++++++++++++++++++++++++++++++++------------
 6 files changed, 251 insertions(+), 276 deletions(-)

-- 
2.25.1


