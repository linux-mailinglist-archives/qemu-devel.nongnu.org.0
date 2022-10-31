Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F285C613E7A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 20:43:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opafl-0004bw-3f; Mon, 31 Oct 2022 15:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opaff-0004a0-D5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opafd-0004uA-Kv
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667245323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LH7mb/5KQY4ajmmCuKwT4KDj2xXr2i31GffBtaWMVi8=;
 b=buvfMQDuSfWI/vdNdgOjJR7SSSP+g6FnKLs3gnOe+0KqrfYanNp4Tb6G+xxDl2Oqpt554J
 cvTXAgMXUgMF6idraWjqp9VwypoJDw4fskobqMip9vVDAWy/2cqlvpG03YEOwR+gun2l6E
 xxZIk2a1a9qKreoI6wEbEkQFvDZtLno=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-lRwIwnSBOWWkWQiDChh_PA-1; Mon, 31 Oct 2022 15:42:01 -0400
X-MC-Unique: lRwIwnSBOWWkWQiDChh_PA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so3333261wrg.16
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 12:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LH7mb/5KQY4ajmmCuKwT4KDj2xXr2i31GffBtaWMVi8=;
 b=A4tulszO53cN7VRCQRYZmad0k349Ky99Tv0qj4gbDqXVBRnEg5NdQJ8lOZ4Co5YP8J
 xRt7/LIt0bWEjLeseXO/Tkow/DrTC3tJ2GqiDRawbHSSsWo4aYVFtM+tnQpfZ3n3X3+u
 Vn3iFtblYeKoTxvM48E4pJrALBoUuSTm8fCiyZjqndbk74kHmsSIXbqsGe7Dx55a32pF
 mAqHV8BpjN9yZ6/v1d+Cwp9ECgOXie4UueOw9OIeDfQhI7EAg2GPoqe8hIkZlWdhGEGo
 PVpzg15a7Uyr9z48AAjW68PZVrvf1lP1sf+oOUrcuLz8+TT9YWj8CkuBuE/JGn/t4d8y
 sRUw==
X-Gm-Message-State: ACrzQf1QS35cg5o3QfeliSKzqPMfTk7WHGVuy9g2kY4EMwvzDly7kiXP
 /DOoVsj5/Tqf4uhli1HAjkuNjcUT5XZoqGu7G8dNfdGx7WSK9CZX09TJCqCw+CKFzYmfiRCTk0z
 Fo//50F/+qrfuz8M=
X-Received: by 2002:a05:600c:3acd:b0:3ce:3f62:a8d1 with SMTP id
 d13-20020a05600c3acd00b003ce3f62a8d1mr9186362wms.78.1667245320245; 
 Mon, 31 Oct 2022 12:42:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mPEJ41doRxBwOynU4BMgQ3CoIcbCWvdIwh2n9LbIofLBlHVjtdGwoXMa7o5jGB5N4qYMeKQ==
X-Received: by 2002:a05:600c:3acd:b0:3ce:3f62:a8d1 with SMTP id
 d13-20020a05600c3acd00b003ce3f62a8d1mr9186345wms.78.1667245319937; 
 Mon, 31 Oct 2022 12:41:59 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c4d8600b003b50428cf66sm8088351wmp.33.2022.10.31.12.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 12:41:59 -0700 (PDT)
Date: Mon, 31 Oct 2022 15:41:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Lei He <helei.sig11@bytedance.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221031154133-mutt-send-email-mst@kernel.org>
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXafXM0CJDe5G=--3Xa4O5ifqz=yvO=ubWLaS-KNBVkwQ@mail.gmail.com>
 <CAJSP0QXndDKsc2wy4uTPtT7uN5yV4ZMn+Nn7uV190JmhnfSROA@mail.gmail.com>
 <20221031152525-mutt-send-email-mst@kernel.org>
 <20221031153513-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031153513-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Oct 31, 2022 at 03:35:28PM -0400, Michael S. Tsirkin wrote:
