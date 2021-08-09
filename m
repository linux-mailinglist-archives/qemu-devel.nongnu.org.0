Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4B3E46D5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:42:20 +0200 (CEST)
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5Xn-0003e2-NH
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD5WT-0001sO-TO
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 09:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD5WQ-00054M-KT
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 09:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628516451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7znOMU21sABj0oQpqf1pkQM7tKTfvturEVG3NAugRKU=;
 b=dKVEfPiZOHwtUl0Lz+VRhQIPrqW8IQpHmcBWMTA4CCtqGOM24UkAZqXTOTErAgmUaI84bZ
 oU+HQXqs3GE1UgxNo0++m+9UqdASTluNi13LY9XH0HAJZdwyRVfKe4BV8MLoi3eadxxKzD
 vaSGW3exwOMm05Gnd1hoOVaaoVGrIRY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-p6EAJK_PPPqvNJnUK8I0nA-1; Mon, 09 Aug 2021 09:40:50 -0400
X-MC-Unique: p6EAJK_PPPqvNJnUK8I0nA-1
Received: by mail-wm1-f72.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so2548573wmd.7
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 06:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7znOMU21sABj0oQpqf1pkQM7tKTfvturEVG3NAugRKU=;
 b=rIMO/CEGg2jWKtbQFDFcMTX8baUr55UReE7wx72SvU3ciMEEOY/NSu7MBcN6yqo2+y
 PWLib6kdHM6xFAnUWWHqc4vlM2rxsYZPHk4rpol1P9HQcJNj2qOV+gsr/YhSlUJNUw4h
 SsOiGevhyNszkn1G55ncJoupgHO2nlpGwUK4o4LRIdSoGulEMkjwJSE1B+YneY9LAAGO
 yOrjFMsKmwFCgd9+IdejkS0yZ7HQkkP2/7WwtkcXCL2QlAXWe3GNtDbjHUgbNQ33p8O9
 5V0BcCdJ9/KVltVHpZYZAaVP/TWo8pOsHbYFPZgEkOVTM+Zp94x8GjqlPw3TvfCL0SfV
 2Yeg==
X-Gm-Message-State: AOAM530bIZEbayUVw/eyXLmhgJG3VygGBlWfzEBiY3xV/NeNO1ki2+nB
 EgMdkYu231rGCW11jHcTrRY0eqn8AVMDkWvySKsa3XdhxXg+eamUUSK9Ldz0rmMI6D4vIVxBFpD
 XeZ8kIxyk9pJKT70=
X-Received: by 2002:a1c:1f17:: with SMTP id f23mr7316074wmf.136.1628516449325; 
 Mon, 09 Aug 2021 06:40:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEsjydhDXftpPoowt+OtAH0Zcu+H/xmKy0ejPaWGi7dPnCZ1OYfSd1Njry8uoDn0xXMjPlUw==
X-Received: by 2002:a1c:1f17:: with SMTP id f23mr7316044wmf.136.1628516449004; 
 Mon, 09 Aug 2021 06:40:49 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 g12sm19575843wri.49.2021.08.09.06.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 06:40:48 -0700 (PDT)
Subject: Re: [PATCH v3 06/10] virtiofsd: Let lo_inode_open() return a TempFd
To: Vivek Goyal <vgoyal@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-7-mreitz@redhat.com> <YQ2TleuDejJY4O4V@redhat.com>
From: Max Reitz <hreitz@redhat.com>
Message-ID: <87ab005c-9ae2-d2c8-f20f-8dea9627ccbc@redhat.com>
Date: Mon, 9 Aug 2021 15:40:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQ2TleuDejJY4O4V@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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

