Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACF67375C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:49:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITPK-0000f0-3a; Thu, 19 Jan 2023 06:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pITP4-0000ea-FS
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:48:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pITP2-0007cE-AH
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674128899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2gSeKKNWAmW7n3XNcz9yQZA//v/CywB7136rmaNp0AI=;
 b=fMN9ENrCwFwuaEte7sl4O2Y+Kv7ul/lN6rWwp371ZgKNDtqhIsArOnvIAvPNoqKghVOgld
 EYA79rZkDDYg/qj6pVD1NIXQLFTNOPTXo6xt4erNgoPC++yH1AlPOw41x1cXGDUAUreKAm
 PtOkpWslDFxKcIOqnqeVV/NIMPzN+D0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-1C5UU_MYOm6FqKGpi7GScQ-1; Thu, 19 Jan 2023 06:48:18 -0500
X-MC-Unique: 1C5UU_MYOm6FqKGpi7GScQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 12-20020a05600c228c00b003db09699216so376567wmf.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gSeKKNWAmW7n3XNcz9yQZA//v/CywB7136rmaNp0AI=;
 b=n7+Sdx3qhQUHp+7fgipHGH1FC3OHrppfSyfmXalEGxwrmZDWpDFDTNohAUSMN83Yu+
 Qejd6Ut/t4u8Ss6EEANov+y6qBagGEgbV+H7n4ddEKmU+NTWlp2SRdBloRsU+7IN8l6k
 B8qDMPWYkNZNu4CdYptMxX0KTpycLZKqZra+7Bdrk9F7gIJ1O7jpkC4XPkagcTjtVVqh
 6mNrVYmIzKN3ZnkmfoaQFYAqEDEyfTuSXI3+kvvn1zrnXvGZ9J9lXh4GXQ9h9B5UFjaa
 54wP7hyF1aq3sCLkUBffuQC8h6ho8moSPGnTfq/Ov6t5OlS3LUvRAWGuzs6RQ4sd+Kek
 RFMw==
X-Gm-Message-State: AFqh2koU22GCWjC6eQQbKtTvwLFRphF19LEka3s9Yb6qNafJC9xaIdyJ
 z/QyV6qQu8ZLdbqxVJE2LSU8xc7qB6xPPMdPdDW1uq8Eh3hiYwehXIUxSH+XbHX7qYqf9SpLKQJ
 KvmJMV9YEUUupsJU=
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id
 f16-20020a1c6a10000000b003daf6655b66mr10382526wmc.6.1674128895780; 
 Thu, 19 Jan 2023 03:48:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdCw2Ygn0Kc8Ye0/M/lMngRJX3cveSsF4sL78VD21AZQvyZrbwGYMo0a1TI0ZRydKujuswcg==
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id
 f16-20020a1c6a10000000b003daf6655b66mr10382509wmc.6.1674128895507; 
 Thu, 19 Jan 2023 03:48:15 -0800 (PST)
Received: from redhat.com ([2.52.28.74]) by smtp.gmail.com with ESMTPSA id
 bd24-20020a05600c1f1800b003db122d5ac2sm4798727wmb.15.2023.01.19.03.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:48:14 -0800 (PST)
Date: Thu, 19 Jan 2023 06:48:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gregory.price@memverge.com>,
 Lukas Wunner <lukas@wunner.de>, qemu-devel@nongnu.org,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
Subject: Re: [PATCH 0/8] hw/cxl: CXL emulation cleanups and minor fixes for
 upstream
Message-ID: <20230119064755-mutt-send-email-mst@kernel.org>
References: <Y8AppXP+eP9cEz+i@memverge.com>
 <20230112172130.0000391b@Huawei.com>
 <Y8CNw/fZT5fZJZcK@memverge.com>
 <20230113091213.00002146@Huawei.com>
 <Y8Foj/12QNl0C96o@memverge.com>
 <20230113144026.000001fb@Huawei.com>
 <20230113144511.00001207@Huawei.com>
 <20230113151206.GA20583@wunner.de> <Y8hG4OyJL7l9oD2f@memverge.com>
 <20230119101946.000079e5@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119101946.000079e5@Huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Jan 19, 2023 at 10:19:46AM +0000, Jonathan Cameron wrote:
