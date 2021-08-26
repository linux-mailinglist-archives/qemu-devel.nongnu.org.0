Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC313F894E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:46:25 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFi4-0006xG-8B
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJFfu-0004QM-H4
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:44:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJFfq-0006l0-JM
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629985444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYLttMuDWROOgZcugJTIvWsNsq9Zj4/lHABveL0mUTY=;
 b=P+5y/WG69WH0TRiSerRc/qd/gkm27U8yfLh6cPC3p9j7J/h0/VX4PflBPCsup/N5pnmwaT
 gnex0mt9ThnIcGcpKAzFfZNJCXTzue3rvab2mEnOPmsZvSJPiUPOk13JrU8jUxFIMBzaY2
 lcS14T0Z5vXlAY/4Y/TaxCtxGveGftw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-CT0C4KQxPzyq_Q6C96UrKA-1; Thu, 26 Aug 2021 09:44:03 -0400
X-MC-Unique: CT0C4KQxPzyq_Q6C96UrKA-1
Received: by mail-qt1-f200.google.com with SMTP id
 l22-20020a05622a175600b0029d63a970f6so81644qtk.23
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jYLttMuDWROOgZcugJTIvWsNsq9Zj4/lHABveL0mUTY=;
 b=m6gk3uj8fpr5wF3lRq2hKAIcRKSzwjdnNzxNBHbG8if+BgUWtcKsZLFu5Org1tOJNo
 h/YUMbh54KMfRI7530vhp7hx0XdNU/toLjztQLtKrI/ckEHhBC6MjAwKszWRLAKAwldY
 Ej4v5zh4uod3gyMd/Jgjgnom6lY8s5uV2E7JYsrF0byZpTH6aOb2TERaWH/YSDs8GEB3
 FIS0SK3wVbTaprtIdThQ4Wy4eI/jpMS7bV/2z2ehFCW/zAijO3VzoXNYQmVBsuw688+x
 r4dPD++1fId5xN7EgrVoEsHyGfxMoz6kwY+KOuP+td6O8UDo5FG2DZeeoML4G+iFTqJj
 MFLQ==
X-Gm-Message-State: AOAM5320M9dTinC1/6KcxdiMUEgGn8Ty0+uFW++ZDvJjWFwNpAjYhIMq
 iTVWmVyeOnVJ9J3kFmVhszgtaUaiP+b0DUBgajs9U2kkoYDE33wiR0D5e3n8XLv2D1poKcyaFQP
 UPUq5HSE6+DAhaFo=
X-Received: by 2002:ac8:5fc5:: with SMTP id k5mr3306449qta.108.1629985442506; 
 Thu, 26 Aug 2021 06:44:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0X5AKWQS7vMaPgoMxWii9LRgnFQ+7YBZHcyYOEbj+SxGk4HiZOT+FlU1R92y3vNKleCTH5w==
X-Received: by 2002:ac8:5fc5:: with SMTP id k5mr3306423qta.108.1629985442123; 
 Thu, 26 Aug 2021 06:44:02 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id e22sm1724247qte.57.2021.08.26.06.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:44:01 -0700 (PDT)
Date: Thu, 26 Aug 2021 09:43:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YSean3PIkslbTHeU@t490s>
References: <20210823210703.cikdkhvyeqqypaqa@habkost.net>
 <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net>
 <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826133629.2ddd3b88@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 01:36:29PM +0200, Igor Mammedov wrote:
> On Thu, 26 Aug 2021 10:01:01 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
> 
> > Peter Xu <peterx@redhat.com> writes:
> > 
> > > On Wed, Aug 25, 2021 at 05:50:23PM -0400, Peter Xu wrote:  
> > >> On Wed, Aug 25, 2021 at 02:28:55PM +0200, Markus Armbruster wrote:  
> > >> > Having thought about this a bit more...
> ...
> > > Any further thoughts will be greatly welcomed.  
> > 
> > I'd like to propose a more modest solution: detect the problem and fail.
> That's or proper dependency tracking (which stands chance to work with QMP,
> but like it was said it's complex)
> 
> > A simple state machine can track "has IOMMU" state.  It has three states
> > "no so far", "yes", and "no", and two events "add IOMMU" and "add device
> > that needs to know".  State diagram:
> > 
> >                           no so far
> >                    +--- (start state) ---+
> >                    |                     |
> >          add IOMMU |                     | add device that
> >                    |                     |  needs to know
> >                    v                     v
> >              +--> yes                    no <--+
> >              |     |   add device that   |     |
> >              +-----+    needs to know    +-----+
> > 
> > "Add IOMMU" in state "no" is an error.
> 
> question is how we distinguish "device that needs to know"
> from device that doesn't need to know, and then recently
> added feature 'bypass IOMMU' adds more fun to this.

Maybe we can start from "no device needs to know"? Then add more into it when
the list expands.

vfio-pci should be a natural fit because we're sure it won't break any valid
old configurations.  However we may need to be careful on adding more devices,
e.g. when some old configuration might work on old binaries, but I'm not sure.

Off-topic: I'm wondering whether bypass_iommu is just a work-around of not
using iommu=pt in the guest cmdlines?  Is there any performance comparison of
using bypass_iommu against having iommu but with iommu=pt?  At least intel
iommu has pt enabled explicitly, i.e. it shouldn't even need a shadow iommu
pgtable in the guest but only a single bit in device context entry showing that
"this device wants to pass-through iommu", so I would expect the perf can be
similar to explicitly bypass iommu in the qemu cmdline.

Thanks,

-- 
Peter Xu


