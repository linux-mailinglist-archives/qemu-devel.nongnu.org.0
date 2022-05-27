Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26568535C39
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 11:03:12 +0200 (CEST)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuVsD-00039U-6f
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 05:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nuVhD-00005A-4q
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:51:47 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nuVh7-0005dt-5S
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:51:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso3784599pjb.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PG+uprLo7VOoHUBnmUgR2afDgCJUN3g8BoyoNV69pwY=;
 b=FUcJmAh0SRom7p4snGfbkdrMch+MvdUrGOBW2OdxvKGpj5zyBzqdwTINULwmYJVxZ1
 qJNTbOEmhYd66R66p4QOWdbrMxzqnL/JP3wB0JGPJmlichjLmKflZzNpLbBwpUpdIhJm
 dj9Qqp5noHsW+goU44wZ+qDKAMT6JYnKjN/4NwmDyUEy2ozvt7uR8UqdsRly2dxHa79E
 Z7hddWUBLiVXYcl9PdAA7UXHmu5SqdSs2cdpgSbKrWzf863hmakp801JErgSo6auZRnb
 mLdp5ESyuuCZDvN4aKvAmKW2s7xnIwxbhf9f7N6f7EOKMaJu2QZ6BJfEle2ag/XzYfYR
 0BuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PG+uprLo7VOoHUBnmUgR2afDgCJUN3g8BoyoNV69pwY=;
 b=xZSjpv4ekH+b4SL4dbe82G+GU3IRB/4ue8NCJiu8MbWMHhTTK52mL8Kb3xdQF0gq+l
 0b3gS8S8VFhyc/xmFoc5vJmQiuHWXLftck9lWBuG+VDhKevp/vYfyU9LC1e+xssdOUKY
 ACWNpnDKBCBL0OWgvZ/HRuTtvHaEayyyY0dSZWnbd681eDBoH83cyhIIxmqxzz8eMhR8
 xfZDsVMn6lqNVSZSN2lKNgj4fY5xZAWkjS3BbUEG6c6GgsUECaO5qezMasN/uM4btf5b
 g9uGQejst+gctJyWmeoBa4gmAO8olblhaSO1p1rUBtE4XWCDYvRH2NTuSBnAO5y9ePOV
 onLg==
X-Gm-Message-State: AOAM532D+K1APxFg6UG5dNCCiBjaRUbsYdnGfaVVKVmKDjCkHNYEgy/w
 HMG98dnFAjNxLAUl2jD9wT8Bmw==
X-Google-Smtp-Source: ABdhPJzixZp1Muxj0UjD0Pj4mAPb5akUvRL5t12RiI7j15G8uBwdlF4Spf796wrL8qV1s9WpWQdJpg==
X-Received: by 2002:a17:902:6b03:b0:161:51d6:61b with SMTP id
 o3-20020a1709026b0300b0016151d6061bmr18008014plk.23.1653641498648; 
 Fri, 27 May 2022 01:51:38 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.235])
 by smtp.gmail.com with ESMTPSA id
 191-20020a6215c8000000b0050dc762816bsm2891367pfv.69.2022.05.27.01.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 01:51:37 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 helei.sig11@bytedance.com, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: Introduce akcipher service for virtio-crypto
Date: Fri, 27 May 2022 16:47:33 +0800
Message-Id: <20220527084734.2649594-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1032.google.com
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

 backends/cryptodev-builtin.c      | 274 +++++++++++++++++++++----
 backends/cryptodev-vhost-user.c   |  34 +++-
 backends/cryptodev.c              |  32 ++-
 hw/virtio/virtio-crypto.c         | 323 ++++++++++++++++++++++++------
 include/hw/virtio/virtio-crypto.h |   5 +-
 include/sysemu/cryptodev.h        |  83 ++++++--
 6 files changed, 607 insertions(+), 144 deletions(-)

-- 
2.20.1