> On Mon, Oct 31, 2022 at 03:31:54PM -0400, Michael S. Tsirkin wrote:
> > On Mon, Oct 31, 2022 at 03:19:25PM -0400, Stefan Hajnoczi wrote:
> > > On Mon, 31 Oct 2022 at 15:14, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > >
> > > > On Mon, 31 Oct 2022 at 08:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > Lei He (4):
> > > > >       virtio-crypto: Support asynchronous mode
> > > >
> > > > The following clang warning breaks the build. Please resend a fixed
> > > > pull request, thanks!
> > > 
> > > On second thought, I have fixed up the merge commit manually since
> > > Michael is offline tomorrow for the soft freeze deadline. If CI passes
> > > then I'll apply this pull request (with my fixup) and you won't need
> > > to resend.
> > 
> > Hmm what's the fixup?
> > I came up with:
> > 
> > diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> > index 39c8f5914e..855b5d60a2 100644
> > --- a/hw/virtio/virtio-crypto.c
> > +++ b/hw/virtio/virtio-crypto.c
> > @@ -495,6 +495,7 @@ static void virtio_crypto_free_request(VirtIOCryptoReq *req)
> >          }
> >      }
> >  
> > +    g_free(req->in_iov);
> >      g_free(req);
> >  }
> >  
> > @@ -566,7 +567,6 @@ static void virtio_crypto_req_complete(void *opaque, int ret)
> >      VirtIOCrypto *vcrypto = req->vcrypto;
> >      VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
> >      uint8_t status = -ret;
> > -    g_autofree struct iovec *in_iov_copy = req->in_iov;
> >  
> >      if (req->flags == CRYPTODEV_BACKEND_ALG_SYM) {
> >          virtio_crypto_sym_input_data_helper(vdev, req, status,
> > 
> 
> 
> Not that is not right either.


Or maybe yes ... still wanted to see what you came up with.
Pretty tired here.

> > 
> > > >
> > > > clang -m64 -mcx16 -Ilibqemu-x86_64-softmmu.fa.p -I. -I.. -Itarget/i386
> > > > -I../target/i386 -Iqapi -Itrace -Iui -Iui/shader
> > > > -I/usr/include/pixman-1 -I/usr/include/capstone
> > > > -I/usr/include/spice-server -I/usr/include/spice-1
> > > > -I/usr/include/cacard -I/usr/include/glib-2.0
> > > > -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4
> > > > -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC -flto
> > > > -fcolor-diagnostics -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
> > > > -isystem /builds/qemu-project/qemu/linux-headers -isystem
> > > > linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
> > > > /builds/qemu-project/qemu/include -iquote
> > > > /builds/qemu-project/qemu/tcg/i386 -pthread -D_GNU_SOURCE
> > > > -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> > > > -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> > > > -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
> > > > -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
> > > > -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
> > > > -Wexpansion-to-defined -Wno-initializer-overrides
> > > > -Wno-missing-include-dirs -Wno-shift-negative-value
> > > > -Wno-string-plus-int -Wno-typedef-redefinition
> > > > -Wno-tautological-type-limit-compare -Wno-psabi
> > > > -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong
> > > > -fsanitize=safe-stack -fsanitize=cfi-icall
> > > > -fsanitize-cfi-icall-generalize-pointers -fno-sanitize-trap=cfi-icall
> > > > -fPIE -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
> > > > '-DCONFIG_TARGET="x86_64-softmmu-config-target.h"'
> > > > '-DCONFIG_DEVICES="x86_64-softmmu-config-devices.h"' -MD -MQ
> > > > libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -MF
> > > > libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o.d -o
> > > > libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -c
> > > > ../hw/virtio/virtio-crypto.c
> > > > ../hw/virtio/virtio-crypto.c:569:30: error: unused variable
> > > > 'in_iov_copy' [-Werror,-Wunused-variable]
> > > > g_autofree struct iovec *in_iov_copy = req->in_iov;
> > > > ^
> > > >
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/3253703167
> > > >
> > > > Stefan


