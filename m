Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC5A3D4D57
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:26:12 +0200 (CEST)
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dCs-0002z4-Uw
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dB8-0000Hc-Ki
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dB7-0003l6-5f
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso2925587pjo.1
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z1A48850AmNUJ480HY8JI9Go9HwmCZPrdsNHUIsFpfk=;
 b=O6wjwYAYDErFEsUdmRgMWTml4W3+DIF/x+RXtlSKy8cKyIlhz6dI4yITwq7FK8vPBr
 cwz76QdqU8190FO2eJHus+q8a6EyPBzjV0BYVKsvhrrZusGFKDkt2Rw4oR6fK+Ac3rXI
 z2KDydI+mlLQ+Lp+CwhLApv006OU+hC++HvxeZmIS14jIr5uy3jpuMKOicyBmu44MHaj
 oG2OQezPVBeH0gttPeGmEQG6tNRiU3AO8iLBOXnFvMisWry9QwNAwYR5NA52y/xNjxL0
 mey45aONdxhkJKIVGvJTPoZx6GfbrNVOJVo+vFDPK949EKXPXnpudD+LknXA8QfR3X0d
 VZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z1A48850AmNUJ480HY8JI9Go9HwmCZPrdsNHUIsFpfk=;
 b=r3PaXpmLlQsmskmX72TvJDY4ksBDQcK7O/FZpJ8l1sag8Yy71qKlo7pRAQIxLc8rJx
 N0eyiet+rChWdPU/ImYCpCgITG+EcTbGtQt8NiT25s7jadV1a6DGgwraei6RImgNoyh4
 3AY6GZRl4PhBGpqljgQI3tyZ62HKm6TFqJukuExrWdvYANgHmi04GZSWP3iv3RAPpWIp
 YQ7Rt8d0yb/V8xyu8bEtE64+jqVIDZvOUScsay/0INKdFcKADQ+K5XG3lTI+PksW7X2n
 hmLMabJ5RLK8NO2lS3f8fHHb5mEJAfjvu/N03zckdsL09wBX9Ek7QaS7/3p7UmqvIBL1
 3CAw==
X-Gm-Message-State: AOAM5334sdehaj3BDBRXGMxbm/StYn5g0NjUgS8gmBeKWMgbVpg9zyU7
 H1furUZTbQ7f8VEY/2sYWznzqr96JYI5hg==
X-Google-Smtp-Source: ABdhPJxT0ZFR/ojDyeuGP3TTh2Mf0qioK5xQHEQnlFd2qqdvyMI08/jc17ZL3WRFPQf/dFKnV29t4A==
X-Received: by 2002:a17:902:7005:b029:12b:9b9f:c463 with SMTP id
 y5-20020a1709027005b029012b9b9fc463mr10479031plk.76.1627215859097; 
 Sun, 25 Jul 2021 05:24:19 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 0/9] Fixes for clang-13
Date: Sun, 25 Jul 2021 02:24:07 -1000
Message-Id: <20210725122416.1391332-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are all "variable set but not used" Werrors when building
with clang master.

Patch 1 is clearly a clang bug, not considering the side-effects
of g_autofree, but the rest are legitimate.


r~


Richard Henderson (9):
  nbd/server: Mark variable unused in nbd_negotiate_meta_queries
  accel/tcg: Remove unused variable in cpu_exec
  util/selfmap: Discard mapping on error
  net/checksum: Remove unused variable in net_checksum_add_iov
  hw/audio/adlib: Remove unused variable in adlib_callback
  hw/ppc/spapr_events: Remove unused variable from check_exception
  hw/pci-hist/pnv_phb4: Fix typo in pnv_phb4_ioda_write
  linux-user/syscall: Remove unused variable from execve
  tests/unit: Remove unused variable from test_io

 accel/tcg/cpu-exec.c   | 10 ++--------
 hw/audio/adlib.c       |  3 +--
 hw/pci-host/pnv_phb4.c |  2 +-
 hw/ppc/spapr_events.c  |  5 -----
 linux-user/syscall.c   |  3 ---
 nbd/server.c           |  3 ++-
 net/checksum.c         |  4 +---
 tests/unit/test-iov.c  |  5 +----
 util/selfmap.c         | 29 +++++++++++++++++------------
 9 files changed, 25 insertions(+), 39 deletions(-)

-- 
2.25.1


