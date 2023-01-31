Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A6F6836D2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 20:50:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMwd3-0007ml-34; Tue, 31 Jan 2023 14:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMwcs-0007hs-MM
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMwcn-0005Si-Ba
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675194540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJgH6hOtrKMlTyTjM8AjYFG9Kac3D9sL9+Ke4JCUbug=;
 b=NKPQ7CbitH4MSxIZTMgZZW8C5/NfAIZl4e1N0qmV0za1av2ubg/xiqdfNGSxQAaLfxr/sx
 KiBVeMrYERr5pGuczU0j0t3Z0Xdwf4Xn8nju15H9TRken2HCn8u4xW9xfkmPSghPWYUpuc
 28ZKReZYN99JFyy4TK0liiqhWi9cYeA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-DCxMm4tHOwC3Uvn5wyWOSA-1; Tue, 31 Jan 2023 14:48:58 -0500
X-MC-Unique: DCxMm4tHOwC3Uvn5wyWOSA-1
Received: by mail-qt1-f198.google.com with SMTP id
 w25-20020ac86b19000000b003b692f65ca2so7230231qts.20
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 11:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJgH6hOtrKMlTyTjM8AjYFG9Kac3D9sL9+Ke4JCUbug=;
 b=21C/k4y0KWR+68v4Vt5Ofp3qcgUo1DzL4aGmlk2FHFO2+XHdqQ0WeVCWoHoeCZoJq0
 3dskKMHTZZuVkyAQXlHCdveKqYZaIht6GsGR+/00O27ESk3qwg+JUS3urC2SOfmGWkE/
 n6sjnrhRHi4AGU3e8PGBIm31jVMJOiHTD22l14rYLRgdPNH+OLJxgQ1DlW/sI5fB559b
 7d06+Wo0OK0fT7RVGMRfgrFs/OQkmeBWSKIvDtS1yyA60KbJssiWM5YrY6aIsgpLqBhv
 s+dSq3WjpV/8t5vgNi2vQIKoajWqTZYK2iR2T7QpQJkBF5IJ0od89VOsRfKibAqK83cC
 V35g==
X-Gm-Message-State: AO0yUKU164yQ+TeKbUL0e3A71Qsps48k3V1OHQVFUWC8SqU8SS7na9XY
 iuq3fFCFB4JsfHIql51F4nh3AT2npPTwHZARBM9xST6+y5LudOrs4eAEuEgBmNbqvMqpDTIYxRx
 8UeUeTj5fE03gGv8=
X-Received: by 2002:ac8:7ef0:0:b0:3b6:309e:dfe1 with SMTP id
 r16-20020ac87ef0000000b003b6309edfe1mr491057qtc.3.1675194537858; 
 Tue, 31 Jan 2023 11:48:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+wbNglmx1V3+crNhNb2meolHhraoGaK5zWYS7hCH6a0EXh5KKyAudeIeTsE1qsLLHUpIUd4w==
X-Received: by 2002:ac8:7ef0:0:b0:3b6:309e:dfe1 with SMTP id
 r16-20020ac87ef0000000b003b6309edfe1mr491034qtc.3.1675194537578; 
 Tue, 31 Jan 2023 11:48:57 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 dc6-20020a05620a520600b00706bc44fda8sm10559261qkb.79.2023.01.31.11.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 11:48:56 -0800 (PST)
Date: Tue, 31 Jan 2023 14:48:54 -0500
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9lwphMDs+Q3aVMr@x1n>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
 <Y9KK72k8dZU7Ccau@work-vm> <Y9KbUaMo8DaH0YKv@x1n>
 <Y9KjZeu9t37XyZ3q@redhat.com> <Y9K31a04dTChnaOV@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9K31a04dTChnaOV@x1n>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 12:26:45PM -0500, Peter Xu wrote:
> On Thu, Jan 26, 2023 at 03:59:33PM +0000, Daniel P. Berrangé wrote:
> > On Thu, Jan 26, 2023 at 10:25:05AM -0500, Peter Xu wrote:
> > > On Thu, Jan 26, 2023 at 02:15:11PM +0000, Dr. David Alan Gilbert wrote:
> > > > * Michal Prívozník (mprivozn@redhat.com) wrote:
> > > > > On 1/25/23 23:40, Peter Xu wrote:
> > > > > > The new /dev/userfaultfd handle is superior to the system call with a
> > > > > > better permission control and also works for a restricted seccomp
> > > > > > environment.
> > > > > > 
> > > > > > The new device was only introduced in v6.1 so we need a header update.
> > > > > > 
> > > > > > Please have a look, thanks.
> > > > > 
> > > > > I was wondering whether it would make sense/be possible for mgmt app
> > > > > (libvirt) to pass FD for /dev/userfaultfd instead of QEMU opening it
> > > > > itself. But looking into the code, libvirt would need to do that when
> > > > > spawning QEMU because that's when QEMU itself initializes internal state
> > > > > and queries userfaultfd caps.
> > > > 
> > > > You also have to be careful about what the userfaultfd semantics are; I
> > > > can't remember them - but if you open it in one process and pass it to
> > > > another process, which processes address space are you trying to
> > > > monitor?
> > > 
> > > Yes it's a problem.  The kernel always fetches the current mm_struct* which
> > > represents the current context of virtual address space when creating the
> > > uffd handle (for either the syscall or the ioctl() approach).
> > 
> > At what point does the process address space get associated ? When
> > the /dev/userfaultfd is opened, or only when ioctl(USERFAULTFD_IOC_NEW)
> > is called ?  If it is the former, then we have no choice, QEMU must open
> > it. if it is the latter, then libvirt can open /dev/userfaultfd, pass
> > it to QEMU which can then do the ioctl(USERFAULTFD_IOC_NEW).
> 
> Good point.. It should be the latter, so should be doable.
> 
> What should be the best interface for QEMU to detect the fd passing over to
> it?  IIUC qemu_open() requires the name to be /dev/fdset/*, but there's no
> existing cmdline that QEMU can know which fd number to fetch from fdset to
> be used as the /dev/userfaultfd descriptor.
> 
> monitor_get_fd() seems more proper, where we can define an unique string so
> Libvirt can preset the descriptor with the same string attached to it, then
> I can opt-in monitor_get_fd() before trying to open() or doing the syscall.

Daniel/Michal, any input here from Libvirt side?

I just noticed that monitor_get_fd() is bound to a specific monitor, then
it seems not clear which one is from Libvirt.  If to use qemu_open() and
add-fd I think we need another QEMU cmdline to set the fd path, iiuc.

I can also leave that for later if opening /dev/userfaultfd is already
resolving the immediate problem in containers.

Thanks,

-- 
Peter Xu


