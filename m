Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00188339112
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:19:41 +0100 (CET)
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjZl-0003yN-0Z
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lKjU2-00077a-FO
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:13:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lKjTz-0000KN-AP
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615562021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLF10vRHS4IZ3ip/WY8507WOXAZ61BddVXnLndfmCrg=;
 b=Prb9S9G88POEEVPR2OwlfVP76re1kA2dxrXSQm1/PXDe0AtsBWvD1/NcJPf4AZ07PyzKOy
 sdCmpmg1+l3GCU/UqqGLRsNSrUsVPq+UWwFaQPWHMPWjU2FBy8rawbqxSfAVN7svBe0lGg
 yhte5XhXbtuHDkSbKkthw86wDtXYoUY=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-ao3fLXG4NU-41f80eHNQdw-1; Fri, 12 Mar 2021 10:13:40 -0500
X-MC-Unique: ao3fLXG4NU-41f80eHNQdw-1
Received: by mail-oo1-f70.google.com with SMTP id u9so12285675oon.23
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KLF10vRHS4IZ3ip/WY8507WOXAZ61BddVXnLndfmCrg=;
 b=M+s9eiH2qRvwzSdm+45TLCs1kkQXUMZ33pR7mSa1kM6IQeQAlGPwrtnFqgo2bJSGNL
 2tvt+z87+TL1PabhNN1YL/PwMqs62JcHNNKOa3M4+I5f7G3a959kAaQXPjAi5Lrti1dj
 MASxRy8O9Tea8KlVpCi2OrZzQV+xh4BxHOt46+oGKv9/ILTOOppcQ2hu8nPlLoi3zrF5
 M3v89OJaIF5JrCX+kTSb1s2kxHHUqfuI8EzFgmrevkRrynXefx4j0+l3NOLDkYwKh8PV
 DvwkKy3N21VO5Z+7+5/gqNYNNqGDzlvIWePyNfH10KLkFS/ShgQboL9Ubo7yWTGYOJAs
 WxMQ==
X-Gm-Message-State: AOAM531/E4SItEMhV9NDLHVz/Yv9S/3LL9dTPDDj/dBNa5vwIZs1Ag8T
 iugRKlkbWtA4usMxxq/NX46o7JDK7s+m8v+ewaPLL64RWtjuyd8BdCs5dcmTejI8TZKFa19vp7i
 9aIMgeO1tD6k1FyQ=
X-Received: by 2002:a54:408a:: with SMTP id i10mr10516313oii.141.1615562018870; 
 Fri, 12 Mar 2021 07:13:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwg313NECvVIIaBI1Ro9kbRoNZAgAAhT4MaDgtr6ltGJAdNZLmzga/Fq0UijkYxX2DqlBrrTw==
X-Received: by 2002:a54:408a:: with SMTP id i10mr10516303oii.141.1615562018623; 
 Fri, 12 Mar 2021 07:13:38 -0800 (PST)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 z14sm428999oid.12.2021.03.12.07.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 07:13:38 -0800 (PST)
Subject: Re: [Virtio-fs] [PATCH 1/3] virtiofsd: Don't allow empty paths in
 lookup_name()
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-2-groug@kaod.org>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <d2b63edf-8326-a645-659e-67ad04a6db0b@redhat.com>
Date: Fri, 12 Mar 2021 09:13:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312141003.819108-2-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 8:10 AM, Greg Kurz wrote:
> When passed an empty filename, lookup_name() returns the inode of
> the parent directory, unless the parent is the root in which case
> the st_dev doesn't match and lo_find() returns NULL. This is
> because lookup_name() passes AT_EMPTY_PATH down to fstatat() or
> statx().
> 
> This behavior doesn't quite make sense because users of lookup_name()
> then pass the name to unlinkat(), renameat() or renameat2(), all of
> which will always fail on empty names.
> 
> Drop AT_EMPTY_PATH from the flags in lookup_name() so that it has
> the consistent behavior of "returning an existing child inode or
> NULL" for all directories.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   tools/virtiofsd/passthrough_ll.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index fc7e1b1e8e2b..27a6c636dcaf 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1308,8 +1308,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>           return NULL;
>       }
>   
> -    res = do_statx(lo, dir->fd, name, &attr,
> -                   AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> +    res = do_statx(lo, dir->fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
>       lo_inode_put(lo, &dir);
>       if (res == -1) {
>           return NULL;
> 

Should the statx() in lo_do_lookup() have this flag removed as well? I 
don't think its callers will pass in an empty name because:

   - One of your later patches prevents lo_mknod_symlink() from doing so
   - lo_create() will fail an earlier call against the host file system 
(open)
   - lo_do_readdir() shouldn't be reading empty names because that 
implies someone was able to pull off making an entry with an empty name

However, I don't know if there will one day be future callers to 
lo_do_lookup() that will depend on that flag.

If the answer to the above is no, then:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


