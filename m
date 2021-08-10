Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2564F3E5582
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:33:49 +0200 (CEST)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNCm-0003mX-6o
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDNC1-0002ti-34
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:33:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDNBz-0004dw-Ah
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628584378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuOCdZRx0KHiDnC7g1LphMv7cZIvNDfuS5DM238Bukk=;
 b=HzWmogYkdk2zmeU7SKqxrTcYLDIqCpXMJgswj1AhUF1gaRnLP/KuxLZMP9CgzQrjjLYYxP
 di4Q4P+yDmVhGwyeF4qqUbGBBhUbUrBFc9DzmvMHTg9RmqtlqrRCHOVyDoj9rW6anGw0HL
 i1ur0lzj8B/Jdw0MNKQLyTv3NVkmykM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-_q1QxLsYOWqywKocFGAP3g-1; Tue, 10 Aug 2021 04:32:57 -0400
X-MC-Unique: _q1QxLsYOWqywKocFGAP3g-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so6139307wri.17
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nuOCdZRx0KHiDnC7g1LphMv7cZIvNDfuS5DM238Bukk=;
 b=B2LvlFd828Qk2bWOkAVwuPpEHRVFuHUipAO+j8hV3XQTAhur1lQrGMJEBrKrTj6u6a
 1s1ZtAGYzKzTBlE8o7UGmc3lBdzAYqdk9iHit8t5bInWCMr7JwEgNGJb9BVqLabBVIzA
 YgE6JDin/izpCCTR1VUrFE9ulxVSbboCfn3XaZWdtaGmR4VdD/MY57/i9TUQf/R6NhPv
 2s8HnIhA7eZ7EdYVsFd5rqSNjDig8FvCR2o57LtxDR/RrCYeU5JKGfgQaEYNUKNimViW
 IyppGnbzAgRKckDxkgrsB25JDjAzOPb4FNcq95/+EXIzzutxsioJD/nd8nJEidAtiCVZ
 IE0A==
X-Gm-Message-State: AOAM533IaSKRdWL9n8oXID1T5Bn6TPWP4SPYO21vcK5zf5TnF3VtXLbR
 JbxFZMDCgprUOufacyIiF00Ey6yrOWFPUACvUmE8aFVhijC3tEvKb1o/aV1EvyyfPzV/aJUF3r/
 qRVou0ldE479wvOE=
X-Received: by 2002:a7b:c188:: with SMTP id y8mr6599674wmi.174.1628584376524; 
 Tue, 10 Aug 2021 01:32:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyUUFYMD8aSj7riWBcd7XjWEvwDXAyGMJUXd6dSkPv6r1vdYm0B/QRu29KJ6/lhGOKb+VhjQ==
X-Received: by 2002:a7b:c188:: with SMTP id y8mr6599655wmi.174.1628584376322; 
 Tue, 10 Aug 2021 01:32:56 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 129sm20322618wmz.26.2021.08.10.01.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 01:32:55 -0700 (PDT)
Subject: Re: [PATCH v3 09/10] virtiofsd: Optionally fill lo_inode.fhandle
To: Vivek Goyal <vgoyal@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-10-mreitz@redhat.com> <YRF2xjwSKOiqB/Al@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <df64553c-c03d-076a-bcef-bec8554977a4@redhat.com>
Date: Tue, 10 Aug 2021 10:32:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRF2xjwSKOiqB/Al@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: virtio-fs@redhat.com, Ioannis Angelakopoulos <jaggel@bu.edu>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.08.21 20:41, Vivek Goyal wrote:
> On Fri, Jul 30, 2021 at 05:01:33PM +0200, Max Reitz wrote:
>> When the inode_file_handles option is set, try to generate a file handle
>> for new inodes instead of opening an O_PATH FD.
>>
>> Being able to open these again will require CAP_DAC_READ_SEARCH, so the
>> description text tells the user they will also need to specify
>> -o modcaps=+dac_read_search.
>>
>> Generating a file handle returns the mount ID it is valid for.  Opening
>> it will require an FD instead.  We have mount_fds to map an ID to an FD.
>> get_file_handle() fills the hash map by opening the file we have
>> generated a handle for.  To verify that the resulting FD indeed
>> represents the handle's mount ID, we use statx().  Therefore, using file
>> handles requires statx() support.
> So opening the file and storing that fd in mount_fds table might be
> a potential problem with inotify work Ioannis is doing.
>
> So say a file foo.txt was opened O_RDONLY and fd stored in mount_fs. Now
> say user unlinks foo.txt. If notifications are enabled, final notification
> will not be generated till this mount_fds fd is closed.
>
> Now question is when will this fd be closed? If it closed at some
> later point and then notification is generated, that will break
> notificaitons.

Currently, it is never closed.

> In fact even O_PATH fd is delaying notifications due to same reason.
> But its not too bad as we close O_PATH fd pretty quickly after
> unlinking. And we were hoping that file handle support will get rid
> of this problem because we will not keep O_PATH fd open.
>
> But, IIUC, mount_fds stuff will make it even worse. I did not see
> the code which removes this fd from mount_fds. So I am not sure what's
> the life time of this fd.

The lifetime is forever.  If we wanted to remove it at some point, we’d 
need to track how many file handles we have open for the given mount fd 
and then remove it from the table once the count reaches 0, so it would 
still be delayed.

I think in practice the first thing that is looked up from some mount 
will probably be the root directory, which cannot be deleted before 
everything else on the mount is gone, so that would work.  We track how 
many handles are there, if the whole mount were to be deleted, I hope 
all lo_inodes are evicted, the count goes to 0, and we can drop the 
mount fd.

I think we can make the assumption that the mount fd is the root 
directory certain by, well, looking into mountinfo...  That would result 
in us always opening the root node of the filesystem, so that first the 
whole filesystem needs to disappear before it can be deleted (and our 
mount fd closed) – which should work, I guess?

It’s a bit tricky because our sandboxing prevents easy access to 
mountinfo, but if that’s the only way...

Hanna


