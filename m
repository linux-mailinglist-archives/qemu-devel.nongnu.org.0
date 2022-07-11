Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87DA57072D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:35:36 +0200 (CEST)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvRf-00024U-Dq
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAvMX-00073s-1A
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAvMV-0001xZ-2l
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:30:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657553414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w76bk0fg9jbKWFKSFIfS3MdCk1xiwLgmLQhkkHGDGFo=;
 b=EZ2mCZoanZB7C3UAiCvWeSGqtw5BHJRoUaZOFycruJYWsEF2etFM1wrjnSaPLiCFWSxmr7
 muq2aj2HzlPukgrGNPBDlIRxTD50dGG3pGKYpuJaszkOtyhbvbZzDETgQwKGP8J6cg5t1N
 9xZVFcZdms0Asd81/NQkHQhO5z/6t94=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-2Sw7IVgeMQGjBP42-dW9Ow-1; Mon, 11 Jul 2022 11:30:13 -0400
X-MC-Unique: 2Sw7IVgeMQGjBP42-dW9Ow-1
Received: by mail-wm1-f70.google.com with SMTP id
 t25-20020a7bc3d9000000b003a2ea772bd2so337505wmj.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 08:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w76bk0fg9jbKWFKSFIfS3MdCk1xiwLgmLQhkkHGDGFo=;
 b=foCIEVcqcnuQq28TTPFfspBjKV1+NFXulZ8HK8F1fkO32ACnBl9mBQvWR+U4WCPLh6
 DdcqCmHFIvX1UrQ8PfKsy7WKueXXpkBESVnmFHd/KI2UETipSsQISWQiRK95mKnBccMx
 uP0iojiygLeIKSkc2swaju1KAmO5nIjXYIJrBUXHhqspuJk3fP1s2xy0ceH9e8JmZN5n
 aU2QQfGJ1vLCq4vgK9CQSnl+3Exttya5Evwvfblz9NEq58yUVbGyfBS8vFnxd3u9px/F
 /9RIl471dAgovv6/t6L5zDNJb+63lku1uL27mxtJzoHQDQDF5zrrxyXXWmouW4JBngqu
 jycg==
X-Gm-Message-State: AJIora/G/2qacylv72rfWX/8OslnN530537bTOWfvneFj1zmvO7IGlFd
 0T2YEVC/xPK3Snxq5TG22Vi0jDMyc0pzF8CS8A7wDe2KGgho5M56kVVSndgn/hz5pEo+ItBvg60
 T3BH7eoqX/dTHxt4=
X-Received: by 2002:a5d:6048:0:b0:21d:68e5:7cf0 with SMTP id
 j8-20020a5d6048000000b0021d68e57cf0mr17823719wrt.678.1657553411992; 
 Mon, 11 Jul 2022 08:30:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ue/uNRcPJ1MbvITWLjWviHX7CCbANzTFgNKg0vyDb9/zIwT3oOgiq9c7+KUCTKNNpq06E1ZQ==
X-Received: by 2002:a5d:6048:0:b0:21d:68e5:7cf0 with SMTP id
 j8-20020a5d6048000000b0021d68e57cf0mr17823691wrt.678.1657553411753; 
 Mon, 11 Jul 2022 08:30:11 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 s7-20020adfecc7000000b0021d7050ace4sm6013983wro.77.2022.07.11.08.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 08:30:11 -0700 (PDT)
Date: Mon, 11 Jul 2022 16:30:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Message-ID: <YsxCAYKDPd2JI89W@work-vm>
References: <20220707161656.41664-1-cohuck@redhat.com>
 <YswkdVeESqf5sknQ@work-vm>
 <CAFEAcA-e4Jvb-wV8sKc7etKrHYPGuOh=naozrcy2MCoiYeANDQ@mail.gmail.com>
 <YswzM/Q75rkkj/+Y@work-vm> <87r12r66kq.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r12r66kq.fsf@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Cornelia Huck (cohuck@redhat.com) wrote:
> On Mon, Jul 11 2022, "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> >> On Mon, 11 Jul 2022 at 14:24, Dr. David Alan Gilbert
> >> <dgilbert@redhat.com> wrote:
> >> > But, ignoring postcopy for a minute, with KVM how do different types of
> >> > backing memory work - e.g. if I back a region of guest memory with
> >> > /dev/shm/something or a hugepage equivalent, where does the MTE memory
> >> > come from, and how do you set it?
> >> 
> >> Generally in an MTE system anything that's "plain old RAM" is expected
> >> to support tags. (The architecture manual calls this "conventional
> >> memory". This isn't quite the same as "anything that looks RAM-like",
> >> e.g. the graphics card framebuffer doesn't have to support tags!)
> >
> > I guess things like non-volatile disks mapped as DAX are fun edge cases.
> >
> >> One plausible implementation is that the firmware and memory controller
> >> are in cahoots and arrange that the appropriate fraction of the DRAM is
> >> reserved for holding tags (and inaccessible as normal RAM even by the OS);
> >> but where the tags are stored is entirely impdef and an implementation
> >> could choose to put the tags in their own entirely separate storage if
> >> it liked. The only way to access the tag storage is via the instructions
> >> for getting and setting tags.
> >
> > Hmm OK;   In postcopy, at the moment, the call qemu uses is a call that
> > atomically places a page of data in memory and then tells the vCPUs to
> > continue.  I guess a variant that took an extra blob of MTE data would
> > do.
> 
> Yes, the current idea is to extend UFFDIO_COPY with a flag so that we
> get the tag data along with the page.
> 
> > Note that other VMMs built on kvm work in different ways; the other
> > common way is to write into the backing file (i.e. the /dev/shm
> > whatever atomically somehow) and then do the userfault call to tell the
> > vcpus to continue.  It looks like this is the way things will work in
> > the split hugepage mechanism Google are currently adding.
> 
> Hmm... I had the impression that other VMMs had not cared about this
> particular use case yet; if they need a slightly different mechanism,
> it would complicate things a bit.

I think Google's internal VMM doesn't use UFFDIO_COPY - but I don't have
details to be sure of that.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


