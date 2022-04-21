Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E25094CB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 03:47:48 +0200 (CEST)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhLv9-00081C-Nr
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 21:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nhLsq-00059v-35
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 21:45:24 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nhLsl-00015U-9i
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 21:45:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id bx5so3584081pjb.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 18:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lLFp+jcZPCDBptlsIznxTdve17ZyRswKCYMzv/KYwNs=;
 b=eIXSY94mJhIN8yUHyDxfX0SvMqUPkcn3XbS9T+n0csM9I8+eu0fqOeyOsoI2eGww1l
 nQG8IxES4nUl5ZdNPfzdBByNWDJVCYKpj2QwYcnqcobC5gyanMbn6LiUju38B0oKe5kI
 dWtLkQFLkabj89M6YIBZJSmkmiBiRtkZx4CHSsIhJm/b28vWn/3SrtfI1Gs01VY+vX8L
 GZb2J4XDt1+zZzgefXbZWgkORpMYBn0Dk1dTTe2DRtzpAd3k0RUmc5uzWOfOD1SHe4lK
 DdzT+MP1h8ZBP0UHDjiCYQk0aK6CYVeu5DjUMc7tQ5mU0BZcSZ+6d32BFWh6RIlSWd2w
 2b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lLFp+jcZPCDBptlsIznxTdve17ZyRswKCYMzv/KYwNs=;
 b=ZYVPVEwLPNWXn8Eb2be5iCuWpdzNFMQSuKk8C5UxvTiQ+216OB1T2NsHrv7VZ4bWdD
 6JdvUCwRa1Q/At95Pd/A21hEMiNQAZxwMwsciDfOeQA+GdA3vYHOLFCu8UbHKojSPqk6
 UDZCZu8sgoEChVaOEMXKUXmmVz8lXHV6GgHsl1vm6N2rApyKtkTA2gWuu3UcNosOMqgN
 xFU86J1yHZmR8z1motlm2JvBxljyNnslEDaKfuMFDP+TqB49Fpp86g54ezum2OIV1IJW
 03Yn7Mf/crNmoD+1CvZVFjCWBonha2AcpbEWlf3BriZSYe62TCNSOTS7PB1sGCZ4cD9q
 +7nQ==
X-Gm-Message-State: AOAM533gyfl0dC7ahqsJHy8NaM4jdsKEck067sAuE8OJbxk+1FrgoAC3
 jrq2N9uTc0r/mleKigOxJYB4NA==
X-Google-Smtp-Source: ABdhPJwmoXVK6D/qbEB2UeQpbMpyZ8W5u7ZKPfEEe9GI+7zMQJuHK1I2o2urYIvboqdPbEE9jhYDig==
X-Received: by 2002:a17:902:7ec1:b0:156:17a4:a2f8 with SMTP id
 p1-20020a1709027ec100b0015617a4a2f8mr24168256plb.155.1650505517363; 
 Wed, 20 Apr 2022 18:45:17 -0700 (PDT)
Received: from [10.76.15.169] ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 ay33-20020a056a00302100b00508374700b9sm20195756pfb.166.2022.04.20.18.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 18:45:16 -0700 (PDT)
Message-ID: <ed446ba2-75a0-aa0d-535e-0bb3501f558f@bytedance.com>
Date: Thu, 21 Apr 2022 09:41:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: PING: [PATCH v4 0/8] Introduce akcipher service for virtio-crypto
Content-Language: en-US
To: mst@redhat.com, berrange@redhat.com, arei.gonglei@huawei.com
References: <20220411104327.197048-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20220411104327.197048-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102a.google.com
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
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,
Could you please review this series?


