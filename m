Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418B63BF1B7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 23:52:23 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1FSv-0004SB-Q4
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 17:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1FRy-0003fS-FR
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1FRw-0000K2-5h
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625694679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fzuvz3exYyMeINdrGGkcoX/Wx6aM+e21wwzdc3q6b2A=;
 b=RlY9mYMDPdfu36elloR6J6FXQCdLrYY51FuYVETomkCBFSdZILWKbQj2mEcXfP3JqaIQbd
 rn8nXdN4xeS4ioLOXIq2koBuQ7C0F/6LThSZd7xMPWih1Kmb6fjpDzxUUv1ePJS/v70TH0
 01wYQmhP+FpLnQq8J/wFXU5UTFkcwUU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-Anq8gApIO9uLgSCRuSYRZg-1; Wed, 07 Jul 2021 17:51:17 -0400
X-MC-Unique: Anq8gApIO9uLgSCRuSYRZg-1
Received: by mail-pf1-f199.google.com with SMTP id
 k2-20020a056a001342b029030577f46001so2377878pfu.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 14:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fzuvz3exYyMeINdrGGkcoX/Wx6aM+e21wwzdc3q6b2A=;
 b=B+S3L6pLHt0IiewPRdnQjNffqp4oxsMh5uytamMobGSLZUyA79jlrzTTALnAM6+swv
 Joo82EteZbOjozIzIQ2puEIGx61kwEUqyjsCC59BNj50v1dwuGBkdu+YrOZmpgUaEME7
 x/9WQMYcGavWzdoyPIBYkHYoTuQxj95ccVOLuo7d8JDOG5KHmTVnyn3M9LYolxAZldIh
 JibHjeWUT4NYzXJzENvasy6YuxzKUOkk7GLEbuCGL5EzHsSSSy1PSa+nP3llarT2Rfo4
 F/YBSUlWnVJhKAx+xcWZ964F5K6nW46/d1ooyawKvjpsswrs7VIiYbMUHISDbdL/96sD
 tXKQ==
X-Gm-Message-State: AOAM530sqiwJQ+p0OuVgNgmt79tLeNVRjpu91qQyMAyUjQ8OIz0fuKgL
 oRP8iMyKZMnYC79R8q3RcMpoNqLM3BCbZzY99B/nplcLot5KfhnrEdsfBWXjXpETmwjMR/AFsTM
 2kKipwa4qlSxvSBQ=
X-Received: by 2002:aa7:9216:0:b029:2e5:6989:4f1a with SMTP id
 22-20020aa792160000b02902e569894f1amr27239783pfo.50.1625694676624; 
 Wed, 07 Jul 2021 14:51:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfi4NnoTH1hxIqpUeud/53cMnelPsASlu/wDBvXi1ld4X1YiBgpUDmVzQH1CJKw0fv8M372A==
X-Received: by 2002:aa7:9216:0:b029:2e5:6989:4f1a with SMTP id
 22-20020aa792160000b02902e569894f1amr27239764pfo.50.1625694676395; 
 Wed, 07 Jul 2021 14:51:16 -0700 (PDT)
Received: from [192.168.1.183] (c-76-27-223-100.hsd1.or.comcast.net.
 [76.27.223.100])
 by smtp.gmail.com with ESMTPSA id d13sm155472pfn.136.2021.07.07.14.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 14:51:16 -0700 (PDT)
Subject: Re: [PATCH] block/rbd: fix type of task->complete
To: Peter Lieven <pl@kamp.de>, qemu-block@nongnu.org
References: <20210707180449.32665-1-pl@kamp.de>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <97a6ebe5-5009-9ba0-5824-348ec9bcfc98@redhat.com>
Date: Wed, 7 Jul 2021 14:51:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707180449.32665-1-pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 ct@flyingcircus.io, mreitz@redhat.com, pbonzini@redhat.com, idryomov@gmail.com,
 idryomov@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 11:04 AM, Peter Lieven wrote:
> task->complete is a bool not an integer.
> 
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index 01a7b94d62..dcf82b15b8 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1066,7 +1066,7 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
>  static void qemu_rbd_finish_bh(void *opaque)
>  {
>      RBDTask *task = opaque;
> -    task->complete = 1;
> +    task->complete = true;
>      aio_co_wake(task->co);
>  }
>  
> 

Hi Peter,

What tree/QEMU git sha does this apply to? I am having trouble
finding definitions for RBDTask and qemu_rbd_finish_bh; and the
patch won't apply to my few-minutes-old clone of upstream.

Connor


