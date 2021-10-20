Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E7F43489D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:09:44 +0200 (CEST)
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8XX-00063N-E3
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1md8Qt-00045X-Qo
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:02:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1md8Qq-0000C4-EN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634724166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tF+aPgeBBn1g9eenxyqYUTm+npmuxppkMmYQU7ZIKko=;
 b=A0R9NPfuGoHDI2tWiI12hSLplV3JmtnROKRU9FWGVckXSzrbI9/AyLkqeCl65RIg1acOlJ
 gBcvWAwPFNUNDvj3dRBuEahH9iRZ5bioFFZPWaz0BuAShq6GPpgMhxT8QPXNpoZFrTO0oc
 4X6baEBNXglOLHlF0P6IGU17cJ+oLcY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-fjkR6VkAMMiQvi4TQ9naxg-1; Wed, 20 Oct 2021 06:02:34 -0400
X-MC-Unique: fjkR6VkAMMiQvi4TQ9naxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 s25-20020a7bc399000000b0030da0f36afeso2871152wmj.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tF+aPgeBBn1g9eenxyqYUTm+npmuxppkMmYQU7ZIKko=;
 b=uxxdwm18zH8DIBaVTsfUqWNFKSDlZo80pqDlzhg4Ktp34ErkRRw1KHNIRn9NJbzOEQ
 jORH1RGd9Zyc3Kb4DDBj8Lx/h3e1R+mhVGwfhEWsuiA3Qny8/kOgWEp5jPC4KCItDTu+
 8EZmzjAjb8zdxE2OQP0scWPhYNGIziisz19LnRMDhO7d7FLxjqrPRQatPZR2tcIKavHd
 HrMEu/jWTcGrxj/iFXT0XZ3LKcrAcMDvqGceahKrwEeUS1NEfharjPzS+aPXNauVVsNa
 9JS/oEOcvIfr4c1rOWdt6aQO/QRrxlhMo2n8UWcaEigN4tSDypWlpdMbaqHAG4rFkISu
 3/dg==
X-Gm-Message-State: AOAM531p7wW9BOSbvZFMvM8ubKnsT3k3R/6tLUlzqDIaM+NJRbC4ISKv
 NqlGaBlK6YK9duPw95GJr5qUXHjlkLwApj8En6uMsxnA3p+Q4b0Ga8UbRjyajuldX5gtlePmheO
 aPFx+2DG5/x3lEAE=
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr49212454wro.349.1634724153300; 
 Wed, 20 Oct 2021 03:02:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXGtAUDbDF+rakYnhSVxaHy2KkUj9HzJ/4rZ8ikQkXEMnTK26K7CfcFgf+PYDNIOqAZctZvA==
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr49212421wro.349.1634724153080; 
 Wed, 20 Oct 2021 03:02:33 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id a16sm1577557wrs.30.2021.10.20.03.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 03:02:32 -0700 (PDT)
Message-ID: <194cd5f5-e5b3-2929-3ae7-ad2fb1083021@redhat.com>
Date: Wed, 20 Oct 2021 12:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 10/12] virtiofsd: Add inodes_by_handle hash table
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
 <20210916084045.31684-11-hreitz@redhat.com> <YW8kbdCeqs11E0Tl@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YW8kbdCeqs11E0Tl@redhat.com>
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

