Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CD39BDF5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:03:50 +0200 (CEST)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDEb-0002io-Mq
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCak-0007Os-3X
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:22:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCah-0006iU-9w
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622823752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REMvC3/TpA8X+QL6qxTMeRanCRQLDlo5OXrm9V52/3s=;
 b=VQISeIixn2VQqwtGrjlzNMqlK+vOUlwg40+AxjDv2ZFaZw4dycdHyIpCwEweHde3Ba8eRP
 vGHE5Q6RlWDOtSncLHs6g0KQAgn8Cu2IFFjAljoVkFbwiuVEn0XvRx1eK2pE92v4XJqVbE
 KdILynAMYLb4PIkHYN7KpzvIHSmejDg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-CwpTXCF5NLCzW0RtNwf-EA-1; Fri, 04 Jun 2021 12:22:31 -0400
X-MC-Unique: CwpTXCF5NLCzW0RtNwf-EA-1
Received: by mail-ed1-f71.google.com with SMTP id
 d8-20020a0564020008b0290387d38e3ce0so5233881edu.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=REMvC3/TpA8X+QL6qxTMeRanCRQLDlo5OXrm9V52/3s=;
 b=bgeUwmTJcH72q56lHRGn1l09Wy/5YzMMo50iRR/0RMszYt41qwL0zEA5BIJSiOZ7Df
 lo6n5NdNnAnqcmhsbgKBkkV8DqKLjzQr0VW0uadZ4MxKc/sB+EvQwirF205CrAogV0RC
 lmh965JY1clDQ24lIMQ1/6bzrgj1Bt2HbyLAVlqq4MtE6KR9hwCC2m79v6wKJApdXoOc
 i2Tp8vPAz8hbR4i82g++I7rq2w5SjeoYqbn5VhmrL4PFHBDXLQKa2MX/OREHk81XPMZL
 7AE2jc/M4vUvMoOD6FrgDnll/GPspHUTjvBJZKaQfAr1AKfwnEXd8hAMAubU0ccBdqey
 /COg==
X-Gm-Message-State: AOAM532irdjEfnkYcxevHiaovfwsA1gTfYO+AkImfwJzyMNtFyU23mn3
 EgG5NOnBufggCYxUiGl4drxS6daQmLLKo1b0M+0LU/V4/RNUuEjsM7B7JBrdMtdBqpo9wyzP0Br
 oq3dW91cDpr8n4a8=
X-Received: by 2002:a05:6402:5193:: with SMTP id
 q19mr5451356edd.167.1622823750166; 
 Fri, 04 Jun 2021 09:22:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXz5Cujr3aDKIrgUSZIJ6dQi1376YLzxPlsq+DNjN1aDJh41LJnMHXI/GWDbJtp4YljQI6Lg==
X-Received: by 2002:a05:6402:5193:: with SMTP id
 q19mr5451326edd.167.1622823749932; 
 Fri, 04 Jun 2021 09:22:29 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 h22sm3417677edv.0.2021.06.04.09.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 09:22:29 -0700 (PDT)
Subject: Re: [PATCH 1/3] virtiofsd: Find original inode ID of mount points
To: Miklos Szeredi <miklos@szeredi.hu>, Vivek Goyal <vgoyal@redhat.com>
References: <20210512125544.9536-1-mreitz@redhat.com>
 <20210512125544.9536-2-mreitz@redhat.com>
 <20210602181958.GC115492@redhat.com>
 <CAJfpegtKjx7y8+bMQUivjxHuF0iiLYxKCtd0H3AisVymHHjtTA@mail.gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <497d1ed1-fbd4-0aad-1349-826be8b49834@redhat.com>
