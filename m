Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3462C445429
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:43:26 +0100 (CET)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mid1Y-0006HW-QL
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mictF-00051g-JN
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 09:34:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mictC-0004so-A8
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 09:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636032885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uIFsGWUuWF2DPgn2ED8UNuh7WHvGgesuutjvuM/6Hhg=;
 b=IkzWlC2DhqDZRsS6vWG1WKOB9IUKFmbxETP2cQnbsyqJ4x8tZ//YJZYKnlfUWAeudi7DA8
 Tg0eKUhNkAvEfC/ZaQ15aE2DPX3dFn4AF+w+OHJiD8jBE2Sw8SUZn/UdKwLCRLwjkK8bFT
 Af9tLyET/mSx14+aSPcIew33Slc3RI8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-0NMovS7rMRq7tK8uZFeuEg-1; Thu, 04 Nov 2021 09:34:44 -0400
X-MC-Unique: 0NMovS7rMRq7tK8uZFeuEg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso2218735wms.1
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 06:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uIFsGWUuWF2DPgn2ED8UNuh7WHvGgesuutjvuM/6Hhg=;
 b=Vl0+1HBAhB1Y19SADAMjVYJFFPix2lREBjJltfiVei1GtVDXFrskwKn5ipkN4tLvQ/
 gtoUYNHkOkubmeqgh78EyUHW0JkR8UV/8ifg3e9Gleuolla1+LzlBVzB/aRHOzl9rf2l
 pQOxAXFyTrAt56C8RNs+ceE//UhCsABUvoia0KOgtRWJoTiRKawEFKgpQ9QeatusOFey
 uSMgH8VYiO8j8vn+CmBnnzBg9nv8mP92DRcgrJ7y3V+DL13VLk6fyChOia4ZHio+kujL
 96EptI2vTvpDMjFaJDlO8w7fnKP5NlZZygUOWKQNrwut5kvUjpvQMwrKhiTtIaG502zc
 bamQ==
X-Gm-Message-State: AOAM533DOKKRLF7X6Zk2sBfKNPhektvN6R+3GnW/ZFC9wsx40jT4GNgn
 K+576lH0b9Remcd5NbVNceb/8/6xV4ZKB16qDFGgMoGfM94h4w6WT32GPJvM9o1E478iQtZPzaa
 cra35D0EYGqTmoYI=
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr63688720wrc.417.1636032883026; 
 Thu, 04 Nov 2021 06:34:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa838F0eEvSwXM/HlSNqkFPp9nSSdsIOEzxpp2oH6nKAeuhTKkTuH33aKZFGw4kDn8zH9X3g==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr63688691wrc.417.1636032882879; 
 Thu, 04 Nov 2021 06:34:42 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n66sm5384087wmn.2.2021.11.04.06.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 06:34:42 -0700 (PDT)
Message-ID: <67f567b7-8d7a-3990-fced-93a082c810b7@redhat.com>
Date: Thu, 4 Nov 2021 14:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/7] block: Attempt on fixing 030-reported errors
To: Kevin Wolf <kwolf@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <YYPK3blXkZldRY0F@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YYPK3blXkZldRY0F@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.11.21 12:58, Kevin Wolf wrote:
> Am 04.11.2021 um 11:38 hat Hanna Reitz geschrieben:
>> (2A) bdrv_replace_child_noperm() should immediately set bs->file or
>>       bs->backing to NULL when it sets bs->{file,backing}->bs to NULL.
>>       It should also immediately remove any BdrvChild with .bs == NULL
>>       from the parent’s BDS.children list.
>>       Implemented in patches 2 through 6.
>>
>> (2B) Alternatively, we could always keep the whole subgraph drained
>>       while we manipulate it.  Then, the bdrv_parent_drained_end_single()
>>       in bdrv_replace_child_noperm() wouldn’t do anything.
>>       To fix 030, we would need to add a drained section to
>>       stream_prepare(): Namely we’d need to drain the subgraph below the
>>       COR filter node.
>>       This would be a much simpler solution, but I don’t feel like it’s
>>       the right one.
>> As you can see, I’m not sure which of 2A or 2B is the right solution.  I
>> decided to investigate both: 2A was much more complicated, but seemed
>> like the right thing to do; 2B is much simpler, but doesn’t feel as
>> right.  Therefore, I decided to go with 2A in this first version of this
>> series.
> I haven't looked at the patches yet, but if I understand correctly the
> choice you're presenting here is between protecting code from accessing
> invalid state and not creating the invalid state in the first place.

Yes, that’s right.

> I agree that the latter is preferable as long as it doesn't make things
> so complicated that we would be willing to accept the higher risk of
> breakage in the former.

No, I don’t think it’s too complicated.  Just not as sample as a 
drained_begin + drained_end.

> If it's doable in five patches, it's probably
> not complicated enough to make such compromises.

Without the clean-up patches that are patches 3 and 4, it would be 
doable in even fewer patches. :)

Hanna


