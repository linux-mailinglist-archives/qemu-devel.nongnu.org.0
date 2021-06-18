Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236393AC61C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 10:29:51 +0200 (CEST)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu9sr-0002tv-HX
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 04:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lu9rt-0001wu-5P
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:28:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lu9ro-0002VN-Cr
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624004922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Awfcc0tzYvcIxjgnRr9Cf5OJnCfaMHvIo23fFM6UIO8=;
 b=a3psO1vkZ8SYPqc8x96ffSiSLPdI01u31S0PFG7EOnAJApeostmu3Xo5Xk6MmdJZrBKyx1
 KKCbXITeG6tHW14obU4yM/593T2bijnKBW9Yt7x4WFSTwTwksdye1m8iVPYducKkYu4z4V
 esqa7t9OM6ijMSTyUHhv3ci+4Otbv1A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-O7ob6NK8NDesa8tC3wAdIg-1; Fri, 18 Jun 2021 04:28:41 -0400
X-MC-Unique: O7ob6NK8NDesa8tC3wAdIg-1
Received: by mail-ej1-f70.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso3618476ejp.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 01:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Awfcc0tzYvcIxjgnRr9Cf5OJnCfaMHvIo23fFM6UIO8=;
 b=WyyYE8zUGvqYhVoJ8U9E0cFhnjb/Or+tg1UuNjUX++hmvY4N6rO9Yt1NxRIkXdarqM
 fc2jyxn9RzF3eGAkVZiB6hqLwV9NvUEgft7rvmawGtJZQ0RlYUmEaPmKPbpHAU8dK6q5
 IEFC0MTwsMVWU+45vq2k+VkiP74qiXcMFNXp/ICunEDz21S+pPeDisXUjkqdXWT37dG4
 XyZXKtG3Is3vsmNrmB5nhtwjZo52h+KL7G/yadEzha6XCHgjAzvAO7cEC3VTZRBsyucB
 HozOqB1Yifx3QnEmBZvkmTmkEDH4AuHnsoNh3E5MMfuoxRFqEP17UTIdsSioGqlHv32q
 2RVA==
X-Gm-Message-State: AOAM532W83q9obCtpjUjF2YazdpJsjQaWqzXZy7aDkglneq7JxG12kjj
 GeGowHDIcMSU/qwbWw7/7p++aWgKPm0Q9YbYsC4ofXvV+r3o5ZyjaCnqAlieZmi2JxYUJVFyBE5
 Bq1kVDF5zvEqJEMc=
X-Received: by 2002:a17:906:c799:: with SMTP id
 cw25mr2446138ejb.173.1624004919747; 
 Fri, 18 Jun 2021 01:28:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8QnqQCTtvW/1rCZ78IW/33ez9fG3n4V/sa2JYrJO1huwsYIpQJWEjRfpt+EsmDZY3d3Qz8Q==
X-Received: by 2002:a17:906:c799:: with SMTP id
 cw25mr2446129ejb.173.1624004919496; 
 Fri, 18 Jun 2021 01:28:39 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 gz12sm742834ejc.36.2021.06.18.01.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 01:28:39 -0700 (PDT)
Subject: Re: [Virtio-fs] [PATCH v2 7/9] virtiofsd: Add inodes_by_handle hash
 table
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
 <20210609155551.44437-8-mreitz@redhat.com>
 <20210611200459.GB767764@redhat.com>
 <9cea5642-e5ea-961f-d816-0998e52aad9f@redhat.com>
 <20210617212143.GD1142820@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <1e5dafd2-34e0-1a25-2cb5-6822eaf2502c@redhat.com>
