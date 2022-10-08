Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE9C5F846F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 10:54:56 +0200 (CEST)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oh5bi-0007l3-CA
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 04:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oh5Xp-0003yh-FJ
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 04:50:53 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oh5Xi-0004yH-CF
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 04:50:48 -0400
Received: by mail-pg1-x531.google.com with SMTP id e129so6507981pgc.9
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wsMfQhz8XqTFxYz34t0MmKEiJS+ehNkiVrcKo/00x5U=;
 b=TzbjHf7H0JzQ528ZZdgg87zXI2t+WrGOwi0JXJagaPlR3ZDugwTn/xOAKDEfrBlAPS
 bLNVwy0rvzg/M/J/wH8Xmu/JzC694W1K6I9+8NhE0an9u5ziBTMAf/SSfVQImj+WCCbQ
 LeDfWphn40tacN5tEM68uxjT5GoIrijsJN1aMx2bSl3EJ9RxRgkqKErSlgnBRCjfhtle
 XolFKHWxDft7dHRie3wALv52KRE8yka2ZszZRFE3cy8OjJnGAezFGYkkAe9dfuD3I6oc
 c0vj9aU1jauuFVtWQavWwyNL3oYtu8aEDlUJlEL5oRviGuvN0ty02q6Itye3D2HcD+99
 wGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wsMfQhz8XqTFxYz34t0MmKEiJS+ehNkiVrcKo/00x5U=;
 b=H5yb0J15aynjBtOxlAqqV1IDkGy6OFU2A8d7vjmIKEPvxBp6OzJ+EtliVS/v5+KQWR
 W1phS/CI9Lhj/FfcLYOF0E4gZcS4ONlK4PmZeInx+Qf5mTJ4kUn0sarJjJAxL5dCGPXf
 uHHjJ3HSlEDHWRBaBImIbjF8inDVzYpWabHgpYGOSF7W0Dvx4imPHcJbWRUlWCWlhP7W
 5d4P92U8AfMFm9fp7vgeXAsS/v/p2BCRQQBr608kAzAj4foEJlqEzQjgvlckhBA6VhRJ
 NLHBh/BrIdF8czWQrZ5yvaQbNYB2USpV53EuaX4dHni0mw0+GigIspPuFwi1MT4Ifwi7
 2O/Q==
X-Gm-Message-State: ACrzQf1T91HKE12FdqR399UfjcMYbP3WsUsawsMaLfjnhRybVE75WaId
 ddsq8zsxjVM5Whpi7fS8AXfjWQ==
X-Google-Smtp-Source: AMsMyM4SCK277jxwOZ3imHCcQqkr1voXRCRqZXArhR/z4TPdFxdViKXpEtvtIgOOHWfDcn5Fap+ZhA==
X-Received: by 2002:a05:6a00:2181:b0:51b:560b:dd30 with SMTP id
 h1-20020a056a00218100b0051b560bdd30mr9267371pfi.44.1665219043360; 
 Sat, 08 Oct 2022 01:50:43 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([63.216.146.187])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a1709028a9400b00179f442519csm2852861plo.40.2022.10.08.01.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 01:50:42 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: berrange@redhat.com,
	arei.gonglei@huawei.com,
	mst@redhat.com
Cc: pizhenwei@bytedance.com, qemu-devel@nongnu.org,
 Lei He <helei.sig11@bytedance.com>
Subject: [PATCH v2 0/4] Add a new backend for cryptodev
Date: Sat,  8 Oct 2022 16:50:26 +0800
Message-Id: <20221008085030.70212-1-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 --> v2:
- Fix compile errors when neither 'nettle' nor 'gcrypt' are enabled.
- Trivial changes to error codes when neither 'nettle' nor 'gcrypt' are
enabled.

This patch adds a new backend called LKCF to cryptodev, LKCF stands
for Linux Kernel Cryptography Framework. If a cryptographic
accelerator that supports LKCF is installed on the the host (you can
see which algorithms are supported in host's LKCF by executing
'cat /proc/crypto'), then RSA operations can be offloaded.
More background info can refer to: https://lwn.net/Articles/895399/,
'keyctl[5]' in the picture.

This patch:
1. Modified some interfaces of cryptodev and cryptodev-backend to
support asynchronous requests.
2. Extended the DER encoder in crypto, so that we can export the
RSA private key into PKCS#8 format and upload it to host kernel.
3. Added a new backend for cryptodev.

I tested the backend with a QAT card, the qps of RSA-2048-decryption
is about 25k/s, and the main-loop becomes the bottleneck. The qps
using OpenSSL directly is about 6k/s (with 6 vCPUs). We will support 
IO-thread for cryptodev in another series later.


Lei He (4):
  virtio-crypto: Support asynchronous mode
  crypto: Support DER encodings
  crypto: Support export akcipher to pkcs8
  cryptodev: Add a lkcf-backend for cryptodev

 backends/cryptodev-builtin.c    |  69 +++--
 backends/cryptodev-lkcf.c       | 645 ++++++++++++++++++++++++++++++++++++++++
 backends/cryptodev-vhost-user.c |  51 +++-
 backends/cryptodev.c            |  44 +--
 backends/meson.build            |   3 +
 crypto/akcipher.c               |  18 ++
 crypto/der.c                    | 307 +++++++++++++++++--
 crypto/der.h                    | 211 ++++++++++++-
 crypto/rsakey.c                 |  42 +++
 crypto/rsakey.h                 |  11 +-
 hw/virtio/virtio-crypto.c       | 324 +++++++++++---------
 include/crypto/akcipher.h       |  21 ++
 include/sysemu/cryptodev.h      |  61 ++--
 qapi/qom.json                   |   2 +
 tests/unit/test-crypto-der.c    | 126 ++++++--
 15 files changed, 1675 insertions(+), 260 deletions(-)
 create mode 100644 backends/cryptodev-lkcf.c

-- 
2.11.0


