Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD174347AF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:12:40 +0200 (CEST)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md7eJ-000117-RB
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1md7d9-0000IK-7n
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:11:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1md7d7-0001WK-Gs
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634721084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lkz8g8PuLEaDDdbI9vL4uJy23DXh1iueMzLoO3ZcefU=;
 b=VmOMw4ZcLZ030t33ZcST+QzKoJJBCpXj/C4a2nQdf5r7Uoa4AmvfvVKnuJRjjV1DT8xc6d
 PjXocFml2bEGea4E7+w35A5hyLTL574VTQbJxSfdWy5k63pOycCQazfii3n39JHUtRa0LN
 Dk0RZZ/aHo/vW48iqFgok6p+7PQ0v6A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-LoNh9wqkOTmrPu6ihSPmPw-1; Wed, 20 Oct 2021 05:11:23 -0400
X-MC-Unique: LoNh9wqkOTmrPu6ihSPmPw-1
Received: by mail-wm1-f71.google.com with SMTP id
 s26-20020a7bc39a000000b0030d9db6c428so3857891wmj.6
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 02:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lkz8g8PuLEaDDdbI9vL4uJy23DXh1iueMzLoO3ZcefU=;
 b=lCg8QOkHfX60vJb3hMqh7zZmLKXHmXh/ZSGpxMaZo2HcA9K/5/25+Lpez/RkuOyJL3
 e1j+uIWO4DYiBFze70wS7q1uP7CqqEZ+5XSi5EIMJb3w19wz2k4qfVFBT0FIZXdMlSXo
 Lp7E+Y1r175THFVrVL6iKkgnZHwfbSyAkc/mOqej5CY+GsBkO8K/uel95j2V0SxUGEKz
 Zsa7092neVhuyec/Gjbg4ivyb5NNEJXphtEw13WxNZznav7DNoCRks6s0uD+kNHHEJt0
 icACF9D8Scx4/GjOI28UBowUWnwcBGy/5vAP02CsxZuGJho1VudlRvr2NP6tdyI6qoOX
 HqlA==
X-Gm-Message-State: AOAM533OFG7NjD24/f4wjeWF7oCyuGP0mHpTNU5QYMNYtKO/E12bJYAv
 tWdRYwoCI1weEkY5WG/v/hLvaeV18xUyPGOJQJN6TVrRU8LHNK0uN+r+k0QSt9414UHeHrdXMx9
 Zoi/Pbs/Kaaou8W8=
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr50140385wra.432.1634721082425; 
 Wed, 20 Oct 2021 02:11:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIBJbBk1UjXrgXIruc1EMY1onWsciebRLfO0Kyujr42D/IIvDqAZOIdmgAvx2eOcbKSEGaIQ==
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr50140349wra.432.1634721082128; 
 Wed, 20 Oct 2021 02:11:22 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id g8sm1460711wrx.26.2021.10.20.02.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 02:11:21 -0700 (PDT)
Message-ID: <014cde63-06de-16d1-8e28-2471c8c7eb14@redhat.com>
Date: Wed, 20 Oct 2021 11:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 02/12] virtiofsd: Limit setxattr()'s creds-dropped
 region
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
 <20210916084045.31684-3-hreitz@redhat.com> <YW2s9+UQa0jozC7z@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YW2s9+UQa0jozC7z@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.10.21 19:20, Vivek Goyal wrote:
> On Thu, Sep 16, 2021 at 10:40:35AM +0200, Hanna Reitz wrote:
>> We only need to drop/switch our credentials for the (f)setxattr() call
>> alone, not for the openat() or fchdir() around it.
>>
>> (Right now, this may not be that big of a problem, but with inodes being
>> identified by file handles instead of an O_PATH fd, we will need
>> open_by_handle_at() calls here, which is really fickle when it comes to
>> credentials being dropped.)
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tools/virtiofsd/passthrough_ll.c | 34 +++++++++++++++++++++++---------
>>   1 file changed, 25 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 6511a6acb4..b43afdfbd3 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -3123,6 +3123,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>>       bool switched_creds = false;
>>       bool cap_fsetid_dropped = false;
>>       struct lo_cred old = {};
>> +    bool changed_cwd = false;
>>   
>>       if (block_xattr(lo, in_name)) {
>>           fuse_reply_err(req, EOPNOTSUPP);
>> @@ -3158,6 +3159,24 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>>                ", name=%s value=%s size=%zd)\n", ino, name, value, size);
>>   
>>       sprintf(procname, "%i", inode->fd);
>> +    /*
>> +     * We can only open regular files or directories.  If the inode is
>> +     * something else, we have to enter /proc/self/fd and use
>> +     * setxattr() on the link's filename there.
>> +     */
>> +    if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
>> +        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
>> +        if (fd < 0) {
>> +            saverr = errno;
>> +            goto out;
>> +        }
>> +    } else {
>> +        /* fchdir should not fail here */
>> +        FCHDIR_NOFAIL(lo->proc_self_fd);
>> +        /* Set flag so the clean-up path will chdir back */
>> +        changed_cwd = true;
> Is there a need to move FCHDIR_NOFAIL() call earlier too? I am assuming
> this will not be impacted by file handle stuff. So we probably could
> leave it in place. Easier to read.

I wanted to limit the region where the creds are dropped to an absolute 
minimum, i.e. just around (f)setxattr().  I prefer this in general, not 
just because it breaks opening file handles, and so I wanted to pull out 
not just the openat(), but the fchdir() as well.

Hanna


