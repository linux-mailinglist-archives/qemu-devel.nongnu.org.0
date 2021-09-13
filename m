Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B91408568
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 09:33:10 +0200 (CEST)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPgSi-0000F5-Ox
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 03:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPgPw-0007DW-0L
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 03:30:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPgPt-00050C-AU
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 03:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631518211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHifXO8abbyhHn1bbUAp6NcSbQQdQrkcalMnZ5vsaQc=;
 b=BUC4QeqL2DKoVvbjU0EtL4q8vsUwb/17pMNb6RzjpPXle9xaoQ6T22Sg3ul3o0UbG1F7Hc
 QL1CoHmirPCneURtRXMTSqZZeTY2qTr0oBaduIcVVlhGwiprb9UHXwxr3Z9iNad9qdYAHX
 PpFpIhgFjmNquDNK9a1QCiEiY0pyR2I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-BqZircB2O_WDrqnKUt3Mxg-1; Mon, 13 Sep 2021 03:30:11 -0400
X-MC-Unique: BqZircB2O_WDrqnKUt3Mxg-1
Received: by mail-wr1-f69.google.com with SMTP id
 z2-20020a5d4c82000000b0015b140e0562so2347950wrs.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 00:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tHifXO8abbyhHn1bbUAp6NcSbQQdQrkcalMnZ5vsaQc=;
 b=E8x18vHo+gABJYOvfGd5YKYzWdXxWqo9RUq5pwt/QoyvkYRzwuSZ+AgbwpCRjtl8d7
 RRaxc0K43A20oUXQ9pNNo/ROMikwgGUwJtiE6XKpC47G1MJr83TVIWTJDI5lGrzRMo3w
 /rn3Vo+ieSnwlA1nBxRHgrx1dMj0B5dMTtRatvrltxO/QD2DAfm3lrAWw1PeoILqZWvG
 eBSgR6E8qmxz8U9DiKNDMZkyeW8DIb4ofkTBkpiwLMkn6euCrbXIQCT9lp7rNRWHJWNG
 bGv5mtc7PcL+YjxVw/U9PRskG2EPixuGqCSdE78zuiShGh7b4hr9vfWWeM4zo4ayihjN
 msuQ==
X-Gm-Message-State: AOAM5338OOn3QErAyKUQXDosRC39aFAyEIoXDNdzoqzWAUv27zvqa2sE
 Y+5yg/M9XJssQBOPnhUNEg8bdgFvBOCMwiFLEDLqDypNsd2iofvxQ835q8fxzgKw8XeS2vHBhBi
 ORpn2ekxyHYrdLerl3OgZ9vNQklTcmyqNe3Fjg+wq910/VdHVARxbJw14JXeQy+7wgkQ=
X-Received: by 2002:a1c:7515:: with SMTP id o21mr9646868wmc.150.1631518209486; 
 Mon, 13 Sep 2021 00:30:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0JXY8E1VzzvDtGChnmQZfkIDRalclGiXSlMv0miaYHmCW98iY3Hv+PZPnwcOiErtKjhovtA==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr9646830wmc.150.1631518209128; 
 Mon, 13 Sep 2021 00:30:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z17sm6907056wrh.66.2021.09.13.00.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 00:30:08 -0700 (PDT)
Subject: Re: [PATCH] qapi: define cleanup function for g_autoptr(Error)
To: Markus Armbruster <armbru@redhat.com>
References: <20210912124834.503032-1-pbonzini@redhat.com>
 <87fsu959rr.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7337ee08-cc7d-4ef1-dcc4-3b0facc8b7b1@redhat.com>
Date: Mon, 13 Sep 2021 09:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87fsu959rr.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/21 07:23, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Allow replacing calls to error_free() with g_autoptr(Error)
>> declarations.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   include/qapi/error.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/qapi/error.h b/include/qapi/error.h
>> index 4a9260b0cc..8564657baf 100644
>> --- a/include/qapi/error.h
>> +++ b/include/qapi/error.h
>> @@ -437,6 +437,8 @@ Error *error_copy(const Error *err);
>>    */
>>   void error_free(Error *err);
>>   
>> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(Error, error_free);
>> +
>>   /*
>>    * Convenience function to assert that *@errp is set, then silently free it.
>>    */
> 
> I'd like to see at least one actual use.

I'll have one soon, I'll Cc you on that one.  (I wrote this because Dan 
suggested using g_autoptr(Error) in a review, but it doesn't work yet).

Paolo


