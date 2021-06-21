Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263BE3AE590
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:04:20 +0200 (CEST)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFqt-0000uY-7U
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvFp5-0007V2-Uj
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvFp1-00040y-8d
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624266140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIqR+egPzhYxY+p0gqAGOgsD5m/cQwaLZ3rXRCQi36g=;
 b=bDGkjqoFRDvPNunoicPesa8hES7whIMeJwmxPg1GhatwkbRw9bgOTL8T/FR0oCebkvCNpo
 r9n2iUOWtyBg57eLux/15UAOBi0hRw2tdAQtWeaRknSVT9Gg60fag/2NP7Qc2PSY5tTQHr
 rgupQE1ogwEci/MAU2VAQxj+y9bDwv4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-_sdtqKuJMgSAohg-oLNszg-1; Mon, 21 Jun 2021 05:02:19 -0400
X-MC-Unique: _sdtqKuJMgSAohg-oLNszg-1
Received: by mail-ed1-f70.google.com with SMTP id
 x10-20020aa7cd8a0000b0290394bdda92a8so490665edv.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yIqR+egPzhYxY+p0gqAGOgsD5m/cQwaLZ3rXRCQi36g=;
 b=JOUO8i+BtqAlSy5NSbwX5kPdHg3VBIPEtX0SGsaCaptBGP58ji7DwsFoIFw352AJPN
 3HWePTnykxn+vsUX1KYxft7nNyK1HxiNNFu/joh6F3hbbnwTsbWboeCP5+8qVhAeMWIF
 CRWS504AtlUnIqvG7cMiEpt88RjY1A1tdUcfx6hjsWPlk2JfQowLv6FiIsAIv2VHUDf/
 O3haUgxkksu1PBtMvti/UlUFnzPsEazVZUWiRfawm7uZ8G+83wyv4ILVSsEvfxsrSdwz
 RAKQA19pmIXsAiRMzV3klG3tmzmcEIgVCCXQTfo+cmyd53Nv8WMMsqWqwQdeI+Jg5hmm
 20rw==
X-Gm-Message-State: AOAM533TwGUKF1GvUtFlukLakRwYv8h58ol14RO79A42GTRq6ucFulKo
 fMKETrDgV/v9EmZbGR6MP2dYX2sfK9j+mO44JMzRL6kQxJC0eAM9oEOZLLV0iKTbHyLhFJhZUIO
 vzEVlmAzA2cJJy4E=
X-Received: by 2002:a05:6402:35c8:: with SMTP id
 z8mr20014268edc.348.1624266138063; 
 Mon, 21 Jun 2021 02:02:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx64N+PePCbX4+irIQqXp1fhCCd65JtTJPypmvDt/tyFKgDQzV4vRn8fPHct0Mssu+7r3WfBw==
