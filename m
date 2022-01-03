Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17701483739
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:55:03 +0100 (CET)
Received: from localhost ([::1]:38608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4SU1-0000tU-AY
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSn-0007E6-Ai; Mon, 03 Jan 2022 13:53:45 -0500
Received: from [2607:f8b0:4864:20::82a] (port=46681
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSl-0006Fv-PP; Mon, 03 Jan 2022 13:53:45 -0500
Received: by mail-qt1-x82a.google.com with SMTP id m25so31284575qtq.13;
 Mon, 03 Jan 2022 10:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1YvrJH5YwHHRtW56oNyUneTyQq1NiAo34LeXTbSRtiw=;
 b=Hf+ShszpnzaUDNWYu5bkUUfhXXniBZvzhOXdzWGiXkg14ucL4965ROoPc5z+v0Z5Bi
 6osTnb+AtgqzDDtLCFD/a7y3DIgRsrM/KMBp+fK133i18Nsesbj4qBHxblUQzNeYQGMu
 F9DGmJ4agYbANYzRKcMV+CWIW1fLQDeWChbdRmhva7OlxmaT1W3ykthiVcppJZEccB8A
 LuUEqW42mUu7+mxXivIKkYNSM7t/AQY/pMW+aFLxVSqYqdhVIaahCZhrHJchFsPOVgDv
 yLVT8v1QEBvu0fcBjzDxiZN9dCyj7VCEn0klom3Eow+FHScSrH9LtAt8VvqHfW2S8dF5
 e6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1YvrJH5YwHHRtW56oNyUneTyQq1NiAo34LeXTbSRtiw=;
 b=Zv0zzQND00evcOnZn3g4xpQdg0dTWBpvlrLJlLAR6y7GdCX4fiohnVFbtj09kc2/iY
 Iz/90CuSGoB3pAqDZ0hF1QmHY3/kdKljGMGs7RLTfA+QN4X9KdpXe8VRmpWmV+o3TNir
 8iJy3KyAPrmjQfK8Z7n7xpAY2L+2jy7q4K6bu/vFQufMqsu50KAZQ9zlQ8ystGUHZVuu
 6MVPZAz7/bYw3RpGKK3Ko0CZTcVuNu2QreI4keHFV7NydxFmzdy6h98l5tZkTGf0+U0/
 IN/0xIqwARGyGNrRWyFV55O5miy367HeMAG0DzqMhjYLexxRqM54PPIo9Ar+8mNHuDNm
 7WuA==
X-Gm-Message-State: AOAM530j4N+v8ZPC79TlESqqXTzkFnShmChnRM0rsAtDNBqWWY6WCVBX
 PP16fM0KuuNgT0JpxsxGs6FN8vTmIDk=
X-Google-Smtp-Source: ABdhPJwGXpB7bJX4PavnhcrViQENKnRTSmbC/OBdWrHnswwh/IijcgzgMN+Dewre0Dv6f6ZMzR29kA==
X-Received: by 2002:a05:622a:1386:: with SMTP id
 o6mr41411296qtk.64.1641236022503; 
 Mon, 03 Jan 2022 10:53:42 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id w9sm29002867qko.71.2022.01.03.10.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 10:53:42 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] Reorg ppc64 pmu insn counting
Date: Mon,  3 Jan 2022 15:53:27 -0300
Message-Id: <20220103185332.117878-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the v2 of Richard's work sent in [1]. The initial implementation
presented some issues with the event-based branch kernel tests that I
fixed in this new version. This code is now passing all EBB PPC64
tests, it makes Avocado happy and it's all contained in the C helper.

Last patch is an improvement that became natural to do after seeing
how Richard updates env->hflags in pmu_update_summaries().

Avocado test performance:

 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (32.63 s)
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (34.16 s)

Changes from v1:
- patch 1:
  * fixed a couple of minor that was causing test failures
- patch 2 and 3: unchanged
- patch 4 (new):
  * clear HFLAGS_INSN_CNT if MMCR0_FC is set
- patch 5 (new):
  * avoid calling hreg_compute_hflags()
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg04013.html

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg04013.html


Daniel Henrique Barboza (2):
  target/ppc: keep ins_cnt/cyc_cnt cleared if MMCR0_FC is set
  target/ppc: do not call hreg_compute_hflags() in helper_store_mmcr0()

Richard Henderson (3):
  target/ppc: Cache per-pmc insn and cycle count settings
  target/ppc: Rewrite pmu_increment_insns
  target/ppc: Use env->pnc_cyc_cnt

 target/ppc/cpu.h         |   3 +
 target/ppc/cpu_init.c    |   1 +
 target/ppc/helper_regs.c |   2 +-
 target/ppc/machine.c     |   2 +
 target/ppc/power8-pmu.c  | 238 +++++++++++++++++----------------------
 target/ppc/power8-pmu.h  |  14 +--
 6 files changed, 117 insertions(+), 143 deletions(-)

-- 
2.33.1


