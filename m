Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440B24943CD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 00:17:34 +0100 (CET)
Received: from localhost ([::1]:38078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAKCq-0000mS-W6
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 18:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nAK9W-0008IC-15
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 18:14:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nAK9S-0002pJ-R2
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 18:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642634041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiqGwXXaaLl4F9vWqoqKsHTZfVvlNicCe/fdIjGAQ2U=;
 b=Oj+3UzFAj66zcZHFNA9MvmlARycR/NVCv49trOTBNSU3nYhKq8w44XuYSmiLM88joZ1Kzl
 a3PAGT5KlWNk7R871DZB7E1dMf4ScPGaNXG2RnTKHDUZ3+bLGnrN0u5WOWFcDf8mrWNmjC
 QUIQczWDA6dZj4oh+AG56K3KpUj1NZw=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-9SABrJ8gPNSnSEvId9a4Ew-1; Wed, 19 Jan 2022 18:13:56 -0500
X-MC-Unique: 9SABrJ8gPNSnSEvId9a4Ew-1
Received: by mail-oo1-f70.google.com with SMTP id
 j8-20020a4aa648000000b002de5781845bso669646oom.12
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 15:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hiqGwXXaaLl4F9vWqoqKsHTZfVvlNicCe/fdIjGAQ2U=;
 b=3wlGGbTTkVoLYf++s/Zaq0N0WriYfJoWwUJIsaiUzMigTlL1R2SlL8QgyxLc+KNiID
 96tYhF/yvJDwexmrIXjjja/++z1Mz2olM/fGKC5rC7wD/7pjhvlgkHDyhxza7V9LRXEg
 65wvm6cKwC9mZMXlTgXERfQ0JAKkpwa0c8BTeAPVc7vq373vyDy7jj/YALTAZfqzFeC7
 nddx9VCTtTbwhrA9bS9CbVySJrz5DFEZJkRJ1Ekf0NjdRiFIqWeOH3XroyibU0HOanqn
 FLQkmEUAL604MTfM9tqq2E9UU7/Z0aW554Bkj2CQ/uePDvKiw9xaO18FdWkuRoGGg95t
 RBeg==
X-Gm-Message-State: AOAM532VBdZSRWyibUU0FgzAvm3e2HkbWQYRIJyrOzdEuOCInFgcLn7u
 P3NtMqY5lw7x3HtNw2Twc6pgHQNJIN8tNCuYRW7ngcP1AFUftO24iwJBnM6V00yDeSMXZcdJ7rs
 kPo+2I08HV6GScbI=
X-Received: by 2002:a05:6830:224e:: with SMTP id
 t14mr26234875otd.154.1642634035252; 
 Wed, 19 Jan 2022 15:13:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqpaAsoz2C9f6biOF8dLmTa3DeXo9PtwZhHgDxvizK6HbeV6uUlW2q0cGGyK0yPcQOwlXskw==
X-Received: by 2002:a05:6830:224e:: with SMTP id
 t14mr26234855otd.154.1642634035011; 
 Wed, 19 Jan 2022 15:13:55 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id bk23sm765896oib.23.2022.01.19.15.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 15:13:54 -0800 (PST)
Date: Wed, 19 Jan 2022 16:13:52 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Message-ID: <20220119161352.7e67a4ba.alex.williamson@redhat.com>
In-Reply-To: <20ca78c8-a9f9-28f4-f1e1-255dbf384c7b@amsat.org>
References: <20220118153306.282681-1-eric.auger@redhat.com>
 <20220118153306.282681-2-eric.auger@redhat.com>
 <20ca78c8-a9f9-28f4-f1e1-255dbf384c7b@amsat.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: stefanb@linux.vnet.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jan 2022 23:46:19 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> On 18/1/22 16:33, Eric Auger wrote:
> > Representing the CRB cmd/response buffer as a standard
> > RAM region causes some trouble when the device is used
> > with VFIO. Indeed VFIO attempts to DMA_MAP this region
> > as usual RAM but this latter does not have a valid page
> > size alignment causing such an error report:
> > "vfio_listener_region_add received unaligned region".
> > To allow VFIO to detect that failing dma mapping
> > this region is not an issue, let's use a ram_device
> > memory region type instead.
> >=20
> > The change in meson.build is required to include the
> > cpu.h header.
> >=20
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Tested-by: Stefan Berger <stefanb@linux.ibm.com>
> >=20
> > ---
> >=20
> > v1 -> v2:
> > - Add tpm_crb_unrealize
> > ---
> >   hw/tpm/meson.build |  2 +-
> >   hw/tpm/tpm_crb.c   | 22 ++++++++++++++++++++--
> >   2 files changed, 21 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> > index 1c68d81d6a..3e74df945b 100644
> > --- a/hw/tpm/meson.build
> > +++ b/hw/tpm/meson.build
> > @@ -1,8 +1,8 @@
> >   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common=
.c'))
> >   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_is=
a.c'))
> >   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis=
_sysbus.c'))
> > -softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
> >  =20
> > +specific_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c')) =
=20
>=20
> We don't need to make this file target-specific.
>=20
> >   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: =
files('tpm_ppi.c'))
> >   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: =
files('tpm_ppi.c'))
> >   specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c=
'))
> > diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> > index 58ebd1469c..6ec19a9911 100644
> > --- a/hw/tpm/tpm_crb.c
> > +++ b/hw/tpm/tpm_crb.c
> > @@ -25,6 +25,7 @@
> >   #include "sysemu/tpm_backend.h"
> >   #include "sysemu/tpm_util.h"
> >   #include "sysemu/reset.h"
> > +#include "cpu.h"
> >   #include "tpm_prop.h"
> >   #include "tpm_ppi.h"
> >   #include "trace.h"
> > @@ -43,6 +44,7 @@ struct CRBState {
> >  =20
> >       bool ppi_enabled;
> >       TPMPPI ppi;
> > +    uint8_t *crb_cmd_buf;
> >   };
> >   typedef struct CRBState CRBState;
> >  =20
> > @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Err=
or **errp)
> >           return;
> >       }
> >  =20
> > +    s->crb_cmd_buf =3D qemu_memalign(=C3=A7,
> > +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE)); =
=20
>=20
> HOST_PAGE_ALIGN() and qemu_real_host_page_size() actually belong
> to "exec/cpu-common.h".
>=20
> Alex, could you hold on a few days for this patch? I am going to send
> a cleanup series. Otherwise no worry, I will clean this on top too.

Sure.  Thanks,

Alex


