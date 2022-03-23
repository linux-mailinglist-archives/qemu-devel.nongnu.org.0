Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263394E4B21
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 03:54:28 +0100 (CET)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWr8k-0006Y0-PH
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 22:54:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWr7M-0004zi-VU
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 22:53:00 -0400
Received: from [2607:f8b0:4864:20::630] (port=34658
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWr7I-0005ji-44
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 22:52:58 -0400
Received: by mail-pl1-x630.google.com with SMTP id i11so330443plr.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 19:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g0D/WBKifaDu0QJZs9LIL569qdjw+FHM82ekkuU6fuM=;
 b=KoN+nML2TonJR5xMgMr2gMwkQES9A1FLa7BAlsvaQ9f1w5K4h4DgAyB0dhKwP7wtiG
 HrCJDRQiUP8skWsJMTV+GJZkwIt4iOMdNEwvFBPHsZHzRukCNGcKlfxbmWcQ2qjS+UsN
 IzLXJ65q/j5ijvMs3h+fZX+VBNaPgkKPagKLxCglfYX6TEPjEiCrxGfsMWXg/DOer4cs
 Q1K77VSirNxaSNNvcmonpH5NyriNtv5/A1M35DA2w2rKjth/kpjiNHeycdqEAvVDbbCg
 8FI3Dr6WXU9WPceBfJvv20+zLz7mfPZ5WF7EQNMe9fV7igx6VkBrN8WrNtev+T/69JHp
 ryeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g0D/WBKifaDu0QJZs9LIL569qdjw+FHM82ekkuU6fuM=;
 b=rjJ9IccyUQ7Re9Lp8QUWDu0hMXJ6UK33gMt19ZKP2qFVp8BfiUY9f9nuE83VN1Pzvt
 Uw7lX3NutslKUPO0xce8YlwQ65A8nf33hbgP8cvBghtXXeAzQrbd12mDzvV8Oi9fh3ma
 WarAEq7QxQFe5gZFteA9BzZng6Mo66JEJSsxbaAgpJxC3dvOcdAbnBpi5kUbOQZ9029d
 +E3+3w3+sxvqJdGM29eMnWngJkSlxitHp8C+emXy6QtNO0zsmT1hlVHjoDmUPtrDQQVv
 lxr2moZfWfqQLrLze3aF6Yocxk7os0XMj6+FXM3q1WbXeCGGto2JsBxqhck91jwYGMWd
 6bag==
X-Gm-Message-State: AOAM532ijVpVXUQiOekkt7WvQSaU14z8R7kSeb9/P/QJ3656ivju0zh+
 wEPKHIQ6G4ptjZStA7RTjHoJuA==
X-Google-Smtp-Source: ABdhPJxYBmxv6gXRXs+b+cxGIwP3jmoRCvK74xS07EPSxgN90S1/2mQYEwexyNb2ELj/F4UwKJNm3A==
X-Received: by 2002:a17:902:6845:b0:153:9af1:3134 with SMTP id
 f5-20020a170902684500b001539af13134mr21522767pln.169.1648003973459; 
 Tue, 22 Mar 2022 19:52:53 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a63a602000000b0038062a0bc6fsm18104869pge.67.2022.03.22.19.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 19:52:52 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com,
	mst@redhat.com
Subject: [PATCH v3 0/6] Support akcipher for virtio-crypto
Date: Wed, 23 Mar 2022 10:49:06 +0800
Message-Id: <20220323024912.249789-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: herbert@gondor.apana.org.au, jasowang@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2 -> v3:
- Introduce akcipher types to qapi
- Add test/benchmark suite for akcipher class
- Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
  - crypto: Introduce akcipher crypto class
  - virtio-crypto: Introduce RSA algorithm

v1 -> v2:
- Update virtio_crypto.h from v2 version of related kernel patch.

v1:
- Support akcipher for virtio-crypto.
- Introduce akcipher class.
- Introduce ASN1 decoder into QEMU.
- Implement RSA backend by nettle/hogweed.

Lei He (3):
  crypto-akcipher: Introduce akcipher types to qapi
  crypto: Implement RSA algorithm by hogweed
  tests/crypto: Add test suite for crypto akcipher

Zhenwei Pi (3):
  virtio-crypto: header update
  crypto: Introduce akcipher crypto class
  virtio-crypto: Introduce RSA algorithm

 backends/cryptodev-builtin.c                  | 319 +++++++-
 backends/cryptodev-vhost-user.c               |  34 +-
 backends/cryptodev.c                          |  32 +-
 crypto/akcipher-nettle.c                      | 523 +++++++++++++
 crypto/akcipher.c                             |  81 ++
 crypto/asn1_decoder.c                         | 185 +++++
 crypto/asn1_decoder.h                         |  42 +
 crypto/meson.build                            |   4 +
 hw/virtio/virtio-crypto.c                     | 326 ++++++--
 include/crypto/akcipher.h                     | 155 ++++
 include/hw/virtio/virtio-crypto.h             |   5 +-
 .../standard-headers/linux/virtio_crypto.h    |  82 +-
 include/sysemu/cryptodev.h                    |  88 ++-
 meson.build                                   |  11 +
 qapi/crypto.json                              |  86 +++
 tests/bench/benchmark-crypto-akcipher.c       | 163 ++++
 tests/bench/meson.build                       |   6 +
 tests/bench/test_akcipher_keys.inc            | 277 +++++++
 tests/unit/meson.build                        |   1 +
 tests/unit/test-crypto-akcipher.c             | 715 ++++++++++++++++++
 20 files changed, 2990 insertions(+), 145 deletions(-)
 create mode 100644 crypto/akcipher-nettle.c
 create mode 100644 crypto/akcipher.c
 create mode 100644 crypto/asn1_decoder.c
 create mode 100644 crypto/asn1_decoder.h
 create mode 100644 include/crypto/akcipher.h
 create mode 100644 tests/bench/benchmark-crypto-akcipher.c
 create mode 100644 tests/bench/test_akcipher_keys.inc
 create mode 100644 tests/unit/test-crypto-akcipher.c

-- 
2.25.1


