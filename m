Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD28F2C0EAB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:20:06 +0100 (CET)
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDdN-0007Bw-Q3
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1khDbX-0005SI-1y
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:18:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1khDbV-0005yy-4m
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606144687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gjysr2TGm2BHd6PEXB4bmvN9WC4d9mZ2jNM8y3Hhwb0=;
 b=Xah1o01dFT+wqRq3ggLLKE+OwXADT0/eqBLfkcnn6ExinElPaKu2efEQTYtZiNb06tFAsk
 aB0onpYk7nNCtK14qYitHEauzlIcq4eAheWQNRiBdPcFXRIrgRsPZzwaIGNMfIHxGosNQm
 EjIwmdjALgdlrnLoa7Y+jYMD1+vb90g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-6uhCZYMEM_yEQC_w3CywFw-1; Mon, 23 Nov 2020 10:18:05 -0500
X-MC-Unique: 6uhCZYMEM_yEQC_w3CywFw-1
Received: by mail-wr1-f72.google.com with SMTP id l5so5980112wrn.18
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 07:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gjysr2TGm2BHd6PEXB4bmvN9WC4d9mZ2jNM8y3Hhwb0=;
 b=n7VAdMeljT1o2Eh64Jrkcb7xCNfYvt3GNDtKmkUAEV7JxtmkTTpYRPtpF8DId7stu1
 QHTdu/sLiLm146PDdj4rvBJUzE6cE4J5urPjkG01kkBG/oqEqlT8nHwSi5NTFcyeJ71S
 FWbkMUaS45NhS6uQMlep/n0MWEOX5bGsDJfF90ECIMnXTJhSJE2+kSAuaRKlBKt9+uKy
 aXTHQ5iNwmb8tGNsgfAoJvRf7TvrFDei2r35wBYDvWJFT1i2ILAkGIe/uLWozJDe/+AS
 OnMppeij3pYDmENu0MgUspcFjdmVh9AQdsgzCIqouXA60ypMdxvQCJnUpS4KEb9dlrUA
 W5gw==
X-Gm-Message-State: AOAM530fVgnxUSb9VdKFGrftYEztgNTY7iPf0eyI4xCQwiCKHAZgcpPU
 jVzmk4RKlXOB1nZjsHt5C7on9zeXacSLdG1dIqW5kjs3KdLEatOhzM7jYCpMaAWYtWjzyPzTFWW
 lC986z1YIaiUt0Cg=
X-Received: by 2002:adf:e84e:: with SMTP id d14mr145431wrn.190.1606144683208; 
 Mon, 23 Nov 2020 07:18:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2R4lL1Mq2Y1aVC5dDdaeyjFkJP6dOyeHTSlEN3C3ieAvijxPn9ns3PNbleWjgoJ6rtHRlSg==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr145403wrn.190.1606144682981; 
 Mon, 23 Nov 2020 07:18:02 -0800 (PST)
Received: from steredhat (host-79-17-248-175.retail.telecomitalia.it.
 [79.17.248.175])
 by smtp.gmail.com with ESMTPSA id n4sm15266610wmc.30.2020.11.23.07.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 07:18:02 -0800 (PST)
Date: Mon, 23 Nov 2020 16:17:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
Message-ID: <20201123151758.5bik46pu4aqrtmd5@steredhat>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
 <20201118113117.GF182763@stefanha-x1.localdomain>
 <20201119094315-mutt-send-email-mst@kernel.org>
 <ceebdc90-3ffc-1563-ff85-12a848bcba18@oracle.com>
 <CAJSP0QUvSwX5NCPmfSODV_C+D41E21LZT=oXQ2PLc6baAsGGDQ@mail.gmail.com>
 <ffd88f0c-981e-a102-4b08-f29d6b9a0f71@oracle.com>
 <CAJSP0QUfqd=QNFa-RikH4dVcLmfcP-pYCwznP3W0zobYkM+KDw@mail.gmail.com>
 <CAJSP0QVu4P6c+kdFkhw1S_OEaj7B-eiDqFOVDxWAaSOcsAADrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QVu4P6c+kdFkhw1S_OEaj7B-eiDqFOVDxWAaSOcsAADrA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam <fam@euphon.net>, linux-scsi <linux-scsi@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 target-devel <target-devel@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mike Christie <michael.christie@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 08:45:49AM +0000, Stefan Hajnoczi wrote:
>On Thu, Nov 19, 2020 at 5:08 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> On Thu, Nov 19, 2020 at 4:43 PM Mike Christie
>> <michael.christie@oracle.com> wrote:
>> >
>> > On 11/19/20 10:24 AM, Stefan Hajnoczi wrote:
>> > > On Thu, Nov 19, 2020 at 4:13 PM Mike Christie
>> > > <michael.christie@oracle.com> wrote:
>> > >>
>> > >> On 11/19/20 8:46 AM, Michael S. Tsirkin wrote:
>> > >>> On Wed, Nov 18, 2020 at 11:31:17AM +0000, Stefan Hajnoczi wrote:
>> > > struct vhost_run_worker_info {
>> > >      struct timespec *timeout;
>> > >      sigset_t *sigmask;
>> > >
>> > >      /* List of virtqueues to process */
>> > >      unsigned nvqs;
>> > >      unsigned vqs[];
>> > > };
>> > >
>> > > /* This blocks until the timeout is reached, a signal is received, or
>> > > the vhost device is destroyed */
>> > > int ret = ioctl(vhost_fd, VHOST_RUN_WORKER, &info);
>> > >
>> > > As you can see, userspace isn't involved with dealing with the
>> > > requests. It just acts as a thread donor to the vhost driver.
>> > >
>> > > We would want the VHOST_RUN_WORKER calls to be infrequent to avoid the
>> > > penalty of switching into the kernel, copying in the arguments, etc.
>> >
>> > I didn't get this part. Why have the timeout? When the timeout expires,
>> > does userspace just call right back down to the kernel or does it do
>> > some sort of processing/operation?
>> >
>> > You could have your worker function run from that ioctl wait for a
>> > signal or a wake up call from the vhost_work/poll functions.
>>
>> An optional timeout argument is common in blocking interfaces like
>> poll(2), recvmmsg(2), etc.
>>
>> Although something can send a signal to the thread instead,
>> implementing that in an application is more awkward than passing a
>> struct timespec.
>>
>> Compared to other blocking calls we don't expect
>> ioctl(VHOST_RUN_WORKER) to return soon, so maybe the timeout will
>> rarely be used and can be dropped from the interface.
>>
>> BTW the code I posted wasn't a carefully thought out proposal :). The
>> details still need to be considered and I'm going to be offline for
>> the next week so maybe someone else can think it through in the
>> meantime.
>
>One final thought before I'm offline for a week. If
>ioctl(VHOST_RUN_WORKER) is specific to a single vhost device instance
>then it's hard to support poll-mode (busy waiting) workers because
>each device instance consumes a whole CPU. If we stick to an interface
>where the kernel manages the worker threads then it's easier to share
>workers between devices for polling.

Agree, ioctl(VHOST_RUN_WORKER) is interesting and perhaps simplifies 
thread management (pinning, etc.), but with kthread would be easier to 
implement polling sharing worker with multiple devices.

>
>I have CCed Stefano Garzarella, who is looking at similar designs for
>vDPA software device implementations.

Thanks, Mike please can you keep me in CC for this work?

It's really interesting since I'll have similar issues to solve with 
vDPA software device.

Thanks,
Stefano