X-Received: by 2002:a05:6402:35c8:: with SMTP id
 z8mr20014241edc.348.1624266137717; 
 Mon, 21 Jun 2021 02:02:17 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 ck2sm1593930edb.72.2021.06.21.02.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:02:17 -0700 (PDT)
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
From: Max Reitz <mreitz@redhat.com>
Message-ID: <eec1bcd6-957d-8e9f-457c-fb717b71336b@redhat.com>
Date: Mon, 21 Jun 2021 11:02:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618182901.GB1252241@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On 18.06.21 20:29, Vivek Goyal wrote:
> On Fri, Jun 18, 2021 at 10:28:38AM +0200, Max Reitz wrote:
>> On 17.06.21 23:21, Vivek Goyal wrote:
>>> On Wed, Jun 16, 2021 at 03:38:13PM +0200, Max Reitz wrote:
>>>> On 11.06.21 22:04, Vivek Goyal wrote:
>>>>> On Wed, Jun 09, 2021 at 05:55:49PM +0200, Max Reitz wrote:
>>>>>> Currently, lo_inode.fhandle is always NULL and so always keep an O_PATH
>>>>>> FD in lo_inode.fd.  Therefore, when the respective inode is unlinked,
>>>>>> its inode ID will remain in use until we drop our lo_inode (and
>>>>>> lo_inode_put() thus closes the FD).  Therefore, lo_find() can safely use
>>>>>> the inode ID as an lo_inode key, because any inode with an inode ID we
>>>>>> find in lo_data.inodes (on the same filesystem) must be the exact same
>>>>>> file.
>>>>>>
>>>>>> This will change when we start setting lo_inode.fhandle so we do not
>>>>>> have to keep an O_PATH FD open.  Then, unlinking such an inode will
>>>>>> immediately remove it, so its ID can then be reused by newly created
>>>>>> files, even while the lo_inode object is still there[1].
>>>>>>
>>>>>> So creating a new file can then reuse the old file's inode ID, and
>>>>>> looking up the new file would lead to us finding the old file's
>>>>>> lo_inode, which is not ideal.
>>>>>>
>>>>>> Luckily, just as file handles cause this problem, they also solve it:  A
>>>>>> file handle contains a generation ID, which changes when an inode ID is
>>>>>> reused, so the new file can be distinguished from the old one.  So all
>>>>>> we need to do is to add a second map besides lo_data.inodes that maps
>>>>>> file handles to lo_inodes, namely lo_data.inodes_by_handle.  For
>>>>>> clarity, lo_data.inodes is renamed to lo_data.inodes_by_ids.
>>>>>>
>>>>>> Unfortunately, we cannot rely on being able to generate file handles
>>>>>> every time.
>>>>> Hi Max,
>>>>>
>>>>> What are the cases where we can not rely being able to generate file
>>>>> handles?
>>>> I have no idea, but it’s much easier to claim we can’t than to prove that we
>>>> can. I’d rather be resilient.
>>> Assuming that we can not genererate file handles all the time and hence
>>> mainitaing another inode cache seems little problematic to me.
>> How so?
> It is extra complexity. Need to worry about one more hash table. Sure,
> I give it to you that we are not creating two copies of inodes. Same
> inode object is being added to two different hash tables and is being
> looked up using two different keys.
>
>>> I would rather start with that we can generate file handles and have
>>> a single inode cache.
>> The assumption that we can generate file handles all the time is a much
>> stronger one (and one which needs to be proven) than assuming that failure
>> is possible.
> So if temporary failures can happen (like -ENOMEM, as you mentioned),
> these can happen with openat() too. And in that case we return error
> to caller. So why to try to hide temporary failures from
> name_to_handle_at().

Well, for openat() we don’t have a choice, if that fails, there is no 
fallback, so we must return an error.  For name_to_handle_at(), there is 
a fallback.

> I am still reading your code and trying to understand it. But one
> question came to mind. What happens if we can generate file handle
> during lookup. But can't generate when same file is looked up again.
>
> - A file foo.txt is looked. We can create file handle and we add it
>    to lo->inodes_by_handle as well as lo->inodes_by_ds.
>
> - Say somebody deleted file and created again and inode number got
>    reused.
>
> - Now during ->revalidation path, lookup happens again. This time say
>    we can't generate file handle. If am reading lo_do_find() code
>    correctly, it will find the old inode using ids and return same
>    inode as result of lookup. And we did not recognize that inode
>    number has been reused.

Oh, that’s a good point.  If an lo_inode has no O_PATH fd but is only 
addressed by handle, we must always look it up by handle.

> And issues might arise if we could not generate file handle in first
> lookup but could generate in second.
>
> - A file foo.txt is lookedup. We can not create file handle and we add it
>    to lo->inodes_by_ids.
>
> - Say somebody deleted file and created again and inode number got
>    reused.

This is not possible, because if we could not generate a file handle on 
the first lookup, the lo_inode will have an O_PATH fd attached to it, so 
the inode number cannot be reused while the lo_inode still exists.

