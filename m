Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6651A5F7B12
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:55:18 +0200 (CEST)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpgz-0005NL-Dd
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogoIP-0004tz-1d
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogoIL-0005Sn-0p
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665152739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aIMttzTwOCORVhZZxSAju3vZzfRaxuQcZ30zDW66RsA=;
 b=ZqVPRLriIZoJU0oGtKzsjp4m8/ZNUwhxWopm0FMXXwjtUwgSO2i8q3p6zocNc2wTQAPduA
 zPLHiXp/KiSsE47CW+VCA+2HTAmdOuvQCmIrMNJtZ3weCbXsLnvx88p1tinsntSeVPVEr5
 N6l6yVwnheUr/BL7wiwGNaSUMpzq0OI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-Iqr_3juFOd2uFnBheboExQ-1; Fri, 07 Oct 2022 10:25:38 -0400
X-MC-Unique: Iqr_3juFOd2uFnBheboExQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k30-20020adfb35e000000b0022e04708c18so1501324wrd.22
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 07:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIMttzTwOCORVhZZxSAju3vZzfRaxuQcZ30zDW66RsA=;
 b=qwnZPnYH+h8oZGmYQuVfihu5ZTrscKfF9I14WGjaOwqGXOpq7BITWEAHvGmyL5gMbe
 lP/YKJ455QLwupKojxoedKp/uLq2TzTCD811yhWrdjTkh6L9WbXAd9V1aVgOsQuPzJyH
 NqwppJw4aFP8y7dVF1anMDZjYZNH4dsCKB+U4qP9c1ygQwRZxqePzAS7PYQ85z0K93/A
 4pOuOeV9RPPM3XmQqxPjfue1ZYe+ojsXWhPi2rt143KDSsAOUOuRtgS0IU7lumwP6M2Q
 5skDE2cGExsY43AZHRspMX8Qb5enSr5kBK7bUXSWN0es0xDukaEs2Um/OGvXLG+APQL9
 dmgA==
X-Gm-Message-State: ACrzQf0HRRCO0VSRyVKZaK00H33/EcdOEiTWEdrff9oG0WddIvBAFdNu
 MNjlkqu4hp78pT1hX9XeU3QD/j0A4uTucM7LWAGWRDSqR5FWZ0AjeqDfJL4P31WnM1YnMJQUG1W
 dJal/ynbnMYeX3GU=
X-Received: by 2002:a05:6000:2a3:b0:226:dff3:b031 with SMTP id
 l3-20020a05600002a300b00226dff3b031mr3426523wry.495.1665152737223; 
 Fri, 07 Oct 2022 07:25:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Cdpr7w+kf1H+SQrSRXgGtAa31hgvzfRH7GKRpfnL/TiFZJZN6BZHXoWKXkv2OsZTcR5gtRg==
X-Received: by 2002:a05:6000:2a3:b0:226:dff3:b031 with SMTP id
 l3-20020a05600002a300b00226dff3b031mr3426512wry.495.1665152737030; 
 Fri, 07 Oct 2022 07:25:37 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c2ccc00b003b47e8a5d22sm4523943wmc.23.2022.10.07.07.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:25:36 -0700 (PDT)
Date: Fri, 7 Oct 2022 10:25:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, arei.gonglei@huawei.com,
 pizhenwei@bytedance.com
Subject: Re: [PATCH 0/4] Add a new backend for cryptodev
Message-ID: <20221007102500-mutt-send-email-mst@kernel.org>
References: <20220919035320.84467-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919035320.84467-1-helei.sig11@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Sep 19, 2022 at 11:53:16AM +0800, Lei He wrote:
> This patch adds a new backend called LKCF to cryptodev, LKCF stands
> for Linux Kernel Cryptography Framework. If a cryptographic
> accelerator that supports LKCF is installed on the the host (you can
> see which algorithms are supported in host's LKCF by executing
> 'cat /proc/crypto'), then RSA operations can be offloaded.
> More background info can refer to: https://lwn.net/Articles/895399/,
> 'keyctl[5]' in the picture.
> 
> This patch:
> 1. Modified some interfaces of cryptodev and cryptodev-backend to
> support asynchronous requests.
> 2. Extended the DER encoder in crypto, so that we can export the
> RSA private key into PKCS#8 format and upload it to host kernel.
> 3. Added a new backend for cryptodev.
> 
> I tested the backend with a QAT card, the qps of RSA-2048-decryption
> is about 25k/s, and the main-loop becomes the bottleneck. The qps
> using OpenSSL directly is about 6k/s (with 6 vCPUs). We will support 
> IO-thread for cryptodev in another series later.
> 
> Lei He (4):
>   virtio-crypto: Support asynchronous mode
>   crypto: Support DER encodings
>   crypto: Support export akcipher to pkcs8
>   cryptodev: Add a lkcf-backend for cryptodev

Seems to fail build for me - probably a conflict applying.
Coul you pls rebase and repost? Sorry about the noise.

>  backends/cryptodev-builtin.c    |  69 +++--
>  backends/cryptodev-lkcf.c       | 620 ++++++++++++++++++++++++++++++++++++++++
>  backends/cryptodev-vhost-user.c |  51 +++-
>  backends/cryptodev.c            |  44 +--
>  backends/meson.build            |   3 +
>  crypto/akcipher.c               |  17 ++
>  crypto/der.c                    | 307 ++++++++++++++++++--
>  crypto/der.h                    | 211 +++++++++++++-
>  crypto/rsakey.c                 |  42 +++
>  crypto/rsakey.h                 |  11 +-
>  hw/virtio/virtio-crypto.c       | 324 ++++++++++++---------
>  include/crypto/akcipher.h       |  21 ++
>  include/sysemu/cryptodev.h      |  61 ++--
>  qapi/qom.json                   |   2 +
>  tests/unit/test-crypto-der.c    | 126 ++++++--
>  15 files changed, 1649 insertions(+), 260 deletions(-)
>  create mode 100644 backends/cryptodev-lkcf.c
> 
> --
> 2.11.0


