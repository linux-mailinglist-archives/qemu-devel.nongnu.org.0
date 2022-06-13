Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC15485B4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 16:34:35 +0200 (CEST)
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0l9F-00020B-Vu
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 10:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o0l8G-0001D5-QK
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 10:33:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o0l8D-0007mM-Mr
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 10:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655130808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pAb13ciOalfroWAzG2skkDj5bBNMYWJx6o1O8WvzFL4=;
 b=DQSCK99YfZzPiBx9YA7QQ0LBdr0HVUBa1IkgcPxpJKHZQ6yZe+KKb8gV96oNHDfAKeKN6P
 1AhNYfSxCx8AIVdWrin7EDKwx9GyCOQeQhlLjzvWl7dPBtHuDcHoMIlThpXE44M15/9YUF
 pOn9I1nI1e/s8uHfWLzmZpZqs8oL1ao=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-pmrYmKxkPWORKOxCrGI-pA-1; Mon, 13 Jun 2022 10:33:26 -0400
X-MC-Unique: pmrYmKxkPWORKOxCrGI-pA-1
Received: by mail-il1-f197.google.com with SMTP id
 b11-20020a92340b000000b002d3dbbc7b15so4718279ila.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 07:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pAb13ciOalfroWAzG2skkDj5bBNMYWJx6o1O8WvzFL4=;
 b=wS6+DGV8xcOl5siV3yAjoKHu2bBUeTxGey3pT/n+5+WPVk0f3sRQsYKXDt/TG7i01Z
 KbkZrr9T49E/d7sAZRctXg0dNw+y/e6K++taiJdkcd9gHLBzfFpnlw9Is0Pojn2W63ug
 fLLwZB/1qYMiYf0/w3bdEbANysSVDWiLsDbtRPt5tRbq8GugsoLCCDeIMhdd0DuR5bBv
 b8YUSh/4NZlNHm5MWyUqHRhq4hp0QI06g/9e2K88VjxmiO/6ZID8xsalkorQ5FWdiOEg
 /X72iczoHVS81qGkMPFoLa3oiLxumLUwyje0idobO+aBKUle5NJvoOi4fbBKKPAj1moy
 qrtg==
X-Gm-Message-State: AJIora+qQfpWYSK9vS67liCZKHfT0ATK1JdR8o/9bdqYy/F3ybeJobjB
 undLmZnTmWsdyaKzyRLckUNXX4VdM0yNWv7HzLVFJDSuhtgvMP2QRC87xPx57WH/VmhHO5+kreA
 0ghDEsp9z6yBc6nk=
X-Received: by 2002:a92:280a:0:b0:2d7:7cdc:8426 with SMTP id
 l10-20020a92280a000000b002d77cdc8426mr23708ilf.245.1655130803900; 
 Mon, 13 Jun 2022 07:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vodF94Om/BOKAI9NCkLDfJ1UNOVYUentLJKipqfOVkdIKjIzmAQznsWzoZX5ZEQHK90na5Ig==
X-Received: by 2002:a92:280a:0:b0:2d7:7cdc:8426 with SMTP id
 l10-20020a92280a000000b002d77cdc8426mr23691ilf.245.1655130803637; 
 Mon, 13 Jun 2022 07:33:23 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 k83-20020a6bba56000000b0065a47e16f44sm4015099iof.22.2022.06.13.07.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 07:33:22 -0700 (PDT)
Date: Mon, 13 Jun 2022 10:33:20 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: Jason Wang <jasowang@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v17 6/8] softmmu/dirtylimit: Implement virtual CPU throttle
Message-ID: <YqdKsNEkWsS3XDvf@xz-m1.local>
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
 <1e117589-1719-0d11-099f-9f3392e0ba6f@nutanix.com>
 <f98ae9a1-8d47-7995-ae0d-101c626c3be4@chinatelecom.cn>
 <f0e09ec4-7d16-b022-0949-4599a5378356@nutanix.com>
 <fb42912b-e3f4-f0cb-fb16-671ba75bd7ef@chinatelecom.cn>
 <Yo5RiqKWuwZPY6Iv@xz-m1.local>
 <CACGkMEsiLUxEKD=o23aaHzo5AVy-vTRPKhxtT6-cTT+ETtdpaA@mail.gmail.com>
 <3cac02a4-5c2a-362d-4035-e82d66097107@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3cac02a4-5c2a-362d-4035-e82d66097107@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jun 13, 2022 at 03:28:34PM +0530, manish.mishra wrote:
