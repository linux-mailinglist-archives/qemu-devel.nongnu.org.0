Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D10613E46
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 20:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opaW1-0000tD-Ij; Mon, 31 Oct 2022 15:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opaVs-0000nP-Ll
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:32:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opaVq-0001cz-OO
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667244717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3CV+zxsyhn0hKR6aSToQBOO+z7i9ePUUTrq9DxwRQJI=;
 b=b4xXJMACvZ5N7MHfdyZtCjtUqYM54fVm2fJrITKQgW1kFf1YUJ99lQqhbU8CkmFaHos2tl
 rTeSja4q4WauQm36OJRmLFFy/sanbZXqYpVcTkhU0ai8ZNSprWlxLgIIXg/UXrVh+eaQsy
 B9u0fUHicciVbNByVmpZiobJaM7H0eM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-pOXdSTnRMFyTb7MDq4q3xQ-1; Mon, 31 Oct 2022 15:31:56 -0400
X-MC-Unique: pOXdSTnRMFyTb7MDq4q3xQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso2938734wmj.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 12:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CV+zxsyhn0hKR6aSToQBOO+z7i9ePUUTrq9DxwRQJI=;
 b=kvx6TTgOfW/OG54+N/b7XcQ0KC9LLVkpkMPe+wfqwb0NJke2Jue1eSHu+CAwHKz2cG
 jjDEhhocon/hXTx1o6U8kG0s8lem+sYk7WmH4/s4Q40LgB7+oRTwhQ20I1rqWBgFgxHQ
 wxeauCo6l2fJ1gS4rg2Fx6fMZXuki2xbeKETnznEP+CK0KKnS34hhum3PpiY2VTzecQI
 F5/dgXFSP9qpPrPrahPd7eTHHOw85XyjULR8U8qEzQ0kxqBIUWWrGkFb/6v0o/x0EXyL
 8HHO92940UCjEmhqlwlkrM1Vin8VBUnspB897cdExDTOC+ji+G9Qxx5ie9kz10n/iIlW
 jTmQ==
X-Gm-Message-State: ACrzQf2rGZwDjwICfXjxxDgfgK3ezFw4Bs3dGzhFI4zEnR/Wn/tNITpP
 wxQsV/r7UVmSnaKa4OTrAu6WkeCuekJl4kQtAqQpa61U1ApM78lQggeE15eJJLQabu/ckc3kmeS
 rRZkbYzZwRPhaVos=
X-Received: by 2002:a5d:4cca:0:b0:236:aecc:60cb with SMTP id
 c10-20020a5d4cca000000b00236aecc60cbmr8890895wrt.11.1667244714608; 
 Mon, 31 Oct 2022 12:31:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fzIREiHuZ9GyFlFxgYvnRdGeAdD643HdAtTypa2rYTNFfSdnQ8tTP9N9Xo9xtywPje0HqlQ==
X-Received: by 2002:a5d:4cca:0:b0:236:aecc:60cb with SMTP id
 c10-20020a5d4cca000000b00236aecc60cbmr8890881wrt.11.1667244714355; 
 Mon, 31 Oct 2022 12:31:54 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c489100b003cf6c2f9513sm5449728wmp.2.2022.10.31.12.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 12:31:53 -0700 (PDT)
Date: Mon, 31 Oct 2022 15:31:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Lei He <helei.sig11@bytedance.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221031152525-mutt-send-email-mst@kernel.org>
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXafXM0CJDe5G=--3Xa4O5ifqz=yvO=ubWLaS-KNBVkwQ@mail.gmail.com>
 <CAJSP0QXndDKsc2wy4uTPtT7uN5yV4ZMn+Nn7uV190JmhnfSROA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QXndDKsc2wy4uTPtT7uN5yV4ZMn+Nn7uV190JmhnfSROA@mail.gmail.com>
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

On Mon, Oct 31, 2022 at 03:19:25PM -0400, Stefan Hajnoczi wrote:
> On Mon, 31 Oct 2022 at 15:14, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > On Mon, 31 Oct 2022 at 08:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > Lei He (4):
> > >       virtio-crypto: Support asynchronous mode
> >
> > The following clang warning breaks the build. Please resend a fixed
> > pull request, thanks!
> 
> On second thought, I have fixed up the merge commit manually since
> Michael is offline tomorrow for the soft freeze deadline. If CI passes
> then I'll apply this pull request (with my fixup) and you won't need
> to resend.

Hmm what's the fixup?
I came up with:

diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 39c8f5914e..855b5d60a2 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -495,6 +495,7 @@ static void virtio_crypto_free_request(VirtIOCryptoReq *req)
         }
     }
 
+    g_free(req->in_iov);
     g_free(req);
 }
 
@@ -566,7 +567,6 @@ static void virtio_crypto_req_complete(void *opaque, int ret)
     VirtIOCrypto *vcrypto = req->vcrypto;
     VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
     uint8_t status = -ret;
-    g_autofree struct iovec *in_iov_copy = req->in_iov;
 
     if (req->flags == CRYPTODEV_BACKEND_ALG_SYM) {
         virtio_crypto_sym_input_data_helper(vdev, req, status,



> >
> > clang -m64 -mcx16 -Ilibqemu-x86_64-softmmu.fa.p -I. -I.. -Itarget/i386
> > -I../target/i386 -Iqapi -Itrace -Iui -Iui/shader
> > -I/usr/include/pixman-1 -I/usr/include/capstone
> > -I/usr/include/spice-server -I/usr/include/spice-1
> > -I/usr/include/cacard -I/usr/include/glib-2.0
> > -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4
> > -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC -flto
> > -fcolor-diagnostics -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
> > -isystem /builds/qemu-project/qemu/linux-headers -isystem
> > linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
> > /builds/qemu-project/qemu/include -iquote
> > /builds/qemu-project/qemu/tcg/i386 -pthread -D_GNU_SOURCE
> > -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> > -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> > -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
> > -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
> > -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
> > -Wexpansion-to-defined -Wno-initializer-overrides
> > -Wno-missing-include-dirs -Wno-shift-negative-value
> > -Wno-string-plus-int -Wno-typedef-redefinition
> > -Wno-tautological-type-limit-compare -Wno-psabi
> > -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong
> > -fsanitize=safe-stack -fsanitize=cfi-icall
> > -fsanitize-cfi-icall-generalize-pointers -fno-sanitize-trap=cfi-icall
> > -fPIE -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
> > '-DCONFIG_TARGET="x86_64-softmmu-config-target.h"'
> > '-DCONFIG_DEVICES="x86_64-softmmu-config-devices.h"' -MD -MQ
> > libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -MF
> > libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o.d -o
> > libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -c
> > ../hw/virtio/virtio-crypto.c
> > ../hw/virtio/virtio-crypto.c:569:30: error: unused variable
> > 'in_iov_copy' [-Werror,-Wunused-variable]
> > g_autofree struct iovec *in_iov_copy = req->in_iov;
> > ^
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/3253703167
> >
> > Stefan


