Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40B2571A2C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:39:28 +0200 (CEST)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFAl-0000R3-I4
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oBF5x-0003bz-0G
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oBF5t-0005Xm-B2
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657629264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7a1n9jOxFfEIX4jA2NwASy9hdiVx0wW2KvV5U4FiQW4=;
 b=gCgFFcaGxdIEVsaYZ5dNOx2eRZdakf8uosGLyAbVRzQixxLP5pDgo88p8JdwqQoTApkjBq
 49+23rsXsaFzj3LxySytzph/SRrJlNz/WC2OscO08b68s6bUm3giheY3WMg8kK6mD8sJ20
 FP/YU7gfR3jhqYekWeIYGm+1gFZhw5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-xkq1q3L5N-23IN9KcGUCFA-1; Tue, 12 Jul 2022 08:33:18 -0400
X-MC-Unique: xkq1q3L5N-23IN9KcGUCFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58B8D8001EA;
 Tue, 12 Jul 2022 12:33:18 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43EBF1121314;
 Tue, 12 Jul 2022 12:33:18 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 1C9F1220463; Tue, 12 Jul 2022 08:33:18 -0400 (EDT)
Date: Tue, 12 Jul 2022 08:33:18 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Zhao, Shirley" <shirley.zhao@intel.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Virtio-fs] [Qemu] how to use viriofs in qemu without NUMA
Message-ID: <Ys1qDhW/DCCt0XdS@redhat.com>
References: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <3b6c8e16-3712-3402-3ab2-17bf53ec64a8@redhat.com>
 <YsPwbbiuxtkD6HSp@work-vm>
 <BY5PR11MB42912BFEA77F94B5B20D6F258D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <YsQGNk5hLv8b6DJS@work-vm>
 <BY5PR11MB4291BCA40054FB484003D4278D829@BY5PR11MB4291.namprd11.prod.outlook.com>
 <BY5PR11MB42914FD092B4312B76417A9C8D869@BY5PR11MB4291.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY5PR11MB42914FD092B4312B76417A9C8D869@BY5PR11MB4291.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
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

On Tue, Jul 12, 2022 at 07:06:50AM +0000, Zhao, Shirley wrote:
> Hi, all, 
> 
> I have another question want to consult you. 
> To enable DAX in virtiofs, according to the memu https://virtio-fs.gitlab.io/howto-qemu.html. 
> I need to add "cache-size=2G" as below. 
> -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs,cache-size=2G
> 
> My qemu command is: 
> sudo qemu-system-x86_64 -M pc -cpu host --enable-kvm -smp 2 -m 4G -drive if=virtio,file=ubuntu.img -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on -machine q35,memory-backend=mem -chardev socket,id=char0,path=/tmp/vhostqemu -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs_root,cache-size=2G -chardev stdio,mux=on,id=mon -mon chardev=mon,mode=readline -device virtio-serial-pci -device virtconsole,chardev=mon -vga none -display none
> 
> And virtiofsd command is:
> sudo ./virtiofsd --socket-path=/tmp/vhostqemu -o source=/home/shirley/testdir -o cache=always
> 
> But there is no option of "cache-size" in qemu 6.0, like below. So how to enable it? 

Hi Shirley,

DAX support in qemu is not upstream yet. We are carrying DAX patches
out of the tree on a branch here.

https://gitlab.com/virtio-fs/qemu/-/commits/virtio-fs-dev

There are some changes required and David Gilbert is looking into
making these changes. I am hoping at some point of time these patches
will make into upstream.

So for the time being, to test DAX, you will have to fetch above branch,
build it and use that qemu.

Thanks
Vivek

