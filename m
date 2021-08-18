Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D73F0535
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 15:49:09 +0200 (CEST)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGLwK-0007y1-P7
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 09:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGLvY-0007Hv-2U
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGLvV-0001DY-Mn
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629294496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqgu16fGhxIctz+GQZ+aztTn6/NwSs4Vor04FxjQMsw=;
 b=dWfF3eJ8DWfDmoaSSzz+fmPabta+QocxAHP46hkng/39iqLehJf+Z+rSEuziV2Rkv5dL38
 Kq5EHB/lo1DHQeirFevMGex0R6ntBlFXXcR/RSlSn/W/X0kkm7ajcGp5d67pLSeOv+5/mB
 M8O1k3R2ClQGSKCxMmCaPGwbixRY9FE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-qBd0O16dPFGGckF92oTbhQ-1; Wed, 18 Aug 2021 09:48:15 -0400
X-MC-Unique: qBd0O16dPFGGckF92oTbhQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l19-20020a05600c4f13b029025b036c91c6so662682wmq.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 06:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=eqgu16fGhxIctz+GQZ+aztTn6/NwSs4Vor04FxjQMsw=;
 b=qwNXH/dsdvSdaDG5wDdUHRH2xjlfTBzLEGyzAgL4mf3wsEcy+12o/PS5310Myi5S4b
 eAuOz6QAA3dZWc1ybFNsUB+5syZ4cla1jl/H17w850rRaXZBwyJSMqpxh7JCfWaD+SHD
 LJ9YxvKvk4up4mGjM9iKn2KBHT8d8cNyiatptX0o3ZQY9daOvB2NbJXAkdIEcryro/Jt
 g8xGH+5JaAnCnCkbLPBINbl/5a/LPJvO2aQO201eYiK+IJwKRPgw7hvj9PxX2i9jC0KT
 3FGZ7Mzbgf7bFfn0SB/6q5s7O2pq4aezafa+hoqx7Z+pRzWSjf2/yDRPNjELxXRDGbdp
 MMJg==
X-Gm-Message-State: AOAM530CGc+P9k/kFKDFVbw2otY+y77OUkrjD9/emf5BP+WChFSBMcEz
 0fPRzSlMkZovE5I2wcQkemDr3UdRXmDr/oGxYNffSWp1qxIfT4ff3A4Hzh1fGi9Ae9nrNM2dNLF
 FmiSjjT4HHRHuEQ0=
X-Received: by 2002:a1c:f405:: with SMTP id z5mr6072603wma.33.1629294494298;
 Wed, 18 Aug 2021 06:48:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq9nc+nRmJnXZ9hT6+U3UFohfk9fRZCtuPo75j4ALoXQHwWkPSSLNC4NuzQ9y3ges3tx0Ajw==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr6072592wma.33.1629294494088;
 Wed, 18 Aug 2021 06:48:14 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 o11sm5875959wrj.47.2021.08.18.06.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 06:48:13 -0700 (PDT)
Subject: Re: [PATCH v3 09/10] virtiofsd: Optionally fill lo_inode.fhandle
To: Vivek Goyal <vgoyal@redhat.com>
References: <YRF2xjwSKOiqB/Al@redhat.com>
 <df64553c-c03d-076a-bcef-bec8554977a4@redhat.com>
 <YRKZ415xrDtcYaQR@redhat.com>
 <4a74bbbd-92f6-a7d1-0c8d-fa8b121b9643@redhat.com>
 <YRKh/fbBntF+GfS8@redhat.com>
 <6e943ee0-dcb3-6812-3a0b-eb2b72b503ad@redhat.com>
 <YRrALRGy2cROwsP9@redhat.com>
 <89b416e7-c0ca-7831-da13-683e8a74b7ae@redhat.com>
 <YRwRz8aZGq6QLpx/@redhat.com> <YRxQ9rClxWux/UHs@redhat.com>
 <YR0MBJs748Fvzvoz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <329e7574-b9fb-d9ae-2e4e-e0351d7a4160@redhat.com>