> On Wed, 18 Jan 2023 14:22:08 -0500
> Gregory Price <gregory.price@memverge.com> wrote:
> 
> > 1) No stack traces present
> > 2) Device usage appears to work, but cxl-cli fails to create a region, i
> > haven't checked why yet (also tried ndctl-75, same results)
> > 3) There seems to be some other regression with the cxl_pmem_init
> > routine, because I get a stack trace in this setup regardless of whether
> > I apply the type-3 device commit.
> > 
> > 
> > All tests below with the previously posted DOE linux branch.
> > Base QEMU branch was Jonathan's 2023-1-11
> > 
> > 
> > DOE Branch - 2023-1-11 (HEAD) (all commits)
> > 
> > QEMU Config:
> > sudo /opt/qemu-cxl/bin/qemu-system-x86_64 \
> > -drive file=/var/lib/libvirt/images/cxl.qcow2,format=qcow2,index=0,media=disk,id=hd \
> > -m 3G,slots=4,maxmem=8G \
> > -smp 4 \
> > -machine type=q35,accel=kvm,cxl=on \
> > -enable-kvm \
> > -nographic \
> > -object memory-backend-ram,id=mem0,size=1G,share=on \
> > -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 \
> > -device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 \
> > -device cxl-type3,bus=rp0,volatile-memdev=mem0,id=cxl-mem0 \
> > -M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=1G
> > 
> > Result:  This worked, but cxl-cli could not create a region (will look
> > into this further later).
> > 
> 
> Even if everything else worked, it will currently fail because of the
> issue with pass through decoders.
> (Kernel assumes always pass through for single rp, qemu assumes never
>  pass through - both are valid under spec).
> Add a second rp for now.  I should be able to post some patches
> to work around that shortly. 
> 
> 
> 
> 
>  
> > 
> > 
> > 
> > When running with a persistent memory configuration, I'm seeing a
> > kernel stack trace on cxl_pmem_init
> > 
> > Config:
> > sudo /opt/qemu-cxl/bin/qemu-system-x86_64 \
> > -drive file=/var/lib/libvirt/images/cxl.qcow2,format=qcow2,index=0,media=disk,id=hd \
> > -m 3G,slots=4,maxmem=4G \
> > -smp 4 \
> > -machine type=q35,accel=kvm,cxl=on \
> > -enable-kvm \
> > -nographic \
> > -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 \
> > -device cxl-rp,port=0,id=rp0,bus=cxl.0,chassis=0,slot=0 \
> > -object memory-backend-file,id=cxl-mem0,mem-path=/tmp/mem0,size=1G \
> > -object memory-backend-file,id=cxl-lsa0,mem-path=/tmp/lsa0,size=1G \
> > -device cxl-type3,bus=rp0,persistent-memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0 \
> > -M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=1G
> > 
> > 
> > [   62.167518] BUG: kernel NULL pointer dereference, address: 00000000000004c0
> > [   62.185069] #PF: supervisor read access in kernel mode
> > [   62.198502] #PF: error_code(0x0000) - not-present page
> > [   62.211019] PGD 0 P4D 0
> > [   62.220521] Oops: 0000 [#1] PREEMPT SMP PTI
> > [   62.233457] CPU: 3 PID: 558 Comm: systemd-udevd Not tainted 6.2.0-rc1+ #1
> > [   62.252886] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
> > [   62.258432] Adding 2939900k swap on /dev/zram0.  Priority:100 extents:1 across:2939900k SSDscFS
> > [   62.285513] RIP: 0010:cxl_nvdimm_probe+0x8d/0x130 [cxl_pmem]
> > [   62.285529] Code: 85 c0 0f 85 90 00 00 00 f0 80 0c 24 40 f0 80 4c 24 08 10 f0 80 4c 24 08 20 f0 80 4c 24 08 40 49 8d 84 24 b8 04 00 00 4c 89 0
> > [   62.285531] RSP: 0018:ffffacff0141fc38 EFLAGS: 00010202
> > [   62.285534] RAX: ffff97a8a37b84b8 RBX: ffff97a8a37b8000 RCX: 0000000000000000
> > [   62.285536] RDX: 0000000000000001 RSI: ffff97a8a37b8000 RDI: 00000000ffffffff
> > [   62.285537] RBP: ffff97a8a37b8000 R08: 0000000000000001 R09: 0000000000000001
> > [   62.285538] R10: 0000000000000001 R11: 0000000000000000 R12: ffff97a8a37b8000
> > [   62.285539] R13: ffff97a982c3dc28 R14: 0000000000000000 R15: 0000000000000000
> > [   62.285541] FS:  00007f2619829580(0000) GS:ffff97a9bca00000(0000) knlGS:0000000000000000
> > [   62.285542] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   62.285544] CR2: 00000000000004c0 CR3: 00000001056a8000 CR4: 00000000000006e0
> > [   62.285653] Call Trace:
> > [   62.285656]  <TASK>
> > [   62.285660]  cxl_bus_probe+0x17/0x50
> > [   62.285691]  really_probe+0xde/0x380
> > [   62.285695]  ? pm_runtime_barrier+0x50/0x90
> > [   62.285700]  __driver_probe_device+0x78/0x170
> > [   62.285846]  driver_probe_device+0x1f/0x90
> > [   62.285850]  __driver_attach+0xd2/0x1c0
> > [   62.285853]  ? __pfx___driver_attach+0x10/0x10
> > [   62.285856]  bus_for_each_dev+0x76/0xa0
> > [   62.285860]  bus_add_driver+0x1b1/0x200
> > [   62.285863]  driver_register+0x89/0xe0
> > [   62.285868]  ? __pfx_init_module+0x10/0x10 [cxl_pmem]
> > [   62.285874]  cxl_pmem_init+0x50/0xff0 [cxl_pmem]
> > [   62.285880]  do_one_initcall+0x6e/0x330
> > [   62.285888]  do_init_module+0x4a/0x200
> > [   62.285892]  __do_sys_finit_module+0x93/0xf0
> > [   62.285899]  do_syscall_64+0x5b/0x80
> > [   62.285904]  ? do_syscall_64+0x67/0x80
> > [   62.285906]  ? asm_exc_page_fault+0x22/0x30
> > [   62.285910]  ? lockdep_hardirqs_on+0x7d/0x100
> > [   62.285914]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> > [   62.285917] RIP: 0033:0x7f2619b0afbd
> > [   62.285920] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 8
> > [   62.285922] RSP: 002b:00007ffcc516bf58 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> > [   62.285924] RAX: ffffffffffffffda RBX: 00005557c0dcaa60 RCX: 00007f2619b0afbd
> > [   62.285925] RDX: 0000000000000000 RSI: 00007f261a18743c RDI: 0000000000000006
> > [   62.285926] RBP: 00007f261a18743c R08: 0000000000000000 R09: 00007f261a17bb52
> > [   62.285927] R10: 0000000000000006 R11: 0000000000000246 R12: 0000000000020000
> > [   62.285928] R13: 00005557c0dbbce0 R14: 0000000000000000 R15: 00005557c0dc18a0
> > [   62.285932]  </TASK>
> > [   62.285933] Modules linked in: cxl_pmem(+) snd_pcm libnvdimm snd_timer snd joydev bochs cxl_mem drm_vram_helper parport_pc soundcore drm_ttm_g
> > [   62.285954] CR2: 00000000000004c0
> > [   62.288385] ---[ end trace 0000000000000000 ]---
> > [   63.203514] RIP: 0010:cxl_nvdimm_probe+0x8d/0x130 [cxl_pmem]
> > [   63.203562] Code: 85 c0 0f 85 90 00 00 00 f0 80 0c 24 40 f0 80 4c 24 08 10 f0 80 4c 24 08 20 f0 80 4c 24 08 40 49 8d 84 24 b8 04 00 00 4c 89 0
> > [   63.203565] RSP: 0018:ffffacff0141fc38 EFLAGS: 00010202
> > [   63.203570] RAX: ffff97a8a37b84b8 RBX: ffff97a8a37b8000 RCX: 0000000000000000
> > [   63.203572] RDX: 0000000000000001 RSI: ffff97a8a37b8000 RDI: 00000000ffffffff
> > [   63.203574] RBP: ffff97a8a37b8000 R08: 0000000000000001 R09: 0000000000000001
> > [   63.203576] R10: 0000000000000001 R11: 0000000000000000 R12: ffff97a8a37b8000
> > [   63.203577] R13: ffff97a982c3dc28 R14: 0000000000000000 R15: 0000000000000000
> > [   63.203580] FS:  00007f2619829580(0000) GS:ffff97a9bca00000(0000) knlGS:0000000000000000
> > [   63.203583] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   63.203585] CR2: 00000000000004c0 CR3: 00000001056a8000 CR4: 00000000000006e0
> > 
> 
> I clearly need to run some more rests as not seen this issue (and I've
> had a couple of reports of it now).  I guess I never tend to be running
> a completely clean tree on either side + testing is mostly on arm64
> (though I doubt that matters). It's not the pass through decoder issues as
> that is visible only when bringing up a region.

