Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0064347C2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:18:01 +0200 (CEST)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md7jU-0005pV-FJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1md7hg-0004il-Vv
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1md7hZ-0001yg-AK
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634721359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+Br5rl727BjsScCpGxHFALxRCgCVTzDZjcjWAthwh4=;
 b=D/rffcb4p1+czmTr136cez6/5s6jTf5v9Lkd9xkaPE3paBMaNw5/8G3Afo33uC9jkw4fj/
 S60RtW3D/4XYZzhfFFWwrWgR3aMeeqk/bhZqe7E7UVrAsSopGoTFdG5rJy/ISv6u/tJ6Bz
 lyuh5K52M960EangXg+zIjOnu7u3TsY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-5Xc08QdQNS68l-p_VRNg-Q-1; Wed, 20 Oct 2021 05:15:58 -0400
X-MC-Unique: 5Xc08QdQNS68l-p_VRNg-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 s25-20020a7bc399000000b0030da0f36afeso2793742wmj.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 02:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d+Br5rl727BjsScCpGxHFALxRCgCVTzDZjcjWAthwh4=;
 b=lKc3pt4xx+jG52mtmO63uDo41ql9zhs7gCiy3ugAWpt1tAbdNxGlAPXSmo0JbCNDpm
 IlqIVbGmtVCdyHoLXw4AWtMc8+JAGie7PkzJjcAhD6IOzuCmV/Cj7kyF4kKljJKKcRG0
 wS5MlslC2pAn0CTVH9dUW+eRg11flFwRpEeOW5rhDLRKkx1tkgl8KfyVf0PXTevwh+gZ
 d3+v3SmOfoiD5W0qtMW2eePylXQdEmU878xNbKffn+lncuhAh0m3EvshD6yZt8kVx5t4
 Z4DTObPITRG7MheVEM++h7QBPZUfsAmcvXiPM+RmB+tSCmSBlMLIckOpm15C4u8O6P1K
 hZrA==
X-Gm-Message-State: AOAM5301CcDsnzGzL63KNxNE6/aeFw00mTy5YH5Lz/U/yGB1Yn8EOJ3V
 zPop/RuMzbyTLRGGaBJFN8WjO4wzSbPs6zO4K+wYjAO9lvJPqv23pboj+KT4xys4Y/7PDjm9KbY
 W35z2BN+QTHknJXU=
X-Received: by 2002:a5d:64e9:: with SMTP id g9mr50109100wri.99.1634721357234; 
 Wed, 20 Oct 2021 02:15:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr2viZ9UiFzhyefYMGQi0T/5yuGfJmzOY7r4B6ILKZJ6eJTwXYkipiOWKC4Usb1kQIyXt9xg==
X-Received: by 2002:a5d:64e9:: with SMTP id g9mr50109077wri.99.1634721356992; 
 Wed, 20 Oct 2021 02:15:56 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id r5sm4332376wmh.28.2021.10.20.02.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 02:15:56 -0700 (PDT)
Message-ID: <85b2d980-f309-cf58-ae5c-a1be00511219@redhat.com>
Date: Wed, 20 Oct 2021 11:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 07/12] virtiofsd: Let lo_inode_open() return a TempFd
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
 <20210916084045.31684-8-hreitz@redhat.com> <YW3ImM9WhNrZnSxN@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YW3ImM9WhNrZnSxN@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 18.10.21 21:18, Vivek Goyal wrote:
