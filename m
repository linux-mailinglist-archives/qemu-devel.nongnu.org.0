Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45F513664
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:08:35 +0200 (CEST)
Received: from localhost ([::1]:46910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4os-0006T8-J1
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nk4ks-0003Wk-5W
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:04:26 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nk4km-0007tW-Rr
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:04:23 -0400
Received: by mail-pf1-x436.google.com with SMTP id p12so4384504pfn.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zkXWp8YkbHgF6tQunE9Dc1g1IZuQaUaeHQc84WiuWuw=;
 b=KBf5cjMviFZ3XkhqoulAuU+Jozs8mLNv5F50zJqFkTDeA1vc1WC+OIpkszs1/B6/Si
 5OpAckCU1cI+q4cMIwDF2JXatP1r7CO6u2va16Bq6oWc1WDFcNVejtRuNg3SdnpqQkh3
 O6eLvIGjcDA5YoOCQJXIvkyHwG6RwYEzkQvTbokrO5hMGUj8z5fuFw2jb3Xq4wq4wGEH
 aNPEwhWKFY5y2XN/Fb31CLW2mpvD0njJ7sxC400FLH6bUoyTsIuCTquJwHkZgSHjE8Wm
 OJ9hkPOE66NwbsoJ7fAGbd5feXBs/WoYAMxTNwPwY4OkknzyjcxkIz6D6D+1OAzX21Db
 uo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zkXWp8YkbHgF6tQunE9Dc1g1IZuQaUaeHQc84WiuWuw=;
 b=xdY6EwQ99ti7AXkmKiy/qSX4YzNIstnAJETGMY6XahtaeJKGPhwGEd9rWmbwEF21cR
 sCht37pMx0xdJKA6izeZM2+nD9/7lVE5jSeigyrpMxlTf89G+VHP4L+8o/eKonELYbiO
 507n3mLceZTJQrYRj9CwLaJv1ELA++4uFID8uD1/dDu9FxONY/jQNmtEzmOe4CY/drl8
 halMnznQL/4GD3KBgC9FbIraVB+3L0rhVkvpvS5JeeyZXkNYE9ExQIqHoOOP4luubYY/
 Nm5oZRtri5GZvzVj2C/Hd7vnzYw1zLvh9vyirfDHSEMisxSBSllmQBxT3dobahKe4mX1
 rnDg==
X-Gm-Message-State: AOAM530gqqwTak+m8aNQJyPDgf4DUrbQ8CoYluwOdJMI7OiCKBgsgpYr
 kqlSj8g58IbELCfTMriMMyfYgQ==
X-Google-Smtp-Source: ABdhPJxbR3dazvNTLyiio1zH4TfsUXSelYR5IENf0r/5fyXtYZI4SWjfy6a0vf2pfkG2atZ8JyAmjA==
X-Received: by 2002:a05:6a00:b4d:b0:50d:7e9f:1ff0 with SMTP id
 p13-20020a056a000b4d00b0050d7e9f1ff0mr9151453pfo.80.1651154658806; 
 Thu, 28 Apr 2022 07:04:18 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 x129-20020a623187000000b0050835f6d6a1sm38975pfx.9.2022.04.28.07.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:04:18 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Subject: [PATCH v5 0/9] Introduce akcipher service for virtio-crypto
Date: Thu, 28 Apr 2022 21:59:34 +0800
Message-Id: <20220428135943.178254-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: helei.sig11@bytedance.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Lei & MST

Daniel has started to review the akcipher framework and nettle & gcrypt
implementation, this part seems to be ready soon. Thanks a lot to Daniel!

And the last patch "crypto: Introduce RSA algorithm" handles akcipher
requests from guest and uses the new akcipher service. The new feature
can be used to test by the builtin driver. I would appreciate it if you
could review patch.

v4 -> v5:
- Move QCryptoAkCipher into akcipherpriv.h, and modify the related comments.
- Rename asn1_decoder.c to der.c.
- Code style fix: use 'cleanup' & 'error' lables.
- Allow autoptr type to auto-free.
- Add test cases for rsakey to handle DER error.
- Other minor fixes.

v3 -> v4:
- Coding style fix: Akcipher -> AkCipher, struct XXX -> XXX, Rsa -> RSA,
XXX-alg -> XXX-algo.
- Change version info in qapi/crypto.json, from 7.0 -> 7.1.
- Remove ecdsa from qapi/crypto.json, it would be introduced with the implemetion later.
- Use QCryptoHashAlgothrim instead of QCryptoRSAHashAlgorithm(removed) in qapi/crypto.json.
- Rename arguments of qcrypto_akcipher_XXX to keep aligned with qcrypto_cipher_XXX(dec/enc/sign/vefiry -> in/out/in2), and add qcrypto_akcipher_max_XXX APIs.
- Add new API: qcrypto_akcipher_supports.
- Change the return value of qcrypto_akcipher_enc/dec/sign, these functions return the actual length of result.
- Separate ASN.1 source code and test case clean.
- Disable RSA raw encoding for akcipher-nettle.
- Separate RSA key parser into rsakey.{hc}, and implememts it with builtin-asn1-decoder and nettle respectivly.
- Implement RSA(pkcs1 and raw encoding) algorithm by gcrypt. This has higher priority than nettle.
- For some akcipher operations(eg, decryption of pkcs1pad(rsa)), the length of returned result maybe less than the dst buffer size, return the actual length of result instead of the buffer length to the guest side. (in function virtio_crypto_akcipher_input_data_helper)
- Other minor changes.

Thanks to Daniel!

Eric pointed out this missing part of use case, send it here again.

In our plan, the feature is designed for HTTPS offloading case and other applications which use kernel RSA/ecdsa by keyctl syscall. The full picture shows bellow:


                  Nginx/openssl[1] ... Apps
Guest   -----------------------------------------
                   virtio-crypto driver[2]
-------------------------------------------------
                   virtio-crypto backend[3]
Host    -----------------------------------------
                  /          |          \
              builtin[4]   vhost     keyctl[5] ...


[1] User applications can offload RSA calculation to kernel by keyctl syscall. There is no keyctl engine in openssl currently, we developed a engine and tried to contribute it to openssl upstream, but openssl 1.x does not accept new feature. Link:
    https://github.com/openssl/openssl/pull/16689

This branch is available and maintained by Lei <helei.sig11@bytedance.com>
    https://github.com/TousakaRin/openssl/tree/OpenSSL_1_1_1-kctl_engine

We tested nginx(change config file only) with openssl keyctl engine, it works fine.

[2] virtio-crypto driver is used to communicate with host side, send requests to host side to do asymmetric calculation.
    https://lkml.org/lkml/2022/3/1/1425

[3] virtio-crypto backend handles requests from guest side, and forwards request to crypto backend driver of QEMU.

[4] Currently RSA is supported only in builtin driver. This driver is supposed to test the full feature without other software(Ex vhost process) and hardware dependence. ecdsa is introduced into qapi type without implementation, this may be implemented in Q3-2022 or later. If ecdsa type definition should be added with the implementation together, I'll remove this in next version.

[5] keyctl backend is in development, we will post this feature in Q2-2022. keyctl backend can use hardware acceleration(Ex, Intel QAT).

Setup the full environment, tested with Intel QAT on host side, the QPS of HTTPS increase to ~200% in a guest.

VS PCI passthrough: the most important benefit of this solution makes the VM migratable.

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

Lei He (6):
  qapi: crypto-akcipher: Introduce akcipher types to qapi
  crypto: add ASN.1 DER decoder
  crypto: Implement RSA algorithm by hogweed
  crypto: Implement RSA algorithm by gcrypt
  test/crypto: Add test suite for crypto akcipher
  tests/crypto: Add test suite for RSA keys

Zhenwei Pi (3):
  virtio-crypto: header update
  crypto: Introduce akcipher crypto class
  crypto: Introduce RSA algorithm

 backends/cryptodev-builtin.c                  | 272 ++++-
 backends/cryptodev-vhost-user.c               |  34 +-
 backends/cryptodev.c                          |  32 +-
 crypto/akcipher-gcrypt.c.inc                  | 520 +++++++++
 crypto/akcipher-nettle.c.inc                  | 432 ++++++++
 crypto/akcipher.c                             | 108 ++
 crypto/akcipherpriv.h                         |  55 +
 crypto/der.c                                  | 190 ++++
 crypto/der.h                                  |  82 ++
 crypto/meson.build                            |   6 +
 crypto/rsakey-builtin.c.inc                   | 209 ++++
 crypto/rsakey-nettle.c.inc                    | 154 +++
 crypto/rsakey.c                               |  44 +
 crypto/rsakey.h                               |  94 ++
 hw/virtio/virtio-crypto.c                     | 323 ++++--
 include/crypto/akcipher.h                     | 158 +++
 include/hw/virtio/virtio-crypto.h             |   5 +-
 .../standard-headers/linux/virtio_crypto.h    |  82 +-
 include/sysemu/cryptodev.h                    |  83 +-
 meson.build                                   |  11 +
 qapi/crypto.json                              |  64 ++
 tests/bench/benchmark-crypto-akcipher.c       | 157 +++
 tests/bench/meson.build                       |   4 +
 tests/bench/test_akcipher_keys.inc            | 537 ++++++++++
 tests/unit/meson.build                        |   2 +
 tests/unit/test-crypto-akcipher.c             | 990 ++++++++++++++++++
 tests/unit/test-crypto-der.c                  | 290 +++++
 27 files changed, 4792 insertions(+), 146 deletions(-)
 create mode 100644 crypto/akcipher-gcrypt.c.inc
 create mode 100644 crypto/akcipher-nettle.c.inc
 create mode 100644 crypto/akcipher.c
 create mode 100644 crypto/akcipherpriv.h
 create mode 100644 crypto/der.c
 create mode 100644 crypto/der.h
 create mode 100644 crypto/rsakey-builtin.c.inc
 create mode 100644 crypto/rsakey-nettle.c.inc
 create mode 100644 crypto/rsakey.c
 create mode 100644 crypto/rsakey.h
 create mode 100644 include/crypto/akcipher.h
 create mode 100644 tests/bench/benchmark-crypto-akcipher.c
 create mode 100644 tests/bench/test_akcipher_keys.inc
 create mode 100644 tests/unit/test-crypto-akcipher.c
 create mode 100644 tests/unit/test-crypto-der.c

-- 
2.20.1


