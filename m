Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB7615D4A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:04:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq8iS-0000eS-Px; Wed, 02 Nov 2022 04:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq8i9-0000Vn-6t
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:02:57 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq8ht-0000ru-JB
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:02:56 -0400
Received: by mail-pg1-x529.google.com with SMTP id 128so15597068pga.1
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 01:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FYBtM1WZg0jTrjWmnAoDteH4LhspLhq4Cl9rgo80LBU=;
 b=uVtKBiznhjXjrguNGLxgSzEB9cizQebdBsTqEVwHwj/orfn4zLUohhnOl9rW7SHUTM
 RTpU9ilT2Z7S8vWZ1NoetRYUz/OfPPaecUFeWab22NoBw73CJ2D9Sgyco4h0prYgdCfM
 yQszKybqc7z3oKaGEb+nfKfRLcp1pv4wsYQqCPzJbciGZvXhNN9rUZj3GXD4iJo//OWh
 1Jm3gqSU1eBlA6a/Y6EuAVb67ygeENxzjDdQ3cPuzmpzlSMbXR2t7Pt2QRMUzmKRudAC
 YEYJYjEbs2IcPlVXvvdfEekxUYQZxstnhrheh2N9VOpvlwaF424l6QlG40nJ+zmlA11n
 d2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FYBtM1WZg0jTrjWmnAoDteH4LhspLhq4Cl9rgo80LBU=;
 b=0535zNDVGgCaJ+RdbgCEt6WmCLOPeUzLrPAGuW9DveE9oAyZe2Unk4j9AvE/6MnWoM
 SrXZY+Ho6X+0wajgb5E+AYCsOPQTnMH2UGD2UJo2WO+Uo9fbxuLfkoSfcHWIpmU4iscz
 qIwi5e8w0hVenAkUaFBqBMctA/Ac0ZC2HaB1c2fyAWmc3Zx2bTC4eSGA07AVia6cehfl
 UTUJtvmmx+isRiEAUoOcBsAiWrFOSY+KcZiAU4WB2iwBTN3JgZCNVG3+y4gTVdgMpKrP
 tq+j5i/8qqlGsWy7m1bIN48+uASh3YDyzguTnSicNxzMEMs8b9OmZU/2UlB84WT4CIDE
 npyA==
X-Gm-Message-State: ACrzQf1TBqsuXTEJKMGsDvZCPQvvJlPIMOKjOlcc/9jHYg3WrNRBXvuT
 nLjSUcQXzlRgNq6S53C9CekDlQ==
X-Google-Smtp-Source: AMsMyM7SEuPKhzaBvqPFGcpY9qJiKqJmG2n7dcNygSAMTSTJnKUSA6WArPaNxJa80lzIp1k7I6QHTQ==
X-Received: by 2002:a65:57cd:0:b0:46e:ca52:f6a9 with SMTP id
 q13-20020a6557cd000000b0046eca52f6a9mr20111645pgr.269.1667376158323; 
 Wed, 02 Nov 2022 01:02:38 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.245])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a63f214000000b0045ff216a0casm3916640pgh.3.2022.11.02.01.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 01:02:37 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: pizhenwei@bytedance.com, qemu-devel@nongnu.org,
 Lei He <helei.sig11@bytedance.com>
Subject: [PATCH v3 0/4] Add a new backend for cryptodev
Date: Wed,  2 Nov 2022 16:02:09 +0800
Message-Id: <20221102080213.46788-1-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v2 --> v3:
- Avoid using g_autoptr to free memory that not allocated in current
function.
- Fix memory-leak when 'virtio_crypto_handle_request' returns non-zero
  value.
- When error occurred, always pass negative status to function 
'virtio_crypto_req_complete'.


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
 hw/virtio/virtio-crypto.c       | 335 ++++++++++++---------
 include/crypto/akcipher.h       |  21 ++
 include/sysemu/cryptodev.h      |  61 ++--
 qapi/qom.json                   |   2 +
 tests/unit/test-crypto-der.c    | 126 ++++++--
 15 files changed, 1682 insertions(+), 264 deletions(-)
 create mode 100644 backends/cryptodev-lkcf.c

-- 
2.11.0


