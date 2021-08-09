Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A5C3E43F4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:32:08 +0200 (CEST)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2Zj-0003v7-JQ
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD2YR-00038g-59
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD2YO-00079Y-Tl
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628505043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfUSg2vo8viFalDoVIdO5S8XCwyP41Lw0khbf0woo+8=;
 b=R6URtK9xihNVwcAQjV9HtUZQbJoouR57tm6MtCIdKpOdi976bWtsi4rvLDT3siH5C/5mmD
 tU2HAA+ShjHijgjRJB106rDTqU43qeURC745dD93vIJCkfDSDiZxmIEj6kR6F23rB+Kevw
 x0Teuu1HWS+SWoYle/61o9lmUqRMm90=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-f-aTSRunP9unFHM_LBIjxg-1; Mon, 09 Aug 2021 06:30:42 -0400
X-MC-Unique: f-aTSRunP9unFHM_LBIjxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so3883869wmc.3
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UfUSg2vo8viFalDoVIdO5S8XCwyP41Lw0khbf0woo+8=;
 b=dUqj7mh4FvD93P5PDAMqpMHV9aIElnBIJFYvjvWH5eStzEh4PKxHdAT7PhXqr1wC3E
 MWVfL0GMefTYVgp+CEi3/5gyTSlxgpYgXBlhuB3uVXWEdv0R9CgsNt5KSZGcql3GHTQ7
 z3CP0WkbNXq7TRFSL06jjQpcUVMcmKrCnDJ06bKb7PVCghGmWBwfUXcOb0xxs0eMT1Hi
 xgwjjJoi12JAljCwNh6ZzLyg5/wlFC8vHMG0DT0zRKqYMkXPSAS7u2hySnjM5wqg9JqN
 88rOMtnZtLNuPnCwtKhpO4zo9GveQClXKHGNdMFLnZT7mBNAsjMz3NNPNkxPwBvn9IKi
 rDLg==
X-Gm-Message-State: AOAM533UKlLD/FOgQuMoh8IC7HFZftRjWkPszs6jllIS3BCFUzqgOqAy
 spfBkuO079qOPT+UZQ/N2A+srjVrlLRxVv3+0Y+1Qk3vCmO2piW0WMtpMjwht6XrCnKtgY9tZGF
 9OTriDXipnD1BBSg=
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr15764492wmm.63.1628505041542; 
 Mon, 09 Aug 2021 03:30:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW8KvI8KvTKCYiz8VsHhTc1QPmjwVV/hajr3c7QQ3FBRmX0FwYnrB04uD51XH3NITFQUAgMg==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr15764470wmm.63.1628505041377; 
 Mon, 09 Aug 2021 03:30:41 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 x12sm19419532wrt.35.2021.08.09.03.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 03:30:41 -0700 (PDT)
Subject: Re: [PATCH v3 01/10] virtiofsd: Limit setxattr()'s creds-dropped
 region
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-2-mreitz@redhat.com> <YQ1EJxcBlUHA8uek@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <65036c43-8ea6-769c-d616-3ebe1c626f53@redhat.com>
Date: Mon, 9 Aug 2021 12:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQ1EJxcBlUHA8uek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 16:16, Vivek Goyal wrote:
> On Fri, Jul 30, 2021 at 05:01:25PM +0200, Max Reitz wrote:
>> We only need to drop/switch our credentials for the (f)setxattr() call
>> alone, not for the openat() or fchdir() around it.
>>
>> (Right now, this may not be that big of a problem, but with inodes being
>> identified by file handles instead of an O_PATH fd, we will need
>> open_by_handle_at() calls here, which is really fickle when it comes to
>> credentials being dropped.)
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tools/virtiofsd/passthrough_ll.c | 34 +++++++++++++++++++++++---------
>>   1 file changed, 25 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 38b2af8599..1f27eeabc5 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -3121,6 +3121,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>>       bool switched_creds = false;
>>       bool cap_fsetid_dropped = false;
>>       struct lo_cred old = {};
>> +    bool open_inode;
>>   
>>       if (block_xattr(lo, in_name)) {
>>           fuse_reply_err(req, EOPNOTSUPP);
>> @@ -3155,7 +3156,24 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>>       fuse_log(FUSE_LOG_DEBUG, "lo_setxattr(ino=%" PRIu64
>>                ", name=%s value=%s size=%zd)\n", ino, name, value, size);
>>   
>> +    /*
>> +     * We can only open regular files or directories.  If the inode is
>> +     * something else, we have to enter /proc/self/fd and use
>> +     * setxattr() on the link's filename there.
>> +     */
>> +    open_inode = S_ISREG(inode->filetype) || S_ISDIR(inode->filetype);
>>       sprintf(procname, "%i", inode->fd);
>> +    if (open_inode) {
>> +        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
>> +        if (fd < 0) {
>> +            saverr = errno;
>> +            goto out;
>> +        }
>> +    } else {
>> +        /* fchdir should not fail here */
>> +        FCHDIR_NOFAIL(lo->proc_self_fd);
>> +    }
>> +
>>       /*
>>        * If we are setting posix access acl and if SGID needs to be
>>        * cleared, then switch to caller's gid and drop CAP_FSETID
>> @@ -3176,20 +3194,13 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>>           }
>>           switched_creds = true;
>>       }
>> -    if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
>> -        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
>> -        if (fd < 0) {
>> -            saverr = errno;
>> -            goto out;
>> -        }
>> +    if (open_inode) {
>> +        assert(fd >= 0);
>>           ret = fsetxattr(fd, name, value, size, flags);
>>           saverr = ret == -1 ? errno : 0;
>>       } else {
>> -        /* fchdir should not fail here */
>> -        FCHDIR_NOFAIL(lo->proc_self_fd);
>>           ret = setxattr(procname, name, value, size, flags);
>>           saverr = ret == -1 ? errno : 0;
>> -        FCHDIR_NOFAIL(lo->root.fd);
>>       }
>>       if (switched_creds) {
>>           if (cap_fsetid_dropped)
>> @@ -3198,6 +3209,11 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>>               lo_restore_cred(&old, false);
>>       }
>>   
>> +    if (!open_inode) {
>> +        /* Change CWD back, fchdir should not fail here */
>> +        FCHDIR_NOFAIL(lo->root.fd);
>> +    }
>> +
> This FCHDIR_NOFAIL() will also need to be called if lo_drop_cap_change_cred()
> fails.
>
>          ret = lo_drop_cap_change_cred(req, &old, false, "FSETID",
>                                        &cap_fsetid_dropped);
>          if (ret) {
>              saverr = ret;
>              goto out;
>          }

Oh, right, thanks!

Max


