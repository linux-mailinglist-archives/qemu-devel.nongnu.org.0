Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5BA4B209F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 09:53:18 +0100 (CET)
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIRg5-0007gb-1q
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 03:53:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nIRYU-00009h-AD
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 03:45:26 -0500
Received: from [2607:f8b0:4864:20::1032] (port=34044
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nIRYN-0003eO-LP
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 03:45:22 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso3718556pjb.1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 00:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PaB4eX5eIfNXcpFcbMwDNqkLnPT1dKU3PJWq0bzJplM=;
 b=YpWYXFjjs6RShsyABwDfvNm6jx79gmMxhaw1Fpaq+dJnqQXoCYTu2GmkSgtK8IZYXY
 ldohj3ygggnAWQK1+pJA3V4adQAXBiEp0ytiDNvAeVChe997HsHLoeN3u+h4vSOG9D1M
 o43M0/OhPBlte0SUrPcDRLxSeJ/S9VllFkQTzLBmwC1zbhC/2+XiI9zKYvm5b1CCBN3+
 AwzmtABTi/bzBfI9eKAijCHDVlELazxGygu5gV3p6iyoEsib1M41OqteIaqsa4z2AT6g
 maVOY4zLbvGkCzoEeYrOHIrAs15FYATsD6ndXrahQJOx7QCAJm29Ld3cdUoI+GX/YldI
 a/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PaB4eX5eIfNXcpFcbMwDNqkLnPT1dKU3PJWq0bzJplM=;
 b=xELmXL+X+y9kWeMqzviLtWMkzqvrun5h1bNZofaPRFN7rmueSj2O6AhB/twoJC2Zaf
 RnFPgr3t7/Ez7r3PsYPcyj1OT8kW6PWm3vpOGqrIGf3KrqyNT1AnKRNQtxOT+3x1lqcQ
 poNJRiAhYxmZX7sn+UID3hBVMNNVM4sFssr8S7cBh3DKXB5h/gxCtsIGrmC8MJFbDjp6
 H1YtxarrubYbTMGgkITG4bLkVhxWfTXoFKnYSEzQE/OSu0JDaXoRxqc8nyexURkvbaqH
 duDiAnU3P/V+2nkRIAJNngdZrlY+YxBaxmAPnsU5r1xrXWlQIuivKrgm+GIpqIz0s/wS
 /ARA==
X-Gm-Message-State: AOAM531WD0izUJGCNhwUqaK5llvpY1jr66hlyWF5/ucDOlsOn6K4yHxz
 PQy0yWjyAqxM71sizKQlnBVRCw==
X-Google-Smtp-Source: ABdhPJw8xZ6h9/FQPj8RwTXVV6Zt8ueVO/BXP2VbGZMp+CjlsH2Wx34zZmbUYlsiJxVDnpE/0+of0A==
X-Received: by 2002:a17:902:b493:: with SMTP id
 y19mr615916plr.97.1644569105992; 
 Fri, 11 Feb 2022 00:45:05 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id u7sm3832686pgc.93.2022.02.11.00.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 00:45:05 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com,
	mst@redhat.com
Subject: [PATCH v2 0/3] Support akcipher for virtio-crypto
Date: Fri, 11 Feb 2022 16:43:32 +0800
Message-Id: <20220211084335.1254281-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: helei.sig11@bytedance.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 herbert@gondor.apana.org.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 -> v2:
- Update virtio_crypto.h from v2 version of related kernel patch.

v1:
- Support akcipher for virtio-crypto.
- Introduce akcipher class.
- Introduce ASN1 decoder into QEMU.
- Implement RSA backend by nettle/hogweed.

Lei He (1):
  crypto: Introduce RSA algorithm

Zhenwei Pi (2):
  virtio-crypto: header update
  virtio_crypto: Support virtio crypto asym operation

 backends/cryptodev-builtin.c                  | 201 ++++++--
 backends/cryptodev-vhost-user.c               |  34 +-
 backends/cryptodev.c                          |  32 +-
 crypto/akcipher-nettle.c                      | 486 ++++++++++++++++++
 crypto/akcipher.c                             |  91 ++++
 crypto/asn1_decoder.c                         | 185 +++++++
 crypto/asn1_decoder.h                         |  42 ++
 crypto/meson.build                            |   4 +
 hw/virtio/virtio-crypto.c                     | 328 +++++++++---
 include/crypto/akcipher.h                     |  77 +++
 include/hw/virtio/virtio-crypto.h             |   5 +-
 .../standard-headers/linux/virtio_crypto.h    |  82 ++-
 include/sysemu/cryptodev.h                    |  88 +++-
 meson.build                                   |  11 +
 14 files changed, 1518 insertions(+), 148 deletions(-)
 create mode 100644 crypto/akcipher-nettle.c
 create mode 100644 crypto/akcipher.c
 create mode 100644 crypto/asn1_decoder.c
 create mode 100644 crypto/asn1_decoder.h
 create mode 100644 include/crypto/akcipher.h

-- 
2.20.1


