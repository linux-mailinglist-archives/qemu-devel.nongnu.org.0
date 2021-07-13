Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A963C72CE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:08:30 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3K1N-00016U-Pw
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m3K0a-0000P4-Bp
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m3K0X-000795-FE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626188855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMUlyRNNTNus1eFOkZe86yrapouZRznKZ5P26DkuyUM=;
 b=K7fZmxHxuI4QidqgIOabHu6tyffoMM9FONv6JvuVLrL0Z7b95IRuaymcaosuDSWOO6n27A
 ksFvdsc3SGgIi5ubY6QhuEniUgBBRXvM38SS3ZhVtDMDqBZ42NF4sx4mJR2YrJz7vJLaSm
 brdqeFh1XswZZs5wbmAlhXWvGjsfdg0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-l_5r9GSANeGkPqox50kyvQ-1; Tue, 13 Jul 2021 11:07:34 -0400
X-MC-Unique: l_5r9GSANeGkPqox50kyvQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a05600c3547b0290229a389ceb2so625643wmq.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iMUlyRNNTNus1eFOkZe86yrapouZRznKZ5P26DkuyUM=;
 b=nTJhbcfdczeusYuFGFiLXkaJzXpJqbCHHfromJtAC9CB8vTYCi9Y9LAvZUchZ4rgjt
 twdYHpCHkeJd6zqREESCny0K6q3UlaC7rO0uzAuZy2xac58zqE2MJOEpCrPFekIZ065l
 onnc8iyjEElykyXFckaxsyMZbMUKXv+6Bn9mf4zEfAqu79Low22pMK9JA7opCcZDE+KU
 gxvn177OhBpbMv/hdtAp4NOW6u9X9eW9hc6tNkO8kqFQHQKuWLxcTtt1C47U7njpizsm
 Y0ueWdbkxVus26FnKRG6pIZyIYhugVtTQFFADAZ1QO3kIps5DhZIbWWh/TgGHpRphXmG
 AYYw==
X-Gm-Message-State: AOAM5316qlWHezmPb2XW9PDa+41cbnKc2v0YFQoE+d8rBMBUuxKJhsoZ
 9uyGnA4ebIpYy33voC0KWn0Nbq0/AaP3DPOyyyGNeqFA46Bl5e9MIru4Fm87TDAxt+cTtkKWNW6
 11nX99Gy/PQS+Fn8=
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr5456744wmq.145.1626188853100; 
 Tue, 13 Jul 2021 08:07:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBsS05C3MQkBqvS831MpsGT1Akf07kI2yc1Gveb+sfO1LncbmwqyV5t38twbFIX5bKWIJDOw==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr5456714wmq.145.1626188852843; 
 Tue, 13 Jul 2021 08:07:32 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 o11sm3001156wmc.2.2021.07.13.08.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 08:07:32 -0700 (PDT)
Subject: Re: [Virtio-fs] [PATCH v2 7/9] virtiofsd: Add inodes_by_handle hash
 table
From: Max Reitz <mreitz@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
 <20210609155551.44437-8-mreitz@redhat.com>
 <20210611200459.GB767764@redhat.com>
 <9cea5642-e5ea-961f-d816-0998e52aad9f@redhat.com>
 <20210617212143.GD1142820@redhat.com>
 <1e5dafd2-34e0-1a25-2cb5-6822eaf2502c@redhat.com>
 <20210618182901.GB1252241@redhat.com>
 <eec1bcd6-957d-8e9f-457c-fb717b71336b@redhat.com>
Message-ID: <eda4ee02-56f8-079d-0829-041ed3471aed@redhat.com>
Date: Tue, 13 Jul 2021 17:07:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eec1bcd6-957d-8e9f-457c-fb717b71336b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

So I’m coming back to this after three weeks (well, PTO), and this again 
turns into a bit of a pain, actually.

I don’t think it’s anything serious, but I had thought we had found 
something that would make us both happy because it wouldn’t be too ugly, 
and now it’s turning ugly again...  So I’m sending this mail as a heads 
up before I send v3 in the next days, to explain my thought process.

On 21.06.21 11:02, Max Reitz wrote:
> On 18.06.21 20:29, Vivek Goyal wrote:
>

[...]

