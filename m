Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F8513BDA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 20:53:18 +0200 (CEST)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk9GO-0000Bm-Sk
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 14:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk9F9-0007w7-Io
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 14:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk9F6-0001PU-35
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 14:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651171914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qeiw++YrdcI5miEwvf3DCDuYyJd3EpCgSjUcXdbOlf0=;
 b=eGS8swfbzFV6KI0SdkPu+hxd9V0KZ4KrnrlpKj8QDkO8lXE1WmOFi3dkT380cI5lJoNiJ/
 9Wmz327338fwaAzpIJha+GCRJzAxuQuYjj6JNvnEyKgeuvh4FRg8xRlzqx4skf086jJ8k2
 XqNZ/6tgcC0Jishs9isN1QBp95bm5ZM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-aEWD_yTKOp-ufO4nNDQ8SA-1; Thu, 28 Apr 2022 14:51:53 -0400
X-MC-Unique: aEWD_yTKOp-ufO4nNDQ8SA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so2199263wrg.19
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 11:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qeiw++YrdcI5miEwvf3DCDuYyJd3EpCgSjUcXdbOlf0=;
 b=EnHV0B6L4ILmC1KIsP1wog+4UhVSzs8PbHAYEi2yx7U4Zv4M8nD1NJum3llIV6bxGH
 /wnpw2wXAqdEZ5hnpMxHQN3LPQ9Uosa/73wtAklocSpWOptUAU89aFEZZ+aPtoXvjHU9
 LxCebGAHbn0Ok7VBKRycjEb9HDhXpbHui55sRf3/Aq7Mh3BcHW3NpgOsV9h1HEDAL4WY
 dhJXZryvwnNfOrqVGjyVAKoNDwIHHmMfstdF3HRhBQsOHEfui9M8crzJhsv+wVrVWLdI
 QJk00T5aCTZjAGBWjplICCRd5+0JR5sc+lwAeREUmads+iphxZMDP8+fmADpjf0ON8X2
 PQTg==
X-Gm-Message-State: AOAM533rvIkcM9x4rWGR70aVJArzILsJcDcEoB8jsEVoQX9jOeXZOaFO
 Up/S48zO5mSt4NyEpNixF2jjaXEQrWwXxAKVW3Gvw0+gd2JS81oFItGIB+gaWxrdQnLcbfmiA5e
 Bjb9O4UfODOTEeEA=
X-Received: by 2002:a05:6000:1788:b0:20a:a4b0:dbbc with SMTP id
 e8-20020a056000178800b0020aa4b0dbbcmr27239440wrg.384.1651171911800; 
 Thu, 28 Apr 2022 11:51:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyLh1g7D4wgNOvUmJmVCcHtZM9JTWekREaqGhCL2tiYBCEeylw1tUT0sj3okeg/oxq+2gG9w==
X-Received: by 2002:a05:6000:1788:b0:20a:a4b0:dbbc with SMTP id
 e8-20020a056000178800b0020aa4b0dbbcmr27239425wrg.384.1651171911534; 
 Thu, 28 Apr 2022 11:51:51 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020aef6046bcsm583006wrq.84.2022.04.28.11.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 11:51:50 -0700 (PDT)
Date: Thu, 28 Apr 2022 19:51:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: yue <kvmluck@163.com>
Subject: Re: a qemu process has 54 threads, how to know who they are and what
 they are doing
Message-ID: <YmriRJgfOngf5qDb@work-vm>
References: <c34d759.1161.18049c8b2d4.Coremail.kvmluck@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c34d759.1161.18049c8b2d4.Coremail.kvmluck@163.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* yue (kvmluck@163.com) wrote:
> Hi, i think it is curios for a process to have so many threads.
> 
> my environment: 5.4.160-1.el7.x86_64, qemu-6.1.0

If you pass:
   -name whatever,debug-threads=on

then the qemu will set the kernel thread name to names
like 'CPU 0/Kvm' or 'migration' or whatever, so you can tell what
the thread is.

I'd bet your threads are mostly IO threads, you can configure that a
lot.

Dave

