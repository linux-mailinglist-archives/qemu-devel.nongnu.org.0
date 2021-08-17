Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900FF3EE881
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 10:28:46 +0200 (CEST)
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFuSj-0004lS-Jy
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 04:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mFuRR-00044m-CG
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:27:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mFuRO-0004dc-B6
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629188840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ceHLT5P36gmNvlAFzJKhj08gfj+AmXIlpvsGDwaEzA=;
 b=JRGzkcKuVR7QLMcUlodP3jojMh8J1Gef5IQ0TCf1i6Qqo/9gFV9J7JvO6+M8TyCEGjz+/3
 xm9XJSx+S7T+DADE1wtfraI6oX0ddnMCnGCLQkFl/SGmqhxyVnwcwmJFJJP7tOZUOBmBUx
 Z0GQfx2GmldIEQ5PFAJDNNhjSYVWsKY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-P8soZnZiOweFVdDBXRM7yg-1; Tue, 17 Aug 2021 04:27:19 -0400
X-MC-Unique: P8soZnZiOweFVdDBXRM7yg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e12-20020a05600c218cb02902e6bbacdcd1so618259wme.4
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 01:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1ceHLT5P36gmNvlAFzJKhj08gfj+AmXIlpvsGDwaEzA=;
 b=dfGAsx6L+dAlfDr2A6vRb0++FGtMXACD0Negij6QKHrL2kxi/9qBk5ta4dq8MjJYyF
 kiNDUBDfXzOVBZ3u5V439NGrA3VsPA8VHHGafE2eTvrSBkRX7m0JGQdGXzoZyziukS+r
 6IzEF3Xp7jKHHlle7aHsjnhwk6w6+/0xknL+ZR0Q8v+9OBUhGQPMVSaT47X0vdt84Q6Z
 ssyHOtXT+dv3J0NHWXxACxBAGsyA8cdxjzkWn96wkQ/BnhL9pc5Fo/k4N38bcvdVBpGH
 h79xKY7iSQ797NbtIyi2/RPzONuDJ/kkxWzX/J2FoXn4XD9SsQPiihWucyyQeTO1CcNo
 Rwvg==
X-Gm-Message-State: AOAM531XEJZE1aeiakMuMwmPNEU2S1MazCyUejh00z8TxccrJOnJ5lFA
 w+xH6cVC5PLlBaQK/FA3Ik1H2ILEZ84IgoakTvFLl/4vWhhRlV9myEwTZHnThRsO4IQlxLHrBev
 vfFUt7M3J5xpTW0U=
X-Received: by 2002:a05:6000:14f:: with SMTP id
 r15mr2617013wrx.18.1629188838377; 
 Tue, 17 Aug 2021 01:27:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk2ekawaXoM/A+1VbyP7sL4MQDNHPf8bJbm70r+hjrywxlKwMOBScHkAGkPGILHP486Qm56w==
X-Received: by 2002:a05:6000:14f:: with SMTP id
 r15mr2616980wrx.18.1629188838117; 
 Tue, 17 Aug 2021 01:27:18 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 f17sm1542757wrt.49.2021.08.17.01.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 01:27:17 -0700 (PDT)
Subject: Re: [PATCH v3 09/10] virtiofsd: Optionally fill lo_inode.fhandle
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-10-mreitz@redhat.com> <YRF2xjwSKOiqB/Al@redhat.com>
 <df64553c-c03d-076a-bcef-bec8554977a4@redhat.com>
 <YRKZ415xrDtcYaQR@redhat.com>
 <4a74bbbd-92f6-a7d1-0c8d-fa8b121b9643@redhat.com>
 <YRKh/fbBntF+GfS8@redhat.com>
 <6e943ee0-dcb3-6812-3a0b-eb2b72b503ad@redhat.com>
 <YRrALRGy2cROwsP9@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <89b416e7-c0ca-7831-da13-683e8a74b7ae@redhat.com>
Date: Tue, 17 Aug 2021 10:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRrALRGy2cROwsP9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Ioannis Angelakopoulos <jaggel@bu.edu>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.08.21 21:44, Vivek Goyal wrote:
> On Wed, Aug 11, 2021 at 08:41:18AM +0200, Hanna Reitz wrote:
>
> [..]
>>>> But given the inotify complications, there’s really a good reason we should
>>>> use mountinfo.
>>>>
>>>>>> It’s a bit tricky because our sandboxing prevents easy access to mountinfo,
>>>>>> but if that’s the only way...
>>>>> yes. We already have lo->proc_self_fd. Maybe we need to keep
>>>>> /proc/self/mountinfo open in lo->proc_self_mountinfo. I am assuming
>>>>> that any mount table changes will still be visible despite the fact
>>>>> I have fd open (and don't have to open new fd to notice new mount/unmount
>>>>> changes).
>>>> Well, yes, that was my idea.  Unfortunately, I wasn’t quite successful yet;
>>>> when I tried keeping the fd open, reading from it would just return 0
>>>> bytes.  Perhaps that’s because we bind-mount /proc/self/fd to /proc so that
>>>> nothing else in /proc is visible. Perhaps we need to bind-mount
>>>> /proc/self/mountinfo into /proc/self/fd before that...
>>> Or perhaps open /proc/self/mountinfo and save fd in lo->proc_mountinfo
>>> before /proc/self/fd is bind mounted on /proc?
>> Yes, I tried that, and then reading would just return 0 bytes.
> Hi Hanna,
>
> I tried this simple patch and I can read /proc/self/mountinfo before
> bind mounting /proc/self/fd and after bind mounting /proc/self/fd. Am
> I missing something.

Yes, but I tried reading it in the main loop (where we’d actually need 
it).  It looks like the umount2(".", MNT_DETACH) in setup_mounts() 
breaks it.

Hanna


