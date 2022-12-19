Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF26650BFB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:43:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7FE9-0002SG-40; Mon, 19 Dec 2022 07:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p7FDz-0002Rn-M1
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:26:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p7FDy-0007qU-8W
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671452789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPSctcGDPfiqFXuBfoyafg7YrKXg0UmLU2hoTKaIIy4=;
 b=ZrKRTCqLZNlMUAnuHleQ7FqPcXLUMSoLjw3CKUmLK9wKOLybdT/1KK5onWjG9beNwCiNR9
 Se6E9DuojoeICHf4VXz2to02u/lZLlbyg22EDF0HtAxqOdQDE0LebmTQsHpnNTqMpJ/bYx
 4LyDaupAgg8dmoLoP10ERyX4p52/3oY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-80-V-0Q3q7AMdqN80ZpCT1FPQ-1; Mon, 19 Dec 2022 07:26:27 -0500
X-MC-Unique: V-0Q3q7AMdqN80ZpCT1FPQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 m8-20020ac807c8000000b003a7f82f0da7so3922246qth.11
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VPSctcGDPfiqFXuBfoyafg7YrKXg0UmLU2hoTKaIIy4=;
 b=8GZ8Nr05W2YyoU4VXB7ZPkf2oNpKW8NyPmymHs1Bwk1cnt/hp5muPOmKCzdAoNByYc
 Es6cN7ZnFEgmsmwGtRonBK7gmNTpRJBUMspfPbCTJWA3fzSlTB7iTGKwYCYBjAD77eRL
 D/9bEcr+y73kJVwNrgKVDoFjeVV46C1L3o7KMGjR7HeeONIlAKZjCBdmq7dp2yHlf9Yb
 VdC1TbJAhdBbmR8aGP7FQvEmVyRteGxyAejSN+pVk68Zxmsv8KbxRwk0V3NPzfG7ypwj
 xO5mmD7/1Jh8+n41prlrIaSJ/HsQfJVEXfu5Tl7SgJpOi2/E4s0rIavB5wf4RQMTyWPS
 20tw==
X-Gm-Message-State: AFqh2koKzHgUAnhwTUdOjJq9d7uNKiUFb2hh7aZCl2lKOlXC5EhkxN8w
 Cx7xTXy54l46F7b2OMiGHsvdWoufkAPjTkQUQn++ZV4PuQNn2kXToYQX1m+UPHpGByvPRwZzbut
 RMDwZgBN5Fy+XluU=
X-Received: by 2002:a05:622a:250e:b0:3a9:8b48:f8f with SMTP id
 cm14-20020a05622a250e00b003a98b480f8fmr3688302qtb.67.1671452787304; 
 Mon, 19 Dec 2022 04:26:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvdD0LyoPL381xksJ/81kWbNAep5Nx/bRUOOf+/V30WppPdxaY+kryakj9xOrRlwir3paqEPA==
X-Received: by 2002:a05:622a:250e:b0:3a9:8b48:f8f with SMTP id
 cm14-20020a05622a250e00b003a98b480f8fmr3688281qtb.67.1671452787109; 
 Mon, 19 Dec 2022 04:26:27 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 g25-20020ac84819000000b0039cc0fbdb61sm5964123qtq.53.2022.12.19.04.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 04:26:26 -0800 (PST)
Message-ID: <c4c1c417-bded-497f-b1bc-41af90d80dab@redhat.com>
Date: Mon, 19 Dec 2022 13:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 02/14] block: Convert bdrv_io_plug() to co_wrapper
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221213085320.95673-1-kwolf@redhat.com>
 <20221213085320.95673-3-kwolf@redhat.com>
 <088f4a56-1ae1-2f3f-0412-c05f65ba6707@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <088f4a56-1ae1-2f3f-0412-c05f65ba6707@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 16/12/2022 um 17:12 schrieb Vladimir Sementsov-Ogievskiy:
> On 12/13/22 11:53, Kevin Wolf wrote:
>> --- a/include/block/block_int-common.h
>> +++ b/include/block/block_int-common.h
>> @@ -729,7 +729,7 @@ struct BlockDriver {
>>       void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent
>> event);
>>         /* io queue for linux-aio */
>> -    void (*bdrv_io_plug)(BlockDriverState *bs);
>> +    void coroutine_fn (*bdrv_io_plug)(BlockDriverState *bs);
> 
> But you didn't add coroutine_fn to realizations of this callback. Seems,
> it should be done
> 

This has to be done by Paolo & Alberto Faria work to add missing
coroutine_fn and various annotations in a systematic way. It has to be
done using tools like vrc, and not manually because it's not feasible.
Not covered by this serie.

Thank you,
Emanuele


