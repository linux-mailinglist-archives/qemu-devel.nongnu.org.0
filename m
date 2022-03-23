Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA034E5282
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:51:34 +0100 (CET)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0Sa-0006qA-Tj
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:51:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nX0EK-0007xS-Ue
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nX0EI-0003Sx-31
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648039004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fa9QTM48OUejCQPoDl5NAKjvkdcSmGmWd5J/s9MvAqs=;
 b=PAtX4DX1UVR9GMtgl2OcT4Fsnx3xiOwLWb3u1JvRBGc3eArubsmm1NewWw1qhF1UC0NNwU
 lvrDuxolFHPM/PpxeQ3seXBEFcpB9k1nboQ6afuVvNBqyzVi1r5JrzItNFzrVncJ64ZCqN
 m04+sMui+cAvATioDIMYAKheB58rWdA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-i7lgVLrrNWCA5hN1Mzh3LA-1; Wed, 23 Mar 2022 08:36:41 -0400
X-MC-Unique: i7lgVLrrNWCA5hN1Mzh3LA-1
Received: by mail-wr1-f70.google.com with SMTP id
 71-20020adf82cd000000b00203dc43d216so463317wrc.22
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 05:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fa9QTM48OUejCQPoDl5NAKjvkdcSmGmWd5J/s9MvAqs=;
 b=rt16W2XCbxhd9wTTHpxuEEq/tFChQyDXeX2XBgQ+M6tSjHWf9A/5g57JrQmQYetnBI
 t9V9SeNJKvRCNHZJyHLzi+bjlDIwSmVUuZbyk9nJRwGtDTQaFZamyixiZ+mM+6hkhATb
 r3cahnkjjEt+dM05gkUpT2Aj24P2EGPtxR9V2SJfn6vfugFOpy2LDYAeU1TqFLGrHvMu
 LDinnZzFYrM7ewZ+gFcLYmQPKYmw5a9XypFxobYL98Mgc6WUyKO+w+r8CJZEuUhsPJ5S
 xR4KCuP2gE7u+5d26QGyQQTqwwZ65gTGFglmd0bBQC2cP+N1KkP7gCTE2UILbVuWuRdj
 vxJw==
X-Gm-Message-State: AOAM530mTfx8/m90PdaoAHXzeVz70VBO39XMS7d20HbNHFNfr0FnyHR0
 Rdr2qGJukY/hbam1uCYZMF/wJ6IECIldqckQngJBcswXftuMbfncF4Eb784gjxuwAu0I5OYTJFa
 3lSfTu/lrOFq0490=
X-Received: by 2002:a5d:6b0b:0:b0:1ef:d826:723a with SMTP id
 v11-20020a5d6b0b000000b001efd826723amr27400463wrw.420.1648039000403; 
 Wed, 23 Mar 2022 05:36:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBxeWRoCDIdMerVIOvtlAnOjiNcVTIj/UD5hdtcw5XobeVf2TSLgENh4CA6UmlgZGf3azmWw==
X-Received: by 2002:a5d:6b0b:0:b0:1ef:d826:723a with SMTP id
 v11-20020a5d6b0b000000b001efd826723amr27400445wrw.420.1648039000212; 
 Wed, 23 Mar 2022 05:36:40 -0700 (PDT)
Received: from redhat.com ([2.55.151.118]) by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b002040552e88esm11818773wrz.29.2022.03.23.05.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 05:36:39 -0700 (PDT)
Date: Wed, 23 Mar 2022 08:36:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v3 0/6] Support akcipher for virtio-crypto
Message-ID: <20220323083558-mutt-send-email-mst@kernel.org>
References: <20220323024912.249789-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20220323024912.249789-1-pizhenwei@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: herbert@gondor.apana.org.au, jasowang@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, arei.gonglei@huawei.com,
 linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 10:49:06AM +0800, zhenwei pi wrote:
> v2 -> v3:
> - Introduce akcipher types to qapi
> - Add test/benchmark suite for akcipher class
> - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
>   - crypto: Introduce akcipher crypto class
>   - virtio-crypto: Introduce RSA algorithm

Thanks!
I tagged this but qemu is in freeze. If possible pls ping or
repost after the release to help make sure I don't lose it.

> v1 -> v2:
> - Update virtio_crypto.h from v2 version of related kernel patch.
> 
> v1:
> - Support akcipher for virtio-crypto.
> - Introduce akcipher class.
> - Introduce ASN1 decoder into QEMU.
> - Implement RSA backend by nettle/hogweed.
> 
> Lei He (3):
>   crypto-akcipher: Introduce akcipher types to qapi
>   crypto: Implement RSA algorithm by hogweed
>   tests/crypto: Add test suite for crypto akcipher
> 
> Zhenwei Pi (3):
>   virtio-crypto: header update
>   crypto: Introduce akcipher crypto class
>   virtio-crypto: Introduce RSA algorithm
> 
>  backends/cryptodev-builtin.c                  | 319 +++++++-
>  backends/cryptodev-vhost-user.c               |  34 +-
>  backends/cryptodev.c                          |  32 +-
>  crypto/akcipher-nettle.c                      | 523 +++++++++++++
>  crypto/akcipher.c                             |  81 ++
>  crypto/asn1_decoder.c                         | 185 +++++
>  crypto/asn1_decoder.h                         |  42 +
>  crypto/meson.build                            |   4 +
>  hw/virtio/virtio-crypto.c                     | 326 ++++++--
>  include/crypto/akcipher.h                     | 155 ++++
>  include/hw/virtio/virtio-crypto.h             |   5 +-
>  .../standard-headers/linux/virtio_crypto.h    |  82 +-
>  include/sysemu/cryptodev.h                    |  88 ++-
>  meson.build                                   |  11 +
>  qapi/crypto.json                              |  86 +++
>  tests/bench/benchmark-crypto-akcipher.c       | 163 ++++
>  tests/bench/meson.build                       |   6 +
>  tests/bench/test_akcipher_keys.inc            | 277 +++++++
>  tests/unit/meson.build                        |   1 +
>  tests/unit/test-crypto-akcipher.c             | 715 ++++++++++++++++++
>  20 files changed, 2990 insertions(+), 145 deletions(-)
>  create mode 100644 crypto/akcipher-nettle.c
>  create mode 100644 crypto/akcipher.c
>  create mode 100644 crypto/asn1_decoder.c
>  create mode 100644 crypto/asn1_decoder.h
>  create mode 100644 include/crypto/akcipher.h
>  create mode 100644 tests/bench/benchmark-crypto-akcipher.c
>  create mode 100644 tests/bench/test_akcipher_keys.inc
>  create mode 100644 tests/unit/test-crypto-akcipher.c
> 
> -- 
> 2.25.1


