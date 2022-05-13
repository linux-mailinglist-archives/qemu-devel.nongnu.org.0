Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177DB525FA7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:24:19 +0200 (CEST)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npST4-0001YP-5a
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npSQV-00009H-Oi
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:21:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npSQT-00027P-J9
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652437296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AIDQwQX3gQExNtzinJQFOkY1cfPLWCho/lhYqKCI8oQ=;
 b=g412eFllelPnFbKAV37TNmRyuA8cyBWtN3G4XtyTxe86sahl8cKGXsf1nHSxq657vxfmUs
 CkZHkS1Blw+4tlUz2hwlQj7zlMwBUVH3QszkjH4vAGgtZlNbsdKOhHfxeCQ3IFf4/r/UQT
 TuS+EgIi6YqG7CrWuN1C3ry1p4Izr+s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-0OVqsKLKMfuFIiRjNfllPQ-1; Fri, 13 May 2022 06:21:35 -0400
X-MC-Unique: 0OVqsKLKMfuFIiRjNfllPQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v29-20020adfa1dd000000b0020ad932b7c0so2790510wrv.0
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 03:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AIDQwQX3gQExNtzinJQFOkY1cfPLWCho/lhYqKCI8oQ=;
 b=jIYcja5p8+BFSSTfhIzQqnBmHrvbmk64gS33VhxOtqbGeCWPefY+iVoQLylNExSnSX
 VCdbSmovzZe2CBldVhVYV2vJH+O5SK4lRM1co+gEjp4QJW7RxckgA+aq4exAgBEjmByQ
 ukmz+8dIM423vRBaQ7vJt9+E/gtHe1QoLBb1iwxyNk28BU1UUoeDPGlsYKFSjztzFrsT
 7aEj3rIadvfivG8FfLzwKsn8iWg+vuHmTWOEbopu7ecXUdmqfrxP3i92oEkOJdqeS4Lw
 EYmYwp6vn1IQKnTvzzTxUyL7DbCmRmzjjfyze8hteGeDV8+4SvWaZcsHPN2h243IpWRB
 B0Zw==
X-Gm-Message-State: AOAM530mFVXKVPtxHpDzY5ICH8aBHObpBi08wvU0yPJ6X71O0HOwXFYP
 fi1jTNDxiZNOJs0DGBgB8Up3jrkDjosjNJSbVks6vtMc199tA88RTWDuJtyaRvL9UA8EmlxhL8h
 bC/OP1u5qE+SzuXo=
X-Received: by 2002:a7b:cf36:0:b0:394:e58:b64b with SMTP id
 m22-20020a7bcf36000000b003940e58b64bmr14355545wmg.125.1652437293841; 
 Fri, 13 May 2022 03:21:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWqHSMW0qG0AeqAueArZqMZeVeTW8CgA01QEdiIaIl6wxh+62/u2SmUQpsbDaZkuzbNcgsiQ==
X-Received: by 2002:a7b:cf36:0:b0:394:e58:b64b with SMTP id
 m22-20020a7bcf36000000b003940e58b64bmr14355521wmg.125.1652437293569; 
 Fri, 13 May 2022 03:21:33 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b0039456c00ba7sm6420102wmq.1.2022.05.13.03.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 03:21:33 -0700 (PDT)
Date: Fri, 13 May 2022 06:21:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, berrange@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, helei.sig11@bytedance.com,
 jasowang@redhat.com, cohuck@redhat.com
Subject: Re: [PATCH v5 0/9] Introduce akcipher service for virtio-crypto
Message-ID: <20220513062055-mutt-send-email-mst@kernel.org>
References: <20220428135943.178254-1-pizhenwei@bytedance.com>
 <20220513061844-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513061844-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 13, 2022 at 06:19:10AM -0400, Michael S. Tsirkin wrote:
> On Thu, Apr 28, 2022 at 09:59:34PM +0800, zhenwei pi wrote:
> > Hi, Lei & MST
> > 
> > Daniel has started to review the akcipher framework and nettle & gcrypt
> > implementation, this part seems to be ready soon. Thanks a lot to Daniel!
> > 
> > And the last patch "crypto: Introduce RSA algorithm" handles akcipher
> > requests from guest and uses the new akcipher service. The new feature
> > can be used to test by the builtin driver. I would appreciate it if you
> > could review patch.
> 
> 
> I applied the first 6 patches. Tests need to address Daniel's comments.

