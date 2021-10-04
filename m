Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83190421820
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:04:25 +0200 (CEST)
Received: from localhost ([::1]:55080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXUCG-0000J1-9X
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXU7l-0007RQ-5G
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:59:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXU7X-0003hj-Lv
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633377570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TcfXAeP6ULCurqc6PLbGNxFL8tf6LLthKHoPN/xN+F0=;
 b=YjgYbHK8N3MhoYF2d5qFPOqpl6A5wGNLwbpP4Js7y/o2bl8mILofWowIAHpFYbdef9XaqV
 /a6RsJ3+4XShzxvvez+hpgofL+MpfgwqdCENYOGFfMqHIIwcyEDaQttDbwQ8pXxu48LlaP
 OQBmxX1DDMyJB99tNd9o9nmyGe1aark=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ie5gCFAGPJOz6yqJF1H2Hw-1; Mon, 04 Oct 2021 15:59:29 -0400
X-MC-Unique: ie5gCFAGPJOz6yqJF1H2Hw-1
Received: by mail-ed1-f71.google.com with SMTP id
 k10-20020a508aca000000b003dad77857f7so2409877edk.22
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 12:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TcfXAeP6ULCurqc6PLbGNxFL8tf6LLthKHoPN/xN+F0=;
 b=iubKSPkPPQeezvEniSof2qTWAbgHTPIvS4RmcCtgWDrYAZYmK9YI6B0+9MR9Wkgyo7
 DBHf40wxAkuSYwuPXLx+50BRMWhO3rkkehL4nTu55AyRlakjF6WiD/8SzvNPm0urvpOB
 EOUfLsjyoifaQBVsFHiIlaKz4aWk+2i0zjkNY4pAT+AcQuCnN3/NmnMi+Z3SOOQ9i08q
 b9YlhpAsCY35pxnm6Jw0Z7356AeHhxZ2V75bu99T8KjGNJDyNydaq4FZ5fPDiOOVN/gr
 a9lLfPJMrDuIygyQO69sf7NlEGYAB1rmWYV0zQABWTRay1dg/bHdY9U/tLC/uaRi9OP+
 QgYg==
X-Gm-Message-State: AOAM532oeNcYa/WTQaUYSvLXYpKw3LqGXUgiTMf0MmgUOw32tH3j0IV0
 PGSb7+7yKH67ucYkFdKgU33g1kYfCyDDwM+6mby5lFgPg2uBCNMYNmiIUv/TONsPIVX9bQMp35e
 RPvMUAyU5FusVMY4=
X-Received: by 2002:a50:c006:: with SMTP id r6mr20906068edb.289.1633377567038; 
 Mon, 04 Oct 2021 12:59:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyos1G1DctCUL/f52gbZ+28lJ201gIbwpfNpPahL2j60Qls7wOrBhN669s0Y2mkIA/vsJnmVg==
X-Received: by 2002:a50:c006:: with SMTP id r6mr20906044edb.289.1633377566783; 
 Mon, 04 Oct 2021 12:59:26 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id b2sm7746221edv.73.2021.10.04.12.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 12:59:26 -0700 (PDT)
Date: Mon, 4 Oct 2021 15:59:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: virtio 4M limit
Message-ID: <20211004155652-mutt-send-email-mst@kernel.org>
References: <2311207.AWRhmksWK6@silver> <9125826.uuVAOS58fx@silver>
 <20211003162341-mutt-send-email-mst@kernel.org>
 <25522755.cqRP6gS9TD@silver>
MIME-Version: 1.0
In-Reply-To: <25522755.cqRP6gS9TD@silver>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 12:44:21PM +0200, Christian Schoenebeck wrote:
> On Sonntag, 3. Oktober 2021 22:27:03 CEST Michael S. Tsirkin wrote:
> > On Sun, Oct 03, 2021 at 08:14:55PM +0200, Christian Schoenebeck wrote:
> > > On Freitag, 1. Oktober 2021 13:21:23 CEST Christian Schoenebeck wrote:
> > > > Hi Michael,
> > > > 
> > > > while testing the following kernel patches I realized there is currently
> > > > a
> > > > size limitation of 4 MB with virtio on QEMU side:
> > > > https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss@crudebyte.
> > > > com/
> > > > 
> > > > So with those kernel patches applied I can mount 9pfs on Linux guest
> > > > with
> > > > the 9p 'msize' (maximum message size) option with a value of up to
> > > > 4186112
> > > > successfully. If I try to go higher with 'msize' then the system would
> > > > hang
> > > > 
> > > > with the following QEMU error:
> > > >   qemu-system-x86_64: virtio: too many write descriptors in indirect
> > > >   table
> > > > 
> > > > Which apparently is due to the amount of scatter gather lists on QEMU
> > > > virtio side currently being hard coded to 1024 (i.e. multiplied by 4k
> > > > page size =>> > 
> > > > 4 MB):
> > > >   ./include/hw/virtio/virtio.h:
> > > >   #define VIRTQUEUE_MAX_SIZE 1024
> > > > 
> > > > Is that hard coded limit carved into stone for some reason or would it
> > > > be OK if I change that into a runtime variable?
> > > 
> > > After reviewing the code and protocol specs, it seems that this value is
> > > simply too small. I will therefore send a patch suggsting to raise this
> > > value to 32768, as this is the maximum possible value according to the
> > > virtio specs.
> > > 
> > > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#
> > > x1-240006
> > I think it's too aggressive to change it for all devices.
> > Pls find a way to only have it affect 9pfs.
> 
> So basically I should rather introduce a variable that would be used at most 
> places instead of using the macro VIRTQUEUE_MAX_SIZE?

I guess so.

> > > > If that would be Ok, maybe something similar that I did with those
> > > > kernel
> > > > patches, i.e. retaining 1024 as an initial default value and if
> > > > indicated
> > > > from guest side that more is needed, increasing the SG list amount
> > > > subsequently according to whatever is needed by guest?
> > > 
> > > Further changes are probably not necessary.
> > > 
> > > The only thing I have spotted that probably should be changed is that at
> > > some few locations, a local array is allocated on the stack with
> > > VIRTQUEUE_MAX_SIZE as array size, e.g.:
> > > 
> > > static void *virtqueue_split_pop(VirtQueue *vq, size_t sz)
> > > {
> > > 
> > >     ...
> > >     hwaddr addr[VIRTQUEUE_MAX_SIZE];
> > >     struct iovec iov[VIRTQUEUE_MAX_SIZE];
> > >     ...
> > > 
> > > }
> 
> What about these allocations on the stack? Is it Ok to disregard this as 
> theoretical issue for now and just retain them on the stack, just with the 
> runtime variable instead of macro as array size?

I think it's not a big deal ... why do you think it is? Are we running
out of stack?

> > > 
> > > > And as I am not too familiar with the virtio protocol, is that current
> > > > limit already visible to guest side? Because obviously it would make
> > > > sense if I change my kernel patches so that they automatically limit to
> > > > whatever QEMU supports instead of causing a hang.
> > > 
> > > Apparently the value of VIRTQUEUE_MAX_SIZE (the maximum amount of scatter
> > > gather lists or the maximum queue size ever possible) is not visible to
> > > guest.
> > > 
> > > I thought about making a hack to make the guest Linux kernel aware whether
> > > host side has the old limit of 1024 or rather the correct value 32768, but
> > > probably not worth it.
> > > 
> > > Best regards,
> > > Christian Schoenebeck
> 