> 
> On 26/05/22 8:21 am, Jason Wang wrote:
> > On Wed, May 25, 2022 at 11:56 PM Peter Xu <peterx@redhat.com> wrote:
> > > On Wed, May 25, 2022 at 11:38:26PM +0800, Hyman Huang wrote:
> > > > > 2. Also this algorithm only control or limits dirty rate by guest
> > > > > writes. There can be some memory dirtying done by virtio based devices
> > > > > which is accounted only at qemu level so may not be accounted through
> > > > > dirty rings so do we have plan for that in future? Those are not issue
> > > > > for auto-converge as it slows full VM but dirty rate limit only slows
> > > > > guest writes.
> > > > > 
> > > >  From the migration point of view, time spent on migrating memory is far
> > > > greater than migrating devices emulated by qemu. I think we can do that when
> > > > migrating device costs the same magnitude time as migrating memory.
> > > > 
> > > > As to auto-converge, it throttle vcpu by kicking it and force it to sleep
> > > > periodically. The two seems has no much difference from the perspective of
> > > > internal method but the auto-converge is kind of "offensive" when doing
> > > > restraint. I'll read the auto-converge implementation code and figure out
> > > > the problem you point out.
> > > This seems to be not virtio-specific, but can be applied to any device DMA
> > > writting to guest mem (if not including vfio).  But indeed virtio can be
> > > normally faster.
> > > 
> > > I'm also curious how fast a device DMA could dirty memories.  This could be
> > > a question to answer to all vcpu-based throttling approaches (including the
> > > quota based approach that was proposed on KVM list).  Maybe for kernel
> > > virtio drivers we can have some easier estimation?
> > As you said below, it really depends on the speed of the backend.
> > 
> > >   My guess is it'll be
> > > much harder for DPDK-in-guest (aka userspace drivers) because IIUC that
> > > could use a large chunk of guest mem.
> > Probably, for vhost-user backend, it could be ~20Mpps or even higher.
> 
> Sorry for late response on this. We did experiment with IO on virtio-scsi based disk.

Thanks for trying this and sharing it out.

> 
> We could see dirty rate of ~500MBps on my system and most of that was not tracked
> 
> as kvm_dirty_log. Also for reference i am attaching test we used to avoid tacking
> 
> in KVM. (as attached file).

The number looks sane as it seems to be the sequential bandwidth for a
disk, though I'm not 100% sure it'll work as expected since you mmap()ed
the region with private pages rather than shared, so after you did I'm
wondering whether below will happen (also based on the fact that you mapped
twice the size of guest mem as you mentioned in the comment):

  (1) Swap out will start to trigger after you read a lot of data into the
      mem already, then old-read pages will be swapped out to disk (and
      hopefully the swap device does not reside on the same virtio-scsi
      disk or it'll be even more complicated scenario of mixture IOs..),
      meanwhile when you finish reading a round and start to read from
      offset 0 swap-in will start to happen too.  Swapping can slow down
      things already, and I'm wondering whether the 500MB/s was really
      caused by the swapout rather than backend disk reads.  More below.

  (2) Another attribute of private pages AFAICT is after you read it once
      it does not need to be read again from the virtio-scsi disks.  In
      other words, I'm thinking whether starting from the 2nd iteration
      your program won't trigger any DMA at all but purely torturing the
      swap device.

Maybe changing MAP_PRIVATE to MAP_SHARED can emulate better on what we want
to measure, but I'm also not 100% sure on whether it could be accurate..

Thanks,

> 
> > 
> > Thanks
> > 
> > > [copy Jason too]
> > > 
> > > --
> > > Peter Xu
> > > 
> #include <fcntl.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/mman.h>
> #include <sys/stat.h>
> #include <sys/time.h>
> #include <time.h>
> #include <unistd.h>
> 
> #define PAGE_SIZE 4096
> #define GB (1024 * 1024 * 1024)
> 
> int main()
> {
>     char *buff;
>     size_t size;
>     struct stat stat;
>     // Take file of size atleast double of RAM size to
>     // achieve max dirty rate possible.
>     const char * file_name = "file_10_gb";
>     int fd;
>     size_t i = 0, count = 0;
>     struct timespec ts1, ts0;
>     double time_diff;
> 
>     fd = open(file_name, O_RDONLY);
>     if (fd == -1) {
>        perror("Error opening file");
>        exit(1);
>     }
> 
>     fstat (fd, &stat);
>     size = stat.st_size;
>     printf("File size %ld\n", (long)size);
> 
>     buff = (char *)mmap(0, size, PROT_READ, MAP_PRIVATE, fd, 0);
>     if (buff == MAP_FAILED) {
>        perror("Mmap Error");
>        exit(1);
>     }
> 
>     (void)clock_gettime(CLOCK_MONOTONIC, &ts0);
> 
>     while(1) {
>        char c;
> 
>        i = (i + PAGE_SIZE) % size;
>        c = buff[i];
>        count++;
>        // Check on every 10K pages for rate.
>        if (count % 10000 == 0) {
>           (void)clock_gettime(CLOCK_MONOTONIC, &ts1);
>           time_diff = ((double)ts1.tv_sec  + ts1.tv_nsec * 1.0e-9) -((double)ts0.tv_sec + ts0.tv_nsec * 1.0e-9);
>           printf("Expected Dirty rate %f\n", (10000.0 * PAGE_SIZE) / GB / time_diff);
>           ts0 = ts1;
>        }
>     }
> 
>     close(fd);
>     return 0;
> }


-- 
Peter Xu


