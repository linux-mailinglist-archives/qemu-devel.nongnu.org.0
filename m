Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB84A439751
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 15:16:58 +0200 (CEST)
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mezqT-00049l-MS
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 09:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1meznp-0001w0-G7
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1meznn-00008i-HD
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635167650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qs7nOitmRghlB3YuLZvrOZ203A+AAaY25ZqFxMXPuDo=;
 b=S8KqSr601c9OIf8cUjTzyJ/CB4rUmp3rPV/2IyHWmaKgECGt7lf/6vg8x3S1JiZRZLFa5u
 oqDRZvRrwkGueE15onAd8tcdaf28e/zQfT+CWbP3fZdgAaeQOsYZ8T66b1iV727dtsNwhk
 B9pti9YXbrp84Xbt+bkJdUjyiZ3uPU8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-lx1MvGCTOnOcynV4RhYkOg-1; Mon, 25 Oct 2021 09:14:09 -0400
X-MC-Unique: lx1MvGCTOnOcynV4RhYkOg-1
Received: by mail-wm1-f71.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so3661857wmc.2
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 06:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qs7nOitmRghlB3YuLZvrOZ203A+AAaY25ZqFxMXPuDo=;
 b=i75HPqoB8mfOg9nEFkHKCiNo2fEG33tiN+9mzDQo0GfTmRaqtGAvnpUWY+bsWlGAqh
 4hA35nGiGGeJn8CSqWAZI5DXnLI+XNPDrHtg+DuZ+rer46MZsQwU10giOvNF62EAFXF/
 SrVOSbJ+SYKWSn1Q2LPgzRIcwj1ksfKP7gnCkvE8fwpU4QqsRQOiJM9i8/rn4X3AjPYt
 athlkR9BCI5vuozvtpUMPVDOq519nnjTySv05bTjWYB13tN3viXT6Jisl+1zBrvEhGh+
 MLGCvoyPmaxz7pwteC9qSqUmzr79egnArVNvVMt8kI6Sb0xhQeY6MMMlJUNS2D5Avck+
 DctA==
X-Gm-Message-State: AOAM530/Pm2kLHkc1rEKVK/1x1skko384xWNDcCaLv7fZv5PEPjWqbkq
 y0j7+S5dq/BeGy8T/fXLN+qniW1mcLiOPaA3AB39Bn0zbhNk2wapRmZV9xjk7tbjhoWSZ8QSmj9
 S0i+mTIQ+nFFIyOo=
X-Received: by 2002:a05:600c:283:: with SMTP id
 3mr19675147wmk.190.1635167647993; 
 Mon, 25 Oct 2021 06:14:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ghACcgjlF6DrD6/cd85Ln2nTbUei0csVJiUOtzL0TIPJ6/fHTJB6G9T1SkpBvAn3Dpxh1g==
X-Received: by 2002:a05:600c:283:: with SMTP id
 3mr19675126wmk.190.1635167647764; 
 Mon, 25 Oct 2021 06:14:07 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:bfd4:918:2bfe:a2a5:6abe])
 by smtp.gmail.com with ESMTPSA id q123sm5280213wma.20.2021.10.25.06.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 06:14:07 -0700 (PDT)
Date: Mon, 25 Oct 2021 09:13:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 7/8] pci: Add pci_for_each_device_all()
Message-ID: <20211025091003-mutt-send-email-mst@kernel.org>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-8-peterx@redhat.com>
 <20211021064948-mutt-send-email-mst@kernel.org>
 <YXIi65J4XiVcdYeZ@xz-m1.local>
 <20211022042642-mutt-send-email-mst@kernel.org>
 <YXapwC46W3Kzq5Qr@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YXapwC46W3Kzq5Qr@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 08:57:36PM +0800, Peter Xu wrote:
> On Fri, Oct 22, 2021 at 04:43:43AM -0400, Michael S. Tsirkin wrote:
> > On Fri, Oct 22, 2021 at 10:33:15AM +0800, Peter Xu wrote:
> > > Hi, Michael,
> > > 
> > > On Thu, Oct 21, 2021 at 06:54:59AM -0400, Michael S. Tsirkin wrote:
> > > > > +typedef struct {
> > > > > +    pci_bus_dev_fn fn;
> > > > > +    void *opaque;
> > > > > +} pci_bus_dev_args;
> > > > 
> > > > code style violation. CamelCase for structs pls.
> > > 
> > > OK.
> > > 
> > > > > +/* Call 'fn' for each pci device on the system */
> > > > > +void pci_for_each_device_all(pci_bus_dev_fn fn, void *opaque);
> > > > 
> > > > Instead of hacking pci making initialization o(N^2),
> > > 
> > > Why it's O(N^2)?  One vIOMMU walks O(N), and we only have one vIOMMU, or am I
> > > wrong?
> > 
> > What I meant is this is O(N) and if called M times will be O(N * M)
> > yes your patches only call once so O(N), still we can do better.
> 
> I see.
> 
> > 
> > > > can't we add a variant of object_resolve_path_type ?
> > > 
> > > Could you elaborate?  Here what we want to do is to make sure there're no
> > > specific PCI devices registered, and potentially it can be more than one type
> > > of device in the future.
> > > 
> > > Thanks,
> > 
> > All you seem to care about is checking there's no VFIO
> > (why - should really be documented in a code comment much more clearly).
> 
> Right, Alex asked the same question.  I'll make sure to mention that in the
> commit message in the next version.
> 
> > Looks like object_resolve_path_type does that with O(1) complexity.
> > If we need a variant that checks for multiple types we can add that.
> 
> It's still O(N), or am I wrong?  I mean for example there's the loop in
> object_resolve_partial_path().

Only if there's a hash collision.

> But yeah I can use that too if you prefer, it's just that when we want to
> detect more types of pci classes it could be slower iiuc, because we'll need to
> call object_resolve_path_type() once for each type.  For pci bus scan it's
> always one round because we only have at most one x86 vIOMMU for each guest.
> 
> At the meantime, IMHO patch 1-6 are cleanups that should be good even without
> patch 7/8. If we prefer object_resolve_path_type() I'd still think it would be
> good to propose patch 1-6 separately (with some patch properly squashed as
> suggested by reviewers)?
> 
> Thanks,

OK let's handle that separately.

> -- 
> Peter Xu


