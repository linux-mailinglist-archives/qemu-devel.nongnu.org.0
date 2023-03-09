Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB626B1891
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 02:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa4r3-0006V1-5y; Wed, 08 Mar 2023 20:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pa4r1-0006Uo-BP
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 20:13:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pa4qz-0006gs-0S
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 20:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678324435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/58rnRV5UGKxHsIXQhXQ+/tnPe7gyQ4qdT7RXJu7vE=;
 b=QuFQsyj87aOz88y5C/TFYdF1VvPqrkMgogxOxceDWRc7gSRY/ZVVEvOPxuHAVoVhfUgxB4
 Wv68pbgFfYeU5WpL7KlqVbqRMV7tjk36ZiaK8NtulCWtmbSnYuqaG0o4aHhI1ioDUuYMoi
 y/NducPVmx0YoGtUbLdWyKkVKHOO2/0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-DhLCuVfDP_6JRpiKAoNqfQ-1; Wed, 08 Mar 2023 20:13:53 -0500
X-MC-Unique: DhLCuVfDP_6JRpiKAoNqfQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 d12-20020a05680813cc00b00383b76f4171so290842oiw.20
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 17:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678324433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/58rnRV5UGKxHsIXQhXQ+/tnPe7gyQ4qdT7RXJu7vE=;
 b=YfpJJLsjEtBJui/O8kXkINgVbaPilAr7wTMDotGqJYHBb1u/KcidIjD4kokD4p9WXT
 Z3yqxNERPjOA0SFsdPPnKjLtPt2K4F1LXepnk87WU2jn+lwY4IglrzyruUIoSacR7oS3
 RfacRqRK60xuDdT3tFRcI3WId5Vmp/Q5W8qqRpg8IFlonc3phd8U+HfHQUTlTmFKuX+4
 6RkTFpXXAlDGPk/iGVyew9woZu/o0ND9Rm9N9qQ+9Ax1Zwld2FBHNJzRMD1g79vhHj6H
 pVooFcUnjYI9sLRTD4QTkV4+NozwMezm8Z04WBmm0ztdZsqphwijfvkrTGuJLKmsLbGe
 ifbw==
X-Gm-Message-State: AO0yUKULC55pgHkW8+g8cTNl7WLtIh+tH9HPHRtRvOGErNhFXWZk7ua0
 Ekwlfexav3gUx/WStPugr06eKttNFhGZE9RUx/RJbQaZviR8MN1EJJqqCeoKOfrazev0ac52fqL
 TF0bFNgl5GLPVQDeFL9bb0q121F9QJl8=
X-Received: by 2002:a05:6808:994:b0:37f:a0a1:bda1 with SMTP id
 a20-20020a056808099400b0037fa0a1bda1mr6762779oic.3.1678324432912; 
 Wed, 08 Mar 2023 17:13:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+qkALXTAXFeiC2Ab7q45mDgm0OsceFe3MBDDUDn5RYXd6i2WzU6eOEM4OWeBSCrm1gt6G4gNBQrTF46CMYi4M=
X-Received: by 2002:a05:6808:994:b0:37f:a0a1:bda1 with SMTP id
 a20-20020a056808099400b0037fa0a1bda1mr6762769oic.3.1678324432527; Wed, 08 Mar
 2023 17:13:52 -0800 (PST)
MIME-Version: 1.0
References: <20230307070816.34833-1-jasowang@redhat.com>
 <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
 <4b67f103-0df3-891c-2a0f-466a82e89732@linaro.org>
 <CACGkMEsuy_eCGcLy2C8-BybbwGC4ak9+Gfv9EeiG6DAZrLjZdQ@mail.gmail.com>
 <719692c2-6401-fd6a-8718-1dd5e6ff1f85@linaro.org>
 <20230308071628-mutt-send-email-mst@kernel.org>
 <197b027e-1bbf-bd44-f78b-e01d535f3ac1@linaro.org>
 <20230308072348-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230308072348-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Mar 2023 09:13:41 +0800
