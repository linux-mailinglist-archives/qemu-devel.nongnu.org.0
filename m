Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B28392930
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 10:04:10 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAzw-0002Gt-Pj
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 04:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lmAyz-0001Z7-VQ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 04:03:09 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:57108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lmAyx-00021P-Oi
 for qemu-devel@nongnu.org; Thu, 27 May 2021 04:03:09 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9C4401FD31;
 Thu, 27 May 2021 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622102580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DffSY7eeZ/ziqjvdDpc1oguX2uS7d0cEP+7HsI888d0=;
 b=bseJZeotHHp8lmbHvtpvc1wSk3xcZXDe1l782gJhXwib2zB4XcHcT6TVdnnPwX9neOCP5w
 9/JKluWh/WGMkYrZLzIoJp3YlFQFGI8sqDYGxZwA4NNNfPyakQlTS0MunVRC5s1/AfNn5F
 jzqpU0kdKlPbWpWGJgeYQ6BYPN276xg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622102580;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DffSY7eeZ/ziqjvdDpc1oguX2uS7d0cEP+7HsI888d0=;
 b=xNqbTE7cWgaZNFcG0kCxKEdK5H3shZIL9wi3OQFK4KYXV421Tgtt7kMZcNFGbYIKiqFVAZ
 vDQhUpDoHA0KjDCA==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id D90FF11CD6;
 Thu, 27 May 2021 07:57:33 +0000 (UTC)
Subject: Re: Windows fails to boot after rebase to QEMU master
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210521091451.GA6016@u366d62d47e3651.ant.amazon.com>
 <20210524055322-mutt-send-email-mst@kernel.org> <YK6hunkEnft6VJHz@work-vm>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d71fee00-0c21-c5e8-dbc6-00b7ace11c5a@suse.de>
