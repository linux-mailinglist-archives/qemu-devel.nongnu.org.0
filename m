Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39AC32A294
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:53:32 +0100 (CET)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6Ox-0003J1-FU
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lH6Nw-0002bq-5f
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:52:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lH6Nr-0004Uz-Qn
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614696741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5u87E+hvZFjBI4L/GfFwUILJ3w8xmjt3Y366YJ7MAFk=;
 b=Y4rpYBORhO4Dn5EGfqVRQ39URGfF763BUdSvJqtv+30xXoWBiuH60k77uLSj47+xtgmYmr
 kbMNlZpxQT2rBiQY8PwOXP6OL2eB8U0lrbIQeHRVGeYtoAhr+wl9QUlgC+PcQraEkYKpLd
 6nI6ypDbgiVUACFbiaSQqwzRZVdTzYU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-wlWonxMIN0mo8XFOqU3-EA-1; Tue, 02 Mar 2021 09:52:16 -0500
X-MC-Unique: wlWonxMIN0mo8XFOqU3-EA-1
Received: by mail-wm1-f72.google.com with SMTP id n17so583694wmi.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 06:52:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5u87E+hvZFjBI4L/GfFwUILJ3w8xmjt3Y366YJ7MAFk=;
 b=tBr/bx5EwkKnRckuSRb41I1qByE7Kuy7gPOo4UwHROF62FY+VCqs0v25fvBjn9hZeO
 OXc5miV3cJpixJqfJr9PXjDYr5+AOuRePUgo7uH8+lF4I5MpJYhDf115vjlzfs0qmz9M
 7QsjHF2+qtgGr3glWq/wy0R18ebSvzz4XAgTA8WgkC8rKctxrslLbhzOOQcfz+VdVc2M
 JPzba6PFevLuA8J1Rp6qNzayE+jsLKyfgegaG9hxixUnbulGyIfsByr7HI4f2+bMNLRh
 F03ODEQv02+6tX72jG/sb8aU85L09TL9vA7KFTvjxSsHlGP35ST4EEQLHxTZPVK6qbw5
 zGaQ==
X-Gm-Message-State: AOAM530fGxLr/5Z+UJbOcRKt4mwQFYsRcsLMt2szEj6Gl/mI58K++HUA
 sFLnBGVJNTjb3s5j1mTsEX61avZ0Hl/08SxOYfVH6IyMtbl54unQojZUGNN8QJO6giOByT0DrOI
 C+kjzwu88d9QhRI8=
X-Received: by 2002:adf:fb03:: with SMTP id c3mr22715599wrr.395.1614696735707; 
 Tue, 02 Mar 2021 06:52:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGS6OPjnpsD0hrEcWsfAKtj99T5cHgrtHxD8occo4YzUkLho9J2nFV192MJXMhIZP4lF3vGg==
X-Received: by 2002:adf:fb03:: with SMTP id c3mr22715578wrr.395.1614696735410; 
 Tue, 02 Mar 2021 06:52:15 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id f7sm28749567wre.78.2021.03.02.06.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:52:14 -0800 (PST)
Date: Tue, 2 Mar 2021 15:52:11 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] KVM: x86: do not fail if software breakpoint has already
 been removed
Message-ID: <20210302145211.lha24tib3dtg6qig@steredhat>
References: <20210301111725.18434-1-pbonzini@redhat.com>
 <dd9b1ebe28be1df2a4b1715f60d451c0c6fb915f.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dd9b1ebe28be1df2a4b1715f60d451c0c6fb915f.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 02:56:40PM +0200, Maxim Levitsky wrote:
>On Mon, 2021-03-01 at 12:17 +0100, Paolo Bonzini wrote:
>> If kvm_arch_remove_sw_breakpoint finds that a software breakpoint does not
>> have an INT3 instruction, it fails.  This can happen if one sets a
>> software breakpoint in a kernel module and then reloads it.  gdb then
>> thinks the breakpoint cannot be deleted and there is no way to add it
>> back.
>>
>> Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  target/i386/kvm/kvm.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 0b5755e42b..c8d61daf68 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -4352,8 +4352,13 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
>>  {
>>      uint8_t int3;
>>
>> -    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0) || int3 != 0xcc ||
>> -        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
>> +    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0)) {
>> +        return -EINVAL;
>> +    }
>> +    if (int3 != 0xcc) {
>> +        return 0;
>> +    }
>> +    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
>>          return -EINVAL;
>>      }
>>      return 0;
>
>There still remains a philosopical question if kvm_arch_remove_sw_breakpoint
>should always return 0, since for the usual case of kernel debugging where
>a breakpoint is in unloaded module, the above will probably still fail
>as paging for this module is removed as well by the kernel.
>It is still better though so:
>
>Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
>
>Note that I managed to make lx-symbols to work in a very stable way
>with attached WIP patch I hacked on this Sunday.
>I will send a cleaned up version of it to upstream when I have time.
>
>Since I make gdb unload the symbols, it works even without this patch.
>
>Added Stefano Garzarella to CC as I know that he tried to make this work as well.
>https://lkml.org/lkml/2020/10/5/514

Thanks Maxim for CCing me!

Just a report when I tried these patches, but I'm not sure they are 
related.

I found that gdb 10 has some problem with QEMU:

     $ gdb --version
     GNU gdb (GDB) Fedora 10.1-2.fc33

     (gdb) lx-symbols
     loading vmlinux
     scanning for modules in linux/build
     ../../gdb/dwarf2/frame.c:1085: internal-error: Unknown CFA rule.

With gdb 9 'lx-symbols' works well, but I still have some issue when I 
put a breakpoint to a symbol not yet loaded (vsock_core_register in this 
example), then I load the module (vsock_loopback in this example) in the 
guest.

Whit your patch gdb stuck after loading the symbols of the first new 
module:
     (gdb) b vsock_core_register
     Function "vsock_core_register" not defined.
     Make breakpoint pending on future shared library load? (y or [n]) y
     Breakpoint 1 (vsock_core_register) pending.
     (gdb) c
     Continuing.
     loading @0xffffffffc00a1000: linux/build/net/vmw_vsock/vsock.ko

Without your patch, gdb loops infinitely reloading the new module:
     refreshing all symbols to reload module 'vsock'
     loading vmlinux
     loading @0xffffffffc00a1000: linux/build/net/vmw_vsock/vsock.ko
     loading @0xffffffffc00ad000: linux/build/drivers/net/tun.ko
     loading @0xffffffffc007e000: linux/build/net/bridge/bridge.ko
     loading @0xffffffffc0077000: linux/build/net/802/stp.ko
     loading @0xffffffffc0007000: linux/build/net/llc/llc.ko
     loading @0xffffffffc0013000: linux/build/net/sunrpc/sunrpc.ko
     loading @0xffffffffc000d000: linux/build/net/ipv4/netfilter/ip_tables.ko
     loading @0xffffffffc0000000: linux/build/net/netfilter/x_tables.ko
     refreshing all symbols to reload module 'vsock'
     loading vmlinux
     loading @0xffffffffc00a1000: linux/build/net/vmw_vsock/vsock.ko
     loading @0xffffffffc00ad000: linux/build/drivers/net/tun.ko
     ...

I'll try to get a better look at what's going on.

I'm using Linux v5.11 in the guest, and the master of QEMU (commit 
51db2d7cf26d05a961ec0ee0eb773594b32cc4a1) with Paolo's patch applied.

Thanks,
Stefano


