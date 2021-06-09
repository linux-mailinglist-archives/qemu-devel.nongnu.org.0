Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805D23A0D5F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 09:13:40 +0200 (CEST)
Received: from localhost ([::1]:40188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqsPD-0006AL-KM
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 03:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqsO9-0005Bf-Rx
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 03:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqsO7-00028Q-S7
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 03:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623222751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fA1bVP8D6Yi1mfcqUVu0XeNF6cQUVoehe01yhsl6C4g=;
 b=aPO8Vy8iOk5ow66dPIS7YRe4mdda5N2ewPOheaGeyHQj4CwLUqKkl7VtZMsEjuRO2dlanM
 dZX6CLnngNe8zndWBLXT1MEczW+p6cgZaxYIvA8nz2FHkDKpwGp3KjTwzIZJS2eQMnD/Xj
 SkmPqeYIE//VpwWGP+XavUdlrm4JTn0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-iSuXtRUZNoCHADmNH1tfoQ-1; Wed, 09 Jun 2021 03:12:29 -0400
X-MC-Unique: iSuXtRUZNoCHADmNH1tfoQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so10334123wrd.7
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 00:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fA1bVP8D6Yi1mfcqUVu0XeNF6cQUVoehe01yhsl6C4g=;
 b=hc+guVPYuEM8UmXV+EUEDiK2/4130IdC98XB0Q2PcxY+7iAl5IfPfj7vTbjMhKIjn2
 vMoaXAiaYri/XcAHGXGhSQdxeLTOp/2ozHYRDCHoNlytpxRkjkYzfBrDUgcPnSiQLuam
 OKznxU9hLoQjrN/aZ0YbaRLxsgwUCUTBu0jGJBDQ+jgip7Xf8d39OUaH711kGQm/olhi
 c0Tjx+ocjHhqEL9myGemwdTcMCId/dhSe+LvZIFjOQT6pDPV8rBsYz8DSFCHch4k+5Dh
 Q8dnY7LasMZz8t5Fwq547/cXKV9fdgGQgdBp664R+Kbyh3YMe9NB18U/D6yPKNGKEgNk
 /sTQ==
X-Gm-Message-State: AOAM5302pP4Ruin3jTVQpqEbFGu2le2i2DY+dXOoaarj/6Z0+CAFnFUg
 onWolrNkbCFidUIMr7Qt1xvTndhrBqMa/7rrG1RvvcfGvWDV0Kok35OcQrd1wIiBlY8iEAc+Bey
 1X4a87L5Iwd5ls2s=
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr25733637wml.88.1623222748038; 
 Wed, 09 Jun 2021 00:12:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAOd/PcSWpGQZ7ALnEYSBdnnKApRgivwoEFn6ePeUndEBc67S4pWHJVId782FadEkaIrVB5A==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr25733603wml.88.1623222747773; 
 Wed, 09 Jun 2021 00:12:27 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de.
 [217.232.61.128])
 by smtp.gmail.com with ESMTPSA id f18sm20057897wmj.13.2021.06.09.00.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:12:27 -0700 (PDT)
Subject: Re: Prevent compiler warning on block.c
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
 <62c90da0-b2f9-7068-e84f-c13bb1527191@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9ef22266-25e1-36df-52e9-ad5244a648dc@redhat.com>
Date: Wed, 9 Jun 2021 09:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <62c90da0-b2f9-7068-e84f-c13bb1527191@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/2021 10.05, Vladimir Sementsov-Ogievskiy wrote:
> 05.05.2021 10:59, Miroslav Rezanina wrote:
>> Commit 3108a15cf (block: introduce bdrv_drop_filter()) introduced 
>> uninitialized
>> variable to_cow_parent in bdrv_replace_node_common function that is used 
>> only when
>> detach_subchain is true. It is used in two places. First if block properly 
>> initialize
>> the variable and second block use it.
>>
>> However, compiler treats this two blocks as two independent cases so it 
>> thinks first
>> block can fail test and second one pass (although both use same 
>> condition). This cause
>> warning that variable can be uninitialized in second block.
>>
>> To prevent this warning, initialize the variable with NULL.
>>
>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>> ---
>> diff --git a/block.c b/block.c
>> index 874c22c43e..3ca27bd2d9 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -4851,7 +4851,7 @@ static int bdrv_replace_node_common(BlockDriverState 
>> *from,
>>       Transaction *tran = tran_new();
>>       g_autoptr(GHashTable) found = NULL;
>>       g_autoptr(GSList) refresh_list = NULL;
>> -    BlockDriverState *to_cow_parent;
>> +    BlockDriverState *to_cow_parent = NULL;
>>       int ret;
>>
>>       if (detach_subchain) {
>>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This just popped up again here:

  https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg02067.html

Kevin, Max, could you please pick it up to get this problem fixed?

  Thomas


