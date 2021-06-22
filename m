Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E993B08B3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:23:34 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviFR-0005Rt-9U
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lviE5-0003rY-7Z
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:22:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lviE2-0005MR-Jw
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624375325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUe+/yEXVojbgM/8L7ck6dmDvp+DGr41qlCPXWNg4bk=;
 b=brSvLsNJRrNg3cUC31400gZzH3W1BX3+GstkVkJ3Yl/9/iZgH36x4UFmI79OH1398U8kcs
 TAqzC82OVbOPQE99eQF80XP2YNKF3QOvfCRsOXs7g0J2+gj7I141yMAwLWIK1xqzUflhF/
 BpoyTHipsOF8vyWK248YM2alKKYVh1E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-Ejv8ZGofOkyOezHWwzoaig-1; Tue, 22 Jun 2021 11:22:04 -0400
X-MC-Unique: Ejv8ZGofOkyOezHWwzoaig-1
Received: by mail-wm1-f70.google.com with SMTP id
 i24-20020a1c54180000b02901dbcf5d699eso977449wmb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RUe+/yEXVojbgM/8L7ck6dmDvp+DGr41qlCPXWNg4bk=;
 b=BzqxOQLZfDOmWvHeOO7YIGl1pV+J+bepxT6LjHLXgMQw3rZkuAJvibAXopU9x1RouO
 QrOo1bEoRdA8++QPkeSyYrMcXe3cj5mLDx4uYnkSbNo3cF7MPr01Enr+K2HxR5bHtiZn
 FrB9qTEIFZzBusqqlJA7ncdRyL8vehFn4FaHB+wGraMZR/CaJXyXTzdKj++HD9UDb2No
 i5t41AlKZjl9HbpJx4m/vVvoyj4vQKzM5JzZZM3X9Ix26uc4vtG9y4i/hOcEKO2FV7K2
 f5gQCrNqqpHk4dn51aVlw5pwPjns4GexS+9uJTHSiEV32byABsrJZOSTXdhChOao6bTz
 /ymA==
X-Gm-Message-State: AOAM532/IjpGSkPUfzLjXZMFPkjaUC2LKvWo1ZQB3Fg6X+rxdx5XvBU+
 mqmM4hanZ6rOyUtcwy134pcn5r/7gDSCuISAf0RroAhuXht+POf25xbL+EzR1QYgZfeY94u2OOy
 oJy8lAX7lC/SOWiy/vONs7sYtG9ppQxR2F4evAq5bgb75OjNFznXWqhCxRDrUX7mY
X-Received: by 2002:a7b:c395:: with SMTP id s21mr5276478wmj.164.1624375323139; 
 Tue, 22 Jun 2021 08:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaRT3vJw7tKACUGIHp2Nc0BfxRTcra9LwuXzv08uTm3kaKzhlzTfZi06G+rpVd8hjUI939bw==
X-Received: by 2002:a7b:c395:: with SMTP id s21mr5276460wmj.164.1624375322885; 
 Tue, 22 Jun 2021 08:22:02 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 v5sm2684344wml.26.2021.06.22.08.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 08:22:02 -0700 (PDT)
Subject: Re: [PATCH 3/4] export/fuse: Let permissions be adjustable
To: Kevin Wolf <kwolf@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
 <20210614144407.134243-4-mreitz@redhat.com> <YNH7l5V/hAKfBmb8@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8f2a3abb-4b42-6257-51b9-08982cd87cb4@redhat.com>