On 06.08.21 21:55, Vivek Goyal wrote:
> On Fri, Jul 30, 2021 at 05:01:30PM +0200, Max Reitz wrote:
>> Strictly speaking, this is not necessary, because lo_inode_open() will
>> always return a new FD owned by the caller, so TempFd.owned will always
>> be true.
>>
>> However, auto-cleanup is nice, and in some cases this plays nicely with
>> an lo_inode_fd() call in another conditional branch (see lo_setattr()).
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tools/virtiofsd/passthrough_ll.c | 138 +++++++++++++------------------
>>   1 file changed, 59 insertions(+), 79 deletions(-)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 9e1bc37af8..292b7f7e27 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -291,10 +291,8 @@ static void temp_fd_clear(TempFd *temp_fd)
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
>> @@ -673,9 +671,12 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino, TempFd *tfd)
>>    * when a malicious client opens special files such as block device nodes.
>>    * Symlink inodes are also rejected since symlinks must already have been
>>    * traversed on the client side.
>> + *
>> + * The fd is returned in tfd->fd.  The return value is 0 on success and -errno
>> + * otherwise.
>>    */
>> -static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
>> -                         int open_flags)
>> +static int lo_inode_open(const struct lo_data *lo, const struct lo_inode *inode,
>> +                         int open_flags, TempFd *tfd)
>>   {
>>       g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
>>       int fd;
>> @@ -694,7 +695,13 @@ static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
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
>> @@ -852,7 +859,12 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>>           return;
>>       }
>>   
>> -    res = lo_inode_fd(inode, &inode_fd);
>> +    if (!fi && (valid & FUSE_SET_ATTR_SIZE)) {
>> +        /* We need an O_RDWR FD for ftruncate() */
>> +        res = lo_inode_open(lo, inode, O_RDWR, &inode_fd);
>> +    } else {
>> +        res = lo_inode_fd(inode, &inode_fd);
>> +    }
> A minor nit.
>
> So inode_fd could hold either an O_PATH fd returned by lo_inode_fd()
> or a O_RDWR fd returned by lo_inode_open().
>
> Previous code held these fds in two different variables, inode_fd and
> truncfd respectively. I kind of found that easier to read because looking
> at variable name, I knew whether I am dealing with O_PATH fd or an
> O_RDWR fd I just opened.
>
> So a minor nit. We could continue to have two variables, say
> inode_fd and trunc_fd. Just that type of trunc_fd will now be TempFd.
>
> Also I liked previous style easier to read where I always got hold
> of O_PATH fd first. And later opened a O_RDWR fd if operation
> is FUSE_ATTR_SIZE. So "valid & FUSE_SET_ATTR_SIZE" check was not
> at two places.

Oh, yes.  The problem with that approach is that we unconditionally need 
to get an O_PATH fd, which is trivial for when we have one, but with 
file handles this means an open_by_handle_at() operation – and then 
another one to get the O_RDWR fd.  So there’s a superfluous 
open_by_handle_at() operation there.

I understand this makes the code a bit more complicated, but I felt 
there was sufficient reason for it.

That also means that I don’t really want to differentiate the fd into 
two distinct fd variables.  Nothing in this function needs an O_PATH fd, 
it’s just that that’s the easier one to open, so those places can work 
with any fd.

What we could do is have an rw_fd variable and a path_fd variable. The 
former will only be valid if the conditions are right (!fi && (valid & 
FUSE_SET_ATTR_SIZE)), the latter will always be valid and will be the 
same fd as rw_fd if the latter is valid.

However, both need to be TempFds, because both lo_inode_open() and 
lo_inode_fd() return TempFds.  So copying from rw_fd to path_fd would 
require a new function temp_fd_copy() or something, so the code would 
look like:

if (!fi && (valid & FUSE_SET_ATTR_SIZE)) {
     res = lo_inode_open(..., &rw_fd);
     if (res >= 0) {
         temp_fd_copy(&rw_fd, &path_fd);
     }
} else {
     res = lo_inode_fd(..., &path_fd);
}

with

void temp_fd_copy(const TempFd *from, const TempFd *to)
{
     *to = {
         .fd = to->fd,
         .owned = false,
     };
}

And then we use path_fd wherever an O_PATH fd would suffice, and rw_fd 
elsewhere (perhaps with a preceding assert(rw_fd.fd >= 0)).  Would that 
be kind of in accordance with what you had in mind?