Date: Fri, 18 Jun 2021 10:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617212143.GD1142820@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 17.06.21 23:21, Vivek Goyal wrote:
> On Wed, Jun 16, 2021 at 03:38:13PM +0200, Max Reitz wrote:
>> On 11.06.21 22:04, Vivek Goyal wrote:
>>> On Wed, Jun 09, 2021 at 05:55:49PM +0200, Max Reitz wrote:
>>>> Currently, lo_inode.fhandle is always NULL and so always keep an O_PATH
>>>> FD in lo_inode.fd.  Therefore, when the respective inode is unlinked,
>>>> its inode ID will remain in use until we drop our lo_inode (and
>>>> lo_inode_put() thus closes the FD).  Therefore, lo_find() can safely use
>>>> the inode ID as an lo_inode key, because any inode with an inode ID we
>>>> find in lo_data.inodes (on the same filesystem) must be the exact same
>>>> file.
>>>>
>>>> This will change when we start setting lo_inode.fhandle so we do not
>>>> have to keep an O_PATH FD open.  Then, unlinking such an inode will
>>>> immediately remove it, so its ID can then be reused by newly created
>>>> files, even while the lo_inode object is still there[1].
>>>>
>>>> So creating a new file can then reuse the old file's inode ID, and
>>>> looking up the new file would lead to us finding the old file's
>>>> lo_inode, which is not ideal.
>>>>
>>>> Luckily, just as file handles cause this problem, they also solve it:  A
>>>> file handle contains a generation ID, which changes when an inode ID is
>>>> reused, so the new file can be distinguished from the old one.  So all
>>>> we need to do is to add a second map besides lo_data.inodes that maps
>>>> file handles to lo_inodes, namely lo_data.inodes_by_handle.  For
>>>> clarity, lo_data.inodes is renamed to lo_data.inodes_by_ids.
>>>>
>>>> Unfortunately, we cannot rely on being able to generate file handles
>>>> every time.
>>> Hi Max,
>>>
>>> What are the cases where we can not rely being able to generate file
>>> handles?
>> I have no idea, but it’s much easier to claim we can’t than to prove that we
>> can. I’d rather be resilient.
> Assuming that we can not genererate file handles all the time and hence
> mainitaing another inode cache seems little problematic to me.

How so?

> I would rather start with that we can generate file handles and have
> a single inode cache.

The assumption that we can generate file handles all the time is a much 
stronger one (and one which needs to be proven) than assuming that 
failure is possible.

Also, it is still a single inode cache. I'm just adding a third key. 
(The two existing keys are lo_key (through lo->inodes) and fuse_ino_t 
(through lo->ino_map).)

>>>> Therefore, we still enter every lo_inode object into
>>>> inodes_by_ids, but having an entry in inodes_by_handle is optional.  A
>>>> potential inodes_by_handle entry then has precedence, the inodes_by_ids
>>>> entry is just a fallback.
>>> If we have to keep inodes_by_ids around, then can we just add fhandle
>>> to the lo_key. That way we can manage with single hash table and still
>>> be able to detect if inode ID has been reused.
>> We cannot, because I assume we cannot rely on name_to_handle_at() working
>> every time.
> I guess either we need concrete information that we can't generate
> file handle every time or we should assume we can until we are proven
> wrong. And then fix it accordingly, IMHO.

I don’t know why we need this other than because it would simplify the code.

Under the assumption that for a specific file we can either generate 
file handles all the time or never, the code as it is will behave 
correct. It’s just a bit more complicated than it would need to be, but 
I don’t find the diffstat of +64/-16 to be indicative of something 
that’s really bad.

>> Therefore, maybe at one point we can generate a file handle, and
>> at another, we cannot – we should still be able to look up the inode
>> regardless.
>>
>> If the file handle were part of inodes_by_ids, then we can look up inodes
>> only if we can generate a file handle either every time (for a given inode)
>> or never.
> Right. And is there a reason to belive that for the same file we can
> sometimes generate file handles and other times not.

Looking into name_to_handle_at()’s man page, there is no error listed 
that I could imagine happening only sometimes. But it doesn’t give an 
explicit guarantee that it will either always succeed or fail for a 
given inode.

Looking into the kernel, I can see that most filesystems only fail 
.encode_fh() if the buffer is too small. Overlayfs can also fail with 
ENOMEM (which will be translated to EOVERFLOW along the way, so so much 
for name_to_handle_at()’s list of error conditions), and EIO on 
conditions I don’t understand well enough (again, will become EOVERFLOW 
for the user).

You’re probably right that at least in practice we don’t need to 
accommodate for name_to_handle_at() sometimes working for some inode and 
sometimes not.

But I feel quite uneasy relying on this being the case, and being the 
case forever, when I find it quite simple to just have some added 
complexity to deal with it. It’s just a third key for our inode cache.

If you want to, I can write a 10/9 patch that simplifies the code under 
the assumption that name_to_handle_at() will either fail or not, but 
frankly I wouldn’t want to have my name under it. (Which is why it would 
be a 10/9 so I can have some explicit note that my S-o-b would be there 
only for legal reasons, not because this is really my patch.)

(And now I tentatively wrote such a patch (which requires patch 9 to be 
reverted, of course), and that gives me a diffstat of +37/-66. 
Basically, the difference is just having two comments removed.)

Max


