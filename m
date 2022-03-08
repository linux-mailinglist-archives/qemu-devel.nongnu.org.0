Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE24E4D163C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:28:17 +0100 (CET)
Received: from localhost ([::1]:49418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRY0m-0001TE-H5
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:28:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXwl-0000C4-UH
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:24:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXwj-0003tO-Vh
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646738644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iUi0g74zoEfQnd0AyvrJ5Nmq/RxeCEQfpiO+2h1VeQ=;
 b=fsShxCt+o+boxEyszelu5NQXwUimpN2x4wlYS7GThdDfS+5DFDJkWxvL1XCP7Q8NDsILm0
 CTIPx7YXdKqHOJwSfRZNW4Kww5BREel9QAwryMLGcJ4n+DfaKuNnwSFl0sgnSgxR/l3D7+
 a+/70QxMbqGScFuPOWtunJduvKgzsuU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-R5DXGk0EPpinQIOti37KXw-1; Tue, 08 Mar 2022 06:24:03 -0500
X-MC-Unique: R5DXGk0EPpinQIOti37KXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso821991wmz.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3iUi0g74zoEfQnd0AyvrJ5Nmq/RxeCEQfpiO+2h1VeQ=;
 b=AX2/TSZ2VnWTLuUq9K9ruiHXhpQHWn60IUbZo0vJoUfLMKxP4DPRefG1+eJjuO8lHc
 T78Cdv5XqPzsLqlW5GUP/8FSmPhBKHioIWNll2/tbndt3lETbR9CRDhoo9jOpF+1+HbC
 ncfmO63ewN/bi47ChdM1ANIx4eRu3FJTzYuNdhJ5+wnH3OAt/Mac4Mp2zbEYBKJTI0Sl
 aoZ2K5+i4/576XPXj10WDJx+hyHdJv7m1W5ovgJyYgz0Wf99Vjlf1z9DGQrg4DEaOdgY
 nV1mhIg1PZzHe4kulxpDnp2yYGNWF1AFFfswGvLEWVCpgk1lXSwR4U9Jm6BIAZaxKBK1
 vgIw==
X-Gm-Message-State: AOAM531SUOtsLoV2jPugBOWnw0FPqPPbHkE2LzyVmfGoP2EGnQOt+Pup
 Zt5VYUuAOwKcNMlU/mECf4NX5AHhI3mRmm09JTYuuS3/F8gQwaM+1lHqNZVdnO4Ks1dnlmoEkrI
 9oshu9WAlAkmOZug=
X-Received: by 2002:a5d:6506:0:b0:1f1:da5e:e077 with SMTP id
 x6-20020a5d6506000000b001f1da5ee077mr11923313wru.405.1646738642020; 
 Tue, 08 Mar 2022 03:24:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbmGoQdO40XvIzVPG4dHqMN/1ZIEehMqvDl6wBB/Q8Vg7c5FcSS0D5/BfxtXacebEblozWng==
X-Received: by 2002:a5d:6506:0:b0:1f1:da5e:e077 with SMTP id
 x6-20020a5d6506000000b001f1da5ee077mr11923295wru.405.1646738641705; 
 Tue, 08 Mar 2022 03:24:01 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b001f0256761b9sm22550410wrt.45.2022.03.08.03.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:24:01 -0800 (PST)
Date: Tue, 8 Mar 2022 06:23:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20220308061940-mutt-send-email-mst@kernel.org>
References: <20220307100058.449628-1-mst@redhat.com>
 <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
 <CAFEAcA_wO6dkr6=HUYsOS7RxGErrAvsNnNqhKfM733Q=4v6cdw@mail.gmail.com>
 <20220307174713-mutt-send-email-mst@kernel.org>
 <CAFEAcA9qUMuDupNRCYeH5rzBY+J7D3XXN_92PJjhBYxF70kF=w@mail.gmail.com>
 <20220308055639-mutt-send-email-mst@kernel.org>
 <CAFEAcA-3iD3hz2ihSDOir6ByWztAjNUkAvCSbeeX7-osMQLTdg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-3iD3hz2ihSDOir6ByWztAjNUkAvCSbeeX7-osMQLTdg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 11:18:38AM +0000, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 11:01, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Mar 08, 2022 at 09:05:27AM +0000, Peter Maydell wrote:
> > > On Mon, 7 Mar 2022 at 22:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Mar 07, 2022 at 05:13:16PM +0000, Peter Maydell wrote:
> > > > > Also fails on cross-win64-system:
> > > > >
> > > > > https://gitlab.com/qemu-project/qemu/-/jobs/2172339938
> > > > >
> > > > > ../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
> > > > > ../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
> > > > > different size [-Werror=pointer-to-int-cast]
> > > > > 4358 | status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
> > > > > | ^
> > > > > ../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
> > > > > different size [-Werror=pointer-to-int-cast]
> > > > > 4359 | status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
> > > > > | ^
> > > > > ../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
> > > > > different size [-Werror=pointer-to-int-cast]
> > > > > 4360 | status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
> > > > > | ^
> > > > > cc1: all warnings being treated as errors
> > >
> > > > I dropped these for now but I really question the value of this warning,
> > > > as you can see the reason we have the buggy cast to unsigned long
> > > > is because someone wanted to shut up the warning on a 32 bit system.
> > > >
> > > > Now, I could maybe get behind this if it simply warned about a cast that
> > > > loses information (cast to a smaller integer) or integer/pointer cast
> > > > that does not go through uintptr_t without regard to size.
> > >
> > > This *is* warning about losing information. On 64-bit Windows
> > > pointers are 64 bits but 'long' is 32 bits, so the path
> > > pointer -> long -> uint64_t drops the top half of the pointer.
> 
> > Yes obviously. My point is that this:
> > (uint64_t)hdev->vqs[queue].avail
> > is always harmless but it warns on a 32 bit system.
> 
> True, I suppose. But compiler warnings are often like that: we
> take the hit of having to tweak some things we know to be OK in
> order to catch the real bugs in other cases.
> 
> > And someone trying to fix that *is* what resulted in
> > (uint64_t)(unsigned long)hdev->vqs[queue].avail
> 
> Using 'unsigned long' in a cast (or anything else) is often
> the wrong thing in QEMU...
> 
> > IOW I don't really see how
> > (uint64_t)(uintptr_t)hdev->vqs[queue].avail
> > is better than
> > (uint64_t)hdev->vqs[queue].avail
> >
> > except as a way to say "yes I do intend to cast pointer to integer
> > here, I did not forget to dereference the pointer". But if that
> > latter is what gcc is trying to warn about, then it should
> > just warn about any cast to integer except to uintptr_t,
> > without respect to size.
> 
> What is the uint64_t cast bringing to the table? Wouldn't
> just status->desc = (uintptr_t)hdev->vqs[queue].desc;
> work ?
> 
> thanks
> -- PMM

True too. I would be happy if this gave a warning:

struct {
	uint32_t foo;
} bar = { .foo = (uintptr_t)hdev->vqs[queue].avail }

but of course it doesn't, uintptr_t is just an integer
type as far as gcc is concerned :(

Maybe adding things like that to sparse might be practical.

Generally sparse seems to mainly gain features from the
kernel, QEMU's needs are different. Could be useful to collect
ideas e.g. for a GSoC project.

-- 
MST