> On Thu, Sep 16, 2021 at 10:40:40AM +0200, Hanna Reitz wrote:
>> Strictly speaking, this is not necessary, because lo_inode_open() will
>> always return a new FD owned by the caller, so TempFd.owned will always
>> be true.
>>
>> The auto-cleanup is nice, though.  Also, we get a more unified interface
>> where you always get a TempFd when you need an FD for an lo_inode
>> (regardless of whether it is an O_PATH FD or a non-O_PATH FD).
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tools/virtiofsd/passthrough_ll.c | 156 +++++++++++++++----------------
>>   1 file changed, 75 insertions(+), 81 deletions(-)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 3bf20b8659..d257eda129 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -293,10 +293,8 @@ static void temp_fd_clear(TempFd *temp_fd)
>>   /**
>>    * Return an owned fd from *temp_fd that will not be closed when
>>    * *temp_fd goes out of scope.
>> - *
>> - * (TODO: Remove __attribute__ once this is used.)
>>    */
>> -static __attribute__((unused)) int temp_fd_steal(TempFd *temp_fd)
>> +static int temp_fd_steal(TempFd *temp_fd)
>>   {
>>       if (temp_fd->owned) {
>>           temp_fd->owned = false;
>> @@ -309,10 +307,8 @@ static __attribute__((unused)) int temp_fd_steal(TempFd *temp_fd)
>>   /**
>>    * Create a borrowing copy of an existing TempFd.  Note that *to is
>>    * only valid as long as *from is valid.
>> - *
>> - * (TODO: Remove __attribute__ once this is used.)
>>    */
>> -static __attribute__((unused)) void temp_fd_copy(const TempFd *from, TempFd *to)
>> +static void temp_fd_copy(const TempFd *from, TempFd *to)
>>   {
>>       *to = (TempFd) {
>>           .fd = from->fd,
>> @@ -689,9 +685,12 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino, TempFd *tfd)
>>    * when a malicious client opens special files such as block device nodes.
>>    * Symlink inodes are also rejected since symlinks must already have been
>>    * traversed on the client side.
>> + *
>> + * The fd is returned in tfd->fd.  The return value is 0 on success and -errno
>> + * otherwise.
>>    */
>>   static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
>> -                         int open_flags)
>> +                         int open_flags, TempFd *tfd)
>>   {
>>       g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
>>       int fd;
>> @@ -710,7 +709,13 @@ static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
>>       if (fd < 0) {
>>           return -errno;
>>       }
>> -    return fd;
>> +
>> +    *tfd = (TempFd) {
>> +        .fd = fd,
>> +        .owned = true,
>> +    };
>> +
>> +    return 0;
>>   }
>>   
>>   static void lo_init(void *userdata, struct fuse_conn_info *conn)
>> @@ -854,7 +859,8 @@ static int lo_fi_fd(fuse_req_t req, struct fuse_file_info *fi)
>>   static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>>                          int valid, struct fuse_file_info *fi)
>>   {
>> -    g_auto(TempFd) path_fd = TEMP_FD_INIT;
>> +    g_auto(TempFd) path_fd = TEMP_FD_INIT; /* at least an O_PATH fd */
> What does atleast O_PATH fd mean?

It means it might as well be an O_RDWR FD.  When we open an O_RDWR FD, 
it’s pointless to open an O_PATH FD, too, because we can use the O_RDWR 
FD everywhere where we’d need an O_PATH FD.  Hence in this case, we open 
rw_fd and copy it to path_fd.

Users still use rw_fd and path_fd according to what they need.

>
>> +    g_auto(TempFd) rw_fd = TEMP_FD_INIT; /* O_RDWR fd */
>>       int saverr;
>>       char procname[64];
>>       struct lo_data *lo = lo_data(req);
>> @@ -868,7 +874,15 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>>           return;
>>       }
>>   
>> -    res = lo_inode_fd(inode, &path_fd);
>> +    if (!fi && (valid & FUSE_SET_ATTR_SIZE)) {
>> +        /* We need an O_RDWR FD for ftruncate() */
>> +        res = lo_inode_open(lo, inode, O_RDWR, &rw_fd);
>> +        if (res >= 0) {
>> +            temp_fd_copy(&rw_fd, &path_fd);
> I am lost here. If lo_inode_open() failed, why are we calling this
> temp_fd_copy()? path_fd is not even a valid fd yet.

We’re calling it on success.

> Still beats me that why open rw_fd now instead of down in
> FUSE_SET_ATTR_SIZE block. I think we had this discussion and you
> had some reasons to move it up.

Because it’s pointless overhead to open two FDs.

Before file handles, getting the O_PATH FD was a trivial operation. If 
we needed an O_RDWR FD later, we’d open it later.  No duplicate work 
involved.

With file handles, getting the O_PATH FD may mean opening a new FD. 
Opening another FD from the same file handle, just with different flags, 
later on would be strange, because we could have just opened the FD as 
O_RDWR right from the start.

Hanna