Date: Thu, 27 May 2021 09:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YK6hunkEnft6VJHz@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Siddharth Chandrasekaran <sidcha@amazon.de>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 9:30 PM, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
>> On Fri, May 21, 2021 at 11:17:19AM +0200, Siddharth Chandrasekaran wrote:
>>> After a rebase to QEMU master, I am having trouble booting windows VMs.
>>> Git bisect indicates commit f5cc5a5c1686 ("i386: split cpu accelerators
>>> from cpu.c, using AccelCPUClass") to have introduced the issue. I spent
>>> some time looking at into it yesterday without much luck.
>>>
>>> Steps to reproduce:
>>>
>>>     $ ./configure --enable-kvm --disable-xen --target-list=x86_64-softmmu --enable-debug
>>>     $ make -j `nproc`
>>>     $ ./build/x86_64-softmmu/qemu-system-x86_64 \
>>>         -cpu host,hv_synic,hv_vpindex,hv_time,hv_runtime,hv_stimer,hv_crash \
>>>         -enable-kvm \
>>>         -name test,debug-threads=on \
>>>         -smp 1,threads=1,cores=1,sockets=1 \
>>>         -m 4G \
>>>         -net nic -net user \
>>>         -boot d,menu=on \
>>>         -usbdevice tablet \
>>>         -vnc :3 \
>>>         -machine q35,smm=on \
>>>         -drive if=pflash,format=raw,readonly=on,unit=0,file="../OVMF_CODE.secboot.fd" \
>>>         -drive if=pflash,format=raw,unit=1,file="../OVMF_VARS.secboot.fd" \
>>>         -global ICH9-LPC.disable_s3=1 \
>>>         -global driver=cfi.pflash01,property=secure,value=on \
>>>         -cdrom "../Windows_Server_2016_14393.ISO" \
>>>         -drive file="../win_server_2016.qcow2",format=qcow2,if=none,id=rootfs_drive \
>>>         -device ahci,id=ahci \
>>>         -device ide-hd,drive=rootfs_drive,bus=ahci.0
>>>
>>> If the issue is not obvious, I'd like some pointers on how to go about
>>> fixing this issue.
>>>
>>> ~ Sid.
>>>
>>
>> At a guess this commit inadvertently changed something in the CPU ID.
>> I'd start by using a linux guest to dump cpuid before and after the
>> change.
> 
> I've not had a chance to do that yet, however I did just end up with a
> bisect of a linux guest failure bisecting to the same patch:
> 
> [dgilbert@dgilbert-t580 qemu]$ git bisect bad
> f5cc5a5c168674f84bf061cdb307c2d25fba5448 is the first bad commit
> commit f5cc5a5c168674f84bf061cdb307c2d25fba5448
> Author: Claudio Fontana <cfontana@suse.de>
> Date:   Mon Mar 22 14:27:40 2021 +0100
> 
>     i386: split cpu accelerators from cpu.c, using AccelCPUClass
>     
>     i386 is the first user of AccelCPUClass, allowing to split
>     cpu.c into:
>     
>     cpu.c            cpuid and common x86 cpu functionality
>     host-cpu.c       host x86 cpu functions and "host" cpu type
>     kvm/kvm-cpu.c    KVM x86 AccelCPUClass
>     hvf/hvf-cpu.c    HVF x86 AccelCPUClass
>     tcg/tcg-cpu.c    TCG x86 AccelCPUClass
>     
> 

Paolo, it seems to me that something went wrong in the merge of this commit.

The last version of the series I sent had this comment in the commit message,
as part of a very long series of rebases after review.

[claudio]: Rebased on commit b8184135 ("target/i386: allow modifying TCG phys-addr-bits")


While I do not see this comment in the commit posted here. So I suspect that an older version of the series was included?

The series is also available as:

https://github.com/hw-claudio/qemu.git "i386_cleanup_9"

Thanks,

Claudio




> The guest crash is:
> [   85.008985][ T1524] BUG: unable to handle page fault for address: ffffffff810d9c42
> [   85.012868][ T1524] #PF: supervisor write access in kernel mode
> [   85.012962][ T1524] #PF: error_code(0x0003) - permissions violation
> [   85.013043][ T1524] PGD 2224067 P4D 2224067 PUD 2225063 PMD 10001e1 
> [   85.013180][ T1524] Oops: 0003 [#1] SMP NOPTI
> [   85.013295][ T1524] CPU: 2 PID: 1524 Comm: blogbench Not tainted 5.11.0-rc7 #100
> [   85.013395][ T1524] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
> [   85.013546][ T1524] RIP: 0010:kvm_kick_cpu+0x22/0x30
> [   85.013630][ T1524] Code: 0f 1f 84 00 00 00 00 00 55 48 63 ff 48 c7 c0 78 11 01 00 48 8b 14 fd c0 36 11 82 48 89 e5 53 31 db 0f b7 0c 02 b8 05 00 00 00 <0f> 01 d9 5b 5d c3 0f 1f 84 00 00 00 00 00 55 48 89 e5 53 48 89 fb
> [   85.013852][ T1524] RSP: 0018:ffffc90000747c08 EFLAGS: 00010046
> [   85.013951][ T1524] RAX: 0000000000000005 RBX: 0000000000000000 RCX: 0000000000000000
> [   85.014058][ T1524] RDX: ffff88807c600000 RSI: 0000000000000100 RDI: 0000000000000000
> [   85.014153][ T1524] RBP: ffffc90000747c10 R08: ffff88807c72a800 R09: ffff88807ffd6000
> [   85.014248][ T1524] R10: 0000000000000001 R11: 0000000000000046 R12: ffff88807c72a800
> [   85.014343][ T1524] R13: 0000000000000000 R14: ffff888005409940 R15: ffff88807c72a818
> [   85.014437][ T1524] FS:  00007fa2f750a700(0000) GS:ffff88807c700000(0000) knlGS:0000000000000000
> [   85.014559][ T1524] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   85.014644][ T1524] CR2: ffffffff810d9c42 CR3: 0000000009016003 CR4: 0000000000370ea0
> [   85.014741][ T1524] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   85.014842][ T1524] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   85.014945][ T1524] Call Trace:
> [   85.014998][ T1524]  __pv_queued_spin_unlock_slowpath+0xa0/0xd0
> [   85.015103][ T1524]  __raw_callee_save___pv_queued_spin_unlock_slowpath+0x15/0x24
> [   85.015206][ T1524]  .slowpath+0x9/0x15
> [   85.015261][ T1524]  do_raw_spin_unlock+0x48/0xc0
> [   85.015333][ T1524]  _raw_spin_unlock_irq+0x1d/0x30
> [   85.015404][ T1524]  finish_task_switch+0xcc/0x2c0
> [   85.015478][ T1524]  __schedule+0x283/0x9a0
> [   85.015534][ T1524]  schedule+0x50/0xc0
> [   85.015588][ T1524]  request_wait_answer+0x126/0x240
> [   85.015667][ T1524]  ? finish_wait+0x90/0x90
> [   85.015740][ T1524]  fuse_simple_request+0x17c/0x2e0
> 
> the backtrace moves about a bit, but it always ends up as
> a page fault in kvm_kick_cpu.
> 
> My qemu commandline being:
> ./x86_64-softmmu/qemu-system-x86_64 -M pc,memory-backend=mem,accel=kvm -cpu host  -m 2G,maxmem=16G,slots=16 -smp 4 -object memory-backend-memfd,id=mem,size=2G,share=on -chardev socket,id=char0,path=/tmp/vhostqemu -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs -kernel /home/dgilbert/virtio-fs/kernel-builds/monolithic-dax-20210209a -initrd /home/dgilbert/virtio-fs/test-initramfs.img -chardev stdio,mux=on,id=mon -mon chardev=mon,mode=readline  -device virtio-serial-pci,disable-modern=on -device virtconsole,chardev=mon -object rng-random,id=objrng0,filename=/dev/urandom -device virtio-rng-pci,rng=objrng0,id=rng0,disable-legacy=on -vga none -append "console=hvc0  debug loglevel=9 systemd.journald.forward_to_console" -display none  -overcommit mem-lock=off -netdev user,id=usernet -device virtio-net-pci,netdev=usernet -name debug-threads=on
> 
> 
>>
>>>
>>>
>>> Amazon Development Center Germany GmbH
>>> Krausenstr. 38
>>> 10117 Berlin
>>> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
>>> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
>>> Sitz: Berlin
>>> Ust-ID: DE 289 237 879
>>>
>>>
>>
>>


