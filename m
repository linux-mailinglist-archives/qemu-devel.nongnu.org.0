Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791C9392A36
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 11:04:13 +0200 (CEST)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmBw4-0007YH-8R
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 05:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmBti-00063E-P3
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmBtf-0007GJ-7M
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622106101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5CiivE3Vnn0R5qTnBTFv6hBLIZ7Lvp+YBUi/WevVtdA=;
 b=fvxTdkfl7DNZVAO+UTlNOSJh7lnsegEr0vER5Crux3BhAim+AkYA2XLts6iH3GINkCRMLQ
 od7Cl92f0981xPdE2mD0clkiXohS7fhztQMAQDrL8BnujJv22jzTSTfkdTtn0ALJIyH9kQ
 dHjaENJpK2JfmuQzLannjuX+9wYDR/k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-8h5CmXtSNzaSU-JSI00PVQ-1; Thu, 27 May 2021 05:01:39 -0400
X-MC-Unique: 8h5CmXtSNzaSU-JSI00PVQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j71-20020a1c234a0000b0290192d5ad58d9so1094965wmj.4
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5CiivE3Vnn0R5qTnBTFv6hBLIZ7Lvp+YBUi/WevVtdA=;
 b=EXP5138scA/vy0Xz/yENjVZ4Zxw/fdI/HBF5H7KuH1WA4dhtWTYO9ncwjuoqkH7ZUr
 2wdNclBUHpxuKIEyrL1lOiqmdobwM3cYlucZaDqq6UHho9orPmcimFdgMCEMns7WekJk
 MAasTJRexvcONu5tZhQLcl+PEegmfvlXrZBe+78AmzWZOZnlsQOXV++nHcwJxR3A++1Q
 6jpYuYTlI4vO9cG5CxskpFmR7OIqJgXgCuKoDUJE8EwZwqmrw7aFZiYdL2Fz+HZVO6AF
 2m4sk73oD8nmjUXkkxUOXWXvrvDvzWCFn4N63jhWPWaUfiu7xNhvOepFqIv2UKzAFr4i
 N/gA==
X-Gm-Message-State: AOAM532XTqoszxCcOEt5LIwg6k2XK4m+N1dFvCKOZPJ1EM+dCBmDSSU9
 O/IQ2ZgSD9tnlRJXHVjejjPMp4d8G7ssSbg7a8WVF1IiMvo0/P4JMEwn/bm/foz9okQTeebb5lx
 +rVN48YeRLD6dBRc=
X-Received: by 2002:a5d:618f:: with SMTP id j15mr2159481wru.273.1622106098684; 
 Thu, 27 May 2021 02:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6t06kgGMpsbHr3NQEiAmofF4RM5HNwsCcMMtfwPaaXZQqEnPOl+QpNlz9weesFO43T00x5A==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr2159453wru.273.1622106098492; 
 Thu, 27 May 2021 02:01:38 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id y22sm11306208wma.36.2021.05.27.02.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 02:01:37 -0700 (PDT)
Subject: Re: Windows fails to boot after rebase to QEMU master
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Siddharth Chandrasekaran <sidcha@amazon.de>
References: <20210521091451.GA6016@u366d62d47e3651.ant.amazon.com>
 <20210524055322-mutt-send-email-mst@kernel.org> <YK6hunkEnft6VJHz@work-vm>
 <d71fee00-0c21-c5e8-dbc6-00b7ace11c5a@suse.de> <YK9Y64U0wjU5K753@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <16a5085f-868b-7e1a-f6de-1dab16103a66@redhat.com>
Date: Thu, 27 May 2021 11:01:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK9Y64U0wjU5K753@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 10:31 AM, Dr. David Alan Gilbert wrote:
> * Claudio Fontana (cfontana@suse.de) wrote:
>> On 5/26/21 9:30 PM, Dr. David Alan Gilbert wrote:
>>> * Michael S. Tsirkin (mst@redhat.com) wrote:
>>>> On Fri, May 21, 2021 at 11:17:19AM +0200, Siddharth Chandrasekaran wrote:
>>>>> After a rebase to QEMU master, I am having trouble booting windows VMs.
>>>>> Git bisect indicates commit f5cc5a5c1686 ("i386: split cpu accelerators
>>>>> from cpu.c, using AccelCPUClass") to have introduced the issue. I spent
>>>>> some time looking at into it yesterday without much luck.
>>>>>
>>>>> Steps to reproduce:
>>>>>
>>>>>     $ ./configure --enable-kvm --disable-xen --target-list=x86_64-softmmu --enable-debug
>>>>>     $ make -j `nproc`
>>>>>     $ ./build/x86_64-softmmu/qemu-system-x86_64 \
>>>>>         -cpu host,hv_synic,hv_vpindex,hv_time,hv_runtime,hv_stimer,hv_crash \
>>>>>         -enable-kvm \
>>>>>         -name test,debug-threads=on \
>>>>>         -smp 1,threads=1,cores=1,sockets=1 \
>>>>>         -m 4G \
>>>>>         -net nic -net user \
>>>>>         -boot d,menu=on \
>>>>>         -usbdevice tablet \
>>>>>         -vnc :3 \
>>>>>         -machine q35,smm=on \
>>>>>         -drive if=pflash,format=raw,readonly=on,unit=0,file="../OVMF_CODE.secboot.fd" \
>>>>>         -drive if=pflash,format=raw,unit=1,file="../OVMF_VARS.secboot.fd" \
>>>>>         -global ICH9-LPC.disable_s3=1 \
>>>>>         -global driver=cfi.pflash01,property=secure,value=on \
>>>>>         -cdrom "../Windows_Server_2016_14393.ISO" \
>>>>>         -drive file="../win_server_2016.qcow2",format=qcow2,if=none,id=rootfs_drive \
>>>>>         -device ahci,id=ahci \
>>>>>         -device ide-hd,drive=rootfs_drive,bus=ahci.0
>>>>>
>>>>> If the issue is not obvious, I'd like some pointers on how to go about
>>>>> fixing this issue.
>>>>>
>>>>> ~ Sid.
>>>>>
>>>>
>>>> At a guess this commit inadvertently changed something in the CPU ID.
>>>> I'd start by using a linux guest to dump cpuid before and after the
>>>> change.
>>>
>>> I've not had a chance to do that yet, however I did just end up with a
>>> bisect of a linux guest failure bisecting to the same patch:
>>>
>>> [dgilbert@dgilbert-t580 qemu]$ git bisect bad
>>> f5cc5a5c168674f84bf061cdb307c2d25fba5448 is the first bad commit
>>> commit f5cc5a5c168674f84bf061cdb307c2d25fba5448
>>> Author: Claudio Fontana <cfontana@suse.de>
>>> Date:   Mon Mar 22 14:27:40 2021 +0100
>>>
>>>     i386: split cpu accelerators from cpu.c, using AccelCPUClass
>>>     
>>>     i386 is the first user of AccelCPUClass, allowing to split
>>>     cpu.c into:
>>>     
>>>     cpu.c            cpuid and common x86 cpu functionality
>>>     host-cpu.c       host x86 cpu functions and "host" cpu type
>>>     kvm/kvm-cpu.c    KVM x86 AccelCPUClass
>>>     hvf/hvf-cpu.c    HVF x86 AccelCPUClass
>>>     tcg/tcg-cpu.c    TCG x86 AccelCPUClass

Well this is a big commit... I'm not custom to x86 target, and am
having hard time following the cpu host/max change.

Is it working when you use '-cpu max,...' instead of '-cpu host,'?


