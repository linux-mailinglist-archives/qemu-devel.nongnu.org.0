Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1B67F790
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 12:31:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLjPY-0002Kr-Vo; Sat, 28 Jan 2023 06:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLjPU-0002KY-IF
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 06:30:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLjPQ-0006mq-JZ
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 06:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674905411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WsekEwdhIoRCTkwBBprRJGsiC3y5DyNpV6bvMuJQkTI=;
 b=Twwda+uDNFVuFFYuvIBQqk/VNiNmPK+u/dqHJ8Zos044+bscBFuX0MnI/A4TSqGHgDDG0K
 LgKoAncxagZkKp2+jIhfJbQF0FGfWN8/m+epMJfhvH4wsNhHv83PnU5RlhnlsJpkRDnRxk
 MYldpXq9SobR9yYtCV6iFehc1JDVb/Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-6KxybedcPJWg-8xcTboHoQ-1; Sat, 28 Jan 2023 06:30:10 -0500
X-MC-Unique: 6KxybedcPJWg-8xcTboHoQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l8-20020a05600c1d0800b003dc25f6bb5dso4266634wms.0
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 03:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WsekEwdhIoRCTkwBBprRJGsiC3y5DyNpV6bvMuJQkTI=;
 b=DYmmXKVmDmp5GIstG0SA5x5nrhYteCcw4ThQLtTefD23x80Qi8HucvISMMxFTuGZ1S
 yxl/dhOpktKJ4QDNfqiPcPS5EVA5To4Y/Jgug301smluCV35AhxZGX5ish4bydmJ91+J
 w8TaGO27qoCfp5nVCQvZlndUptA2tOM6j1u6mzBue7j5hGGLCUsX+XcEi8pPs+zCVtd9
 ANBbckbW56ZYYn4MlXYLPV9bABNPUzf8Y1sgk/7C2CFpvw2KzJXR2WJfBoRlJDMc5mmb
 Ea5NtQUTrTTVwZiGxDxd7zJEgkAJ62JcYb8OOod8JqGOe4TpICzYw1A6mPK/b/mAWl3T
 hgvA==
X-Gm-Message-State: AFqh2kpM7PD6kGoXNGy6ldkodFKNXcSRK0ISWI13CTPtri7JZGWC+hMQ
 IwTfg/dfhdCHd7sicddsOvVPlmGRXDpgjILPLHPMIW9SKZlo1nht98ke/W+PRHbepAc3Oy52qR1
 0kW4RNu2gKo+dxkg=
X-Received: by 2002:a05:600c:714:b0:3d9:ed30:79d with SMTP id
 i20-20020a05600c071400b003d9ed30079dmr43147614wmn.18.1674905408937; 
 Sat, 28 Jan 2023 03:30:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs6U/oS241pIvK1xl55UiaWF7B2YgMu31y74Hb5gYiQ7Y1rZPk95kjmkmqRTa/QgH0BZDqg6Q==
X-Received: by 2002:a05:600c:714:b0:3d9:ed30:79d with SMTP id
 i20-20020a05600c071400b003d9ed30079dmr43147593wmn.18.1674905408674; 
 Sat, 28 Jan 2023 03:30:08 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003db0bb81b6asm7357650wmb.1.2023.01.28.03.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 03:30:08 -0800 (PST)
Date: Sat, 28 Jan 2023 06:30:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, berrange@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/12] Refactor cryptodev
Message-ID: <20230128062802-mutt-send-email-mst@kernel.org>
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230128035633.2548315-1-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sat, Jan 28, 2023 at 11:56:21AM +0800, zhenwei pi wrote:
> v3 -> v4:
> - a small change in '0005-cryptodev-Introduce-query-cryptodev-QMP-command.patch':
>   use 'uint32' instead of 'int' to describe CryptodevBackendClient:queue

what was the motivation for this change? we generally just use int
unless width is important.

> - fix compling warning(gcc)/error(clang-11) on 32 bit platform in
>   '0007-hmp-add-cryptodev-info-command.patch':
>   use 'printf("%u", client->queue)' instead of 'printf("%ld", client->queue)'
> 

Are you aware of PRIu64? And if you are going to print uint32 use PRIu32

> v2 -> v3:
> - rebase code against the lastest commist: fb7e7990342e59cf67d
> - document the missing fields in qapi/cryptodev.json
> - rework statistics part: use 'query-stats' command instead of
>   'query-cryptodev'(cryptodev: Support query-stats QMP command)
> 
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