> thanks
> 
> 
> =============cmd==================
> root     11918  0.0  0.0 112720  2280 pts/0    S+   09:30   0:00 grep --color=auto 38032
> root     38032 58.0  1.0 8705632 2823304 ?     Sl   Apr19 1451:10 /opt/kata/bin/qemu-system-x86_64 -name sandbox-598c832569b63321f393b1f
> ef6d23cb209a9668a17f3b56a8eb87171506baaf8 -uuid 9ab925f1-86f2-4703-801e-be23ce0fdca6 -machine q35,accel=kvm,kernel_irqchip=on,nvdimm=on 
> -cpu host,pmu=off -qmp unix:/run/vc/vm/598c832569b63321f393b1fef6d23cb209a9668a17f3b56a8eb87171506baaf8/qmp.sock,server=on,wait=off -qmp
>  unix:/run/vc/vm/598c832569b63321f393b1fef6d23cb209a9668a17f3b56a8eb87171506baaf8/qmp-guestcsi.sock,server=on,wait=off -qmp unix:/run/vc
> /vm/598c832569b63321f393b1fef6d23cb209a9668a17f3b56a8eb87171506baaf8/qmp-guestcni.sock,server=on,wait=off -m 4352M,slots=10,maxmem=25856
> 2M -device pci-bridge,bus=pcie.0,id=pci-bridge-0,chassis_nr=1,shpc=off,addr=2,io-reserve=4k,mem-reserve=1m,pref64-reserve=1m -device vir
> tio-serial-pci,disable-modern=false,id=serial0 -device virtconsole,chardev=charconsole0,id=console0 -chardev socket,id=charconsole0,path
> =/run/vc/vm/598c832569b63321f393b1fef6d23cb209a9668a17f3b56a8eb87171506baaf8/console.sock,server=on,wait=off -device nvdimm,id=nv0,memde
> v=mem0,unarmed=on -object memory-backend-file,id=mem0,mem-path=/opt/kata/share/kata-containers/kata-containers-2.4.img,size=134217728,re
> adonly=on -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -device pcie-root-port,id=rp0,bus=pcie.0,chas
> sis=0,slot=0,multifunction=off -device pcie-root-port,id=rp1,bus=pcie.0,chassis=0,slot=1,multifunction=off -device vhost-vsock-pci,disab
> le-modern=false,vhostfd=3,id=vsock-2210812542,guest-cid=2210812542 -device virtio-9p-pci,disable-modern=false,fsdev=extra-9p-kataShared,
> mount_tag=kataShared -fsdev local,id=extra-9p-kataShared,path=/run/kata-containers/shared/sandboxes/598c832569b63321f393b1fef6d23cb209a9
> 668a17f3b56a8eb87171506baaf8/shared,security_model=none,multidevs=remap -netdev tap,id=network-0,vhost=on,vhostfds=4:5:6,fds=7:8:9 -devi
> ce driver=virtio-net-pci,netdev=network-0,mac=fa:16:3e:fd:ba:ab,disable-modern=false,mq=on,vectors=8 -rtc base=utc,driftfix=slew,clock=h
> ost -global kvm-pit.lost_tick_policy=discard -vga none -no-user-config -nodefaults -nographic --no-reboot -daemonize -object memory-back
> end-ram,id=dimm1,size=4352M -numa node,memdev=dimm1 -kernel /opt/kata/share/kata-containers/vmlinux-5.4.160 -append tsc=reliable no_time
> r_check rcupdate.rcu_expedited=1 i8042.direct=1 i8042.dumbkbd=1 i8042.nopnp=1 i8042.noaux=1 noreplace-smp reboot=k console=hvc0 console=
> hvc1 cryptomgr.notests net.ifnames=0 pci=lastbus=0 root=/dev/pmem0p1 rootflags=dax,data=ordered,errors=remount-ro ro rootfstype=ext4 deb
> ug systemd.show_status=true systemd.log_level=debug panic=1 nr_cpus=40 systemd.unit=kata-containers.target systemd.mask=systemd-networkd
> .service systemd.mask=systemd-networkd.socket agent.debug_console agent.debug_console_vport=1026 -pidfile /run/vc/vm/598c832569b63321f39
> 3b1fef6d23cb209a9668a17f3b56a8eb87171506baaf8/pid -D /run/vc/vm/598c832569b63321f393b1fef6d23cb209a9668a17f3b56a8eb87171506baaf8/qemu.lo
> g -smp 3,cores=1,threads=1,sockets=40,maxcpus=40
> root     38038  0.0  0.0      0     0 ?        S    Apr19   0:10 [vhost-38032]
> root     38040  0.0  0.0      0     0 ?        S    Apr19   0:10 [vhost-38032]
> root     38041  0.0  0.0      0     0 ?        S    Apr19   0:11 [vhost-38032]
> root     38046  0.0  0.0      0     0 ?        S    Apr19   0:00 [kvm-pit/38032]
> root     38047  0.0  0.0      0     0 ?        S    Apr19   0:02 [vhost-38032]
> [root@os ~]# ps -L -p 38032 | wc -l
> 54
> [root@os ~]# ps -fT -p 38032 | wc -l
> 54
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