On 4/11/22 18:43, zhenwei pi wrote:
> v3 -> v4:
> - Coding style fix: Akcipher -> AkCipher, struct XXX -> XXX, Rsa -> RSA,
> XXX-alg -> XXX-algo.
> - Change version info in qapi/crypto.json, from 7.0 -> 7.1.
> - Remove ecdsa from qapi/crypto.json, it would be introduced with the implemetion later.
> - Use QCryptoHashAlgothrim instead of QCryptoRSAHashAlgorithm(removed) in qapi/crypto.json.
> - Rename arguments of qcrypto_akcipher_XXX to keep aligned with qcrypto_cipher_XXX(dec/enc/sign/vefiry -> in/out/in2), and add qcrypto_akcipher_max_XXX APIs.
> - Add new API: qcrypto_akcipher_supports.
> - Change the return value of qcrypto_akcipher_enc/dec/sign, these functions return the actual length of result.
> - Separate ASN.1 source code and test case clean.
> - Disable RSA raw encoding for akcipher-nettle.
> - Separate RSA key parser into rsakey.{hc}, and implememts it with builtin-asn1-decoder and nettle respectivly.
> - Implement RSA(pkcs1 and raw encoding) algorithm by gcrypt. This has higher priority than nettle.
> - For some akcipher operations(eg, decryption of pkcs1pad(rsa)), the length of returned result maybe less than the dst buffer size, return the actual length of result instead of the buffer length to the guest side. (in function virtio_crypto_akcipher_input_data_helper)
> - Other minor changes.
> 
> Thanks to Daniel!
> 
> Eric pointed out this missing part of use case, send it here again.
> 
> In our plan, the feature is designed for HTTPS offloading case and other applications which use kernel RSA/ecdsa by keyctl syscall. The full picture shows bellow:
> 
> 
>                    Nginx/openssl[1] ... Apps
> Guest   -----------------------------------------
>                     virtio-crypto driver[2]
> -------------------------------------------------
>                     virtio-crypto backend[3]
> Host    -----------------------------------------
>                    /          |          \
>                builtin[4]   vhost     keyctl[5] ...
> 
> 
> [1] User applications can offload RSA calculation to kernel by keyctl syscall. There is no keyctl engine in openssl currently, we developed a engine and tried to contribute it to openssl upstream, but openssl 1.x does not accept new feature. Link:
>      https://github.com/openssl/openssl/pull/16689
> 
> This branch is available and maintained by Lei <helei.sig11@bytedance.com>
>      https://github.com/TousakaRin/openssl/tree/OpenSSL_1_1_1-kctl_engine
> 
> We tested nginx(change config file only) with openssl keyctl engine, it works fine.
> 
> [2] virtio-crypto driver is used to communicate with host side, send requests to host side to do asymmetric calculation.
>      https://lkml.org/lkml/2022/3/1/1425
> 
> [3] virtio-crypto backend handles requests from guest side, and forwards request to crypto backend driver of QEMU.
> 
> [4] Currently RSA is supported only in builtin driver. This driver is supposed to test the full feature without other software(Ex vhost process) and hardware dependence. ecdsa is introduced into qapi type without implementation, this may be implemented in Q3-2022 or later. If ecdsa type definition should be added with the implementation together, I'll remove this in next version.
> 
> [5] keyctl backend is in development, we will post this feature in Q2-2022. keyctl backend can use hardware acceleration(Ex, Intel QAT).
> 
> Setup the full environment, tested with Intel QAT on host side, the QPS of HTTPS increase to ~200% in a guest.
> 
> VS PCI passthrough: the most important benefit of this solution makes the VM migratable.
> 
> v2 -> v3:
> - Introduce akcipher types to qapi
> - Add test/benchmark suite for akcipher class
> - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
>    - crypto: Introduce akcipher crypto class
>    - virtio-crypto: Introduce RSA algorithm
> 
> v1 -> v2:
> - Update virtio_crypto.h from v2 version of related kernel patch.
> 
> v1:
> - Support akcipher for virtio-crypto.
> - Introduce akcipher class.
> - Introduce ASN1 decoder into QEMU.
> - Implement RSA backend by nettle/hogweed.
> 
> Lei He (4):
>    crypto-akcipher: Introduce akcipher types to qapi
>    crypto: add ASN.1 decoder
>    crypto: Implement RSA algorithm by hogweed
>    crypto: Implement RSA algorithm by gcrypt
> 
> Zhenwei Pi (3):
>    virtio-crypto: header update
>    crypto: Introduce akcipher crypto class
>    crypto: Introduce RSA algorithm
> 
> lei he (1):
>    tests/crypto: Add test suite for crypto akcipher
> 
>   backends/cryptodev-builtin.c                  | 261 ++++++-
>   backends/cryptodev-vhost-user.c               |  34 +-
>   backends/cryptodev.c                          |  32 +-
>   crypto/akcipher-gcrypt.c.inc                  | 531 +++++++++++++
>   crypto/akcipher-nettle.c.inc                  | 448 +++++++++++
>   crypto/akcipher.c                             | 108 +++
>   crypto/akcipherpriv.h                         |  43 ++
>   crypto/asn1_decoder.c                         | 161 ++++
>   crypto/asn1_decoder.h                         |  75 ++
>   crypto/meson.build                            |   6 +
>   crypto/rsakey-builtin.c.inc                   | 150 ++++
>   crypto/rsakey-nettle.c.inc                    | 141 ++++
>   crypto/rsakey.c                               |  43 ++
>   crypto/rsakey.h                               |  96 +++
>   hw/virtio/virtio-crypto.c                     | 323 ++++++--
>   include/crypto/akcipher.h                     | 151 ++++
>   include/hw/virtio/virtio-crypto.h             |   5 +-
>   .../standard-headers/linux/virtio_crypto.h    |  82 +-
>   include/sysemu/cryptodev.h                    |  83 +-
>   meson.build                                   |  11 +
>   qapi/crypto.json                              |  64 ++
>   tests/bench/benchmark-crypto-akcipher.c       | 161 ++++
>   tests/bench/meson.build                       |   4 +
>   tests/bench/test_akcipher_keys.inc            | 537 +++++++++++++
>   tests/unit/meson.build                        |   2 +
>   tests/unit/test-crypto-akcipher.c             | 708 ++++++++++++++++++
>   tests/unit/test-crypto-asn1-decoder.c         | 289 +++++++
>   27 files changed, 4404 insertions(+), 145 deletions(-)
>   create mode 100644 crypto/akcipher-gcrypt.c.inc
>   create mode 100644 crypto/akcipher-nettle.c.inc
>   create mode 100644 crypto/akcipher.c
>   create mode 100644 crypto/akcipherpriv.h
>   create mode 100644 crypto/asn1_decoder.c
>   create mode 100644 crypto/asn1_decoder.h
>   create mode 100644 crypto/rsakey-builtin.c.inc
>   create mode 100644 crypto/rsakey-nettle.c.inc
>   create mode 100644 crypto/rsakey.c
>   create mode 100644 crypto/rsakey.h
>   create mode 100644 include/crypto/akcipher.h
>   create mode 100644 tests/bench/benchmark-crypto-akcipher.c
>   create mode 100644 tests/bench/test_akcipher_keys.inc
>   create mode 100644 tests/unit/test-crypto-akcipher.c
>   create mode 100644 tests/unit/test-crypto-asn1-decoder.c
> 

-- 
zhenwei pi

