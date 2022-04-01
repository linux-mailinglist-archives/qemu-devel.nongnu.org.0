Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22544EEE43
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:37:31 +0200 (CEST)
Received: from localhost ([::1]:49666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHT0-0003b1-Va
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:37:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHKK-000056-LJ
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHKJ-0007t4-0y
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648819710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yp6F3SrdwfLaf9WQ+045Wq7HoR81hi8n88pO1J05ytI=;
 b=e/1EGFjrIsrpY+zEDwV0wE8b9JVFC2RtKcknUOkoaebnYvMnA2XS96ipznZd3vUC2B8ytz
 J3c12rldY+wzAtSpgue0TKV3cwT3NhdNnoSz9y/OhB0znLy5a0WtqOBtyizd43u5j9Maip
 ITz9aR3+etnEJRmDycefH2dHB/BHTGo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-Wk7KEm-bMHCfIZaf94xtHw-1; Fri, 01 Apr 2022 09:28:26 -0400
X-MC-Unique: Wk7KEm-bMHCfIZaf94xtHw-1
Received: by mail-ej1-f72.google.com with SMTP id
 gv17-20020a1709072bd100b006dfcc7f7962so1595473ejc.5
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Yp6F3SrdwfLaf9WQ+045Wq7HoR81hi8n88pO1J05ytI=;
 b=unlrRomRxQtk/GXj1QlJJl0TJleqj8QA6jzPELKV6KC7wbFpOotZeni913ApqGxQp5
 vC6O4u0S1Tx0nhbDVDi/OSEzT2lJVv+eZ8GfSaTyzkDX6W1TH9360ONPr3jhtTMgrWsH
 y8cTlLxTgRQeRv6EMqXniMz/vF0GtL2RkfeAGuIPmH2IDiU83dewj3gaAxQLSfd/engO
 8nBH5+0QJAEhWoVDj/xcWEJ3daOm/MiFgoFehbIKMFvxrjQMVEIGcwo9Ebq9in++tvUK
 0Ojs3Ka6x59DKFGoQvfBUbdrfWcVNZQNTA6QDR/ZCzbcHqJ8UyMvT1tDTSALZXn4m/XT
 Z24w==
X-Gm-Message-State: AOAM5320tVyzLqPQNbYDBgNORc1t7mPn9cxW74hTpgTVjuH8+9xBG/oM
 EQBEong1mr7E144ztQCZxGWX3lP6Ko/inQYuVE+pjaU0PPC8TZOMGMa06ogQcW7eSL4sSi4t9lP
 akEu2xoNuhuG9FlI=
X-Received: by 2002:a17:906:c0c8:b0:6d0:562c:2894 with SMTP id
 bn8-20020a170906c0c800b006d0562c2894mr9465866ejb.625.1648819705058; 
 Fri, 01 Apr 2022 06:28:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaIBHPkLyEi3F3xHRY3Q7Y6z5o/PAWzi63B0V5T5oAFLaKYxob/ux81EJbAgwPq2O9mysGfw==
X-Received: by 2002:a17:906:c0c8:b0:6d0:562c:2894 with SMTP id
 bn8-20020a170906c0c800b006d0562c2894mr9465833ejb.625.1648819704672; 
 Fri, 01 Apr 2022 06:28:24 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170906144200b006ceb8723de9sm1038969ejc.120.2022.04.01.06.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:28:24 -0700 (PDT)
Message-ID: <233b9b99-bb0b-4149-65bb-699a3783a1a9@redhat.com>
Date: Fri, 1 Apr 2022 15:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/7] block/copy-before-write: implement cbw-timeout
 option
From: Hanna Reitz <hreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-7-vsementsov@openvz.org>
 <14f219f3-be1c-888e-3076-779de736a2c0@redhat.com>
In-Reply-To: <14f219f3-be1c-888e-3076-779de736a2c0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 15:24, Hanna Reitz wrote:
> On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
>> In some scenarios, when copy-before-write operations lasts too long
>> time, it's better to cancel it.
>>
>> Most useful would be to use the new option together with
>> on-cbw-error=break-snapshot: this way if cbw operation takes too long
>> time we'll just cancel backup process but do not disturb the guest too
>> much.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block/copy-before-write.c | 6 +++++-
>>   qapi/block-core.json      | 5 ++++-
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>

[...]

>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 3f08025114..e077506e0f 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -4207,12 +4207,15 @@
>>   # @on-cbw-error: Behavior on failure of copy-before-write operation.
>>   #                Default is @break-guest-write. (Since 7.0)
>>   #
>> +# @cbw-timeout: Zero means no limit. Non-zero sets the timeout in 
>> seconds
>> +#               for copy-before-write operation. Default 0. (Since 7.0)
>
> *7.1, but:
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>

On second thought, perhaps we should make an explicit note that a 
timeout means an error?  E.g. “When a timeout occurs, the respective 
copy-before-write operation will fail, and the @on-cbw-error parameter 
will decide how this failure is handled.”

(Optional, R-b stands without it, too)