Date: Wed, 18 Aug 2021 15:48:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR0MBJs748Fvzvoz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Ioannis Angelakopoulos <jaggel@bu.edu>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.08.21 15:32, Vivek Goyal wrote:
> On Tue, Aug 17, 2021 at 08:14:46PM -0400, Vivek Goyal wrote:
>> On Tue, Aug 17, 2021 at 03:45:19PM -0400, Vivek Goyal wrote:
>>> On Tue, Aug 17, 2021 at 10:27:16AM +0200, Hanna Reitz wrote:
>>>> On 16.08.21 21:44, Vivek Goyal wrote:
>>>>> On Wed, Aug 11, 2021 at 08:41:18AM +0200, Hanna Reitz wrote:
>>>>>
>>>>> [..]
>>>>>>>> But given the inotify complications, there’s really a good reason we should
>>>>>>>> use mountinfo.
>>>>>>>>
>>>>>>>>>> It’s a bit tricky because our sandboxing prevents easy access to mountinfo,
>>>>>>>>>> but if that’s the only way...
>>>>>>>>> yes. We already have lo->proc_self_fd. Maybe we need to keep
>>>>>>>>> /proc/self/mountinfo open in lo->proc_self_mountinfo. I am assuming
>>>>>>>>> that any mount table changes will still be visible despite the fact
>>>>>>>>> I have fd open (and don't have to open new fd to notice new mount/unmount
>>>>>>>>> changes).
>>>>>>>> Well, yes, that was my idea.  Unfortunately, I wasn’t quite successful yet;
>>>>>>>> when I tried keeping the fd open, reading from it would just return 0
>>>>>>>> bytes.  Perhaps that’s because we bind-mount /proc/self/fd to /proc so that
>>>>>>>> nothing else in /proc is visible. Perhaps we need to bind-mount
>>>>>>>> /proc/self/mountinfo into /proc/self/fd before that...
>>>>>>> Or perhaps open /proc/self/mountinfo and save fd in lo->proc_mountinfo
>>>>>>> before /proc/self/fd is bind mounted on /proc?
>>>>>> Yes, I tried that, and then reading would just return 0 bytes.
>>>>> Hi Hanna,
>>>>>
>>>>> I tried this simple patch and I can read /proc/self/mountinfo before
>>>>> bind mounting /proc/self/fd and after bind mounting /proc/self/fd. Am
>>>>> I missing something.
>>>> Yes, but I tried reading it in the main loop (where we’d actually need it).
>>>> It looks like the umount2(".", MNT_DETACH) in setup_mounts() breaks it.
>>> Good point. I modified my code and notice too that after umoutn2() it
>>> always reads 0 bytes. I can understand that all the other mount points
>>> could go away but new rootfs mount point of virtiofsd should still be
>>> visible, IIUC. I don't understand why.
>>>
>>> Anyway, I tried re-opening /proc/self/mountinfo file after umount2(".",
>>> MNT_DETACH), and that seems to work and it shows root mount point. I
>>> created a bind mount and it shows that too.
>>>
>>> So looks like quick fix can be that we re-open /proc/self/mountinfo. But
>>> that means we can't bind /proc/self/fd on /proc/. We could bind mount
>>> /proc/self on /proc. Not sure is it safe enough.
>> Or may be I can do this.
>>
>> - Open O_PATH fd for /proc/self
>>    proc_self = open("/proc/self");
>> - Bind mount /proc/self/fd on /proc
>> - pivot_root() and umount() stuff
>> - Openat(proc_self, "mountinfo")
>> - close(proc_self)
>>
>> If this works, then we don't have the security issue and we managed
>> to open mountinfo after pivot_root() and umount(). Will give it a
>> try and see if it works tomorrow.
> Hi Hanna,
>
> This seems to work for me. I think key is to open mountinfo after
> pivot_root() and then it works. If it is opened before pivot_root()
> then it does not work. Not sure why.

Great, your code looks good to me.  I was afraid this was going to be 
really complicated, but that doesn’t look too bad.

Thanks!

Hanna


