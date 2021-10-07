Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A16D425253
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:54:41 +0200 (CEST)
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYRyy-0007H8-E4
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYRx1-0005M6-1h
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYRwx-0000ES-Jf
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633607554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOv9YbYYgMECMLPQsh6jA7+Iq1Gk02fmiUe2/lXuBnw=;
 b=MRGAoigANnnEUrZ5VYqYIuTH/TOjJ5W9C36Kz/uuWA479eGaqafmMcGyh9/CbOxjuhBRRo
 j1HYFziMHJYF1hl9Zv3kjo5BABC8SsNthhlHfrHmySvVA8EWitQBXwbLCwdxmGH9PyOvxJ
 jooQzfJx5XkVwcpY2LCDc5jQqT6sGt4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-6lni7haiP-6X0v--wqMyUA-1; Thu, 07 Oct 2021 07:52:33 -0400
X-MC-Unique: 6lni7haiP-6X0v--wqMyUA-1
Received: by mail-ed1-f71.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso5639578edf.7
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 04:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xOv9YbYYgMECMLPQsh6jA7+Iq1Gk02fmiUe2/lXuBnw=;
 b=XHOUnWTvdgXC61lMVJomJHY4iB8SzvRCO8x31G41BhlVBtSkaSv50Jm2gXgl3IRMaH
 8F2uecBz7K4GGVd1V+g+5NJtSJrRO65fPTGhEyUW13iMy3QtMcLkvCh1jgK1aI+Ako8I
 Ls59nB2gqE7KDqrjsO3uR0TVjIRhr8uVNT+OcMbKCO/CvkdO0g9dsYjodyBBD2xcjX2R
 SVlEzBlGAOuXuRZrgNyEHzMZjxsQoPNR804fT5HWgjQiFgc9i6IJAgBZ0ghjJB8gcQ3w
 8AfVrXBBoeF+VusZwG09GfzRTenMdTmH0nJTd+sC+8m/qv959oTJ4CIexxTb2daMCeQc
 68wA==
X-Gm-Message-State: AOAM533gal4Ut0bNN+4R1kD8J3cGR2fN8aYhDlkzvB8D/dvPDMB5zZtC
 BPt3cHqcytZ+ne6hELdkOzL/85qVCsVEKZCtdWugko1vHodWG2TCmkltoPJK+n1/XQyL1zeJodP
 4MbE346bwXAk+TCg=
X-Received: by 2002:a17:906:3adb:: with SMTP id
 z27mr5045722ejd.291.1633607551970; 
 Thu, 07 Oct 2021 04:52:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjrOcXNiMr/7nOuFmG4SzqQ4qu0bCB5VcdoeTMY0k+DxI7MLuaeMZwlXkD1Qo2rf8Yl0lrow==
X-Received: by 2002:a17:906:3adb:: with SMTP id
 z27mr5045701ejd.291.1633607551785; 
 Thu, 07 Oct 2021 04:52:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d3sm10037914ejb.35.2021.10.07.04.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 04:52:31 -0700 (PDT)
Message-ID: <83ec43d6-375e-4360-e32a-0f3d22b5d237@redhat.com>
Date: Thu, 7 Oct 2021 13:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 18/25] block/coroutines: I/O API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-19-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211005143215.29500-19-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/21 16:32, Emanuele Giuseppe Esposito wrote:
> block coroutines functions run in different aiocontext, and are
> not protected by the BQL. Therefore are I/O.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/coroutines.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/block/coroutines.h b/block/coroutines.h
> index 514d169d23..105e0ce2a9 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -27,6 +27,12 @@
>   
>   #include "block/block_int.h"
>   
> +/*
> + * I/O API functions. These functions are thread-safe, and therefore
> + * can run in any thread as long as they have called
> + * aio_context_acquire/release().
> + */
> +
>   int coroutine_fn bdrv_co_check(BlockDriverState *bs,
>                                  BdrvCheckResult *res, BdrvCheckMode fix);
>   int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp);
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

except for the same comment about "they" that was in patch 2.

Paolo