> Anyway, this is a minor nit. If you don't like the idea of using
> two separate variables to hold O_PATH fd and O_RDWR fd, that's ok.
>
>
>>       if (res < 0) {
>>           saverr = -res;
>>           goto out_err;
>> @@ -900,18 +912,11 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>>           if (fi) {
>>               truncfd = fd;
>>           } else {
>> -            truncfd = lo_inode_open(lo, inode, O_RDWR);
>> -            if (truncfd < 0) {
>> -                saverr = -truncfd;
>> -                goto out_err;
>> -            }
>> +            truncfd = inode_fd.fd;
>>           }
>>   
>>           saverr = drop_security_capability(lo, truncfd);
>>           if (saverr) {
>> -            if (!fi) {
>> -                close(truncfd);
>> -            }
>>               goto out_err;
>>           }
>>   
>> @@ -919,9 +924,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>>               res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
>>               if (res != 0) {
>>                   saverr = res;
>> -                if (!fi) {
>> -                    close(truncfd);
>> -                }
>>                   goto out_err;
>>               }
>>           }
>> @@ -934,9 +936,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>>                   fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
>>               }
>>           }
>> -        if (!fi) {
>> -            close(truncfd);
>> -        }
>>           if (res == -1) {
>>               goto out_err;
>>           }
>> @@ -1822,11 +1821,12 @@ static struct lo_dirp *lo_dirp(fuse_req_t req, struct fuse_file_info *fi)
>>   static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
>>                          struct fuse_file_info *fi)
>>   {
>> +    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
>>       int error = ENOMEM;
>>       struct lo_data *lo = lo_data(req);
>>       struct lo_inode *inode;
>>       struct lo_dirp *d = NULL;
>> -    int fd;
>> +    int res;
>>       ssize_t fh;
>>   
>>       inode = lo_inode(req, ino);
>> @@ -1840,13 +1840,13 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
>>           goto out_err;
>>       }
>>   
>> -    fd = lo_inode_open(lo, inode, O_RDONLY);
>> -    if (fd < 0) {
>> -        error = -fd;
>> +    res = lo_inode_open(lo, inode, O_RDONLY, &inode_fd);
>> +    if (res < 0) {
>> +        error = -res;
>>           goto out_err;
>>       }
>>   
>> -    d->dp = fdopendir(fd);
>> +    d->dp = fdopendir(temp_fd_steal(&inode_fd));
> So we are using temp_fd_steal(), because if fdopendir() is succesful,
> we don't want to close fd instead it will be closed during closedir()
> call. inode_fd will be closed once lo_opendir(), so we get fd ownership
> which will need to close explicitly, when appropriate.
>
> Who closes the stolen fd returned by temp_fd_steal() if fdopendir() fails?

Nobody, I forgot handling it in the error path. O:)

Thanks for the catch.

>>       if (d->dp == NULL) {
>>           goto out_errno;
>>       }
>> @@ -1876,8 +1876,6 @@ out_err:
>>       if (d) {
>>           if (d->dp) {
>>               closedir(d->dp);
>> -        } else if (fd != -1) {
>> -            close(fd);
>>           }
>>           free(d);
>>       }
>> @@ -2077,6 +2075,7 @@ static void update_open_flags(int writeback, int allow_direct_io,
>>   static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
>>                         int existing_fd, struct fuse_file_info *fi)
>>   {
>> +    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
> It bothers me that we are using variable inode_fd both to hold O_PATH
> fd as well as regular fd. Will be nice if just by looking at variable
> name I could figure out which type of fd it is.
>
> Will it make sense to use path_fd, or ipath_fd, or inode_path_fd to
> represent where we are using O_PATH fd.

I suppose you mean in general and not specifically for lo_do_open()?  
Sure, I vote for path_fd.

I can imagine the diff stat may become rather large, though, so while I 
agree in principle, I’ll have to take a look first to know how invasive 
such a change would be (and then let you know).

Thanks for you feedback!

Max