Oh sorry, spoke too soon - I noticed mingw issues, and in fact Daniel noticed them too.
Pls address and repost the series. Thanks!

> > v4 -> v5:
> > - Move QCryptoAkCipher into akcipherpriv.h, and modify the related comments.
> > - Rename asn1_decoder.c to der.c.
> > - Code style fix: use 'cleanup' & 'error' lables.
> > - Allow autoptr type to auto-free.
> > - Add test cases for rsakey to handle DER error.
> > - Other minor fixes.
> > 
> > v3 -> v4:
> > - Coding style fix: Akcipher -> AkCipher, struct XXX -> XXX, Rsa -> RSA,
> > XXX-alg -> XXX-algo.
> > - Change version info in qapi/crypto.json, from 7.0 -> 7.1.
> > - Remove ecdsa from qapi/crypto.json, it would be introduced with the implemetion later.
> > - Use QCryptoHashAlgothrim instead of QCryptoRSAHashAlgorithm(removed) in qapi/crypto.json.
> > - Rename arguments of qcrypto_akcipher_XXX to keep aligned with qcrypto_cipher_XXX(dec/enc/sign/vefiry -> in/out/in2), and add qcrypto_akcipher_max_XXX APIs.
> > - Add new API: qcrypto_akcipher_supports.
> > - Change the return value of qcrypto_akcipher_enc/dec/sign, these functions return the actual length of result.
> > - Separate ASN.1 source code and test case clean.
> > - Disable RSA raw encoding for akcipher-nettle.
> > - Separate RSA key parser into rsakey.{hc}, and implememts it with builtin-asn1-decoder and nettle respectivly.
> > - Implement RSA(pkcs1 and raw encoding) algorithm by gcrypt. This has higher priority than nettle.
> > - For some akcipher operations(eg, decryption of pkcs1pad(rsa)), the length of returned result maybe less than the dst buffer size, return the actual length of result instead of the buffer length to the guest side. (in function virtio_crypto_akcipher_input_data_helper)
> > - Other minor changes.
> > 
> > Thanks to Daniel!
> > 
> > Eric pointed out this missing part of use case, send it here again.
> > 
> > In our plan, the feature is designed for HTTPS offloading case and other applications which use kernel RSA/ecdsa by keyctl syscall. The full picture shows bellow:
> > 
> > 
> >                   Nginx/openssl[1] ... Apps
> > Guest   -----------------------------------------
> >                    virtio-crypto driver[2]
> > -------------------------------------------------
> >                    virtio-crypto backend[3]
> > Host    -----------------------------------------
> >                   /          |          \
> >               builtin[4]   vhost     keyctl[5] ...
> > 
> > 
> > [1] User applications can offload RSA calculation to kernel by keyctl syscall. There is no keyctl engine in openssl currently, we developed a engine and tried to contribute it to openssl upstream, but openssl 1.x does not accept new feature. Link:
> >     https://github.com/openssl/openssl/pull/16689
> > 
> > This branch is available and maintained by Lei <helei.sig11@bytedance.com>
> >     https://github.com/TousakaRin/openssl/tree/OpenSSL_1_1_1-kctl_engine
> > 
> > We tested nginx(change config file only) with openssl keyctl engine, it works fine.
> > 
> > [2] virtio-crypto driver is used to communicate with host side, send requests to host side to do asymmetric calculation.
> >     https://lkml.org/lkml/2022/3/1/1425
> > 
> > [3] virtio-crypto backend handles requests from guest side, and forwards request to crypto backend driver of QEMU.
> > 
> > [4] Currently RSA is supported only in builtin driver. This driver is supposed to test the full feature without other software(Ex vhost process) and hardware dependence. ecdsa is introduced into qapi type without implementation, this may be implemented in Q3-2022 or later. If ecdsa type definition should be added with the implementation together, I'll remove this in next version.
> > 
> > [5] keyctl backend is in development, we will post this feature in Q2-2022. keyctl backend can use hardware acceleration(Ex, Intel QAT).
> > 
> > Setup the full environment, tested with Intel QAT on host side, the QPS of HTTPS increase to ~200% in a guest.
> > 
> > VS PCI passthrough: the most important benefit of this solution makes the VM migratable.
> > 
> > v2 -> v3:
> > - Introduce akcipher types to qapi
> > - Add test/benchmark suite for akcipher class
> > - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
> >   - crypto: Introduce akcipher crypto class
> >   - virtio-crypto: Introduce RSA algorithm
> > 
> > v1 -> v2:
> > - Update virtio_crypto.h from v2 version of related kernel patch.
> > 
> > v1:
> > - Support akcipher for virtio-crypto.
> > - Introduce akcipher class.
> > - Introduce ASN1 decoder into QEMU.
> > - Implement RSA backend by nettle/hogweed.
> > 
> > Lei He (6):
> >   qapi: crypto-akcipher: Introduce akcipher types to qapi
> >   crypto: add ASN.1 DER decoder
> >   crypto: Implement RSA algorithm by hogweed
> >   crypto: Implement RSA algorithm by gcrypt
> >   test/crypto: Add test suite for crypto akcipher
> >   tests/crypto: Add test suite for RSA keys
> > 
> > Zhenwei Pi (3):
> >   virtio-crypto: header update
> >   crypto: Introduce akcipher crypto class
> >   crypto: Introduce RSA algorithm
> > 
> >  backends/cryptodev-builtin.c                  | 272 ++++-
> >  backends/cryptodev-vhost-user.c               |  34 +-
> >  backends/cryptodev.c                          |  32 +-
> >  crypto/akcipher-gcrypt.c.inc                  | 520 +++++++++
> >  crypto/akcipher-nettle.c.inc                  | 432 ++++++++
> >  crypto/akcipher.c                             | 108 ++
> >  crypto/akcipherpriv.h                         |  55 +
> >  crypto/der.c                                  | 190 ++++
> >  crypto/der.h                                  |  82 ++
> >  crypto/meson.build                            |   6 +
> >  crypto/rsakey-builtin.c.inc                   | 209 ++++
> >  crypto/rsakey-nettle.c.inc                    | 154 +++
> >  crypto/rsakey.c                               |  44 +
> >  crypto/rsakey.h                               |  94 ++
> >  hw/virtio/virtio-crypto.c                     | 323 ++++--
> >  include/crypto/akcipher.h                     | 158 +++
> >  include/hw/virtio/virtio-crypto.h             |   5 +-
> >  .../standard-headers/linux/virtio_crypto.h    |  82 +-
> >  include/sysemu/cryptodev.h                    |  83 +-
> >  meson.build                                   |  11 +
> >  qapi/crypto.json                              |  64 ++
> >  tests/bench/benchmark-crypto-akcipher.c       | 157 +++
> >  tests/bench/meson.build                       |   4 +
> >  tests/bench/test_akcipher_keys.inc            | 537 ++++++++++
> >  tests/unit/meson.build                        |   2 +
> >  tests/unit/test-crypto-akcipher.c             | 990 ++++++++++++++++++
> >  tests/unit/test-crypto-der.c                  | 290 +++++
> >  27 files changed, 4792 insertions(+), 146 deletions(-)
> >  create mode 100644 crypto/akcipher-gcrypt.c.inc
> >  create mode 100644 crypto/akcipher-nettle.c.inc
> >  create mode 100644 crypto/akcipher.c
> >  create mode 100644 crypto/akcipherpriv.h
> >  create mode 100644 crypto/der.c
> >  create mode 100644 crypto/der.h
> >  create mode 100644 crypto/rsakey-builtin.c.inc
> >  create mode 100644 crypto/rsakey-nettle.c.inc
> >  create mode 100644 crypto/rsakey.c
> >  create mode 100644 crypto/rsakey.h
> >  create mode 100644 include/crypto/akcipher.h
> >  create mode 100644 tests/bench/benchmark-crypto-akcipher.c
> >  create mode 100644 tests/bench/test_akcipher_keys.inc
> >  create mode 100644 tests/unit/test-crypto-akcipher.c
> >  create mode 100644 tests/unit/test-crypto-der.c
> > 
> > -- 
> > 2.20.1


