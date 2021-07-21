Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA83D0A7F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:31:50 +0200 (CEST)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67dt-0000VT-Ns
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m67c6-00087i-80
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:29:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m67c4-0003L7-8E
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SujSFdrKwfwNljzbKODqAvHviOukZSnZP+rUzpcWvGo=;
 b=UQAvG3k86Jvo9FXAxeb32ZnMY/dDguHpjqfNEBRKjb32kpPE67LfrWFRo6l051Jbhx43Aj
 S3pC9Zy4H8jyb0NvUl172QK8CQsLoQnSW8xhLJfJ9hLRVKYirk2p052NHLNRLDvCOg6MSh
 BF/TWK9ny+Vv/D7lL4Dnfo/Z53MsncU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-wKptWMNrMZiFxovd9eP6VA-1; Wed, 21 Jul 2021 04:29:54 -0400
X-MC-Unique: wKptWMNrMZiFxovd9eP6VA-1
Received: by mail-wr1-f69.google.com with SMTP id
 i10-20020a5d55ca0000b029013b976502b6so663840wrw.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 01:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SujSFdrKwfwNljzbKODqAvHviOukZSnZP+rUzpcWvGo=;
 b=Y7QrLj/aSZBiBfppYzrezvJkWFVT2ZW+EuZwKxu52HP0deQS6MtO4L5bk1mQfbwCN0
 pa8qkTxAe4DLUuS0Q1lhhQ8DLOrDDM+3Log6Cjl4ed6m1oST2rABbhA+UmbAwsP/HMqM
 qnPT3qa17ZohmCPcWjTgv8zIJ1Obl1BkphSo+6Z9WoIdRT5mimZ7Mk5MTOxRkznM1LtN
 +yHQF7Pit/l3A7SQn1DcDqkkvBebL005daEtPpQTq1iN7HWXrWiiZzYoCLpqYr2118l+
 M4sPSi4aicYF0Hr6ViO31cZCBjKiOoHHoxiiY28M7wOx8TnQBHsqx9AvR0khVobH45Bq
 sB0w==
X-Gm-Message-State: AOAM530taNt6O5PgwBtAFpT5d9DoFfdY2sIFBKTjgIGC0T7Cq5XYsXF0
 LzxnzrYwUSt/CwNDzL4olGknxB3CyFWifCoLACu1m/+CMcmPvLPh1oaz18J73SktQUFYnfkTCmP
 UOSYFYKBJlL7o3D8=
X-Received: by 2002:a5d:6d89:: with SMTP id l9mr40307443wrs.371.1626856192535; 
 Wed, 21 Jul 2021 01:29:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaezMmP72gV1Xwn98RzuicprIjj2IkLVKzVlwqyk9KEF72w7s+D9e4uV58jvFndpda7/CERw==
X-Received: by 2002:a5d:6d89:: with SMTP id l9mr40307414wrs.371.1626856192163; 
 Wed, 21 Jul 2021 01:29:52 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 y197sm4728259wmc.7.2021.07.21.01.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 01:29:51 -0700 (PDT)
Subject: Re: [Virtio-fs] [PATCH v2 7/9] virtiofsd: Add inodes_by_handle hash
 table
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
 <20210609155551.44437-8-mreitz@redhat.com>
 <20210611200459.GB767764@redhat.com>
 <9cea5642-e5ea-961f-d816-0998e52aad9f@redhat.com>
 <20210617212143.GD1142820@redhat.com>
 <1e5dafd2-34e0-1a25-2cb5-6822eaf2502c@redhat.com>
 <20210618182901.GB1252241@redhat.com>
 <eec1bcd6-957d-8e9f-457c-fb717b71336b@redhat.com>
 <eda4ee02-56f8-079d-0829-041ed3471aed@redhat.com>
 <YPbit/qbA4Ussaa5@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <fe636905-5943-0212-d4d9-9320f6109e62@redhat.com>
Date: Wed, 21 Jul 2021 10:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPbit/qbA4Ussaa5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 16:50, Vivek Goyal wrote:
> On Tue, Jul 13, 2021 at 05:07:31PM +0200, Max Reitz wrote:
>
> [..]
>>> The next question is, how do we detect temporary failure, because if we
>>> look up some new inode, name_to_handle_at() fails, we ignore it, and
>>> then it starts to work and we fail all further lookups, that’s not
>>> good.  We should have the first lookup fail.  I suppose ENOTSUPP means
>>> “OK to ignore”, and for everything else we should let lookup fail?  (And
>>> that pretty much answers my "what if name_to_handle_at() works the first
>>> time, but then fails" question.  If we let anything but ENOTSUPP let the
>>> lookup fail, then we should do so every time.)
>> I don’t think this will work as cleanly as I’d hoped.
>>
>> The problem I’m facing is that get_file_handle() doesn’t only call
>> name_to_handle_at(), but also contains a lot of code managing mount_fds.
>> There are a lot of places that can fail, too, and I think we should have
>> them fall back to using an O_PATH FD:
>>
>> Say mount_fds doesn’t contain an FD for the new handle’s mount ID yet, so we
>> want to add one.  However, it turns out that the file is not a regular file
>> or directory, so we cannot open it as a regular FD and add it to mount_fds;
> Hi Max,
>
> So an fd opened using O_PATH can't be used as "mount_fd" in
> open_by_handle_at()? (I see that you are already first opening O_PATH
> fd and then verifying if this is a regular file/dir or not).