> qemu-6.0.0$ qemu-system-x86_64 -device vhost-user-fs-pci,help
> vhost-user-fs-pci options:
>   acpi-index=<uint32>    -  (default: 0)
>   addr=<int32>           - Slot and optional function number, example: 06.0 or 06 (default: -1)
>   aer=<bool>             - on/off (default: false)
>   any_layout=<bool>      - on/off (default: true)
>   ats=<bool>             - on/off (default: false)
>   bootindex=<int32>
>   chardev=<str>          - ID of a chardev to use as a backend
>   event_idx=<bool>       - on/off (default: true)
>   failover_pair_id=<str>
>   indirect_desc=<bool>   - on/off (default: true)
>   iommu_platform=<bool>  - on/off (default: false)
>   migrate-extra=<bool>   - on/off (default: true)
>   modern-pio-notify=<bool> - on/off (default: false)
>   multifunction=<bool>   - on/off (default: false)
>   notify_on_empty=<bool> - on/off (default: true)
>   num-request-queues=<uint16> -  (default: 1)
>   packed=<bool>          - on/off (default: false)
>   page-per-vq=<bool>     - on/off (default: false)
>   queue-size=<uint16>    -  (default: 128)
>   rombar=<uint32>        -  (default: 1)
>   romfile=<str>
>   romsize=<uint32>       -  (default: 4294967295)
>   tag=<str>
>   use-disabled-flag=<bool> -  (default: true)
>   use-started=<bool>     -  (default: true)
>   vectors=<uint32>       -  (default: 4294967295)
>   virtio-backend=<child<vhost-user-fs-device>>
>   virtio-pci-bus-master-bug-migration=<bool> - on/off (default: false)
>   x-ats-page-aligned=<bool> - on/off (default: true)
>   x-disable-legacy-check=<bool> -  (default: false)
>   x-disable-pcie=<bool>  - on/off (default: false)
>   x-ignore-backend-features=<bool> -  (default: false)
>   x-pcie-deverr-init=<bool> - on/off (default: true)
>   x-pcie-extcap-init=<bool> - on/off (default: true)
>   x-pcie-flr-init=<bool> - on/off (default: true)
>   x-pcie-lnkctl-init=<bool> - on/off (default: true)
>   x-pcie-lnksta-dllla=<bool> - on/off (default: true)
>   x-pcie-pm-init=<bool>  - on/off (default: true) 
> 
> 
> -----Original Message-----
> From: Zhao, Shirley 
> Sent: Friday, July 8, 2022 8:40 AM
> To: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>; qemu-devel@nongnu.org; virtio-fs@redhat.com; Stefan Hajnoczi <stefanha@redhat.com>
> Subject: RE: [Qemu] how to use viriofs in qemu without NUMA
> 
> Yes, the qemu version is too old. 
> My previous qemu version is 4.2, and I upgraded it into 6.0, and it worked now. 
> Thanks a lot. 
> 
> - Shirley 
> 
> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Tuesday, July 5, 2022 5:37 PM
> To: Zhao, Shirley <shirley.zhao@intel.com>
> Cc: Thomas Huth <thuth@redhat.com>; qemu-devel@nongnu.org; virtio-fs@redhat.com; Stefan Hajnoczi <stefanha@redhat.com>
> Subject: Re: [Qemu] how to use viriofs in qemu without NUMA
> 
> * Zhao, Shirley (shirley.zhao@intel.com) wrote:
> > Thanks for the information. 
> > Yes, I also found the memory backend options on s390x, and also copy the command to x86, but failed. 
> > 
> > The following is the command used to start qemu + virtiofs + ubuntu 20.04. 
> > One is worked well using NUMA, another one is failed without NUMA. 
> > Is there anything wrong? 
> > 
> > The worked one with NUMA options: 
> > 
> > qemu-system-x86_64 -M pc -cpu host --enable-kvm -smp 2 -m 4G -object 
> > memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on -numa 
> > node,memdev=mem -chardev socket,id=char0,path=/tmp/vfsd.sock -device 
> > vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs -chardev 
> > stdio,mux=on,id=mon -mon chardev=mon,mode=readline -device 
> > virtio-serial-pci -device virtconsole,chardev=mon -vga none -display 
> > none -drive if=virtio,file=ubuntu.img
> > 
> > The failed one without NUMA options: 
> > 
> > qemu-system-x86_64 -M pc -cpu host --enable-kvm -smp 2 -m 4G -object 
> > memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on -machine 
> > q35,memory-backend=mem -chardev socket,id=char0,path=/tmp/vfsd.sock
> > -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs
> > -chardev stdio,mux=on,id=mon -mon chardev=mon,mode=readline -device 
> > virtio-serial-pci -device virtconsole,chardev=mon -vga none -display 
> > none -drive if=virtio,file=ubuntu.img
> 
> What error did it give?
> 
> 20.04 is quite old, what qemu version is it?
> 
> I'd have to check when the memdev= went in.
> 
> Dave
> 
> > 
> > Thanks. 
> > - Shirley
> > 
> > -----Original Message-----
> > From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Sent: Tuesday, July 5, 2022 4:04 PM
> > To: Thomas Huth <thuth@redhat.com>
> > Cc: Zhao, Shirley <shirley.zhao@intel.com>; qemu-devel@nongnu.org; 
> > virtio-fs@redhat.com; Stefan Hajnoczi <stefanha@redhat.com>
> > Subject: Re: [Qemu] how to use viriofs in qemu without NUMA
> > 
> > * Thomas Huth (thuth@redhat.com) wrote:
> > > On 05/07/2022 03.02, Zhao, Shirley wrote:
> > > > Hi, all,
> > > > 
> > > > I want to use virtiofs to share folder between host and guest.
> > > > 
> > > >  From the guide, it must set the NUMA node.
> > > > https://virtio-fs.gitlab.io/howto-qemu.html
> > > > 
> > > > But my guest doesn’t support NUMA.
> > > > 
> > > > Is there any guide to use qemu + virtiofs without NUMA?
> > > > 
> > > > Or does qemu have any plan to support it?
> > > 
> > >  Hi!
> > > 
> > > At least on s390x, you can also specify the memory backend via the 
> > > -machine option instead of using the -numa option, e.g.:
> > > 
> > >  qemu-system-s390x -machine memory-backend=mem \
> > >   -object memory-backend-file,id=mem,...
> > > 
> > > Not sure whether that works on other architectures, too, though. 
> > > Stefan, David, do you know?
> > 
> > Right, that's the way I do it on x86.
> > We wrote virtiofs before the memory-backend option existed, which is why the old docs talk about using the NUMA stuff.
> > 
> > Dave
> > 
> > >  Thomas
> > > 
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