Date: Tue, 22 Jun 2021 17:22:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YNH7l5V/hAKfBmb8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.06.21 17:02, Kevin Wolf wrote:
> Am 14.06.2021 um 16:44 hat Max Reitz geschrieben:
>> Allow changing the file mode, UID, and GID through SETATTR.
>>
>> This only really makes sense with allow-other, though (because without
>> it, the effective access mode is fixed to be 0600 (u+rw) with qemu's
>> user being the file's owner), so changing these stat fields is not
>> allowed without allow-other.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/export/fuse.c | 48 ++++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 37 insertions(+), 11 deletions(-)
>>
>> diff --git a/block/export/fuse.c b/block/export/fuse.c
>> index 1d54286d90..742e0af657 100644
>> --- a/block/export/fuse.c
>> +++ b/block/export/fuse.c
>> @@ -47,6 +47,10 @@ typedef struct FuseExport {
>>       bool writable;
>>       bool growable;
>>       bool allow_other;
>> +
>> +    mode_t st_mode;
>> +    uid_t st_uid;
>> +    gid_t st_gid;
>>   } FuseExport;
>>   
>>   static GHashTable *exports;
>> @@ -120,6 +124,13 @@ static int fuse_export_create(BlockExport *blk_exp,
>>       exp->growable = args->growable;
>>       exp->allow_other = args->allow_other;
>>   
>> +    exp->st_mode = S_IFREG | S_IRUSR;
>> +    if (exp->writable) {
>> +        exp->st_mode |= S_IWUSR;
>> +    }
>> +    exp->st_uid = getuid();
>> +    exp->st_gid = getgid();
>> +
>>       ret = setup_fuse_export(exp, args->mountpoint, errp);
>>       if (ret < 0) {
>>           goto fail;
>> @@ -329,7 +340,6 @@ static void fuse_getattr(fuse_req_t req, fuse_ino_t inode,
>>       int64_t length, allocated_blocks;
>>       time_t now = time(NULL);
>>       FuseExport *exp = fuse_req_userdata(req);
>> -    mode_t mode;
>>   
>>       length = blk_getlength(exp->common.blk);
>>       if (length < 0) {
>> @@ -344,17 +354,12 @@ static void fuse_getattr(fuse_req_t req, fuse_ino_t inode,
>>           allocated_blocks = DIV_ROUND_UP(allocated_blocks, 512);
>>       }
>>   
>> -    mode = S_IFREG | S_IRUSR;
>> -    if (exp->writable) {
>> -        mode |= S_IWUSR;
>> -    }
>> -
>>       statbuf = (struct stat) {
>>           .st_ino     = inode,
>> -        .st_mode    = mode,
>> +        .st_mode    = exp->st_mode,
>>           .st_nlink   = 1,
>> -        .st_uid     = getuid(),
>> -        .st_gid     = getgid(),
>> +        .st_uid     = exp->st_uid,
>> +        .st_gid     = exp->st_gid,
>>           .st_size    = length,
>>           .st_blksize = blk_bs(exp->common.blk)->bl.request_alignment,
>>           .st_blocks  = allocated_blocks,
>> @@ -400,15 +405,23 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
>>   }
>>   
>>   /**
>> - * Let clients set file attributes.  Only resizing is supported.
>> + * Let clients set file attributes.  With allow_other, only resizing and
>> + * changing permissions (st_mode, st_uid, st_gid) is allowed.  Without
>> + * allow_other, only resizing is supported.
>>    */
>>   static void fuse_setattr(fuse_req_t req, fuse_ino_t inode, struct stat *statbuf,
>>                            int to_set, struct fuse_file_info *fi)
>>   {
>>       FuseExport *exp = fuse_req_userdata(req);
>> +    int supported_attrs;
>>       int ret;
>>   
>> -    if (to_set & ~FUSE_SET_ATTR_SIZE) {
>> +    supported_attrs = FUSE_SET_ATTR_SIZE;
>> +    if (exp->allow_other) {
>> +        supported_attrs |= FUSE_SET_ATTR_MODE | FUSE_SET_ATTR_UID |
>> +            FUSE_SET_ATTR_GID;
>> +    }
>> +    if (to_set & ~supported_attrs) {
>>           fuse_reply_err(req, ENOTSUP);
>>           return;
>>       }
>> @@ -426,6 +439,19 @@ static void fuse_setattr(fuse_req_t req, fuse_ino_t inode, struct stat *statbuf,
>>           }
>>       }
>>   
>> +    if (to_set & FUSE_SET_ATTR_MODE) {
>> +        /* Only allow changing the file mode, not the type */
>> +        exp->st_mode = (statbuf->st_mode & 07777) | S_IFREG;
>> +    }
> Should we check that the mode actually makes sense? Not sure if making
> an image executable has a good use case, and making it writable in the
> permissions for a read-only export isn't a good idea either.

I mean, I don’t mind what the user does.  It doesn’t really faze us, I 
believe.  If the image contains an executable ELF and the user wants to 
run it directly from FUSE...  I don’t mind.

As for +w on RO exports, I’m not sure.  This reminds me of `sudo chattr 
+i $file`, which effectively makes any regular file read-only, too, and 
it can still keep +w.  So the file permissions are basically just ACLs, 
getting permission for something doesn’t mean you can actually do it.

OTOH, the difference to `chattr +i` is that we’d allow opening the 
export R/W, only writing would then fail.  `chattr +i` does give EPERM 
when opening the file.

So I’m not quite sure.  I don’t really want to prevent the user from 
setting any access restrictions they want, but on the other hand, if 
writing can never work, then there really is no point in allowing +w.  
(Then I’m wondering, if we don’t allow +w, should we silently drop it or 
return an error?  I guess returning success but not actually succeeding 
is weird, so we probably should return EROFS.)

But +x can technically work, so I wouldn’t disallow it.

Max


