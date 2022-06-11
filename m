Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C2C5471A9
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 05:36:58 +0200 (CEST)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzrvl-00088Q-6t
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 23:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nzrtf-0006cH-91
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 23:34:47 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nzrtZ-0007lV-K1
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 23:34:44 -0400
Received: by mail-pg1-x534.google.com with SMTP id e66so841914pgc.8
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 20:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AwJqyhb+aRWMDB6VmQidGTvGrWJ8hNACDp4b3wUJSlk=;
 b=S23Uh2XTjEyOiIopclaZplv98tKyIZHryu+MF1dITNyX4cNKH+llzDsjn9q5b54b3N
 9RyDPVVzTAr7O0xDfU3WhWKRiVyteXRrqLaycQwuSd3WsjFQ86mebV5lNNhjFsxEY3OD
 454OvEBS2cjg/8Eb85+n4lYrtnNOI7E1NSLVkJtpF9IYD6b/Npekr72TETBE46Gex7rs
 NYkcYYbB8vfZ5VY7iHtL6Ed82A/t1nYip5UB6Mv8HxePIEI+yB4EdHW3zayeko6LLdlM
 NfgbOdTD/oZHBQ6/IsK8ALEzznqnE5w2GJUKoM7qdP0RmWUQtHNR54AdE7XD9/G04gyU
 msFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AwJqyhb+aRWMDB6VmQidGTvGrWJ8hNACDp4b3wUJSlk=;
 b=VTOvuF/7+dFx5xJz9yViG36QrwfjZzUUH3cR3k0yqXr8vcqGvDfJAkXFuDc8Eahdvn
 MSPAQPIKIC/0DsxieW7YvEGrVcQ7naG1qPUvamFXcwoYPlULY0DRwqgoDaVx+CQXyr73
 BRNk6YFTwLAd5y5oIzvHAPfMFo4zR82iO6y+n9JDQMahJ2D1slC4g5aR0SqTJmgwdOf3
 c/4W67YkyjyerPQJHdysnn+JNNscNkhaO+0XuLughVp3HrvPKMGH34RGHHaInk/57QEr
 l543F4fWcJAmEK7iNaRCg+08AuTEv2Cicn/iEfkaYvKChQ2H/ST7kSt4KI2c4z6Lm5lf
 GGQg==
X-Gm-Message-State: AOAM5336d2eyAJG1RuWoFw5amUk8xzdCzPYh9LMwYWhPtjwePJuSluvt
 ZvqzICE946wXwVa7knE7XxR60w==
X-Google-Smtp-Source: ABdhPJymDVOwEd6S15UWSYYMUQsA5Mr4c7aS0uczqpHE6PxVNHX18iPP1I6StKIXRnQXuelXDFFpAQ==
X-Received: by 2002:a63:741:0:b0:3fc:6b3c:f9dd with SMTP id
 62-20020a630741000000b003fc6b3cf9ddmr41536861pgh.351.1654918478958; 
 Fri, 10 Jun 2022 20:34:38 -0700 (PDT)
Received: from always-T480.www.tendawifi.com ([139.177.225.229])
 by smtp.gmail.com with ESMTPSA id
 x126-20020a628684000000b0051c15bb876esm331167pfd.174.2022.06.10.20.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 20:34:38 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: f4bug@amsat.org, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, helei.sig11@bytedance.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v9 0/1] Introduce akcipher service for virtio-crypto
Date: Sat, 11 Jun 2022 11:36:57 +0800
Message-Id: <20220611033658.19645-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v8 - v9:
- Fix compiling error reported by clang-13/14:
  opt->hash_alg = cryptodev_builtin_get_rsa_hash_algo(); this leads
  implicit convertion from 'int' to 'uint32'. 'if (opt->hash_alg < 0)'
  is always false. Thanks to Philippe Mathieu-Daudé.

v7 - v8:
- The changes of QEMU crypto has been reviewed & merged by Daniel,
  remove this part from this series. Thanks to Daniel!
- virtio_crypto.h is updated by e4082063e47e
  ("linux-headers: Update to v5.18-rc6"), remove from this series.
- Minor fixes reviewed by Gonglei. Thanks to Gonglei!

v6 -> v7:
- Fix serval build errors for some specific platforms/configurations.
- Use '%zu' instead of '%lu' for size_t parameters.
- AkCipher-gcrypt: avoid setting wrong error messages when parsing RSA
  keys.
- AkCipher-benchmark: process constant amount of sign/verify instead
 of running sign/verify for a constant duration.

v5 -> v6:
- Fix build errors and codestyles.
- Add parameter 'Error **errp' for qcrypto_akcipher_rsakey_parse.
- Report more detailed errors.
- Fix buffer length check and return values of akcipher-nettle, allows caller to
 pass a buffer with larger size than actual needed.

A million thanks to Daniel!

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

Zhenwei Pi (1):
  crypto: Introduce RSA algorithm

 backends/cryptodev-builtin.c      | 275 +++++++++++++++++++++----
 backends/cryptodev-vhost-user.c   |  34 +++-
 backends/cryptodev.c              |  32 ++-
 hw/virtio/virtio-crypto.c         | 323 ++++++++++++++++++++++++------
 include/hw/virtio/virtio-crypto.h |   5 +-
 include/sysemu/cryptodev.h        |  83 ++++++--
 6 files changed, 608 insertions(+), 144 deletions(-)

-- 
2.20.1


