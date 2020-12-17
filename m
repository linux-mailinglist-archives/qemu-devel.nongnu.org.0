Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189EA2DD9DC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:26:01 +0100 (CET)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzqa-0000uX-5F
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpzou-0008EJ-TJ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:24:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpzos-0005eH-0K
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608236652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pSPqKNzOR9onvN1ZL4QaQY6IqlP1P6G4mAHezVMDe8w=;
 b=Qs/Rm33BxGjFUQaAZnyu/AlcNb0FYAGcuVpGiSbEzXuUK3koq+Sde8eDFclGgYbJysUEiv
 NmU6yTIv4DFTDiMYvfaTsPTdn9dK/J0VwrPmJ2IbiF1NW8ZGuLSm51BMTauoPqiLTHASaE
 beI4qC0aw8caztl1A+Rp4cqdDjLzha8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-aB4vknfFNJyx_OflH05HtQ-1; Thu, 17 Dec 2020 15:24:08 -0500
X-MC-Unique: aB4vknfFNJyx_OflH05HtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 581EC6D525;
 Thu, 17 Dec 2020 20:24:07 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6293360BE5;
 Thu, 17 Dec 2020 20:24:06 +0000 (UTC)
Date: Thu, 17 Dec 2020 20:24:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Diego Viola <diego.viola@gmail.com>, kraxel@redhat.com
Subject: Re: Slow video output from webcam with qemu-xhci but smooth with
 usb-ehci
Message-ID: <20201217202403.GB43032@work-vm>
References: <CA+ToGPHan_XHjy+=3vzefnJ9+EBHkL+BBR2FgM_v-XWcqVkgQw@mail.gmail.com>
 <CA+ToGPFoARJQ80DcGnNqtH3KHcyN7OXiFYtkBEVr7wa=bJV4zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+ToGPFoARJQ80DcGnNqtH3KHcyN7OXiFYtkBEVr7wa=bJV4zw@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Diego Viola (diego.viola@gmail.com) wrote:
> On Sat, Dec 12, 2020 at 1:28 PM Diego Viola <diego.viola@gmail.com> wrote:
> >
> > Hi,
> >
> > I'm experiencing a lot of choppiness in the video output when I pass
> > through my USB webcam to the guest using qemu-xhci as follows:
> >
> > qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -vga virtio
> > -device qemu-xhci,id=xhci -device
> > usb-host,bus=xhci.0,hostdevice=/dev/bus/usb/002/004
> >
> > My webcam is:
> >
> > Bus 002 Device 004: ID 04f2:b449 Chicony Electronics Co., Ltd Integrated Camera
> >
> > I am using mpv /dev/video0 from the guest.
> >
> > It works fine if I use usb-ehci instead, e.g.:
> >
> > qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -vga virtio
> > -device usb-ehci,id=ehci -device
> > usb-host,bus=ehci.0,hostdevice=/dev/bus/usb/002/004
> >
> > In this case, the video output from mpv /dev/video0 is not choppy.
> >
> > My QEMU version is 5.2.0 -- I am running Arch Linux on the host and guest.
> >
> > Any ideas please?
> >
> > Thanks,
> > Diego
> 
> OK, I just noticed that it's mostly at the beginning (when I first run
> mpv) that the video is jerky/choppy, looks like mpv is still buffering
> at that stage, after buffering gets to 99% the video is smoother (with
> xhci).
> 
> Now I don't understand why buffering with ehci happens a lot faster/smoother.

I don't understand it either; but cc'ing in Gerd for his USB wisdom.

Dave

> Nevermind, not an issue after all.
> 
> Diego
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


