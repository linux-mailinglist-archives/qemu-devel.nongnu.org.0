Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714123E4430
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:50:24 +0200 (CEST)
Received: from localhost ([::1]:44464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2rP-0001HR-EJ
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD2pq-0007lD-Tb
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD2pp-0002qq-8A
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628506124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlGTbMUQ1QLdG7muiEu7MouMZQYErRsCaiyD59lGSOk=;
 b=KmnBJzHnzm+d1Hg+ueomQux3+kwv5iylERl0RkBa2momPCHuvv38/I/JhCM13eRocUqx/5
 2A1trj5AahH4q9hIHNRPyUC1s2mpnco47KgaW5rlwJeKNDd5nHvFMSozYV401iZSUxLLTd
 DIBkYC7nMtDOHoEbqCMojsQDdyFwkBU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-QTB0UG0GMqawEQt12z-VSQ-1; Mon, 09 Aug 2021 06:48:43 -0400
X-MC-Unique: QTB0UG0GMqawEQt12z-VSQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j204-20020a1c23d50000b029024e75a15714so4502776wmj.0
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rlGTbMUQ1QLdG7muiEu7MouMZQYErRsCaiyD59lGSOk=;
 b=kNVaghONX3rJGSbNQ7OaIYRl2WHLupQ7a7lF4YbbUXa8JF9xFE7g42VUnhekHDGow5
 6fn0zhXm043eiLAB60TnJSzlPi/4GEVbLEAVr0knaJbbfQ8KSlvzQYN7JYlbNcyXorhq
 RrK8h0wShygYRUSpxoaXxnNfdzVlQvfY7o35g+FaDXXwztiCGCXF1uhi25DItrGaNOwE
 wMFgyX7uN7528uH5//Blo8u6F3/Y9G8mHcdBcqEs14Kcm5ZjnAdbn4SGo+MZS4Dsw1k4
 wgbs+bkmsxGUHrxGnjnXesopJpBGkLQAdxDHJPxGz5pXM80AOooHyYhl2Aj9W/hnYBN7
 F8+Q==
X-Gm-Message-State: AOAM533JkrDGBECunBfPYIMnoax6JX9M0UoU2RSDFhJ42caL8EYts30n
 RxostvBcznHN+xW6bpXtIEX6WMfcq4dyEQL3Pgpn52pF0Mu1ITVT8KuVegZQnX2PP1rhUVkvntb
 NN3Omr/nEeuMby34=
X-Received: by 2002:a7b:c052:: with SMTP id u18mr33418406wmc.105.1628506122162; 
 Mon, 09 Aug 2021 03:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb1uE5XakzSpv/WCqu4gefcnRJU/yf2B5ZyDuHJNGL/ZkmnVof2mXgml98sFcFqMhCbFFkMg==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr33418378wmc.105.1628506121865; 
 Mon, 09 Aug 2021 03:48:41 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 n10sm1892996wmq.3.2021.08.09.03.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 03:48:41 -0700 (PDT)
Subject: Re: [PATCH v3 04/10] virtiofsd: Add lo_inode_fd() helper
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-5-mreitz@redhat.com> <YQ1+qPISUq5AhBtT@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ae8eb346-bdc9-1fb9-5dc3-7f8deb6ba7a9@redhat.com>
Date: Mon, 9 Aug 2021 12:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQ1+qPISUq5AhBtT@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 06.08.21 20:25, Vivek Goyal wrote:
> On Fri, Jul 30, 2021 at 05:01:28PM +0200, Max Reitz wrote:
>
> [..]
>> @@ -1335,12 +1359,18 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
>>           return;
>>       }
>>   
>> +    res = lo_inode_fd(dir, &dir_fd);
>> +    if (res < 0) {
>> +        saverr = -res;
>> +        goto out;
>> +    }
>> +
>>       saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
>>       if (saverr) {
>>           goto out;
>>       }
>>   
>> -    res = mknod_wrapper(dir->fd, name, link, mode, rdev);
>> +    res = mknod_wrapper(dir_fd.fd, name, link, mode, rdev);
>>   
>>       saverr = errno;
>>   
>> @@ -1388,6 +1418,8 @@ static void lo_symlink(fuse_req_t req, const char *link, fuse_ino_t parent,
>>   static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
>>                       const char *name)
>>   {
>> +    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
>> +    g_auto(TempFd) parent_fd = TEMP_FD_INIT;
>>       int res;
>>       struct lo_data *lo = lo_data(req);
>>       struct lo_inode *parent_inode;
>> @@ -1413,18 +1445,31 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
>>           goto out_err;
>>       }
>>   
>> +    res = lo_inode_fd(inode, &inode_fd);
>> +    if (res < 0) {
>> +        errno = -res;
> In previous function, we saved error to "saverr" and jumped to "out"
> label, instead of overwriting to errno.
>
> I would think that it will be good to use a single pattern. Either
> save error in saverr or overwrite errno. I personally prefer saving
> error into "saverr".

Absolutely, will do.

>> +        goto out_err;
>> +    }
>> +
>> +    res = lo_inode_fd(parent_inode, &parent_fd);
>> +    if (res < 0) {
>> +        errno = -res;
>> +        goto out_err;
>> +    }
>> +
>>       memset(&e, 0, sizeof(struct fuse_entry_param));
>>       e.attr_timeout = lo->timeout;
>>       e.entry_timeout = lo->timeout;
>>   
>> -    sprintf(procname, "%i", inode->fd);
>> -    res = linkat(lo->proc_self_fd, procname, parent_inode->fd, name,
>> +    sprintf(procname, "%i", inode_fd.fd);
>> +    res = linkat(lo->proc_self_fd, procname, parent_fd.fd, name,
>>                    AT_SYMLINK_FOLLOW);
>>       if (res == -1) {
>>           goto out_err;
>>       }
>>   
>> -    res = fstatat(inode->fd, "", &e.attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
>> +    res = fstatat(inode_fd.fd, "", &e.attr,
>> +                  AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
>>       if (res == -1) {
>>           goto out_err;
>>       }
>> @@ -1453,23 +1498,33 @@ out_err:
>>   static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>>                                       const char *name)
>>   {
>> +    g_auto(TempFd) dir_fd = TEMP_FD_INIT;
>>       int res;
>>       uint64_t mnt_id;
>>       struct stat attr;
>>       struct lo_data *lo = lo_data(req);
>>       struct lo_inode *dir = lo_inode(req, parent);
>> +    struct lo_inode *inode = NULL;
>>   
>>       if (!dir) {
>> -        return NULL;
>> +        goto out;
> Should we continue to just call "return NULL". dir is NULL. That means
> lo_inode() failed. That means we never got the reference. So we don't
> have to put the reference. If we do "goto out", it will call
> lo_inode_put() which is not needed.

Yes, but lo_inode_put() will handle this gracefully, so it isn’t wrong. 
My personal preference is that if there is an clean-up path, it should 
be used everywhere instead of having pure returns at the beginning of a 
function (where not many resources have been initialized yet), so that 
no clean-up will be forgotten.  Like, if we were to add some resource 
acquisition in the declarations above (and clean-up code in the clean-up 
path), we would need to change the return to a goto here.  Or maybe we’d 
forget that, and then we’d leak something.

So I prefer having clean-up sections be generic enough that they can be 
used from anywhere within the function, and then also use it from 
anywhere within the function, even if they end up being no-ops.

>>       }
>>   
>> -    res = do_statx(lo, dir->fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
>> -    lo_inode_put(lo, &dir);
>> +    res = lo_inode_fd(dir, &dir_fd);
>> +    if (res < 0) {
>> +        goto out;
>> +    }
>> +
>> +    res = do_statx(lo, dir_fd.fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
>>       if (res == -1) {
>> -        return NULL;
>> +        goto out;
>>       }
>>   
>> -    return lo_find(lo, &attr, mnt_id);
>> +    inode = lo_find(lo, &attr, mnt_id);
>> +
>> +out:
>> +    lo_inode_put(lo, &dir);
>> +    return inode;
>>   }
>
> Thanks
> Vivek
>


