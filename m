Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5067E4AE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:10:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNXs-0001lm-1H; Fri, 27 Jan 2023 07:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLNXk-0001l6-A7
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:09:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLNXi-0005AX-FB
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674821357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oN4tyfQtB+VIjrVxVFLEiOZrPcbl5758PCnNZ1GxC64=;
 b=Lj2dp4WAmF4u4Lhd5+xwqgcsOtblyODdv4/XhFPZTD2lnQeE4ZUu2yaF17DSPIXmvLRyUF
 PVvQkYPKy2EMq1RoMl4srLXkUZRvm5lioiX/VIu8PUtk6ouc7gvjZyhpfA03a9oRxsN0E0
 JF0aUIj0FSZRZutVTPjIDZRhzcBfnk8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-Eb3QRXr2NIqw3GQ538sLFA-1; Fri, 27 Jan 2023 07:09:15 -0500
X-MC-Unique: Eb3QRXr2NIqw3GQ538sLFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h9-20020a1ccc09000000b003db1c488826so4557450wmb.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 04:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oN4tyfQtB+VIjrVxVFLEiOZrPcbl5758PCnNZ1GxC64=;
 b=NmBNorSpLvrIRFgOzHHX/4dc3LxB0H7TBSC6pTotc3DYIXXqCSTd+BEleq3c2atTQo
 ySO/9Mq8hb2kcZA2fL6/c0MpsEtRNM10rHA9CNmEV8jGQMANTrY99/YXD6ytIExmK7if
 sUmFTeCIQe1GkluCP1yZuNxXuF+MvrFA0PHA89e6loBvcqB2piHqhze+7OoWisWUpmiS
 Kp1AecaC4kmt/X0FQANuTLlFqk1OwEFJlboqWyCSw3XEeUi3s3yBwEXK4V4hFX72CXAY
 Em4FVUVaVhC80ydwXhoeimKr9PZDMA2auRL+nGdEOhOJD79nsl9Se670vx7yNDav+c5L
 FIeA==
X-Gm-Message-State: AFqh2kpnr6e97UK6ba74lza5/CvhvMbpmMS9Hhcs4kDqTl2vKknVuYSU
 qZimLwALcJg+mHFADxXvjJoVudVZ9muocGZt6ZRLMmGWkzmlk16HZk87LNBeNecFuwLcciFlAXg
 kMkiNoouoAgSRkY7u6IHOcZG71o8sdB4=
X-Received: by 2002:a7b:ce8f:0:b0:3d9:e033:e2ee with SMTP id
 q15-20020a7bce8f000000b003d9e033e2eemr2200899wmj.117.1674821354764; 
 Fri, 27 Jan 2023 04:09:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvTj9z88Zzv3k4g/NfuH0NJUUgwEuzscGt8rgm5qXRuwsz18kZ2IoboRecZ+PYR1a/RDf0WJGYQOBMCxRnjGSI=
X-Received: by 2002:a7b:ce8f:0:b0:3d9:e033:e2ee with SMTP id
 q15-20020a7bce8f000000b003d9e033e2eemr2200892wmj.117.1674821354398; Fri, 27
 Jan 2023 04:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20230127084604.53175-1-smitterl@redhat.com>
 <46642f8f-d514-798b-1e4e-bc337a206c38@redhat.com>
In-Reply-To: <46642f8f-d514-798b-1e4e-bc337a206c38@redhat.com>
From: Sebastian Mitterle <smitterl@redhat.com>
Date: Fri, 27 Jan 2023 13:08:38 +0100
Message-ID: <CAKgrZ6+=kPizSUh=0Bq3PRgbjLGGkeSGbUbgLhsREbqKtMa6uw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/s390x/pcidevices: document pci devices on s390x
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, cohuck@redhat.com, clegoate@redhat.com, 
 qemu-trivial@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=smitterl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jan 27, 2023 at 10:24 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/01/2023 09.46, Sebastian Mitterle wrote:
> > Add some documentation about the zpci device and how
> > to use it with pci devices on s390x.
>
> Thanks for tackling this! ... some comments below...
>
> > Used source: Cornelia Huck's blog post
> > https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
> >
> > Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
> > ---
> > v2: move section below 'Device support'
> > ---
> >   docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
> >   docs/system/target-s390x.rst     |  1 +
> >   2 files changed, 35 insertions(+)
> >   create mode 100644 docs/system/s390x/pcidevices.rst
> >
> > diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
> > new file mode 100644
> > index 0000000000..fec905d6e6
> > --- /dev/null
> > +++ b/docs/system/s390x/pcidevices.rst
> > @@ -0,0 +1,34 @@
> > +PCI devices on s390x
> > +====================
> > +
> > +PCI devices on s390x work differently than on other architectures.
> > +
> > +To start with, using a PCI device requires the additional ``zpci`` device. For example,
>
> Please wrap lines at 80 columns (if possible)
>
> > +in order to pass a PCI device ``0000:00:00.0`` through you'd specify::
>
> I'd suggest to be more explicit here:
>
> in order to pass a host PCI device ``0000:00:00.0`` through to the guest,
> you would specify::
>
> > + qemu-system-s390x ... \
> > +                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
> > +                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
> > +
> > +Here, the zpci device is joined with the PCI device via the ``target`` property.
> > +
> > +Note that we don't set bus, slot or function here for the guest as is common in other
>
> "as *it* is common" ?
>
I checked linguee.com and it seems to me it's correct to omit the 'it' here.
> > +PCI implementations. Topology information is not available on s390x. Instead, ``uid``
> > +and ``fid`` determine how the device is presented to the guest operating system.
> > +
> > +In case of Linux, ``uid`` will be used in the ``domain`` part of the PCI identifier, and
> > +``fid`` identifies the physical slot, i.e.::
> > +
> > + qemu-system-s390x ... \
> > +                   -device zpci,uid=7,fid=8,target=hostdev0,id=zpci1 \
> > +                   ...
> > +
> > +will be presented in the guest as::
> > +
> > + # lspci -v
> > + 0007:00:00.0 ...
> > + Physical Slot: 00000008
> > + ...
> > +
> > +Finally, note that you might have to enable the ``zpci`` feature in the cpu model in oder to use
>
> s/oder/order/
>
> (and it's a very long line again, please wrap at 80 columns)
>
> > +it.
>
> Should we also add some information about virtio devices? (can also be added
> later, not necessarily in your patch already)
>
I don't have experience with virtio pci devices on s390x. Therefore I
prefer not to add this information this time.
>   Thomas
>


