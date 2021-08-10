Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE13E7C24
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:27:33 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTfA-0007sZ-V8
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTe4-00078z-4o
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTe0-0006xb-5o
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628609179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jU7l5AIBF8t3CwMaWoBEanNrSFSGnNjpL7r+pbomak=;
 b=NXG67YPzrFhfwpCD7xycmyu6T9LeYoqkaw3iIDJSEPIcknBUhBAdJP6tz4vgBEbdmnEoxy
 tUIxA8OqKfiGJAl712snWlSd+zpVyid7KPAtAjSKOG6xmVFpMKyQ1HeRTb5+Ep6ekxpMpX
 vCmaAKY/XxyUQdmgQ/207/nBxQIJe9Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-ys-6lMC8OpWfIBIShDIVIA-1; Tue, 10 Aug 2021 11:26:18 -0400
X-MC-Unique: ys-6lMC8OpWfIBIShDIVIA-1
Received: by mail-wm1-f72.google.com with SMTP id
 u15-20020a05600c210fb02902e6a5231792so350441wml.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8jU7l5AIBF8t3CwMaWoBEanNrSFSGnNjpL7r+pbomak=;
 b=kp6zc3rTk4fh9jPi9lVhQ5nVvoX9KIeIs3qNss4RK0knjlxrsJvdz8VJnHCyc61UXM
 amYKZSYGFE7ClbAIW+7CDXx7f02DfXCoT9BsQQ5FWXwKoZI8iU3F9AmyArT1M2y7azOL
 Y79iol+rOjb4wpz7376WrkgTWcr7uRI3TXccj7jBwJtEukG/B9h3oJ8gfJIm2RWeI9eK
 FaywVv21QF/pagfgJmgFo79AkmeGY9E6eFEcOnHb5dQwrkBb/GyUCSEWjy0KfhR1XDae
 UYoPGdzBKVK4tsX2I6GIVYIyQb5d0RQK+7NkwygNk6jRpV8po6H1AlGqTTsPvOEkppVQ
 Edhg==
X-Gm-Message-State: AOAM533DOWGpG7CyhI8LYjbPhVNezbN30C3i5LkCPmez1zTCtSJy7RcG
 eD2GL7FhQFt3088YE/cBrWmH1EAeO6Owis3HUae73/hpB3lWbRdbG/bGVb251lL1U3kJ5F6/BVG
 cU0RdT4wDwimKWK0=
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr32880963wrn.308.1628609177223; 
 Tue, 10 Aug 2021 08:26:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylogVK1O0cSXgR0c5WylONpkik9fStoB8Fdc9kLquphNM1jdaDKxvLS0kpW6q5nqBn3kwj3w==
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr32880949wrn.308.1628609177018; 
 Tue, 10 Aug 2021 08:26:17 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 z2sm21494444wma.45.2021.08.10.08.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:26:16 -0700 (PDT)
Subject: Re: [PATCH v3 09/10] virtiofsd: Optionally fill lo_inode.fhandle
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-10-mreitz@redhat.com> <YRF2xjwSKOiqB/Al@redhat.com>
 <df64553c-c03d-076a-bcef-bec8554977a4@redhat.com>
 <YRKZ415xrDtcYaQR@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <4a74bbbd-92f6-a7d1-0c8d-fa8b121b9643@redhat.com>
