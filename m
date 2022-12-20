Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29D46523C0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7efP-0005yz-DS; Tue, 20 Dec 2022 10:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7efM-0005vl-VD
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:36:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7efL-0003n1-Dm
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671550586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pHvrtTTqJtqygtjTYJ7H7MU3UIk9GkM2MIHHoGPftb0=;
 b=dWnw18D2VY/p5/5Re8JRMoNGxwP9zhu+zzH17pZYGFW4VNKIugPU5+Ecy7nDYE62mNUoru
 981V8rcf+Mayl7mXFzash2yanZbwUxqqM8N/ODL6PU6x8B9ttXQk3Tk22TQKr6E4JA2YS3
 cRcFhS87oMk6n1NHf9fpa4MDsQIRvCE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-9j0X_dDROAuMay-7jE5eeA-1; Tue, 20 Dec 2022 10:36:25 -0500
X-MC-Unique: 9j0X_dDROAuMay-7jE5eeA-1
Received: by mail-qt1-f200.google.com with SMTP id
 v20-20020ac87494000000b003a81928b279so5688369qtq.21
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHvrtTTqJtqygtjTYJ7H7MU3UIk9GkM2MIHHoGPftb0=;
 b=oqhceAV27ihhBfixsdGUNK6JELzQYg5cY2jna/VWlrD6StFxaaULpRYBwrmTcJXyFn
 K43kVq/p742Z3hiZTsLfpB3k0eelXtkLnT9j/AsX1fitqz5bpRGIT2RH7Zns1mm3EUV7
 o9NIAy4LSz0lFAgLzYKPdVbnr+IJI7l2Wa8mgGj/5SJpUIy5xsrGKrAXwmykDOf7lyel
 5CMIKE7DwKcuVTZbJWlZMCP23Xn1TQOe0fbx7Ui9aLIPlsXGmSee9RbdLnVF130uDRFP
 gTduLdmw+by7E5RFXOZ3laSkULawuUIeCwWkFoI1f4u2J3qutjcs4sGq/XdcC2ORotZW
 oo1Q==
X-Gm-Message-State: AFqh2kqkKcxTx1B/J49yKxeW+AZFHGhKPN0vIUG4G0g9sNB9DBPCg+l2
 qE5EaZpgnJ3HO/G3F/m/ir8VwNRdy9p0l5wo+NXlD1Jetn30y+AttRG0qomP3sOMtppy2Lyd060
 ofLBTLcdJFHDmjSs=
X-Received: by 2002:a05:622a:1a1f:b0:3a9:8b1a:fe22 with SMTP id
 f31-20020a05622a1a1f00b003a98b1afe22mr12293454qtb.4.1671550585142; 
 Tue, 20 Dec 2022 07:36:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtwsmyQAm9jqPAUgaFeksxkKTcz9JFy3o/xrDg3L3DZ5ap6P8+FBCqP19twU+UHKyjQ3W0S/w==
X-Received: by 2002:a05:622a:1a1f:b0:3a9:8b1a:fe22 with SMTP id
 f31-20020a05622a1a1f00b003a98b1afe22mr12293421qtb.4.1671550584814; 
 Tue, 20 Dec 2022 07:36:24 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 f2-20020ac84982000000b003a4c3c4d2d4sm5690691qtq.49.2022.12.20.07.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:36:24 -0800 (PST)
Date: Tue, 20 Dec 2022 10:36:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, michael.roth@amd.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [for-8.0 v2 00/11] Refactor cryptodev
Message-ID: <20221220103602-mutt-send-email-mst@kernel.org>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
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

On Tue, Nov 22, 2022 at 10:07:45PM +0800, zhenwei pi wrote:
> v1 -> v2:
> - fix coding style and use 'g_strjoin()' instead of 'char services[128]'
>   (suggested by Dr. David Alan Gilbert)
> - wrapper function 'cryptodev_backend_account' to record statistics, and
>   allocate sym_stat/asym_stat in cryptodev base class. see patch:
>   'cryptodev: Support statistics'.
> - add more arguments into struct CryptoDevBackendOpInfo, then
>   cryptodev_backend_crypto_operation() uses *op_info only.
> - support cryptodev QoS settings(BPS&OPS), both QEMU command line and QMP
>   command works fine.
> - add myself as the maintainer for cryptodev.
> 
> v1:
> - introduce cryptodev.json to describe the attributes of crypto device, then
>   drop duplicated type declare, remove some virtio related dependence.
> - add statistics: OPS and bandwidth.
> - add QMP command: query-cryptodev
> - add HMP info command: cryptodev
> - misc fix: detect akcipher capability instead of exposing akcipher service
>   unconditionally.


Can we get ACK on QAPI things please?
Thanks!

> Zhenwei Pi (11):
>   cryptodev: Introduce cryptodev.json
>   cryptodev: Remove 'name' & 'model' fields
>   cryptodev: Introduce cryptodev alg type in QAPI
>   cryptodev: Introduce server type in QAPI
>   cryptodev: Introduce 'query-cryptodev' QMP command
>   cryptodev: Support statistics
>   cryptodev-builtin: Detect akcipher capability
>   hmp: add cryptodev info command
>   cryptodev: Use CryptoDevBackendOpInfo for operation
>   cryptodev: support QoS
>   MAINTAINERS: add myself as the maintainer for cryptodev
> 
>  MAINTAINERS                     |   2 +
>  backends/cryptodev-builtin.c    |  42 +++--
>  backends/cryptodev-lkcf.c       |  19 +-
>  backends/cryptodev-vhost-user.c |  13 +-
>  backends/cryptodev-vhost.c      |   4 +-
>  backends/cryptodev.c            | 295 +++++++++++++++++++++++++++++---
>  hmp-commands-info.hx            |  14 ++
>  hw/virtio/virtio-crypto.c       |  48 ++++--
>  include/monitor/hmp.h           |   1 +
>  include/sysemu/cryptodev.h      |  94 +++++-----
>  monitor/hmp-cmds.c              |  36 ++++
>  qapi/cryptodev.json             | 144 ++++++++++++++++
>  qapi/meson.build                |   1 +
>  qapi/qapi-schema.json           |   1 +
>  qapi/qom.json                   |   8 +-
>  15 files changed, 604 insertions(+), 118 deletions(-)
>  create mode 100644 qapi/cryptodev.json
> 
> -- 
> 2.20.1


