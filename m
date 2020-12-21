Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670D2DFBBC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 13:09:09 +0100 (CET)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krJzw-00057b-6N
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 07:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1krJxl-0004Gx-Sh
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:06:53 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1krJxh-0002OJ-Rr
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:06:53 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x18so5509657pln.6
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 04:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n8y3mHUXGs07WLscaYtv5gnc3I6afpOm79QHfAlg+LI=;
 b=XwNU4dHDGzotxWRU84UfOa/i3091eDuPJQt3WX4G1tWg7MVF7yty3bsH9fxMhVTSzI
 ofKPKdqoPxARnLRYdIenHy8sLIJbHjqgwt+WMRUVhgl5L3svvcnn+qC69hGCgHPuT8HM
 qNKLTYmgJhUxHAydAA7t+rTdxHo2a/IRm6Oc2rt15G08UEoY4adfuNuI49tUpVdpfhVi
 ODrKTefPzgH2Os9F94+rWnAwOC/Lbuw0GUtJt4bIiaRa1yeaRkMPHDBFGGASlE4v3Mqz
 m+Y9dNNNpwzgWnQp/xgkqYssyw54g6BBCtgJ4KWS7X67DTxYts8JKEc9k695J33WxjJB
 GlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n8y3mHUXGs07WLscaYtv5gnc3I6afpOm79QHfAlg+LI=;
 b=L8Z6Y8J85IFT6PL2zMbfvV9hLE2IO+Tc/6byHB8HpuO0PT5UJL6CsXdbxFVnWkQQvK
 jbieQROpo0ZYJgmnVsLGEYijE/93VWYYpLba3KL7nYAHnMNyjkYEI2Byz8z0Wdj08rNs
 YEB+LcyyYp+DQokOc6iLmasz/RDGy6nMdPhrN3sn4s00g7lFLr+k9DHzDYvwnpuUYQuO
 AIixAaUr/pCyG7en7jFD7dzc4b2C55NLAG6V3aJxmXHks8eQaApeVLwU5+y+JOefwNbY
 GkwxO87zK4ox9rKGY0SEC2sxDXM+nI1qH5liPFjiwyOkDjwEixjRzR/48L9qwBamnTuB
 QQfA==
X-Gm-Message-State: AOAM532iHp/Nd9UrCNDAAtMAwDRXW8RQ+7coINy0+nXyrsihkH4hMDE6
 5UGKK2DkC3vKK6CrqAPBPSaQxQ==
X-Google-Smtp-Source: ABdhPJwVGbStVKS1Wyntx/OZouofaafKKLrlv0LegxVSAJoa9OTpYkiGU7AGqCvSnQsOm0bBN6rMGQ==
X-Received: by 2002:a17:90a:df81:: with SMTP id
 p1mr17488952pjv.158.1608552405798; 
 Mon, 21 Dec 2020 04:06:45 -0800 (PST)
Received: from [192.168.10.153] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id f67sm10084317pfg.159.2020.12.21.04.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 04:06:44 -0800 (PST)
Subject: Re: [PATCH qemu v12] spapr: Implement Open Firmware client interface
To: Greg Kurz <groug@kaod.org>
References: <20201218025040.98132-1-aik@ozlabs.ru>
 <20201218150413.44da862d@bahia.lan>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <f6d39e3e-e4e8-4397-b83a-9e51fd54c0d4@ozlabs.ru>
Date: Mon, 21 Dec 2020 23:06:40 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201218150413.44da862d@bahia.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/12/2020 01:04, Greg Kurz wrote:
> On Fri, 18 Dec 2020 13:50:40 +1100
> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> 
>> The PAPR platform which describes an OS environment that's presented by
>> a combination of a hypervisor and firmware. The features it specifies
>> require collaboration between the firmware and the hypervisor.
>>
>> Since the beginning, the runtime component of the firmware (RTAS) has
>> been implemented as a 20 byte shim which simply forwards it to
>> a hypercall implemented in qemu. The boot time firmware component is
>> SLOF - but a build that's specific to qemu, and has always needed to be
>> updated in sync with it. Even though we've managed to limit the amount
>> of runtime communication we need between qemu and SLOF, there's some,
>> and it has become increasingly awkward to handle as we've implemented
>> new features.
>>
>> This implements a boot time OF client interface (CI) which is
>> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>> which implements Open Firmware Client Interface (OF CI). This allows
>> using a smaller stateless firmware which does not have to manage
>> the device tree.
>>
>> The new "vof.bin" firmware image is included with source code under
>> pc-bios/. It also includes RTAS blob.
>>
>> This implements a handful of CI methods just to get -kernel/-initrd
>> working. In particular, this implements the device tree fetching and
>> simple memory allocator - "claim" (an OF CI memory allocator) and updates
>> "/memory@0/available" to report the client about available memory.
>>
>> This implements changing some device tree properties which we know how
>> to deal with, the rest is ignored. To allow changes, this skips
>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>> appending.
>>
>> In absence of SLOF, this assigns phandles to device tree nodes to make
>> device tree traversing work.
>>
>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>
>> This adds basic instances support which are managed by a hash map
>> ihandle -> [phandle].
>>
>> Before the guest started, the used memory is:
>> 0..4000 - the initial firmware
>> 10000..180000 - stack
>>
>> This OF CI does not implement "interpret".
>>
>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>> includes a disk image with pre-formatted nvram.
>>
>> With this basic support, this can only boot into kernel directly.
>> However this is just enough for the petitboot kernel and initradmdisk to
>> boot from any possible source. Note this requires reasonably recent guest
>> kernel with:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>> The example command line is:
>>
>> -c 0 /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>> -nodefaults \
>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>> -mon id=MON0,chardev=STDIO0,mode=readline \
>> -nographic \
>> -vga none \
>> -enable-kvm \
>> -m 2G \
>> -machine pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
>> -kernel pbuild/kernel-le-guest/vmlinux \
>> -initrd t/le.cpio \
>> -drive id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof/nvram.bin,format=raw \
>> -global spapr-nvram.drive=DRIVE0 \
>> -snapshot \
>> -smp 8,threads=8 \
>> -L /home/aik/t/qemu-ppc64-bios/ \
>> -trace events=qemu_trace_events \
>> -d guest_errors \
>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>> -mon chardev=SOCKET0,mode=control
>>
>> ---
>> Changes:
>> v12:
>> * split VOF and SPAPR
>>
> 
> Thanks for the split. The VOF paths are now clearly identified in
> the sPAPR code, and well guarded by a check on x-vof. Rest of the
> patch looks good to me. I gave it a try with a stock fedora 33
> kernel and initramfs and it booted really fast !
 >
> With the checkpatch complaints addressed,


They all are about the firmware, not QEMU ifself, do we enforce it for 
such things as firmwares too?


> 
> Acked-by: Greg Kurz <groug@kaod.org>
> 
> and
> 
> Tested-by: Greg Kurz <groug@kaod.org>


Thanks! Now I am thinking whether someone may want to use it for 
something else, like... dunno... ARM? :)


-- 
Alexey