Date: Tue, 10 Aug 2021 17:26:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRKZ415xrDtcYaQR@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 10.08.21 17:23, Vivek Goyal wrote:
> On Tue, Aug 10, 2021 at 10:32:55AM +0200, Hanna Reitz wrote:
>> On 09.08.21 20:41, Vivek Goyal wrote:
>>> On Fri, Jul 30, 2021 at 05:01:33PM +0200, Max Reitz wrote:
>>>> When the inode_file_handles option is set, try to generate a file handle
>>>> for new inodes instead of opening an O_PATH FD.
>>>>
>>>> Being able to open these again will require CAP_DAC_READ_SEARCH, so the
>>>> description text tells the user they will also need to specify
>>>> -o modcaps=+dac_read_search.
>>>>
>>>> Generating a file handle returns the mount ID it is valid for.  Opening
>>>> it will require an FD instead.  We have mount_fds to map an ID to an FD.
>>>> get_file_handle() fills the hash map by opening the file we have
>>>> generated a handle for.  To verify that the resulting FD indeed
>>>> represents the handle's mount ID, we use statx().  Therefore, using file
>>>> handles requires statx() support.
>>> So opening the file and storing that fd in mount_fds table might be
>>> a potential problem with inotify work Ioannis is doing.
>>>
>>> So say a file foo.txt was opened O_RDONLY and fd stored in mount_fs. Now
>>> say user unlinks foo.txt. If notifications are enabled, final notification
>>> will not be generated till this mount_fds fd is closed.
>>>
>>> Now question is when will this fd be closed? If it closed at some
>>> later point and then notification is generated, that will break
>>> notificaitons.
>> Currently, it is never closed.
>>
>>> In fact even O_PATH fd is delaying notifications due to same reason.
>>> But its not too bad as we close O_PATH fd pretty quickly after
>>> unlinking. And we were hoping that file handle support will get rid
>>> of this problem because we will not keep O_PATH fd open.
>>>
>>> But, IIUC, mount_fds stuff will make it even worse. I did not see
>>> the code which removes this fd from mount_fds. So I am not sure what's
>>> the life time of this fd.
>> The lifetime is forever.  If we wanted to remove it at some point, we’d need
>> to track how many file handles we have open for the given mount fd and then
>> remove it from the table once the count reaches 0, so it would still be
>> delayed.
>>
>> I think in practice the first thing that is looked up from some mount will
>> probably be the root directory, which cannot be deleted before everything
>> else on the mount is gone, so that would work.  We track how many handles
>> are there, if the whole mount were to be deleted, I hope all lo_inodes are
>> evicted, the count goes to 0, and we can drop the mount fd.
> Keeping a reference count on mount_fd object make sense. So we probably
> maintain this hash table and lookup using mount_id (as you are already
> doing). All subsequent inodes from same filesystem will use same
> object. Once all inodes have been flushed out, then mount_fd object
> should go away as well (allowing for unmount on host).
>
>> I think we can make the assumption that the mount fd is the root directory
>> certain by, well, looking into mountinfo...  That would result in us always
>> opening the root node of the filesystem, so that first the whole filesystem
>> needs to disappear before it can be deleted (and our mount fd closed) –
>> which should work, I guess?
> This seems more reasonable. And I think that's what man page seems to
> suggest.
>
>         The  mount_id  argument  returns an identifier for the filesystem mount
>         that corresponds to pathname.  This corresponds to the first  field  in
>         one  of  the  records in /proc/self/mountinfo.  Opening the pathname in
>         the fifth field of that record yields a file descriptor for  the  mount
>         point;  that  file  descriptor  can  be  used  in  a subsequent call to
>         open_by_handle_at().
>
> Fifth field seems to be the mount point. man proc says.
>
>                (5)  mount  point:  the  pathname of the mount point relative to
>                     the process's root directory.
>
> So opening mount point and saving as mount_fd (if it is not already
> in hash table) and then take a per inode reference count on mount_fd
> object looks like will solve the life time issue of mount_fd as
> well as the issue of temporary failures arising because we can't
> open a device special file.

Well, we’ve had this discussion before, and it’s possible that a 
filesystem has a device file as its mount point.

But given the inotify complications, there’s really a good reason we 
should use mountinfo.

>> It’s a bit tricky because our sandboxing prevents easy access to mountinfo,
>> but if that’s the only way...
> yes. We already have lo->proc_self_fd. Maybe we need to keep
> /proc/self/mountinfo open in lo->proc_self_mountinfo. I am assuming
> that any mount table changes will still be visible despite the fact
> I have fd open (and don't have to open new fd to notice new mount/unmount
> changes).

Well, yes, that was my idea.  Unfortunately, I wasn’t quite successful 
yet; when I tried keeping the fd open, reading from it would just return 
0 bytes.  Perhaps that’s because we bind-mount /proc/self/fd to /proc so 
that nothing else in /proc is visible. Perhaps we need to bind-mount 
/proc/self/mountinfo into /proc/self/fd before that...

I’ll just have to try.

Hanna


