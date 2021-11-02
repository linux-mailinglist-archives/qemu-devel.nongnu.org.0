Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43DF442E92
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:58:02 +0100 (CET)
Received: from localhost ([::1]:33812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtMV-00016m-KI
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mht67-0006dE-3H
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mht64-0007Ba-Uw
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635856860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNz5RYj3QGRMAORZva7PEmetznfmiYKTyAGL+dmZwHg=;
 b=MK4lhyTq3mR+gp/Tj00nH4YLYUV+tPBtd47UOpKSvYZWxNDxygONs8K+x84rPEFVKQhxZv
 isdhcKV4IpctsPJfnOj8T/ILLIXT2rEpDpyREPCqJ+kjKo2TUfXR3FC2cowYpbpWKjSSq3
 ZyB7cnuBTciMp/GBLi0B0s4CL1mDPmA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-n_3LuFUtOcqw26O8NktPjA-1; Tue, 02 Nov 2021 08:40:59 -0400
X-MC-Unique: n_3LuFUtOcqw26O8NktPjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso6906867wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cNz5RYj3QGRMAORZva7PEmetznfmiYKTyAGL+dmZwHg=;
 b=h5nREVKEGBlV7sW199XW3zT/oua6ILOGNGR5013kIuBomenRKTLPIxxIPntgW45BH9
 rWHaR4+bOhD3kXV5kbARPqdBYMzVi6tv0hF9lOd4OoWgT0E13xCzg+Ra8YtWK5QZQj+b
 HHfj7VLNDxeH82eRhEqAEoxL63iHZxta/NQywhiB8Qh0Vh8DyFDColxAh1eqzj4mbW2N
 oTUOXNYFWq3k6Mk/AI5d7ZrKcP75KcBzcizR7LsODwI5XoCt1kzu2ePhXi3gcLpLvcEA
 pV/zgz/axYJ2FybkOJfEnQFRTdLQnP/jn/HrEI8FpWcDdZutqr9OiNy9C1oWbR81DDez
 UgNA==
X-Gm-Message-State: AOAM533HZYlZr2oKh7F36DrAPqzMKEOlVZTgml5v33kbpsOMEaccJhVv
 56P5FE1EJK4U4zid5OE9fEXKSEsCtaa2Pywy4suBrhNR/ghkFUMeFkHhMNMX3+wrkIh2fnJok27
 RCvRqCoXx8IJ1eoI=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr47101913wrd.73.1635856857914; 
 Tue, 02 Nov 2021 05:40:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJah3XZUmdBeRAOV+Kn96qbu+ppo+37E4zwW4hkHfNQdehSC7E6URw29qrEB/bFKfQye6/Wg==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr47101887wrd.73.1635856857721; 
 Tue, 02 Nov 2021 05:40:57 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id q4sm12046814wrs.56.2021.11.02.05.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 05:40:57 -0700 (PDT)
Message-ID: <4b27891f-5df0-6b65-280e-fee4d55e819f@redhat.com>
Date: Tue, 2 Nov 2021 13:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/4] qemu-img: implement compare --stat
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
 <20211028102441.1878668-2-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211028102441.1878668-2-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 nsoffer@redhat.com, nikita.lapshin@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.10.21 12:24, Vladimir Sementsov-Ogievskiy wrote:
> With new option qemu-img compare will not stop at first mismatch, but
> instead calculate statistics: how many clusters with different data,
> how many clusters with equal data, how many clusters were unallocated
> but become data and so on.
>
> We compare images chunk by chunk. Chunk size depends on what
> block_status returns for both images. It may return less than cluster
> (remember about qcow2 subclusters), it may return more than cluster (if
> several consecutive clusters share same status). Finally images may
> have different cluster sizes. This all leads to ambiguity in how to
> finally compare the data.
>
> What we can say for sure is that, when we compare two qcow2 images with
> same cluster size, we should compare clusters with data separately.
> Otherwise, if we for example compare 10 consecutive clusters of data
> where only one byte differs we'll report 10 different clusters.
> Expected result in this case is 1 different cluster and 9 equal ones.
>
> So, to serve this case and just to have some defined rule let's do the
> following:
>
> 1. Select some block-size for compare procedure. In this commit it must
>     be specified by user, next commit will add some automatic logic and
>     make --block-size optional.
>
> 2. Go chunk-by-chunk using block_status as we do now with only one
>     differency:
>     If block_status() returns DATA region that intersects block-size
>     aligned boundary, crop this region at this boundary.
>
> This way it's still possible to compare less than cluster and report
> subcluster-level accuracy, but we newer compare more than one cluster
> of data.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   docs/tools/qemu-img.rst |  18 +++-
>   qemu-img.c              | 210 +++++++++++++++++++++++++++++++++++++---
>   qemu-img-cmds.hx        |   4 +-
>   3 files changed, 216 insertions(+), 16 deletions(-)

[...]

> diff --git a/qemu-img.c b/qemu-img.c
> index f036a1d428..0cb7cebe91 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c

[...]

> @@ -1465,7 +1602,7 @@ static int img_compare(int argc, char **argv)
>       }
>   
>       while (offset < total_size) {
> -        int status1, status2;
> +        block_end = QEMU_ALIGN_UP(offset + 1, block_size);

Without --stat, `block_size` is 0, and then this is a division by zero.

My compiler seems clever enough to skip this division if `stat == NULL`, 
but when I add a `printf("%li\n", block_size);` after this line and do a 
compare without --stat, qemu-img aborts.  I don’t think we should rely 
on the compiler optimization working here.

(Sorry I didn’t notice this in v2, I just noticed it because I was 
trying to find out whether `block_size` really needs to be a power of 
two as Eric proposed...  The good news is that I don’t think it needs to 
be a power of two (still might make sense to require it), but, well, the 
bad news is that I found this.)

Hanna


