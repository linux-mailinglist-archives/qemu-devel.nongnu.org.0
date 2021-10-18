Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18684310C3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 08:43:58 +0200 (CEST)
Received: from localhost ([::1]:50128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcMNJ-0007zw-Jq
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 02:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcMLu-0007CE-9i
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:42:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcMLq-0000jO-UB
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634539345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/H5SnUwRwJ4dfnkbcKCW+LRynS7b30H02ffi2vo9T2c=;
 b=CRniB51epdVER4sFLRahCBdpKU21Iq3TF5W4BO+X6JVADH0l+rAgQWKPFIs899ssybHmHb
 jp0RZjbL5uXQyirasyLVA0IH/14fBlJAHO9rqv/Pq/ZmPE5fpKZmFcZadb+HGWYYOEAtYQ
 +lN7MZko1Dxy6zHyVu0leCMBAODMlPs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-w6twfCLIOKyf18YsDNUBaw-1; Mon, 18 Oct 2021 02:42:24 -0400
X-MC-Unique: w6twfCLIOKyf18YsDNUBaw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso8380002wrg.16
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 23:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/H5SnUwRwJ4dfnkbcKCW+LRynS7b30H02ffi2vo9T2c=;
 b=ssa+KVbRyPVxy2guFMdpg+HO7K5O++CN4sba24CQg+rn3BCxWScawm4spu8haKHTgq
 alttfaYg3WmgJjXslvrV3Xd099YpD9FAk/upTEgcua+cqIvVu6dcXRKCq3ETwFPalWwa
 G7FNo4nXU25RQHzd7Zz+kBhoIOpZ/krcAZ4aYhLrdOgHQXYQkuT32vY4QyJ0hpS8071K
 TUMmiaMizLSk5k86d7APNkLew5gkaRVw9E1Mvas2/4B5uhlOlyMakZAxPao1w3+gx5BW
 MeHG8pWR+GjH1++lbiEhcy40yqjxCWEW7hNGlTwAur/AHKkk6Ag+upKhuOl29KPPHBWa
 RZRA==
X-Gm-Message-State: AOAM532b/bsHqVILas5rkljeuv3R7LDuSMLF+NG6lVdYEbIZNZGcGhjk
 pXRDuNPinY/V5YeGa6YLr6XzVg2MGC9kyhhwK6dIOR21fU5bhl5i49jYGKGBeMLvaOAucoc4IY7
 tQYSq/40fYrZQc1g=
X-Received: by 2002:adf:ff86:: with SMTP id j6mr32533358wrr.59.1634539342982; 
 Sun, 17 Oct 2021 23:42:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh088wzWtIzQczXwOP4LMDI+oKiquxEvkG1Iq73aFurMcLVyqp6vS7TsQtcsStA4FTJG92uQ==
X-Received: by 2002:adf:ff86:: with SMTP id j6mr32533324wrr.59.1634539342689; 
 Sun, 17 Oct 2021 23:42:22 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v191sm11663829wme.36.2021.10.17.23.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 23:42:22 -0700 (PDT)
Date: Mon, 18 Oct 2021 08:42:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: bugfix the memory-backend-file
 command is invalid
Message-ID: <20211018084221.622ae711@redhat.com>
In-Reply-To: <CAEUhbmVTs109MLog+wjnayJY++SvEPhuCKcG3xXotqySkpGAaA@mail.gmail.com>
References: <20211012014501.24996-1-limingwang@huawei.com>
 <CAEUhbmX=A4LPgzNgNPcxzzg=veU0=3vXyZQrwikxMFvb_Rcxzw@mail.gmail.com>
 <c4c6cc03d1c6459ea036c08ae30806a5@huawei.com>
 <CAEUhbmVD1jyvGJrQLSZLJYfaz6E-m0b9SZA+DQA2YYK70oL7Lg@mail.gmail.com>
 <20211015145922.5a82e31a@redhat.com>
 <CAEUhbmVTs109MLog+wjnayJY++SvEPhuCKcG3xXotqySkpGAaA@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "limingwang \(A\)" <limingwang@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Fanliang \(EulerOS\)" <fanliang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Wubin \(H\)" <wu.wubin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Oct 2021 10:17:45 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Igor,
> 
> On Fri, Oct 15, 2021 at 8:59 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Fri, 15 Oct 2021 17:25:01 +0800
> > Bin Meng <bmeng.cn@gmail.com> wrote:
> >  
> > > On Fri, Oct 15, 2021 at 4:52 PM limingwang (A) <limingwang@huawei.com> wrote:  
> > > >
> > > >
> > > > On Wed, Oct 13, 2021 at 22:41 PM Bin Meng <bin.meng@windriver.com> wrote:  
> > > > >
> > > > > On Tue, Oct 12, 2021 at 9:46 AM MingWang Li <limingwang@huawei.com> wrote:  
> > > > > >
> > > > > > From: Mingwang Li <limingwang@huawei.com>
> > > > > >
> > > > > > When I start the VM with the following command:
> > > > > > $ ./qemu-system-riscv64 -M virt,accel=kvm -m 4096M -cpu host -nographic \
> > > > > >     -name guest=riscv-guset \
> > > > > >     -smp 2 \
> > > > > >     -bios none \
> > > > > >     -kernel ./Image \
> > > > > >     -drive file=./guest.img,format=raw,id=hd0 \
> > > > > >     -device virtio-blk-device,drive=hd0 \
> > > > > >     -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
> > > > > >     -object  
> > > > > memory-backend-file,id=mem,size=4096M,mem-path=/dev/hugepages,share=on \  
> > > > > >     -numa node,memdev=mem -mem-prealloc \
> > > > > >     -chardev socket,id=char0,path=/mnt/vhost-net0 \
> > > > > >     -netdev type=vhost-user,id=mynet1,chardev=char0,vhostforce \
> > > > > >     -device
> > > > > > virtio-net-pci,mac=52:54:00:00:00:01,netdev=mynet1,mrg_rxbuf=on,csum=o
> > > > > > n,guest_csum=on,guest_ecn=on \
> > > > > >
> > > > > > Then, QEMU displays the following error information:
> > > > > > qemu-system-riscv64: Failed initializing vhost-user memory map,
> > > > > > consider using -object memory-backend-file share=on  
> > > > >
> > > > > I see your command line parameters already contain "-object memory-backend-file
> > > > > share=on", so this error message is not accurate.  
> > > >
> > > > QEMU uses this command to alloc fd in the "memory_region_init_ram_from_file" function
> > > > and assigns the value of fd to mr->ram_block-fd. If the QEMU uses the default memory to
> > > > initialize the system, the QEMU cannot obtain the fd in the "vhost_user_mem_section_filter"
> > > > function when initializing the vhost-user. As a result, an error is reported in the "vhost_user_fill_set_mem_table_msg"
> > > > function.
> > > >
> > > > Because of the above bug, even if "-object memory-backend-file share=on" is added to the command line,
> > > > the QEMU still reports an error.  
> > >
> > > Yes, what I meant is that QEMU should not report such inaccurate
> > > messages because of some random codes elsewhere.
> > >
> > > With current message, it suggested user use "-object
> > > memory-backend-file share=on" in the command line, but it is already
> > > used. So this is a false alarm. The "bug" is somewhere else.  
> >
> > bug is in using memory_region_init_ram(),
> > which can't possibly handle vhost-user, and can't work as expected with
> > '-numa node,memdev' options.
> > Before main ram infrastructure was converted to memdev,
> > one should have used memory_region_allocate_system_memory() for
> > allocating main RAM, so numa usecase was broken from the start.
> > Later it old API was dropped in favor of more flexible/generic
> > MachineState::ram approach (see commits 68a86dc15ccd..f0530f14c7c35d).  
> 
> Thanks for the detailed pointers.
> 
> I wonder if it is possible to make the error message to be clearer, so
> instead of having
> 
>     "qemu-system-riscv64: Failed initializing vhost-user memory map,
> consider using -object memory-backend-file share=on"
> 
> can we do:
> 
>     "qemu-system-riscv64: Failed initializing vhost-user memory map,
> considering using MachineState::ram instead of manually initializing
> RAM memory region."
> 
> which is more straightforward?

It would only make sense in context of this thread and
give a hint to a developer how to fix bug in machine code
but won't give a clue to the end user what's wrong with
configuration.

Maybe following would be better:
 "Failed initializing vhost-user memory map, vhost requires shared system memory."
 "See 'System Emulation::Device Emulation::Emulated Devices::vhost-user back ends'
  chapter in QEMU manual."

the chapter gives an example how to correctly configure vhost-user
(albeit using old style)

 
> >
> >
> > Modulo commit message, patch looks good to me and does what
> > every machine should do. (I though that I've converted every
> > existing to generalized MachineState::ram but it looks like
> > riscv was missed).  
> 
> Indeed all riscv boards are doing the same thing.
> 
> >
> > So we can model commit message after bd457782b3b0a,
> > and also add that the patch fixes broken -numa node,memdev case,
> > which never properly worked. It also opens possibility to
> > use vhost-user/virtiosf with main RAM if main RAM is
> > provided explicitly via machine.memory-backend option
> > with shared memory backend.
> >
> > Btw: is there other riscv machines that allocate RAM directly?
> > (if yes, those should be fixed as well, a patch per machine)
> >  
> 
> I will see if I can get some patches to fix other riscv machines.
> 
> Regards,
> Bin
> 


