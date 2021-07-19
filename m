Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3243CEB8E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:01:02 +0200 (CEST)
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZRk-00057m-Vw
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5ZQE-0004HY-8l
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5ZQA-0004gv-Jp
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626724760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SDnDy/AS35qwXMw9k5XSjwh0Kq6XXAUkWgt6bEv6oKw=;
 b=hV9exE+GZTrjhLwUlBJkFOGjsCryepT/+WCt4xheetEYujYaduvnvp0bYYto8eBAXyONYX
 ZcoYUxDYy29ZcnpP7A1eXD6+TAaaprExwZva2R8atbcKk9Xe+dUfO1TVhcRAtdW7UBDFOl
 Ks2tO70CXkfR9UiyElozo/RIwhTrpPg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-amXXM2RHO3a7mzod1gSG6g-1; Mon, 19 Jul 2021 15:59:19 -0400
X-MC-Unique: amXXM2RHO3a7mzod1gSG6g-1
Received: by mail-qv1-f70.google.com with SMTP id
 e19-20020ad442b30000b02902dc988b8675so16330642qvr.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 12:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SDnDy/AS35qwXMw9k5XSjwh0Kq6XXAUkWgt6bEv6oKw=;
 b=Ju6jIZcxCwiKan76UJnfRIriuteVtmPyWlShUNvY7yv4lOIfIllvTgEeu3GUpplYi+
 KyvWRmZwmGerl7/2I63+S/ndUQj5SpqPvjRX5KD8Lt7KenCl7pIpbek2J4P9CukBNvHq
 6zbu462uhaXejaDlsrRESWHKUxM5RbHaJz0AU5ybN5e8AGqds29Di9QCk09CsQGZbM9K
 5Aa6Qfqh9oW1mydpoSt0Q5g93zsZESq4oaZgi+xB3eesqhPM/cI86PKijETdKG/AofdO
 HBOOryVa921BH3Dcb+5ORESZlhE9+FZuhgAD01sg7AY20yLIz5VsXzc2xCDjsVMrsErZ
 pcrg==
X-Gm-Message-State: AOAM531enYvLHtNrsRDCywC/1+ZHamwT5CznGLDaslg5yqAZtE32rNw3
 54DrIsmXyWiPgsncl5p2pnpuLKo1QgsVCos6CfbH04Zn53hnR4rDlocz5ekooct4BwTtz5gXzNJ
 EItqYLJtjIw4FnGc=
X-Received: by 2002:a05:622a:1907:: with SMTP id
 w7mr23232118qtc.251.1626724757493; 
 Mon, 19 Jul 2021 12:59:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQQDlggRQpW4VifJKOP9GceKlKdMYZnTBHFVa1tzi5JeMY1aA2ym3PMof6PzImvzeKDtVYDw==
X-Received: by 2002:a05:622a:1907:: with SMTP id
 w7mr23232097qtc.251.1626724757078; 
 Mon, 19 Jul 2021 12:59:17 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id z68sm8584711qke.86.2021.07.19.12.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 12:59:16 -0700 (PDT)
Date: Mon, 19 Jul 2021 15:59:15 -0400
From: Peter Xu <peterx@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: Question on memory commit during MR finalize()
Message-ID: <YPXZkynODtvXXx6c@t490s>
References: <5ed295a3-9e4a-0dca-adc6-5361dc78a83c@redhat.com>
 <20200421104334.GC420399@xz-x1>
 <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPB/8f0pv7mDR310@t490s>
 <CH0PR02MB7898ACD1C68149CE11314EB08B119@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPGVQ0ONUc/qPSNz@t490s>
 <CH0PR02MB7898BB81DCB85237D38E07638BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPWglNqZFegBRZjM@t490s>
 <CH0PR02MB789857DE73B0A9B1FC29593E8BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
 <CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Markus Armbruster <armbru@redhat.com>, John Levon <john.levon@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 07:05:29PM +0000, Thanos Makatos wrote:
> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-
> > bounces+thanos.makatos=nutanix.com@nongnu.org> On Behalf Of Thanos
> > Makatos
> > Sent: 19 July 2021 19:02
> > To: Peter Xu <peterx@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>; John Levon
> > <john.levon@nutanix.com>; John G Johnson <john.g.johnson@oracle.com>;
> > Markus Armbruster <armbru@redhat.com>; QEMU Devel Mailing List
> > <qemu-devel@nongnu.org>
> > Subject: Re: Question on memory commit during MR finalize()
> > 
> > Omg I don't know how I missed that, of course I'll ignore SIGUSR1 and retest!
> > 
> > ________________________________________
> > From: Peter Xu <mailto:peterx@redhat.com>
> > Sent: Monday, 19 July 2021, 16:58
> > To: Thanos Makatos
> > Cc: Paolo Bonzini; Markus Armbruster; QEMU Devel Mailing List; John Levon;
> > John G Johnson
> > Subject: Re: Question on memory commit during MR finalize()
> > 
> > 
> > Hi, Thanos,
> > 
> > On Mon, Jul 19, 2021 at 02:38:52PM +0000, Thanos Makatos wrote:
> > > I can trivially trigger an assertion with a build where I merged the recent
> > vfio-user patches (https://urldefense.proofpoint.com/v2/url?u=https-
> > 3A__patchew.org_QEMU_cover.1626675354.git.elena.ufimtseva-
> > 40oracle.com_&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=XTpYsh5Ps2zJv
> > tw6ogtti46atk736SI4vgsJiUKIyDE&m=LvALaULnrxZWlgXFcaxGAl95UIwq3a6LI8
> > OnG_5r4XY&s=moFPVchYp27xozQcvvxG4nb4nC2QmMnqQ1Wmt4Z3dNE&e
> > = ) to master and then merging the result into your xzpeter/memory-sanity
> > branch, I've pushed the branch here:
> > https://urldefense.proofpoint.com/v2/url?u=https-
> > 3A__github.com_tmakatos_qemu_tree_memory-
> > 2Dsanity&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=XTpYsh5Ps2zJvtw6og
> > tti46atk736SI4vgsJiUKIyDE&m=LvALaULnrxZWlgXFcaxGAl95UIwq3a6LI8OnG_
> > 5r4XY&s=veyjdkkFkGSYNDZOuksB-kbHmdQaw9RYxyZp8Qo7nW4&e= . I
> > explain the repro steps below in case you want to take a look:
> > >
> > > Build as follows:
> > >
> > > ./configure --prefix=/opt/qemu-xzpeter --target-list=x86_64-softmmu --
> > enable-kvm  --enable-debug --enable-multiprocess && make -j `nproc` &&
> > make install
> > >
> > > Then build and run the GPIO sample from libvfio-user
> > (https://urldefense.proofpoint.com/v2/url?u=https-
> > 3A__github.com_nutanix_libvfio-
> > 2Duser&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=XTpYsh5Ps2zJvtw6ogt
> > ti46atk736SI4vgsJiUKIyDE&m=LvALaULnrxZWlgXFcaxGAl95UIwq3a6LI8OnG_5
> > r4XY&s=HYP5NmDMGuS13pdyV83x3HzyhGbE-oP1T8NLtu0d1U8&e= ):
> > >
> > > libvfio-user/build/dbg/samples/gpio-pci-idio-16 -v /var/run/vfio-user.sock
> > >
> > > And then run QEMU as follows:
> > >
> > > gdb --args /opt/qemu-xzpeter/bin/qemu-system-x86_64 -cpu host -
> > enable-kvm -smp 4 -m 2G -object memory-backend-
> > file,id=mem0,size=2G,mem-path=/dev/hugepages,share=on,prealloc=yes -
> > numa node,memdev=mem0 -kernel bionic-server-cloudimg-amd64-vmlinuz-
> > generic -initrd bionic-server-cloudimg-amd64-initrd-generic -append
> > 'console=ttyS0 root=/dev/sda1 single' -hda bionic-server-cloudimg-amd64-
> > 0.raw -nic user,model=virtio-net-pci -machine pc-q35-3.1 -device vfio-user-
> > pci,socket=/var/run/vfio-user.sock -nographic
> > >
> > > I immediately get the following stack trace:
> > >
> > > Thread 5 "qemu-system-x86" received signal SIGUSR1, User defined signal
> > 1.
> > 
> > This is SIGUSR1.  QEMU uses it for general vcpu ipis.
> > 
> > > [Switching to Thread 0x7fffe6e82700 (LWP 151973)]
> > > __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:103
> > > 103     ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S: No such file or
> > directory.
> > > (gdb) bt
> > > #0  0x00007ffff655d29c in __lll_lock_wait () at
> > ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:103
> > > #1  0x00007ffff6558642 in __pthread_mutex_cond_lock
> > (mutex=mutex@entry=0x5555568bb280 <qemu_global_mutex>) at
> > ../nptl/pthread_mutex_lock.c:80
> > > #2  0x00007ffff6559ef8 in __pthread_cond_wait_common (abstime=0x0,
> > mutex=0x5555568bb280 <qemu_global_mutex>, cond=0x555556cecc30) at
> > pthread_cond_wait.c:645
> > > #3  0x00007ffff6559ef8 in __pthread_cond_wait (cond=0x555556cecc30,
> > mutex=0x5555568bb280 <qemu_global_mutex>) at
> > pthread_cond_wait.c:655
> > > #4  0x000055555604f717 in qemu_cond_wait_impl (cond=0x555556cecc30,
> > mutex=0x5555568bb280 <qemu_global_mutex>, file=0x5555561ca869
> > "../softmmu/cpus.c", line=514) at ../util/qemu-thread-posix.c:194
> > > #5  0x0000555555d28a4a in qemu_cond_wait_iothread
> > (cond=0x555556cecc30) at ../softmmu/cpus.c:514
> > > #6  0x0000555555d28781 in qemu_wait_io_event (cpu=0x555556ce02c0) at
> > ../softmmu/cpus.c:425
> > > #7  0x0000555555e5da75 in kvm_vcpu_thread_fn (arg=0x555556ce02c0) at
> > ../accel/kvm/kvm-accel-ops.c:54
> > > #8  0x000055555604feed in qemu_thread_start (args=0x555556cecc70) at
> > ../util/qemu-thread-posix.c:541
> > > #9  0x00007ffff6553fa3 in start_thread (arg=<optimized out>) at
> > pthread_create.c:486
> > > #10 0x00007ffff64824cf in clone () at
> > ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> > 
> > Would you please add below to your ~/.gdbinit script?
> > 
> >   handle SIGUSR1 nostop noprint
> > 
> > Or just run without gdb and wait it to crash with SIGABRT.
> > 
> > Thanks,
> > 
> > --
> > Peter Xu
> 
> Sorry for the bad brain day, here's your stack trace:
> 
> qemu-system-x86_64: ../softmmu/cpus.c:72: qemu_mutex_unlock_iothread_prepare: Assertion `!memory_region_has_pending_transaction()' failed.
> 
> Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
> __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> 50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
> (gdb) bt
> #0  0x00007ffff63c07bb in __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007ffff63ab535 in __GI_abort () at abort.c:79
> #2  0x00007ffff63ab40f in __assert_fail_base
>     (fmt=0x7ffff650dee0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x5555561ca880 "!memory_region_has_pending_transaction()", file=0x5555561ca869 "../softmmu/cpus.c", line=72, function=<optimized out>) at assert.c:92
> #3  0x00007ffff63b9102 in __GI___assert_fail
>     (assertion=0x5555561ca880 "!memory_region_has_pending_transaction()", file=0x5555561ca869 "../softmmu/cpus.c", line=72, function=0x5555561caa60 <__PRETTY_FUNCTION__.37393> "qemu_mutex_unlock_iothread_prepare") at assert.c:101
> #4  0x0000555555d27c20 in qemu_mutex_unlock_iothread_prepare () at ../softmmu/cpus.c:72
> #5  0x0000555555d289f6 in qemu_mutex_unlock_iothread () at ../softmmu/cpus.c:507
> #6  0x0000555555dcb3d6 in vfio_user_send_recv (proxy=0x555557ac5560, msg=0x555557933d50, fds=0x0, rsize=40) at ../hw/vfio/user.c:88
> #7  0x0000555555dcd30a in vfio_user_dma_unmap (proxy=0x555557ac5560, unmap=0x7fffffffd8d0, bitmap=0x0) at ../hw/vfio/user.c:796
> #8  0x0000555555dabf5f in vfio_dma_unmap (container=0x555557a06fb0, iova=786432, size=2146697216, iotlb=0x0) at ../hw/vfio/common.c:501
> #9  0x0000555555dae12c in vfio_listener_region_del (listener=0x555557a06fc0, section=0x7fffffffd9f0) at ../hw/vfio/common.c:1249
> #10 0x0000555555d3d06d in address_space_update_topology_pass (as=0x5555568bbc80 <address_space_memory>, old_view=0x555556d6cfb0, new_view=0x555556d6c8b0, adding=false) at ../softmmu/memory.c:960
> #11 0x0000555555d3d62c in address_space_set_flatview (as=0x5555568bbc80 <address_space_memory>) at ../softmmu/memory.c:1062
> #12 0x0000555555d3d800 in memory_region_transaction_commit () at ../softmmu/memory.c:1124
> #13 0x0000555555b75a3e in mch_update_pam (mch=0x555556e80a40) at ../hw/pci-host/q35.c:344
> #14 0x0000555555b76068 in mch_update (mch=0x555556e80a40) at ../hw/pci-host/q35.c:504
> #15 0x0000555555b761d7 in mch_reset (qdev=0x555556e80a40) at ../hw/pci-host/q35.c:561
> #16 0x0000555555e93a95 in device_transitional_reset (obj=0x555556e80a40) at ../hw/core/qdev.c:1028
> #17 0x0000555555e956f8 in resettable_phase_hold (obj=0x555556e80a40, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/resettable.c:182
> #18 0x0000555555e8e07c in bus_reset_child_foreach (obj=0x555556ebce80, cb=0x555555e955ca <resettable_phase_hold>, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/bus.c:97
> #19 0x0000555555e953ff in resettable_child_foreach (rc=0x555556a07ab0, obj=0x555556ebce80, cb=0x555555e955ca <resettable_phase_hold>, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/resettable.c:96
> #20 0x0000555555e9567e in resettable_phase_hold (obj=0x555556ebce80, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/resettable.c:173
> #21 0x0000555555e920e0 in device_reset_child_foreach (obj=0x555556e802d0, cb=0x555555e955ca <resettable_phase_hold>, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/qdev.c:366
> #22 0x0000555555e953ff in resettable_child_foreach (rc=0x555556ad2830, obj=0x555556e802d0, cb=0x555555e955ca <resettable_phase_hold>, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/resettable.c:96
> #23 0x0000555555e9567e in resettable_phase_hold (obj=0x555556e802d0, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/resettable.c:173
> #24 0x0000555555e8e07c in bus_reset_child_foreach (obj=0x555556beaac0, cb=0x555555e955ca <resettable_phase_hold>, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/bus.c:97
> #25 0x0000555555e953ff in resettable_child_foreach (rc=0x555556b1ca70, obj=0x555556beaac0, cb=0x555555e955ca <resettable_phase_hold>, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/resettable.c:96
> #26 0x0000555555e9567e in resettable_phase_hold (obj=0x555556beaac0, opaque=0x0, type=RESET_TYPE_COLD) at ../hw/core/resettable.c:173
> #27 0x0000555555e952b4 in resettable_assert_reset (obj=0x555556beaac0, type=RESET_TYPE_COLD) at ../hw/core/resettable.c:60
> #28 0x0000555555e951f8 in resettable_reset (obj=0x555556beaac0, type=RESET_TYPE_COLD) at ../hw/core/resettable.c:45
> #29 0x0000555555e95a37 in resettable_cold_reset_fn (opaque=0x555556beaac0) at ../hw/core/resettable.c:269
> #30 0x0000555555e93f40 in qemu_devices_reset () at ../hw/core/reset.c:69
> #31 0x0000555555c9eb04 in pc_machine_reset (machine=0x555556a4d9e0) at ../hw/i386/pc.c:1654
> #32 0x0000555555d381fb in qemu_system_reset (reason=SHUTDOWN_CAUSE_NONE) at ../softmmu/runstate.c:443
> #33 0x0000555555a787f2 in qdev_machine_creation_done () at ../hw/core/machine.c:1330
> #34 0x0000555555d4e09c in qemu_machine_creation_done () at ../softmmu/vl.c:2650
> #35 0x0000555555d4e16b in qmp_x_exit_preconfig (errp=0x5555568db1a0 <error_fatal>) at ../softmmu/vl.c:2673
> #36 0x0000555555d506be in qemu_init (argc=31, argv=0x7fffffffe268, envp=0x7fffffffe368) at ../softmmu/vl.c:3692
> #37 0x0000555555945cad in main (argc=31, argv=0x7fffffffe268, envp=0x7fffffffe368) at ../softmmu/main.c:49
> 
> This is where the vfio-user client in QEMU tells the vfio-user server (the GPIO device) that this particular memory region is not available for DMA. There are 3 vfio_dma_map() operations before this happens and this seems to be the very first vfio_dma_unmap() operation.
> 

Yes my branch is just for catching things like the stack above.

Here vfio_user_send_recv() looks tricky to me - it releases the bql within a
memory update procedure, and IMHO it needs some serious justification on why it
can do so. For example, what if memory layout changed when waiting for the
reply?  As it can happen in parallel if without bql, afaict.

Thanks,

-- 
Peter Xu


