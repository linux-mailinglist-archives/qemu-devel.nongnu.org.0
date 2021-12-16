Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373254773F1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:08:07 +0100 (CET)
Received: from localhost ([::1]:33324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrQT-0007By-QR
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:08:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxrJ4-0007LT-8d
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:00:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxrIt-0003EE-9t
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639663213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xz8RhnEYtnoD2uub05PQVXbxHymXzwTNrTsr3gWwlbk=;
 b=gmx6wvKgH35cyKLrgDf2Wa6alJK6skyBl43G7itQRnxvyjnp0imwKl1PZyDPoYHdm+oKiX
 XIq0rpjhb/5V1jm8mkCFZW5tU1m+Y/+VDc7WFkxv/FKLvqicT8TO/+REJE99jLw0Pf5wi9
 C1+N0TbKP7TyMKz8tPXkIg99/ynDPcs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-OXstbA3ROKG82xTrBNz6iA-1; Thu, 16 Dec 2021 09:00:11 -0500
X-MC-Unique: OXstbA3ROKG82xTrBNz6iA-1
Received: by mail-wr1-f72.google.com with SMTP id
 l9-20020adfa389000000b001a23bd1c661so793348wrb.6
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 06:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xz8RhnEYtnoD2uub05PQVXbxHymXzwTNrTsr3gWwlbk=;
 b=YGmR0jZyXqVo3aKnraV4NCcWEZXRebRnd1Noao0xuP2FsJfKEW7f1oHNcc3lP5cj3Q
 aZbaAnCQOYWMOG0O3ALydRI0bcxLy3+mgMy3sMhw+DbKK0bKf2lXcOAmEGp1qmvq6XbE
 jRWgd19KlYhNHM5YUXtDQtbLfHaAJg6aN9Nm8mLX2te0b9MlDGioWC5imZNW0lABlX9J
 ASWB9wElkSbnSFZ+y+on/f8bTeNlFR6bq1OjgTHh4Zcvl66RALgPlMCaS5ZaNV7BRTih
 mCG0qNE7kvyz0Ac22C+h3CH92Cs/SqVh5TDgDA+/7dKYsJ8FJlncSfhNgh2aA9NDrBFP
 ma/w==
X-Gm-Message-State: AOAM532YcTAINugVIFJjQKdlD9P0EL1XwwAgV7Yb5xv0M9JLe0ChzN28
 vuRMBjdJEr9c47/anpTehU5beNtPUG7VYxj0cFt20V2a1mS1brxjI3p7xZWPZlwlOr3L/+byhrP
 7bRvFUT+DboYLt7Q=
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr2747420wrg.118.1639663208692; 
 Thu, 16 Dec 2021 06:00:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIS6sak7juByvkqwm+tlKnP7CKvc9KdCyU4LhyPsAAEGq8/dRvRf/Os10EdjyEkYqiQ5vP3Q==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr2747369wrg.118.1639663208335; 
 Thu, 16 Dec 2021 06:00:08 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l25sm2866614wmh.18.2021.12.16.06.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:00:08 -0800 (PST)
Message-ID: <d443fc40-ef44-5551-51e5-f3d01a34fd7f@redhat.com>
Date: Thu, 16 Dec 2021 15:00:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 05/31] block-backend: special comments for
 blk_set/get_perm due to fuse
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-6-eesposit@redhat.com>
 <2b924119-5bfd-d00d-169d-5cf1d7460116@redhat.com>
 <449921a0-4f53-f57a-a47b-a6707b551f67@redhat.com>
 <2f566e3c-58b8-f573-5862-290187a40044@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <2f566e3c-58b8-f573-5862-290187a40044@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.12.21 11:13, Emanuele Giuseppe Esposito wrote:
>
>
> On 15/12/2021 09:57, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 10/12/2021 15:38, Hanna Reitz wrote:
>>> On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
>>>> Fuse logic can be classified as I/O, so there is no BQL held
>>>> during its execution. And yet, it uses blk_{get/set}_perm
>>>> functions, that are classified as BQL and clearly require
>>>> the BQL lock. Since there is no easy solution for this,
>>>> add a couple of TODOs and FIXME in the relevant sections of the
>>>> code.
>>>
>>> Well, the problem goes deeper, because we still consider them GS 
>>> functions.  So it’s fine for the permission function 
>>> raw_handle_perm_lock() to call bdrv_get_flags(), which is a GS 
>>> function, and then you still get:
>>>
>>> qemu-storage-daemon: ../block.c:6195: bdrv_get_flags: Assertion 
>>> `qemu_in_main_thread()' failed.
>
> Wait... Now that I read it more carefully I am confused about this. I 
> don't think the above has to do with fuse, right?

It does, because the problem is that the FUSE export code 
(fuse_do_truncate()) calls a permission function (blk_set_perm()), and 
then we assume in those permission functions that they can call GS 
functions, like bdrv_get_flags() (called from raw_handle_perm_lock()).  
So in practice, the permission functions are still effectively GS 
functions, and just dropping the assertions from blk_set/get_perm() 
doesn’t really help.

(This is the state on this patch; patch 7 adds an assertion in 
bdrv_child_try_set_perm(), and so from then on, that assertion fails 
before the one in bdrv_get_flags() can.)

> Can you share the command that makes qemu-storage-daemon fail?

Sure:

$ touch /tmp/fuse-export

$ storage-daemon/qemu-storage-daemon \
   --object iothread,id=iothr0 \
   --blockdev file,node-name=node0,filename=/tmp/fuse-export \
   --export 
fuse,id=exp0,node-name=node0,mountpoint=/tmp/fuse-export,iothread=iothr0,writable=true 
\
   &
[1] 96997

$ truncate /tmp/fuse-export -s 1M
qemu-storage-daemon: ../block.c:6197: bdrv_get_flags: Assertion 
`qemu_in_main_thread()' failed.
truncate: failed to truncate '/tmp/fuse-export' at 1048576 bytes: 
Software caused connection abort
truncate: failed to close '/tmp/fuse-export': Transport endpoint is not 
connected
[1]  + 96997 IOT instruction (core dumped) 
storage-daemon/qemu-storage-daemon --object iothread,id=iothr0 --blockdev

