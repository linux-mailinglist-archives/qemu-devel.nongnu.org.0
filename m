Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA944C2EF7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:08:29 +0100 (CET)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNFjH-00034I-U6
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNFhp-0002AY-6k
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:06:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNFhk-000261-NV
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645715211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swHTv3HYIELjhsARurMZL1nZD4Z9JqzCABCRczFGATQ=;
 b=YK+1Tmu63fgUHdLzY3GrtljR9LZD588OxHqoCi/pwB85jQzE76G8TIhEcJZ4O4JQ53H+N3
 1LjcP2N4ahEjeU/5o8OjAxl3aw8gd+7OI/IRbxSdnD0rifKwwwXtbrcSOEzCY4PqxDBiOo
 Kdfa5XrFsxMqgZi8MPrJVjw4zAsDQA0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-GBIMUnfUNNi7VUccjHkyqQ-1; Thu, 24 Feb 2022 10:06:50 -0500
X-MC-Unique: GBIMUnfUNNi7VUccjHkyqQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso1331629eje.20
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=swHTv3HYIELjhsARurMZL1nZD4Z9JqzCABCRczFGATQ=;
 b=nJ97uL3+8TlqOqKKdmjOBVxCbQujQSc+RMotc2mZ/iE1ULSn70QLP8T4Kr0l45qZPl
 j0FQz4G9mNSQIbQCUmPOUBOeQs/S+eBuNBGCyGeuM3yB+OHEIhfthaiqJWTRslNiOsrr
 REFqAyjQZxkbQQNda18TIEKVRZCN+H08hGlkB/cQMuSfLc5gfG6NL5wZbg/jt3a0duCk
 cHQgeRxbyFLCg9alrTWaX6m4P7tbY5s+kTsGBGjFVnZHyoE2omxVz+9SQONDYPwsbUFi
 DilVFBMdE/Y6qLIP8L/xKa1PFQFYCb8lScsXCSrITget3MuBLJIil8BEeQZ6gpqnemiy
 5oiA==
X-Gm-Message-State: AOAM531uNPlA1PJ8UdCq/9mkW5ziVRv2KtqU9rnnMU6kEbK6JpaB/t4O
 wKKVfVAX1WrpS290w31w7OpDyo5CFGlo014zDffeA2YGoOx+3lbSczu5dN+zfHLtnROIzft+P1/
 hwmgavnt6vyZC9lU=
X-Received: by 2002:a17:906:7b91:b0:6cd:19b4:edfa with SMTP id
 s17-20020a1709067b9100b006cd19b4edfamr2544070ejo.227.1645715208759; 
 Thu, 24 Feb 2022 07:06:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy698fukESR5cGG2npDu9IbvXIXjr+bVOBu5Y/yf4atqaKQ2Z9guan2f/LrR4KNbzoncbedpA==
X-Received: by 2002:a17:906:7b91:b0:6cd:19b4:edfa with SMTP id
 s17-20020a1709067b9100b006cd19b4edfamr2544035ejo.227.1645715208403; 
 Thu, 24 Feb 2022 07:06:48 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id x6sm1509767edv.109.2022.02.24.07.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 07:06:47 -0800 (PST)
Message-ID: <62b4181d-7188-cb24-a947-1c68fb3b8d4b@redhat.com>
Date: Thu, 24 Feb 2022 16:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block: fix preallocate filter: don't do unaligned
 preallocate requests
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220215121609.38570-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220215121609.38570-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-devel@nongnu.org,
 stefanha@redhat.com, "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.02.22 13:16, Vladimir Sementsov-Ogievskiy wrote:
> There is a bug in handling BDRV_REQ_NO_WAIT flag: we still may wait in
> wait_serialising_requests() if request is unaligned. And this is
> possible for the only user of this flag (preallocate filter) if
> underlying file is unaligned to its request_alignment on start.
>
> So, we have to fix preallocate filter to do only aligned preallocate
> requests.
>
> Next, we should fix generic block/io.c somehow. Keeping in mind that
> preallocate is the only user of BDRV_REQ_NO_WAIT and that we have to
> fix its behavior now, it seems more safe to just assert that we never
> use BDRV_REQ_NO_WAIT with unaligned requests and add corresponding
> comment. Let's do so.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Denis V. Lunev <den@openvz.org>
> ---
>   include/block/block.h |  3 ++-
>   block/io.c            |  4 ++++
>   block/preallocate.c   | 15 ++++++++++++---
>   3 files changed, 18 insertions(+), 4 deletions(-)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block


