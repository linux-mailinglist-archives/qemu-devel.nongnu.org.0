Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E53613E57
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 20:36:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opaZM-0002SI-JV; Mon, 31 Oct 2022 15:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opaZJ-0002RC-VZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:35:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opaZH-0002GN-Ul
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667244931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PCCP8q1JO1deTfbTomFquoRGUnV1hA5eXoLZBZJ4sD8=;
 b=bzKPDaJLWsfyOYQ34Jcw6ykKkkP+lftT36sHBq1/O7pGWpTzhSNRNQ3gxIf8uydFdMVRna
 acPqGUUJysPr9kCHclCADuSXWg5yr8soqKQBSvRmrJhs74fJY7LhaKVNXQgDlFJG/PFRYP
 f7L6lKPYJV390sASfNjQsGGjb36pHU0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-mL_3ynktOdOHdTAsA3JSsA-1; Mon, 31 Oct 2022 15:35:30 -0400
X-MC-Unique: mL_3ynktOdOHdTAsA3JSsA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h204-20020a1c21d5000000b003cf4e055442so5697168wmh.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 12:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCCP8q1JO1deTfbTomFquoRGUnV1hA5eXoLZBZJ4sD8=;
 b=BVzwtHAYesNVJO7n1oCd2VFbNEVAAHhaoTqvifzSXhpdaqqRViSknKcsS1HUWFpSRw
 NByed3Ss++B1J4TGfXdLgtPIMdx3Eo30ADqrXvgqfUsz8fhhH/5eCNuCGXhoFRVN4fhn
 GZWGduyKCWPjMKlFyuncB2nujRGpADcjT98cE457B3PWqMQJo3ueP9MWZRu6cwOC27lH
 JyO5gCZBTKh6acTZb2mki6nzWOVWpUEFxkJKY8gBUilWUhu2JeHYYUwlmk+15bD1f/3p
 DQgkZDR1mdpQEKPoqHsKIhBf2YCSRnkTdoaVsOI/0DpIqSLaZgORgEHTEy+lpM2jmeSE
 08ag==
X-Gm-Message-State: ACrzQf2oKajy7fXCtRdaKTQgQEjHRlkS/1c3B9a3Eu1IAQxbu+AONPou
 s+P+DvQGcPjNKb50wRXjLNAhHFEzFvKuevv3j9Y4dq/eWw5R3LZmwj0IC3Uod5RGLgOkEPk57ZY
 egz523ZlSoZO6s28=
X-Received: by 2002:a05:6000:1143:b0:236:5ede:cdad with SMTP id
 d3-20020a056000114300b002365edecdadmr9434450wrx.410.1667244928413; 
 Mon, 31 Oct 2022 12:35:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oQ5Z676etVOaxN0Ru7M7ydir3xL4qXiCLa7EkX3nYSBJX3yVqIybZyHXWyUfRlfJmac6RIQ==
X-Received: by 2002:a05:6000:1143:b0:236:5ede:cdad with SMTP id
 d3-20020a056000114300b002365edecdadmr9434439wrx.410.1667244928108; 
 Mon, 31 Oct 2022 12:35:28 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 u6-20020a056000038600b0022ca921dc67sm7895407wrf.88.2022.10.31.12.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 12:35:27 -0700 (PDT)
Date: Mon, 31 Oct 2022 15:35:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Lei He <helei.sig11@bytedance.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221031153513-mutt-send-email-mst@kernel.org>
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXafXM0CJDe5G=--3Xa4O5ifqz=yvO=ubWLaS-KNBVkwQ@mail.gmail.com>
 <CAJSP0QXndDKsc2wy4uTPtT7uN5yV4ZMn+Nn7uV190JmhnfSROA@mail.gmail.com>
 <20221031152525-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031152525-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 03:31:54PM -0400, Michael S. Tsirkin wrote:
> On Mon, Oct 31, 2022 at 03:19:25PM -0400, Stefan Hajnoczi wrote:
> > On Mon, 31 Oct 2022 at 15:14, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >
> > > On Mon, 31 Oct 2022 at 08:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > Lei He (4):
> > > >       virtio-crypto: Support asynchronous mode
> > >
> > > The following clang warning breaks the build. Please resend a fixed
> > > pull request, thanks!
> > 
> > On second thought, I have fixed up the merge commit manually since
> > Michael is offline tomorrow for the soft freeze deadline. If CI passes
> > then I'll apply this pull request (with my fixup) and you won't need
> > to resend.
> 
> Hmm what's the fixup?
> I came up with:
> 
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index 39c8f5914e..855b5d60a2 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -495,6 +495,7 @@ static void virtio_crypto_free_request(VirtIOCryptoReq *req)
>          }
>      }
>  
> +    g_free(req->in_iov);
>      g_free(req);
>  }
>  
> @@ -566,7 +567,6 @@ static void virtio_crypto_req_complete(void *opaque, int ret)
>      VirtIOCrypto *vcrypto = req->vcrypto;
>      VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
>      uint8_t status = -ret;
> -    g_autofree struct iovec *in_iov_copy = req->in_iov;
>  
>      if (req->flags == CRYPTODEV_BACKEND_ALG_SYM) {
>          virtio_crypto_sym_input_data_helper(vdev, req, status,
> 


Not that is not right either.

> 
> > >
> > > clang -m64 -mcx16 -Ilibqemu-x86_64-softmmu.fa.p -I. -I.. -Itarget/i386
> > > -I../target/i386 -Iqapi -Itrace -Iui -Iui/shader
> > > -I/usr/include/pixman-1 -I/usr/include/capstone
> > > -I/usr/include/spice-server -I/usr/include/spice-1
> > > -I/usr/include/cacard -I/usr/include/glib-2.0
> > > -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4
> > > -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC -flto
> > > -fcolor-diagnostics -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
> > > -isystem /builds/qemu-project/qemu/linux-headers -isystem
> > > linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
> > > /builds/qemu-project/qemu/include -iquote
> > > /builds/qemu-project/qemu/tcg/i386 -pthread -D_GNU_SOURCE
> > > -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> > > -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> > > -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
> > > -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
> > > -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
> > > -Wexpansion-to-defined -Wno-initializer-overrides
> > > -Wno-missing-include-dirs -Wno-shift-negative-value
> > > -Wno-string-plus-int -Wno-typedef-redefinition
> > > -Wno-tautological-type-limit-compare -Wno-psabi
> > > -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong
> > > -fsanitize=safe-stack -fsanitize=cfi-icall
> > > -fsanitize-cfi-icall-generalize-pointers -fno-sanitize-trap=cfi-icall
> > > -fPIE -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
> > > '-DCONFIG_TARGET="x86_64-softmmu-config-target.h"'
> > > '-DCONFIG_DEVICES="x86_64-softmmu-config-devices.h"' -MD -MQ
> > > libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -MF
> > > libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o.d -o
> > > libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -c
> > > ../hw/virtio/virtio-crypto.c
> > > ../hw/virtio/virtio-crypto.c:569:30: error: unused variable
> > > 'in_iov_copy' [-Werror,-Wunused-variable]
> > > g_autofree struct iovec *in_iov_copy = req->in_iov;
> > > ^
> > >
> > > https://gitlab.com/qemu-project/qemu/-/jobs/3253703167
> > >
> > > Stefan