Yep, unfortunately we need a non-O_PATH fd.

>> or that it is a regular file, but without permission to open it O_RDONLY.
>> So we cannot return a file handle, because it will not be usable until a
>> mount FD is added.
>>
>> I think in such a case we should fall back to an O_PATH FD, because this is
>> not some unexpected error, but just an unfortunate (but reproducible and
>> valid) circumstance where using `-o inode_file_handles` fails to do
>> something that works without it.
>>
>> Now, however, this means that the next time we try to generate a handle for
>> this file (to look it up), it will absolutely work if some other FD was
>> added to mount_fds for this mount ID in the meantime.
>>
>>
>> We could get around this by not trying to open the file for which we are to
>> generate a handle to add its FD to mount_fds, but instead doing what the
>> open_by_handle_at() man page suggests:
>>
>>> The mount_id argument returns an identifier for the filesystem mount
>>> that corresponds to pathname. This corresponds to the first field in one
>>> of the records in /proc/self/mountinfo. Opening the pathname in the
>>> fifth field of that record yields a file descriptor for the mount point;
>>> that file descriptor can be used in a subsequent call to
>>> open_by_handle_at().
>> However, I’d rather avoid parsing mountinfo.
> Hmm.., not sure what's wrong with parsing mountinfo.

Well, it’s just that it’s some additional complexity that I didn’t 
consider necessary.

(Because I was content with falling back in the rare case that the 
looked up file is not a regular file or directory.)

> Example code does
> not look too bad. Also it mentions that libmount provides helpers
> (if we don't want to write our own function to parse mountinfo).
>
> I would think parsing mountinfo is a good idea because it solves
> your problem of not wanting to open device nodes for mount_fds. And
> in turn not relying on a fallback to O_PATH fds.

Well.  Strictly speaking, it isn’t really my problem, because I didn’t 
really consider a rare fallback to be a problem.

Furthermore, I don’t even know whether it really solves the problem.  
Just as a mount point need not be a directory, it need not even be a 
regular file.  You absolutely can mount a filesystem on a device file, 
and have the root node be a device file, too:

(I did this by modifying the qemu FUSE block export code (to pass “dev” 
as a mount option, to drop the check whether the mount point is a 
regular file, and to report a device file instead of a regular file).  
It doesn’t work perfectly well because FUSE drops the rdev attribute, 
and so you can only create 0:0 device files, but, well...)

$ cat /proc/self/mountinfo
436 40 0:45 / /tmp/blub rw,nosuid,relatime shared:238 - fuse /dev/fuse 
rw,user_id=0,group_id=0,default_permissions,allow_other,max_read=67108864
$ stat /tmp/blub
File: /tmp/blub
Size: 1073741824 Blocks: 2097152 IO Block: 1 character special file
Device: 2dh/45d Inode: 1 Links: 1 Device type: 0,0
[...]

I know this is something that nobody will normally ever do, but I still 
don’t think we can absolutely safely assume a mount point to always be a 
regular file or directory.

> Few thoughts overall.
>
> - We are primarily disagreeing on whether we should fallback to O_PATH
>    fds or not if something goes wrong w.r.t handle generation.
>
>    My preference is that atleast in the initial patches we should not try
>    to fall back. EOPNOTSUPP is the only case we need to take care of.
>    Otherwise if there is any temporary error (EMOMEM, running out of
>    fds or something else), we return it to the caller. That's what
>    rest of the code is doing. If some operation fails due to some
>    temporary error (say ENOMEM), we return error to the caller.
>
> - If above apporach creates problem, we can always add the fallback
>    path later.
>
> - If you have strong preference for fallback path, can we have it
>    as last patch of the series and not bake it in from the beginning
>    of the patch series.
>
> - Even if we add fallback path, can we not make that assumption in
>    other areas of the code. For example, can we not avoid parsing
>    mountinfo to generate mount_fd, because we have a fallback path
>    and we can afford to not generate handle. I mean if we were to
>    remove fallback logic at some point of time, it will be much
>    easier to do if dependency on this assumption did not spread
>    too much.

The problem I see is that we always need a fallback path (for 
EOPNOTSUPP), and it’s very simple to have.  I see no reason to ever 
remove it, because removing it won’t really simplify anything.

As for when to report errors to the guest and when not, the simplest 
case is to have all errors fall back to O_PATH fds.  It’s naturally more 
difficult having to distinguish between errors that should be passed to 
the guest, and errors that should result in fallbacks.

In fact, frankly, I still don’t understand why it’s a problem to always 
fall back.  I thought I understood one problem in our discussion on v2, 
but then it turned out that it was just a single condition somewhere 
else that was wrong (i.e. the fact that we must never look up lo_inodes 
that have no O_PATH fd by a device ID without a generation ID).

I understand that intuitively erroring out is easier.  But technically, 
it isn’t, and I don’t see any technical advantage in passing 
file-handle-related errors to the guest immediately rather than trying 
to fall back first.  (Even if the fallback then fails, and one could 
argue that we could have seen it coming based on the file handle error, 
taking a bit more time for a case that will fail anyway shouldn’t be a 
real problem.  (And the “more time” is just a single openat(O_PATH).))

Max


