Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F967EB73
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRsU-0002D8-RS; Fri, 27 Jan 2023 11:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLRsI-0002Cp-NC
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 11:46:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLRsD-0005b2-7w
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 11:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674838004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u80zp7VbkvM4SL/M6qJ29HUDFedVyUq2D7MruNoyFOw=;
 b=eheyCOCPuyVJQ832dwFWbRdr/OocJlCY4M3KnUqemm/FfIo625v4MZa5oHiUGOPNuQDTn9
 JRfaEwPBsEx8TuUiRFc/XUFd0IfV2E0Cb7bA2oIkV1UayFK5TpEwHQUIwcVmxOXU3Uz4ke
 ZZafJ8ZJOlFWhuFiQuGasqOaz8qv1oU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-ogLuzSpxMFi-8XS67XrEog-1; Fri, 27 Jan 2023 11:46:41 -0500
X-MC-Unique: ogLuzSpxMFi-8XS67XrEog-1
Received: by mail-ej1-f69.google.com with SMTP id
 hp2-20020a1709073e0200b0084d47e3fe82so3721428ejc.8
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 08:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u80zp7VbkvM4SL/M6qJ29HUDFedVyUq2D7MruNoyFOw=;
 b=tJqINpnkXiw7+paV2qLiFY/x5rs3+xqYbBWuxR+vemvpasolG1QDu8Ea0uIrLB9r33
 G8S1SyVIwylU1FcHiSF/+++iX3xn/DokaCLvKenzCN3aVt8MIQdDreutA0ORex2yXWnf
 qO0owc24z+44vtLOyJg31U9dUeDUOtCHz/BczhbMKSCEQLYsqdx6dAtV3Q2hIETAFTEV
 /G8E9L41535JmnIN6GG8V2OXAHV1lMaXSN0bnW0buGuwS4ytMxP9RuaWnNWi4o1kku46
 2lDzjvO8Z6fj4NTPDlshJ5DeRq1Tid/DSmF5uVct5qfd6NuvHb92jyvXqBC2sEkp886O
 E8vw==
X-Gm-Message-State: AFqh2krgNsQXPcXIsIjo+AGn+akA3zDDwaWwD+bLz5BwES6bk6Ku1vJa
 xA5xW8WTFnOja4FLiHUKe1MaeTOwEycMqQnvjNtskEltcVcrZyNGJR1DR+9Jtyym1SaJWZil0tV
 tfxsGD2EDlwrSI4I=
X-Received: by 2002:a05:6402:1107:b0:493:a6eb:874e with SMTP id
 u7-20020a056402110700b00493a6eb874emr43111783edv.5.1674838000494; 
 Fri, 27 Jan 2023 08:46:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3MpFSinRG7cayRJudtPix/OSE5tfsfWDZDZPHg4KYsoSy4kh/G5JGbdC7DF+yIa3Iw2OP/g==
X-Received: by 2002:a05:6402:1107:b0:493:a6eb:874e with SMTP id
 u7-20020a056402110700b00493a6eb874emr43111766edv.5.1674838000243; 
 Fri, 27 Jan 2023 08:46:40 -0800 (PST)
Received: from redhat.com ([2.52.137.69]) by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm2486827ejc.23.2023.01.27.08.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:46:39 -0800 (PST)
Date: Fri, 27 Jan 2023 11:46:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/12] Refactor cryptodev
Message-ID: <20230127114609-mutt-send-email-mst@kernel.org>
References: <20230119071419.3585771-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119071419.3585771-1-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 19, 2023 at 03:14:07PM +0800, zhenwei pi wrote:
> v2 -> v3:
> - rebase code against the lastest commist: fb7e7990342e59cf67d
> - document the missing fields in qapi/cryptodev.json
> - rework statistics part: use 'query-stats' command instead of
>   'query-cryptodev'(cryptodev: Support query-stats QMP command)

Fails on 32 bit

../qemu/monitor/hmp-cmds.c: In function 'hmp_info_cryptodev':
../qemu/monitor/hmp-cmds.c:2317:46: error: format '%ld' expects argument of type 'long int', but argument 3 has type 'int64_t' {aka 'long long int'} [-Werror=format=]
 2317 |             monitor_printf(mon, "    queue %ld: type=%s\n", client->queue,
      |                                            ~~^              ~~~~~~~~~~~~~
      |                                              |                    |
      |                                              long int             int64_t {aka long long int}
      |                                            %lld
cc1: all warnings being treated as errors


> v1 -> v2:
> - fix coding style and use 'g_strjoin()' instead of 'char services[128]'
>    (suggested by Dr. David Alan Gilbert)
> - wrapper function 'cryptodev_backend_account' to record statistics, and
>    allocate sym_stat/asym_stat in cryptodev base class. see patch:
>    'cryptodev: Support statistics'.
> - add more arguments into struct CryptoDevBackendOpInfo, then
>    cryptodev_backend_crypto_operation() uses *op_info only.
> - support cryptodev QoS settings(BPS&OPS), both QEMU command line and QMP
>    command works fine.
> - add myself as the maintainer for cryptodev.
> 
> v1:
> - introduce cryptodev.json to describe the attributes of crypto device, then
>    drop duplicated type declare, remove some virtio related dependence.
> - add statistics: OPS and bandwidth.
> - add QMP command: query-cryptodev
> - add HMP info command: cryptodev
> - misc fix: detect akcipher capability instead of exposing akcipher service
>    unconditionally.
> 
> Zhenwei Pi (12):
>   cryptodev: Introduce cryptodev.json
>   cryptodev: Remove 'name' & 'model' fields
>   cryptodev: Introduce cryptodev alg type in QAPI
>   cryptodev: Introduce server type in QAPI
>   cryptodev: Introduce 'query-cryptodev' QMP command
>   cryptodev-builtin: Detect akcipher capability
>   hmp: add cryptodev info command
>   cryptodev: Use CryptoDevBackendOpInfo for operation
>   cryptodev: Account statistics
>   cryptodev: support QoS
>   cryptodev: Support query-stats QMP command
>   MAINTAINERS: add myself as the maintainer for cryptodev
> 
>  MAINTAINERS                     |   2 +
>  backends/cryptodev-builtin.c    |  42 ++--
>  backends/cryptodev-lkcf.c       |  19 +-
>  backends/cryptodev-vhost-user.c |  13 +-
>  backends/cryptodev-vhost.c      |   4 +-
>  backends/cryptodev.c            | 419 ++++++++++++++++++++++++++++++--
>  hmp-commands-info.hx            |  14 ++
>  hw/virtio/virtio-crypto.c       |  48 +++-
>  include/monitor/hmp.h           |   1 +
>  include/sysemu/cryptodev.h      |  95 ++++----
>  monitor/hmp-cmds.c              |  41 ++++
>  monitor/qmp-cmds.c              |   2 +
>  qapi/cryptodev.json             | 143 +++++++++++
>  qapi/meson.build                |   1 +
>  qapi/qapi-schema.json           |   1 +
>  qapi/qom.json                   |   8 +-
>  qapi/stats.json                 |  10 +-
>  17 files changed, 743 insertions(+), 120 deletions(-)
>  create mode 100644 qapi/cryptodev.json
> 
> -- 
> 2.34.1


