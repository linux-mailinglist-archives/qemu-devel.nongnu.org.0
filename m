Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40655F645B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 12:31:12 +0200 (CEST)
Received: from localhost ([::1]:53436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogO9n-00070K-60
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 06:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.leiming@gmail.com>)
 id 1ogO5F-0003Rp-Pf
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:26:29 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.leiming@gmail.com>)
 id 1ogO5E-0006DQ-5l
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:26:29 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 204so1629023pfx.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=Dpy86RHsOIyY8RatM+wRIJiLlfwuHhPTmUB4qFPEGJk=;
 b=QyTJYnqNYvFxy+QOXNMXGWq5rkSrku5U4cGVmTMYztO94pjdDCtcniWrbsv3zVsVnA
 U7aPHSBXaSm+bS1jXS17QYABexfxn2vfK6RYxYy4DlugO+n6Sto76TArIGr5raIDr5aI
 PGMh+BveQvkSa6wGOrM8LU18VEdZcWWoWsdS3IozhgVpMe+5fHCSH6aWe2m033385AEZ
 VaraQ8XtmkD9max5LVhLT/zvqySD97JfN/9/yMQGCge26Qd4Eg3zsjrgvyS+GMaxzqSF
 a0WUx8Se//2ZG0xaHKWeNLhloxMVOCbe1KbvVRaMscJR0HIfkskOLXVihXPkdqUpbh0b
 6h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Dpy86RHsOIyY8RatM+wRIJiLlfwuHhPTmUB4qFPEGJk=;
 b=48iHQe1KvNbAdowD87yuw06k+x5S4KZfep3G4mJd78r7i6yO8Ocsj/tizj+HlaHX6P
 iO3qyeJt6rz0wXMucMgJxMda2t4fWzbUAACI+ZQl9f7C3fhPkgKzDWWga2IqQF5VrBxr
 I6IabKaJzRoJTuFRQZppxvXM6mqy3/FmrsHvAD8P4z+MzXfPSq2x0/0S6331HOrhId6k
 wXC3N8qlF23HimaDEReIxVgw0x1mR7ab7OQKCDuj5nsc/XnF9gS2Rvx2WHGE2pM5ULY5
 Hg6Ur92jhIIux4XaIixxc8MrV8vA1GbWfgIOePQxbLjNfOUUA2MwfdSyrme6wJLEXR7k
 4PLQ==
X-Gm-Message-State: ACrzQf3NUu0UdRaTg4LyocJrwWIhpCruIeWmgurbs35Ki47en3Jll/po
 bVk6+mUtVmfiCcielErhikk=
X-Google-Smtp-Source: AMsMyM60r7beaY8MBsKwg8FNKuPP0I9lUDdCdQls0RgHH1ZQtjQ3dyWhKvC9ux903RHdbZjhwBjDDQ==
X-Received: by 2002:a63:20f:0:b0:43c:1ef6:ebd6 with SMTP id
 15-20020a63020f000000b0043c1ef6ebd6mr3906197pgc.217.1665051986555; 
 Thu, 06 Oct 2022 03:26:26 -0700 (PDT)
Received: from T590 ([209.132.188.80]) by smtp.gmail.com with ESMTPSA id
 i13-20020a170902cf0d00b001784a45511asm11977254plg.79.2022.10.06.03.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 03:26:25 -0700 (PDT)
Date: Thu, 6 Oct 2022 18:26:15 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Denis V. Lunev" <den@virtuozzo.com>, io-uring@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kirill Tkhai <kirill.tkhai@openvz.org>,
 Manuel Bentele <development@manuel-bentele.de>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 rjones@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Josef Bacik <josef@toxicpanda.com>
Subject: Re: ublk-qcow2: ublk-qcow2 is available
Message-ID: <Yz6tR24T8HPHJ70D@T590>
References: <Yza1u1KfKa7ycQm0@T590> <Yzs9xQlVuW41TuNC@fedora>
 <6659a0d5-60ab-9ac7-d25d-b4ff1940c6ab@virtuozzo.com>
 <Yz2epPwoufj0mug/@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yz2epPwoufj0mug/@fedora>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=tom.leiming@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 05, 2022 at 11:11:32AM -0400, Stefan Hajnoczi wrote:
> On Tue, Oct 04, 2022 at 01:57:50AM +0200, Denis V. Lunev wrote:
> > On 10/3/22 21:53, Stefan Hajnoczi wrote:
> > > On Fri, Sep 30, 2022 at 05:24:11PM +0800, Ming Lei wrote:
> > > > ublk-qcow2 is available now.
> > > Cool, thanks for sharing!
> > yep
> > 
> > > > So far it provides basic read/write function, and compression and snapshot
> > > > aren't supported yet. The target/backend implementation is completely
> > > > based on io_uring, and share the same io_uring with ublk IO command
> > > > handler, just like what ublk-loop does.
> > > > 
> > > > Follows the main motivations of ublk-qcow2:
> > > > 
> > > > - building one complicated target from scratch helps libublksrv APIs/functions
> > > >    become mature/stable more quickly, since qcow2 is complicated and needs more
> > > >    requirement from libublksrv compared with other simple ones(loop, null)
> > > > 
> > > > - there are several attempts of implementing qcow2 driver in kernel, such as
> > > >    ``qloop`` [2], ``dm-qcow2`` [3] and ``in kernel qcow2(ro)`` [4], so ublk-qcow2
> > > >    might useful be for covering requirement in this field
> > There is one important thing to keep in mind about all partly-userspace
> > implementations though:
> > * any single allocation happened in the context of the
> >    userspace daemon through try_to_free_pages() in
> >    kernel has a possibility to trigger the operation,
> >    which will require userspace daemon action, which
> >    is inside the kernel now.
> > * the probability of this is higher in the overcommitted
> >    environment
> > 
> > This was the main motivation of us in favor for the in-kernel
> > implementation.
> 
> CCed Josef Bacik because the Linux NBD driver has dealt with memory
> reclaim hangs in the past.
> 
> Josef: Any thoughts on userspace block drivers (whether NBD or ublk) and
> how to avoid hangs in memory reclaim?

If I remember correctly, there isn't new report after the last NBD(TCMU) deadlock
in memory reclaim was addressed by 8d19f1c8e193 ("prctl: PR_{G,S}ET_IO_FLUSHER
to support controlling memory reclaim").


Thanks, 
Ming

