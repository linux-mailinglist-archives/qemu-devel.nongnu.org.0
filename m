Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D949E509
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:48:28 +0100 (CET)
Received: from localhost ([::1]:34232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD64Z-0004E6-QI
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:48:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nD5xJ-0005eG-NM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:40:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nD5xE-0006A9-KM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643294451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSjJt6PYWoaq2b+LPPDHWmTQUMvBdUfa5OIkbHNRonQ=;
 b=BQj0NNJdJDAbDgxfSCcMOhFKeP0faIG5X9NhYEVRQFLFi8hTXPd3VZpUsLjWBLzQNGD1MY
 dcMJgdaE8JSL+SBqYTFblfp56i0g4uMog4FPrQRELMaQrypg9ABkpyJLrRZ/OKG2r3VdxZ
 y+LT+dUIMiNpnrIgywjFB+/uWmB7lNI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-VD0vQEXbPe2XHk_87H69Zg-1; Thu, 27 Jan 2022 09:40:50 -0500
X-MC-Unique: VD0vQEXbPe2XHk_87H69Zg-1
Received: by mail-io1-f69.google.com with SMTP id
 d70-20020a6bcd49000000b0060d10445eddso2237483iog.13
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=wSjJt6PYWoaq2b+LPPDHWmTQUMvBdUfa5OIkbHNRonQ=;
 b=Ej4bpJNdG2jbCN5rDJYiBKADeK+zz9UWbqhcimLYgY0AIoEMPymj40im4n1O8APWod
 ZaSpqTpeXsuCIpVKkzk02RKGeFEXoxWGNw81jAyLAK37mtbWnje0GLVGy6iuDCtDd5ZO
 TV++r9szPQgqGBDwPwzMx/3JnQsLcN2bc/Eaaj5HM9WYm3QzlUT8peLQYpPYCvF6xmgU
 BOuHkS9RObR6lYX4A4l8/kupvH2yyHKx/VxoyeipeiN/5JqULBp14gcXkxozqau6hcVY
 3cgpeVbtTZKzjltTwSpxy4f4xtboCEQAFMIXO3oQ9JlD3wFuX2Letd8gG7kwdnB5L7BJ
 sg5w==
X-Gm-Message-State: AOAM533Y64mFNc33PyZJrFKo0Z8kX3HYcCwJ3ZSzFiY4ubGATuWUJ8uH
 3097nsXzVcqkd641znhuDkJ3QtCEaIOZiHH6//Z5xWu49WQ7JkrVG1kwAsWc3yzDi+Wcl0MXOKe
 VhYR7BmcQl5bScn4=
X-Received: by 2002:a05:6602:140c:: with SMTP id
 t12mr2073957iov.177.1643294449504; 
 Thu, 27 Jan 2022 06:40:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZxZNIY54Bs7DRXPR3v8Wz+/RxhjQVndj82gXvclSSaZmPezDBaX+0Z/JdaGxni+CsmAhjxQ==
X-Received: by 2002:a05:6602:140c:: with SMTP id
 t12mr2073949iov.177.1643294449280; 
 Thu, 27 Jan 2022 06:40:49 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id b6sm5946537ioz.43.2022.01.27.06.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:40:48 -0800 (PST)
Date: Thu, 27 Jan 2022 07:40:47 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 0/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Message-ID: <20220127074047.6d3ecd16.alex.williamson@redhat.com>
In-Reply-To: <ccd1ccae-d9eb-8873-ded4-8caca5985b80@amsat.org>
References: <20220120001242.230082-1-f4bug@amsat.org>
 <20220126165143.29352fb4.alex.williamson@redhat.com>
 <ccd1ccae-d9eb-8873-ded4-8caca5985b80@amsat.org>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 08:51:15 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Hi Alex,
>=20
> On 27/1/22 00:51, Alex Williamson wrote:
> > On Thu, 20 Jan 2022 01:12:40 +0100
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >  =20
> >> This is a respin of Eric's work, but not making tpm_crb.c target
> >> specific.
> >>
> >> Based-on: <20220120000836.229419-1-f4bug@amsat.org>
> >> "exec/cpu: Make host pages variables / macros 'target agnostic'"
> >> https://lore.kernel.org/qemu-devel/20220120000836.229419-1-f4bug@amsat=
.org/ =20
>=20
> [*]
>=20
> >> --
> >>
> >> Eric's v2 cover:
> >>
> >> This series aims at removing a spurious error message we get when
> >> launching a guest with a TPM-CRB device and VFIO-PCI devices.
> >>
> >> The CRB command buffer currently is a RAM MemoryRegion and given
> >> its base address alignment, it causes an error report on
> >> vfio_listener_region_add(). This series proposes to use a ram-device
> >> region instead which helps in better assessing the dma map error
> >> failure on VFIO side.
> >>
> >> Eric Auger (2):
> >>    tpm: CRB: Use ram_device for "tpm-crb-cmd" region
> >>    hw/vfio/common: Silence ram device offset alignment error traces
> >>
> >>   hw/tpm/tpm_crb.c     | 22 ++++++++++++++++++++--
> >>   hw/vfio/common.c     | 15 ++++++++++++++-
> >>   hw/vfio/trace-events |  1 +
> >>   3 files changed, 35 insertions(+), 3 deletions(-)
> >> =20
> >=20
> > Unfortunately, FTB:
> >=20
> > ../hw/tpm/tpm_crb.c: In function =E2=80=98tpm_crb_realize=E2=80=99:
> > ../hw/tpm/tpm_crb.c:297:33: warning: implicit declaration of function =
=E2=80=98HOST_PAGE_ALIGN=E2=80=99 [-Wimplicit-function-declaration]
> >    297 |                                 HOST_PAGE_ALIGN(CRB_CTRL_CMD_S=
IZE));
> >        |                                 ^~~~~~~~~~~~~~~
> > ../hw/tpm/tpm_crb.c:297:33: warning: nested extern declaration of =E2=
=80=98HOST_PAGE_ALIGN=E2=80=99 [-Wnested-externs]
> >=20
> > This is a regression since Eric's v2.  Thanks, =20
>=20
> This series is based on another patch that Paolo already queued
> (see [*] earlier).
>=20
> Next time I'll try to make it more explicit.

Sorry I missed that.  Since Paolo now has that pending in a pull
request I'll try again next week.  Thanks,

Alex


