Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8946C53A7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 19:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf36f-0001Ch-7g; Wed, 22 Mar 2023 14:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pf36c-0001By-WC
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pf36b-0002ft-EL
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679509355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dgm8GvGjiSix+6ZJ/nRrCAuItoeap+7OWPmLlDaMUpo=;
 b=UaRBuDUwIE9NRlcyXYB0rtChbHain5AfTLKjyweHlSDpRsBGoANS3P6Fx3DbUATyYSMRHb
 8yyR5gC//lAAlqRiCMrb9GtkmcNCHp4B9/TwSnRXCBkCpcD3Zspyk8v+BvnclUsdE1j4QZ
 0oMNhczDGAltrKJSUe0Y05yiDnVqUQI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132--FdEjEzsNdKHaADKV4fezA-1; Wed, 22 Mar 2023 14:22:30 -0400
X-MC-Unique: -FdEjEzsNdKHaADKV4fezA-1
Received: by mail-io1-f71.google.com with SMTP id
 b26-20020a5d805a000000b0074cfe3a44aeso10237258ior.10
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 11:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679509349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dgm8GvGjiSix+6ZJ/nRrCAuItoeap+7OWPmLlDaMUpo=;
 b=GdioPKJED3Y8bAeLClxlzZ0EMjShqe8yNs7xiqoeW0mXZAQ2qiEfonaHlfZjZxnlNN
 bMxvFzvyREZBcM6V7uXHnC7G0ZxNzSlTt+B7tHjpPCov4fvebNf8k+AnoE7C1gDXJz/E
 R5+xEHDpathN+UV+azZPgRsHMeB407bthC2RuktCeeJh8HNlDFXMAJb9IxSR62p2ydCv
 cxYnJuTbFoZz9Jqf/1CMAZMsyrJ+npE2I/vvMgKwMrcB6zKqlG9zJOUDkTD8IN7JAra0
 3haee8IMFP/l2dJlMGT29jMiQGr5JIjoy8yH0cmChIUVL0V50rm3Ab+xvHwOHPvQ11gG
 iLxA==
X-Gm-Message-State: AO0yUKW3ItUF3cb8OVmYCwkRpVSywIlMauM89p7LWgIXLG8nFZBw72qx
 6A+mrdTxb1DOgjGRnb7aptq1j89EiWeQMuiytBxlDwV3bpRq7RZuCWE4LmOW3jOiRKHtYa6Nk/D
 v4VyRWCNweZw28lZ+LA3JJDk=
X-Received: by 2002:a6b:4a03:0:b0:74c:97ee:3e56 with SMTP id
 w3-20020a6b4a03000000b0074c97ee3e56mr4417378iob.19.1679509349156; 
 Wed, 22 Mar 2023 11:22:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set+y2AlAuCIiIuVOP42TOppVXXWRP1VghpNEb409lK+HK69VQpBPpNH/wD6+khgJHUEKgJXu3g==
X-Received: by 2002:a6b:4a03:0:b0:74c:97ee:3e56 with SMTP id
 w3-20020a6b4a03000000b0074c97ee3e56mr4417370iob.19.1679509348926; 
 Wed, 22 Mar 2023 11:22:28 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 cl4-20020a0566383d0400b003ab21c8fa84sm5215565jab.121.2023.03.22.11.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 11:22:28 -0700 (PDT)
Date: Wed, 22 Mar 2023 12:22:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yang Zhong <yang.zhong@linux.intel.com>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: About the instance_finalize callback in VFIO PCI
Message-ID: <20230322122227.01a51193.alex.williamson@redhat.com>
In-Reply-To: <ZBr+PNMHHVZ/mEs/@yangzhon>
References: <ZBgn90bjw9iRaTrw@yangzhon>
 <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org>
 <ZBr0dr7xPjZrn3e5@yangzhon>
 <62b9e8b3-a619-573d-c641-d80a12c3ab59@kaod.org>
 <ZBr+PNMHHVZ/mEs/@yangzhon>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 22 Mar 2023 09:10:20 -0400
Yang Zhong <yang.zhong@linux.intel.com> wrote:

> On Wed, Mar 22, 2023 at 01:56:13PM +0100, C=C3=A9dric Le Goater wrote:
> > On 3/22/23 13:28, Yang Zhong wrote: =20
> > > On Tue, Mar 21, 2023 at 06:30:14PM +0100, C=C3=A9dric Le Goater wrote=
: =20
> > > > On 3/20/23 10:31, Yang Zhong wrote: =20
> > > > > Hello Alex and Paolo,
> > > > >=20
> > > > > There is one instance_finalize callback definition in hw/vfio/pci=
.c, but
> > > > > i find this callback(vfio_instance_finalize()) never be called du=
ring the
> > > > > VM shutdown with close VM or "init 0" command in guest.
> > > > >=20
> > > > > The Qemu related command:
> > > > >      ......
> > > > >      -device vfio-pci,host=3Dd9:00.0
> > > > >      ...... =20
> > > >=20
> > > > well, the finalize op is correctly called for hot unplugged devices=
, using
> > > > device_add.
> > > >  =20
> > >     Thanks C=C3=A9dric, i can use device_del command in the monitor to
> > >     trigger this instance_finalize callback function in the VFIO PCI.
> > >     thanks! =20
> >=20
> > yes. I think that in the shutdown case, QEMU simply relies on exit() to
> > do the cleanup. On the kernel side, unmaps, fds being closed trigger any
> > allocated resources.
> >=20
> > Out of curiosity, what were you trying to achieve in the finalize op ?
> >  =20
> =20
>  We are doing one new feature, which need this callback to do some
>  cleanup work with VFIO/iommufd kernel module. thanks!

This sounds dangerously like relying on userspace for cleanup.  Kernel
drivers need to be able to perform all cleanup themselves when file
descriptors are closed.  They must expect that userspace can be killed
at any point in time w/o an opportunity to do cleanup work.  Thanks,

Alex