Message-ID: <CACGkMEtjmpX8G9HYZ0r3n5ErhAENKhQ81f4ocfCYrh=XoF=5hw@mail.gmail.com>
Subject: Re: [PULL 00/51] Net patches
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Stefan Weil <sw@weilnetz.de>, Igor Mammedov <imammedo@redhat.com>,
 wei.huang2@amd.com, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Mar 8, 2023 at 8:25=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Mar 08, 2023 at 01:21:52PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 8/3/23 13:17, Michael S. Tsirkin wrote:
> > > On Wed, Mar 08, 2023 at 08:40:42AM +0100, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > > On 8/3/23 07:56, Jason Wang wrote:
> > > > > On Wed, Mar 8, 2023 at 4:43=E2=80=AFAM Philippe Mathieu-Daud=C3=
=A9 <philmd@linaro.org> wrote:
> > > > > >
> > > > > > On 7/3/23 18:01, Peter Maydell wrote:
> > > > > > > On Tue, 7 Mar 2023 at 07:08, Jason Wang <jasowang@redhat.com>=
 wrote:
> > > > > > > >
> > > > > > > > The following changes since commit 817fd33836e73812df2f1907=
612b57750fcb9491:
> > > > > > > >
> > > > > > > >      Merge tag 'audio-pull-request' of https://gitlab.com/m=
arcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)
> > > > > > > >
> > > > > > > > are available in the git repository at:
> > > > > > > >
> > > > > > > >      https://github.com/jasowang/qemu.git tags/net-pull-req=
uest
> > > > > > > >
> > > > > > > > for you to fetch changes up to c19b566a3898510ec2b3e881b3fb=
78614b240414:
> > > > > > > >
> > > > > > > >      hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by E=
EPRO100() (2023-03-07 14:55:39 +0800)
> > > > > > > >
> > > > > > > > -----------------------------------------------------------=
-----
> > > > > >
> > > > > > > build-oss-fuzz failed on something involving fuzzing eepro100=
:
> > > > > > > https://gitlab.com/qemu-project/qemu/-/jobs/3889073821
> > > > > > Jason, please drop my patches. I'll look at that failure.
> > > >
> > > > Before "hw/net/eepro100: Convert reset handler to DeviceReset",
> > > > e100_pci_reset() is only called once from DeviceRealize _before_
> > > > the device is realized.
> > > >
> > > > After, 1/ it can be called multiple times and 2/ it seems to do
> > > > stuffs that really belong to DeviceRealize (should be called once),
> > > > in particular pci_add_capability().
> > > >
> > > > I *think* it should be illegal to call pci_add_capability() _after_
> > > > a device is realized. Auditing pci_add_capability(), there is only
> > > > one other use before realize: amdvi_sysbus_realize() in
> > > > hw/i386/amd_iommu.c.
> > >
> > > Calling pci_add_capability when VM is running is likely to confuse
> > > guests, yes.
> >
> > Thanks for confirming. Similar pattern: msi_init().
> >
> > While trying to fix that in hw/i386/amd_iommu.c I realized this device
> > isn't in a good shape, almost unmaintained: 2 bugfixes in since 7 years=
,
> > the other commits are generic API cleanups.

Last time I tried AMD vIOMMU it didn't even boot. We need to check if
anyone can maintain that driver (adding Wei and Peter).

> I'll post the series and
> > we can discuss that there.
>
> Absolutely. A mix of VTD or for that matter virtio iommu and AMD CPUs
> seems to work well enough that most people don't bother.
> I vaguely remember spec review showed some things were hard
> to support correctly with shadowing, but I don't remember
> the detail

Something like caching mode otherwise we need to trap the page table
modification via userfaultfd?

> (and our shadowing with VTD only works because
> it matches what drivers are doing).

I think not, VTD has a caching mode that is designed to be friendly
for virtualization/emulation (mentioned in the spec). But it would be
replaced by hardware accelerated one soon.

Thanks

>
> --
> MST
>


