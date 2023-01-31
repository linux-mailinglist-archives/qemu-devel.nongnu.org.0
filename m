Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A657683840
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 22:03:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMxlo-0007gS-H6; Tue, 31 Jan 2023 16:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMxll-0007g8-3M
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:02:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMxlh-0007r5-97
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675198936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvMfzXnWZtvybyQlN8GCqeHna+wrLPnfxh5Be76JQrM=;
 b=Ui0awV4RaqDDP+Gjrr83UH7SIndfJR0KhJ+AltYY9xtEf76f5GpLjYY9ZssuB8qLjmHKso
 kFv9pzFqn3epQXr5HxzaKl9yb3zLmXA36clQJjKt/lD2Bm3t5Lz8nA+l9Zhm5d/24Q/eio
 EoJ7KCoW7b1wMzpWnpnpeF5puKK2PFM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-mz99-n4TOfSV8Whfd-g4ig-1; Tue, 31 Jan 2023 16:02:14 -0500
X-MC-Unique: mz99-n4TOfSV8Whfd-g4ig-1
Received: by mail-qv1-f72.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso8959913qvr.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 13:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MvMfzXnWZtvybyQlN8GCqeHna+wrLPnfxh5Be76JQrM=;
 b=Fbt/AsH46XLmSty3id2z28joFgLRpfvJN1A4z1fZzjDUYg5lZxQDz3OY5eHCLlZQfC
 W73raSOoAJYctrswqzmIKjBGd07VrA7hKQA/JMFMFbuA+GT7dOlhREvT+v3rC49iyB1R
 CmfEY6scIlOEGO9WwU6bHGA82PJZrtkPxTgIQbe4GXmMRG0XZ/G7YC/r5qApChAkCw32
 lZmmlYSFE6MLJT+TqND+5jLnuvf4KCtCTRfMwDB32ifkpCG0kEuAwTjCsgDL/GAbtZr7
 KufE14awRzEM/WUnW8z+e7dGVkfmIWz+pBx4SJGENAwIJRFzEt26A9dvbq2lReDC7A2P
 3sQw==
X-Gm-Message-State: AO0yUKXlWKi347VUWpsI1w0iIBInzEk0PWnokAfdj4amI254gXzaay5E
 A6V3mxsa0dLliDlVb2dkZ7OIP+ex4yWqjtZqSHeUNzUQx/QjBNaxJzPEaQb1c5v1/csgTG1yDoQ
 lMVf5tjK02jMF9Gw=
X-Received: by 2002:a05:622a:17c4:b0:3b8:5199:f841 with SMTP id
 u4-20020a05622a17c400b003b85199f841mr410974qtk.0.1675198933318; 
 Tue, 31 Jan 2023 13:02:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+VyHugMyRbPprLWG7N24Qi5xKaggSvhitrTNg/QgLbVx+NBUQK6cLAmaxkv27U3tUkA3ZlFA==
X-Received: by 2002:a05:622a:17c4:b0:3b8:5199:f841 with SMTP id
 u4-20020a05622a17c400b003b85199f841mr410954qtk.0.1675198933012; 
 Tue, 31 Jan 2023 13:02:13 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 m186-20020a37bcc3000000b007068b49b8absm10748769qkf.62.2023.01.31.13.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 13:02:12 -0800 (PST)
Date: Tue, 31 Jan 2023 16:01:58 -0500
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9mBxpYBv+h8Y0TT@x1n>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
 <Y9KK72k8dZU7Ccau@work-vm> <Y9KbUaMo8DaH0YKv@x1n>
 <Y9KjZeu9t37XyZ3q@redhat.com> <Y9K31a04dTChnaOV@x1n>
 <Y9lwphMDs+Q3aVMr@x1n> <Y9l0328Sp3HJ948a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9l0328Sp3HJ948a@redhat.com>
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