> - Now during ->revalidation path, lookup happens again. This time say
>    we can generate file handle. If am reading lo_do_find() code
>    correctly, it will find the old inode using ids and return same
>    inode as result of lookup. And we did not recognize that inode
>    number has been reused.
>
> IOW, because we could not generate the file handle, we lost the
> ability to recognize that inode number has been reused. That means
> either we don't switch to using file handles or if we do switch,
> it is important that we can generate file handle to differentiate
> whether inode number has been used or not. If not, return error to
> caller. Caller probably will mark inode bad and let and do a lookup
> again.
>
>> Also, it is still a single inode cache. I'm just adding a third key. (The
>> two existing keys are lo_key (through lo->inodes) and fuse_ino_t (through
>> lo->ino_map).)
>>
>>>>>> Therefore, we still enter every lo_inode object into
>>>>>> inodes_by_ids, but having an entry in inodes_by_handle is optional.  A
>>>>>> potential inodes_by_handle entry then has precedence, the inodes_by_ids
>>>>>> entry is just a fallback.
>>>>> If we have to keep inodes_by_ids around, then can we just add fhandle
>>>>> to the lo_key. That way we can manage with single hash table and still
>>>>> be able to detect if inode ID has been reused.
>>>> We cannot, because I assume we cannot rely on name_to_handle_at() working
>>>> every time.
>>> I guess either we need concrete information that we can't generate
>>> file handle every time or we should assume we can until we are proven
>>> wrong. And then fix it accordingly, IMHO.
>> I don’t know why we need this other than because it would simplify the code.
>>
>> Under the assumption that for a specific file we can either generate file
>> handles all the time or never, the code as it is will behave correct. It’s
>> just a bit more complicated than it would need to be, but I don’t find the
>> diffstat of +64/-16 to be indicative of something that’s really bad.
>>
>>>> Therefore, maybe at one point we can generate a file handle, and
>>>> at another, we cannot – we should still be able to look up the inode
>>>> regardless.
>>>>
>>>> If the file handle were part of inodes_by_ids, then we can look up inodes
>>>> only if we can generate a file handle either every time (for a given inode)
>>>> or never.
>>> Right. And is there a reason to belive that for the same file we can
>>> sometimes generate file handles and other times not.
>> Looking into name_to_handle_at()’s man page, there is no error listed that I
>> could imagine happening only sometimes. But it doesn’t give an explicit
>> guarantee that it will either always succeed or fail for a given inode.
>>
>> Looking into the kernel, I can see that most filesystems only fail
>> .encode_fh() if the buffer is too small. Overlayfs can also fail with ENOMEM
>> (which will be translated to EOVERFLOW along the way, so so much for
>> name_to_handle_at()’s list of error conditions), and EIO on conditions I
>> don’t understand well enough (again, will become EOVERFLOW for the user).
>>
>> You’re probably right that at least in practice we don’t need to accommodate
>> for name_to_handle_at() sometimes working for some inode and sometimes not.
> What am I not able to understand is that why we can't return error if
> we run into a temporary issue and can't generate file handle. What's
> that requirement that we need to hide the error and try to cover it
> up by some other means.

There is no requirement, it’s just that we need to hide ENOTSUPP errors 
anyway (because e.g. some submounted filesystem may not support file 
handles), so I considered hiding temporary errors not to really add 
complexity.  (Which is true, as can be seen from the diff stat I posted 
below: Dropping the second hash table and making the handle part of 
lo_key, so that temporary errors are now fatal, generates a diff of 
+37/-66, where -20 are just two comments (which realistically I’d need 
to replace by different comments), so in terms of code, it’s +37/-46.)

I’d just rather handle errors gracefully when I find it doesn’t really 
cost complexity.


However, you made a good point in that we must require 
name_to_handle_at() to work if it worked before for some inode, not 
because it would be simpler, but because it would be wrong otherwise.

As for the other way around...  Well, now I don’t have a strong opinion 
on it.  Handling temporary name_to_handle_at() failure after it worked 
the first time should not add extra complexity, but it wouldn’t be 
symmetric.  Like, allowing temporary failure sometimes but not at other 
times.

The next question is, how do we detect temporary failure, because if we 
look up some new inode, name_to_handle_at() fails, we ignore it, and 
then it starts to work and we fail all further lookups, that’s not 
good.  We should have the first lookup fail.  I suppose ENOTSUPP means 
“OK to ignore”, and for everything else we should let lookup fail?  (And 
that pretty much answers my "what if name_to_handle_at() works the first 
time, but then fails" question.  If we let anything but ENOTSUPP let the 
lookup fail, then we should do so every time.)

Max

>> But I feel quite uneasy relying on this being the case, and being the case
>> forever, when I find it quite simple to just have some added complexity to
>> deal with it. It’s just a third key for our inode cache.
>>
>> If you want to, I can write a 10/9 patch that simplifies the code under the
>> assumption that name_to_handle_at() will either fail or not, but frankly I
>> wouldn’t want to have my name under it. (Which is why it would be a 10/9 so
>> I can have some explicit note that my S-o-b would be there only for legal
>> reasons, not because this is really my patch.)
>>
>> (And now I tentatively wrote such a patch (which requires patch 9 to be
>> reverted, of course), and that gives me a diffstat of +37/-66. Basically,
>> the difference is just having two comments removed.)
>>
>> Max
>>