On 19.10.21 22:02, Vivek Goyal wrote:
> On Thu, Sep 16, 2021 at 10:40:43AM +0200, Hanna Reitz wrote:
>> Currently, lo_inode.fhandle is always NULL and so always keep an O_PATH
>> FD in lo_inode.fd.  Therefore, when the respective inode is unlinked,
>> its inode ID will remain in use until we drop our lo_inode (and
>> lo_inode_put() thus closes the FD).  Therefore, lo_find() can safely use
>> the inode ID as an lo_inode key, because any inode with an inode ID we
>> find in lo_data.inodes (on the same filesystem) must be the exact same
>> file.
>>
>> This will change when we start setting lo_inode.fhandle so we do not
>> have to keep an O_PATH FD open.  Then, unlinking such an inode will
>> immediately remove it, so its ID can then be reused by newly created
>> files, even while the lo_inode object is still there[1].
>>
>> So creating a new file can then reuse the old file's inode ID, and
>> looking up the new file would lead to us finding the old file's
>> lo_inode, which is not ideal.
>>
>> Luckily, just as file handles cause this problem, they also solve it:  A
>> file handle contains a generation ID, which changes when an inode ID is
>> reused, so the new file can be distinguished from the old one.  So all
>> we need to do is to add a second map besides lo_data.inodes that maps
>> file handles to lo_inodes, namely lo_data.inodes_by_handle.  For
>> clarity, lo_data.inodes is renamed to lo_data.inodes_by_ids.
>>
>> Unfortunately, we cannot rely on being able to generate file handles
>> every time.  Therefore, we still enter every lo_inode object into
>> inodes_by_ids, but having an entry in inodes_by_handle is optional.  A
>> potential inodes_by_handle entry then has precedence, the inodes_by_ids
>> entry is just a fallback.
>>
>> Note that we do not generate lo_fhandle objects yet, and so we also do
>> not enter anything into the inodes_by_handle map yet.  Also, all lookups
>> skip that map.  We might manually create file handles with some code
>> that is immediately removed by the next patch again, but that would
>> break the assumption in lo_find() that every lo_inode with a non-NULL
>> .fhandle must have an entry in inodes_by_handle and vice versa.  So we
>> leave actually using the inodes_by_handle map for the next patch.
>>
>> [1] If some application in the guest still has the file open, there is
>> going to be a corresponding FD mapping in lo_data.fd_map.  In such a
>> case, the inode will only go away once every application in the guest
>> has closed it.  The problem described only applies to cases where the
>> guest does not have the file open, and it is just in the dentry cache,
>> basically.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tools/virtiofsd/passthrough_ll.c | 81 +++++++++++++++++++++++++-------
>>   1 file changed, 65 insertions(+), 16 deletions(-)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index bd8fc922ea..b7d6aa7f9d 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -186,7 +186,8 @@ struct lo_data {
>>       int announce_submounts;
>>       bool use_statx;
>>       struct lo_inode root;
>> -    GHashTable *inodes; /* protected by lo->mutex */
>> +    GHashTable *inodes_by_ids; /* protected by lo->mutex */
>> +    GHashTable *inodes_by_handle; /* protected by lo->mutex */
>>       struct lo_map ino_map; /* protected by lo->mutex */
>>       struct lo_map dirp_map; /* protected by lo->mutex */
>>       struct lo_map fd_map; /* protected by lo->mutex */
>> @@ -275,8 +276,9 @@ static struct {
>>   /* That we loaded cap-ng in the current thread from the saved */
>>   static __thread bool cap_loaded = 0;
>>   
>> -static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
>> -                                uint64_t mnt_id);
>> +static struct lo_inode *lo_find(struct lo_data *lo,
>> +                                const struct lo_fhandle *fhandle,
>> +                                struct stat *st, uint64_t mnt_id);
>>   static int xattr_map_client(const struct lo_data *lo, const char *client_name,
>>                               char **out_name);
>>   
>> @@ -1143,18 +1145,40 @@ out_err:
>>       fuse_reply_err(req, saverr);
>>   }
>>   
>> -static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
>> -                                uint64_t mnt_id)
>> +static struct lo_inode *lo_find(struct lo_data *lo,
>> +                                const struct lo_fhandle *fhandle,
>> +                                struct stat *st, uint64_t mnt_id)
>>   {
>> -    struct lo_inode *p;
>> -    struct lo_key key = {
>> +    struct lo_inode *p = NULL;
>> +    struct lo_key ids_key = {
>>           .ino = st->st_ino,
>>           .dev = st->st_dev,
>>           .mnt_id = mnt_id,
>>       };
>>   
>>       pthread_mutex_lock(&lo->mutex);
>> -    p = g_hash_table_lookup(lo->inodes, &key);
>> +    if (fhandle) {
>> +        p = g_hash_table_lookup(lo->inodes_by_handle, fhandle);
>> +    }
>> +    if (!p) {
>> +        p = g_hash_table_lookup(lo->inodes_by_ids, &ids_key);
>> +        /*
>> +         * When we had to fall back to looking up an inode by its
>> +         * inode ID, ensure that we hit an entry that has a valid file
>> +         * descriptor.  Having an FD open means that the inode cannot
>> +         * really be deleted until the FD is closed, so that the inode
>> +         * ID remains valid until we evict our lo_inode.
>> +         * With no FD open (and just a file handle), the inode can be
>> +         * deleted while we still have our lo_inode, and so the inode
>> +         * ID may be reused by a completely different new inode.  We
>> +         * then must look up the lo_inode by file handle, because this
>> +         * handle contains a generation ID to differentiate between
>> +         * the old and the new inode.
>> +         */
>> +        if (p && p->fd == -1) {
>> +            p = NULL;
>> +        }
> What happens in following scenario.
>
> - Say I have a hard linked file foo.txt with link foo-link.txt.
>
> - I lookup foo.txt. We generate file handle and add inode for foo.txt
>    to inode cache. lo_inode->fhandle will be valie but lo_inode->fd == -1.
>
> - Now later lookup for foo-link.txt happens. Say this time we can't
>    generate file handle.

Which we’ve already decided is practically impossible.

> When we try to lookup inode, lo_find() should
>    return NULL. It will find inode by ids but not use it because inode
>    was added using file handle and p->fd == -1. That means lookup
>    for foo-link.txt will end up adding another inode, when it should
>    not have?

Yes, it would end up adding another inode, which doesn’t seem 
catastrophic to me.  But again, the whole case seems impossible to me.

Hanna