On Tue, Jan 31, 2023 at 08:06:55PM +0000, Daniel P. Berrangé wrote:
> On Tue, Jan 31, 2023 at 02:48:54PM -0500, Peter Xu wrote:
> > On Thu, Jan 26, 2023 at 12:26:45PM -0500, Peter Xu wrote:
> > > On Thu, Jan 26, 2023 at 03:59:33PM +0000, Daniel P. Berrangé wrote:
> > > > On Thu, Jan 26, 2023 at 10:25:05AM -0500, Peter Xu wrote:
> > > > > On Thu, Jan 26, 2023 at 02:15:11PM +0000, Dr. David Alan Gilbert wrote:
> > > > > > * Michal Prívozník (mprivozn@redhat.com) wrote:
> > > > > > > On 1/25/23 23:40, Peter Xu wrote:
> > > > > > > > The new /dev/userfaultfd handle is superior to the system call with a
> > > > > > > > better permission control and also works for a restricted seccomp
> > > > > > > > environment.
> > > > > > > > 
> > > > > > > > The new device was only introduced in v6.1 so we need a header update.
> > > > > > > > 
> > > > > > > > Please have a look, thanks.
> > > > > > > 
> > > > > > > I was wondering whether it would make sense/be possible for mgmt app
> > > > > > > (libvirt) to pass FD for /dev/userfaultfd instead of QEMU opening it
> > > > > > > itself. But looking into the code, libvirt would need to do that when
> > > > > > > spawning QEMU because that's when QEMU itself initializes internal state
> > > > > > > and queries userfaultfd caps.
> > > > > > 
> > > > > > You also have to be careful about what the userfaultfd semantics are; I
> > > > > > can't remember them - but if you open it in one process and pass it to
> > > > > > another process, which processes address space are you trying to
> > > > > > monitor?
> > > > > 
> > > > > Yes it's a problem.  The kernel always fetches the current mm_struct* which
> > > > > represents the current context of virtual address space when creating the
> > > > > uffd handle (for either the syscall or the ioctl() approach).
> > > > 
> > > > At what point does the process address space get associated ? When
> > > > the /dev/userfaultfd is opened, or only when ioctl(USERFAULTFD_IOC_NEW)
> > > > is called ?  If it is the former, then we have no choice, QEMU must open
> > > > it. if it is the latter, then libvirt can open /dev/userfaultfd, pass
> > > > it to QEMU which can then do the ioctl(USERFAULTFD_IOC_NEW).
> > > 
> > > Good point.. It should be the latter, so should be doable.
> > > 
> > > What should be the best interface for QEMU to detect the fd passing over to
> > > it?  IIUC qemu_open() requires the name to be /dev/fdset/*, but there's no
> > > existing cmdline that QEMU can know which fd number to fetch from fdset to
> > > be used as the /dev/userfaultfd descriptor.
> > > 
> > > monitor_get_fd() seems more proper, where we can define an unique string so
> > > Libvirt can preset the descriptor with the same string attached to it, then
> > > I can opt-in monitor_get_fd() before trying to open() or doing the syscall.
> > 
> > Daniel/Michal, any input here from Libvirt side?
> > 
> > I just noticed that monitor_get_fd() is bound to a specific monitor, then
> > it seems not clear which one is from Libvirt.  If to use qemu_open() and
> > add-fd I think we need another QEMU cmdline to set the fd path, iiuc.
> > 
> > I can also leave that for later if opening /dev/userfaultfd is already
> > resolving the immediate problem in containers.
> 
> I don't have any great ideas really. If we assume the /dev/userfaultfd
> is accessible to QEMU we can ignore it.

It's my understanding that QEMU process will be invoked by the user or
group that has access to /dev/userfaultfd, probably in the same context as
what Libvirt specified. So hopefully everything will work out naturally
already.

There's one thing I'm unsure on introducing a new qemu cmdline option - I
can't remember where I get this memory, but - IIRC Paolo suggested at some
point to reduce or forbid introducing new options to QEMU.

To remedy that, we can also add a migration parameter which will point to
/dev/userfaultfd (which can be set to "/dev/fdsets/N" by Libvirt in QMP in
QEMU's early stage), considering that so far most of the uffd features are
used by migration submodule, IMHO it's fine to do so.

Said that, I think we can always work on top of this series if that'll be
useful to libvirt some day; the change should be trivial.  So I can keep
this series simple.

I'll wait 1-2 more days to see whether Michal has anything to comment.

Thanks,

-- 
Peter Xu