OK so I should drop this from my queue for now?


> > 
> > 
> > Next i reverted the QEMU branch to the commit just before the type-3
> > volatile commit and used the old method of launching with a type-3 pmem
> > device
> > 
> > Config:
> > sudo /opt/qemu-cxl/bin/qemu-system-x86_64 \
> > -drive file=/var/lib/libvirt/images/cxl.qcow2,format=qcow2,index=0,media=disk,id=hd \
> > -m 2G,slots=4,maxmem=4G \
> > -smp 4 \
> > -machine type=q35,accel=kvm,cxl=on \
> > -enable-kvm \
> > -nographic \
> > -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 \
> > -device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 \
> > -object memory-backend-file,pmem=true,id=cxl-mem0,mem-path=/tmp/cxl-mem0,size=1G \
> > -object memory-backend-file,pmem=true,id=lsa0,mem-path=/tmp/cxl-lsa0,size=1G \
> > -device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 \
> > -M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=1G
> > 
> > 
> > Result: Similar stack trace
> > [   29.850023] BUG: kernel NULL pointer dereference, address: 00000000000004c0
> > [   29.882400] RIP: 0010:cxl_nvdimm_probe+0x8d/0x130 [cxl_pmem]
> > [   29.957485] Call Trace:
> > [   29.959067]  <TASK>
> > [   29.962176]  cxl_bus_probe+0x17/0x50
> > [   29.964940]  really_probe+0xde/0x380
> > [   29.969065]  ? pm_runtime_barrier+0x50/0x90
> > [   29.973419]  __driver_probe_device+0x78/0x170
> > [   29.977183]  driver_probe_device+0x1f/0x90
> > [   29.984212]  __driver_attach+0xd2/0x1c0
> > [   29.988463]  ? __pfx___driver_attach+0x10/0x10
> > [   29.992379]  bus_for_each_dev+0x76/0xa0
> > [   29.997040]  bus_add_driver+0x1b1/0x200
> > [   30.000368]  driver_register+0x89/0xe0
> > [   30.004579]  ? __pfx_init_module+0x10/0x10 [cxl_pmem]
> > [   30.012403]  cxl_pmem_init+0x50/0xff0 [cxl_pmem]
> > [   30.019394]  do_one_initcall+0x6e/0x330
> > [   30.024028]  do_init_module+0x4a/0x200
> > [   30.029243]  __do_sys_finit_module+0x93/0xf0
> > [   30.034943]  do_syscall_64+0x5b/0x80
> > [   30.039844]  ? do_syscall_64+0x67/0x80
> > [   30.045163]  ? do_syscall_64+0x67/0x80
> > [   30.049729]  ? lock_release+0x14b/0x440
> > [   30.054055]  ? seqcount_lockdep_reader_access.constprop.0+0x82/0x90
> > [   30.061039]  ? lock_is_held_type+0xe8/0x140
> > [   30.067625]  ? do_syscall_64+0x67/0x80
> > [   30.071909]  ? lockdep_hardirqs_on+0x7d/0x100
> > [   30.079037]  ? do_syscall_64+0x67/0x80
> > [   30.084537]  ? do_syscall_64+0x67/0x80
> > [   30.089091]  ? do_syscall_64+0x67/0x80
> > [   30.094174]  ? lockdep_hardirqs_on+0x7d/0x100
> > [   30.099224]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> > [   30.104446] RIP: 0033:0x7f000550afbd