$ fusermount -u /tmp/fuse-export

Relevant part of the stacktrace:

#5  0x00007f68322243a6 in __GI___assert_fail 
(assertion=assertion@entry=0x562380ca2f53 "qemu_in_main_thread()", 
file=file@entry=0x562380ca53cd "../block.c", line=line@entry=6197,
     function=function@entry=0x562380ca78e8 <__PRETTY_FUNCTION__.63> 
"bdrv_get_flags") at assert.c:101
#6  0x0000562380b64283 in bdrv_get_flags (bs=0x562382440680) at 
../block.c:6197
#7  0x0000562380b68506 in bdrv_get_flags (bs=bs@entry=0x562382440680) at 
../block.c:6199
#8  0x0000562380be6d18 in raw_handle_perm_lock (errp=0x7f68277103b0, 
new_shared=31, new_perm=11, op=RAW_PL_PREPARE, bs=0x562382440680) at 
../block/file-posix.c:975
#9  raw_check_perm (bs=0x562382440680, perm=11, shared=31, 
errp=0x7f68277103b0) at ../block/file-posix.c:3172
#10 0x0000562380b66db5 in bdrv_drv_set_perm (errp=0x7f68277103b0, 
tran=0x7f68180038b0, shared_perm=31, perm=11, bs=0x562382440680) at 
../block.c:2272
#11 bdrv_node_refresh_perm (errp=0x7f68277103b0, tran=0x7f68180038b0, 
q=0x0, bs=0x562382440680) at ../block.c:2441
#12 bdrv_list_refresh_perms (list=list@entry=0x56238243a1c0 = {...}, 
q=q@entry=0x0, tran=tran@entry=0x7f68180038b0, 
errp=errp@entry=0x7f68277103b0) at ../block.c:2479
#13 0x0000562380b67098 in bdrv_refresh_perms (bs=0x562382440680, 
errp=errp@entry=0x7f68277103b0) at ../block.c:2542
#14 0x0000562380b6727c in bdrv_child_try_set_perm (c=0x56238243cf70, 
perm=11, shared=31, errp=0x0) at ../block.c:2557
#15 0x0000562380b8632d in blk_set_perm (blk=0x56238243e7a0, perm=11, 
shared_perm=31, errp=errp@entry=0x0) at ../block/block-backend.c:890
#16 0x0000562380b57a7d in fuse_do_truncate 
(exp=exp@entry=0x56238243eb20, size=1048576, 
req_zero_write=req_zero_write@entry=true, 
prealloc=prealloc@entry=PREALLOC_MODE_OFF) at ../block/export/fuse.c:405
#17 0x0000562380b58121 in fuse_setattr (req=0x7f6818003800, inode=1, 
statbuf=0x7f68277104e0, to_set=8, fi=0x7f68277104b0) at 
../block/export/fuse.c:476

> raw_handle_perm_lock() is currently called by these three callbacks:
>     .bdrv_check_perm = raw_check_perm,
>     .bdrv_set_perm   = raw_set_perm,
>     .bdrv_abort_perm_update = raw_abort_perm_update,
>
> all three function pointers are defined as GS functions. So I don't 
> understand why is this failing.

Because this patch explicitly allows I/O code to call 
blk_set/get_perm().  But as you rightly say, all permission functions 
are still classified as GS code, so we can’t allow it.

Hanna

>>>
>>> It looks like in this case making bdrv_get_flags() not a GS function 
>>> would be feasible and might solve the problem, but I guess we should 
>>> instead think about adding something like
>>>
>>> if (!exp->growable && !qemu_in_main_thread()) {
>>>      /* Changing permissions like below only works in the main 
>>> thread */
>>>      return -EPERM;
>>> }
>>>
>>> to fuse_do_truncate().
>>>
>>> Ideally, to make up for this, we should probably take the RESIZE 
>>> permission in fuse_export_create() for writable exports in iothreads.
>>
>> I think I got it. I will send the RESIZE permission fix in a separate 
>> patch.
>>
>> Thank you,
>> Emanuele
>