>> I am still reading your code and trying to understand it. But one
>> question came to mind. What happens if we can generate file handle
>> during lookup. But can't generate when same file is looked up again.
>>
>> - A file foo.txt is looked. We can create file handle and we add it
>>    to lo->inodes_by_handle as well as lo->inodes_by_ds.
>>
>> - Say somebody deleted file and created again and inode number got
>>    reused.
>>
>> - Now during ->revalidation path, lookup happens again. This time say
>>    we can't generate file handle. If am reading lo_do_find() code
>>    correctly, it will find the old inode using ids and return same
>>    inode as result of lookup. And we did not recognize that inode
>>    number has been reused.
>
> Oh, that’s a good point.  If an lo_inode has no O_PATH fd but is only 
> addressed by handle, we must always look it up by handle.

Also, just wanted to throw in this remark:

Now that I read the code again, lo_do_find() already has a condition to 
prevent this.  It’s this:

if (p && fhandle != NULL && p->fhandle != NULL) {
     p = NULL;
}

There’s just one thing wrong with it, and that is the `fhandle != NULL` 
part.  It has no place there.  But this piece of code does exactly what 
we’d need it do if it were just:

if (p && p->fhandle != NULL) {
     p = NULL;
}

[...]

> However, you made a good point in that we must require 
> name_to_handle_at() to work if it worked before for some inode, not 
> because it would be simpler, but because it would be wrong otherwise.
>
> As for the other way around...  Well, now I don’t have a strong 
> opinion on it.  Handling temporary name_to_handle_at() failure after 
> it worked the first time should not add extra complexity, but it 
> wouldn’t be symmetric.  Like, allowing temporary failure sometimes but 
> not at other times.

(I think I mistyped here, it should be “Handling name_to_handle_at() 
randomly working after it failed the first time”.)

> The next question is, how do we detect temporary failure, because if 
> we look up some new inode, name_to_handle_at() fails, we ignore it, 
> and then it starts to work and we fail all further lookups, that’s not 
> good.  We should have the first lookup fail.  I suppose ENOTSUPP means 
> “OK to ignore”, and for everything else we should let lookup fail?  
> (And that pretty much answers my "what if name_to_handle_at() works 
> the first time, but then fails" question.  If we let anything but 
> ENOTSUPP let the lookup fail, then we should do so every time.)

I don’t think this will work as cleanly as I’d hoped.

The problem I’m facing is that get_file_handle() doesn’t only call 
name_to_handle_at(), but also contains a lot of code managing 
mount_fds.  There are a lot of places that can fail, too, and I think we 
should have them fall back to using an O_PATH FD:

Say mount_fds doesn’t contain an FD for the new handle’s mount ID yet, 
so we want to add one.  However, it turns out that the file is not a 
regular file or directory, so we cannot open it as a regular FD and add 
it to mount_fds; or that it is a regular file, but without permission to 
open it O_RDONLY.  So we cannot return a file handle, because it will 
not be usable until a mount FD is added.

I think in such a case we should fall back to an O_PATH FD, because this 
is not some unexpected error, but just an unfortunate (but reproducible 
and valid) circumstance where using `-o inode_file_handles` fails to do 
something that works without it.

Now, however, this means that the next time we try to generate a handle 
for this file (to look it up), it will absolutely work if some other FD 
was added to mount_fds for this mount ID in the meantime.


We could get around this by not trying to open the file for which we are 
to generate a handle to add its FD to mount_fds, but instead doing what 
the open_by_handle_at() man page suggests:

> The mount_id argument returns an identifier for the filesystem mount 
> that corresponds to pathname. This corresponds to the first field in 
> one of the records in /proc/self/mountinfo. Opening the pathname in 
> the fifth field of that record yields a file descriptor for the mount 
> point; that file descriptor can be used in a subsequent call to 
> open_by_handle_at().

However, I’d rather avoid parsing mountinfo.  And as far as I 
understand, the only problem here is that we’ll have to cope with the 
fact that sometimes on lookups, we can generate a file handle, but the 
lo_inode we want to find has no file handle attached to it (because 
get_file_handle() failed the first time), and so we won’t find it by 
that handle but have to look it up by its inode ID. (Which is safe, 
because that lo_inode must have an O_PATH FD attached to it, so the 
inode ID cannot be reused.)  And that’s something that this series 
already does, so I tend to favor that over parsing mountinfo.

Max