Date: Fri, 4 Jun 2021 18:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJfpegtKjx7y8+bMQUivjxHuF0iiLYxKCtd0H3AisVymHHjtTA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.06.21 20:59, Miklos Szeredi wrote:
> On Wed, 2 Jun 2021 at 20:20, Vivek Goyal <vgoyal@redhat.com> wrote:
>> On Wed, May 12, 2021 at 02:55:42PM +0200, Max Reitz wrote:
>>> Mount point directories represent two inodes: On one hand, they are a
>>> normal directory on their parent filesystem.  On the other, they are the
>>> root node of the filesystem mounted there.  Thus, they have two inode
>>> IDs.
>>>
>>> Right now, we only report the latter inode ID (i.e. the inode ID of the
>>> mounted filesystem's root node).  This is fine once the guest has
>>> auto-mounted a submount there (so this inode ID goes with a device ID
>>> that is distinct from the parent filesystem), but before the auto-mount,
>>> they have the device ID of the parent and the inode ID for the submount.
>>> This is problematic because this is likely exactly the same
>>> st_dev/st_ino combination as the parent filesystem's root node.  This
>>> leads to problems for example with `find`, which will thus complain
>>> about a filesystem loop if it has visited the parent filesystem's root
>>> node before, and then refuse to descend into the submount.
>>>
>>> There is a way to find the mount directory's original inode ID, and that
>>> is to readdir(3) the parent directory, look for the mount directory, and
>>> read the dirent.d_ino field.  Using this, we can let lookup and
>>> readdirplus return that original inode ID, which the guest will thus
>>> show until the submount is auto-mounted.  (Then, it will invoke getattr
>>> and that stat(2) call will return the inode ID for the submount.)
>> [ CC miklos ]
>>
>> Hi Max,
>>
>> Though we discussed this in chat room, I am still responding to this
>> email with the concern I have, so that there is a record of it.

That sounds scary :)

>> So with this patch for FUSE_LOOKUP  we always return submount's parentinode
>> id and with GETATTR request we return actual inode id of submount. That
>> kind of bothers me a bit as we are assuming that there is always going
>> to be a GETATTR request after FUSE_LOOKUP. FUSE_LOOKUP itself has attrs
>> returned with it and it might happen that after FUSE_LOOKUP, FUSE_GETATTR
>> might not be called at all because FUSE_LOOKUP itself got the latest
>> updated attrs with certain timeout.
>>
>> For example, if I call stat on a normal file (not submount), I see that
>> after FUSE_LOOKUP, no FUSE_GETATTR request is going and
>> fuse_update_get_attr() is using attrs from locally cached inode attrs.
>>
>> But same thing does not seem to be happening in case of submount. Once
>> submount is created in guest, I see that we never seem to be calling
>> ->revalidate() on newly created dentry of submount root. I am not sure
>> why. And that means we don't do FUSE_LOOKUP and that means FUSE_GETATTR
>> always gets called.

Even if it worked reliably, I have to admit it’s kind of relying on at 
most implementation-defined behavior.  Having two inodes would 
definitely be the right solution.

> Yes, this sounds normal.
>
> The lookup sequence for "/mnt/virtiofs/dir1/submount/file" will be:
>
> LOOKUP(1, "dir")
>      create inode I1 in sb1
>      create dentry "dir" with inode I1 in sb1
> LOOKUP(I1, "submount")
>      create inode I2 in sb1, set S_AUTOMOUNT
>      create dentry "submount" with inode I2 in sb1
>      automount triggered:
>      create sb2
>      create inode I2 in sb2
>      create dentry "/" with inode I2 in sb2
> GETATTR(I2)
>       fill inode I2
> LOOKUP(I2, "file")
>       create inode I3
>       create dentry "file" with inode I3 in sb2
>
> Notice how there's two inodes numbered I2, but in separate sb's.
> However the server has only the notion of a single I2 inode which is
> the root of the submount, since the mountpoint is not visible (except
> for d_ino in readdir()).
>
> Now AFAICS what this patch does is set the inode number in the
> attributes returned by LOOKUP(I1, "submount") to the covered inode, so
> that AT_NO_AUTOMOUNT stat will return the correct value.   While this
> seems to work, it's not a fundamental fix to the problem, since the
> attributes on sb1/I2 will time out and the next stat(...,
> AT_NO_AUTOMOUNT) will trigger a GETATTR request, which will return the
> inode number of the submount root.

Ah, yeah.

> Solving this properly would mean that the server would have to
> generate separate nodeid's for the mountpoint and the submount root
> and the protocol would have to be extended so that this information
> could be transferred to the client.

Yes, we’d somehow need to do a separate lookup for the root inode of the 
submount...

> Not sure whether this is worth it or not.

I’m wondering the same.  This series was mostly the result of an 
incidental finding and seeing that getting it to work and do what I want 
seemed to be pretty easy.  Turns out doing something right can never 
really be easy...

But we have already decided that we don’t deem the inode ID problem too 
important (not least considering NFS has the same issue), so fixing it 
is not really top priority.  Maybe I’ll get back to it, but I think for 
now I consider it on the backlog.

Max


