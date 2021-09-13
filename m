Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40AE4096D4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:13:15 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPndy-0008Ny-U3
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPnas-0006FJ-VZ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:10:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPnap-0005Vk-4v
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631545798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZzWktstPuktzLnVjrfkJ5dEhDXuXPxwqbzw9hsmHHQ=;
 b=EpSaYIfbGuaM7pfiwvZb9Q8xVvuqb3Qm23Tm0pl2g9dhqNnwi+nmM9OQcU3cjJaTw3fn0A
 ke+0aSFMUWdX493l4H6sOBTew36I+3uyQiayu6im0Hgyclnpem8WIpibLm9gzp78MIjhc6
 XXZ2H2gXTnKJSEwBtaRNPLKCvba2cJM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-yaSPF9fUNzmHAt_Mh-6lXw-1; Mon, 13 Sep 2021 11:09:57 -0400
X-MC-Unique: yaSPF9fUNzmHAt_Mh-6lXw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n17-20020a7bc5d1000000b002f8ca8bacdeso96023wmk.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FZzWktstPuktzLnVjrfkJ5dEhDXuXPxwqbzw9hsmHHQ=;
 b=U98WyBQjrSB3ez6Ul5BGlFLliCaCr6bfncOLShahnJEenYva1NujTQZyFg6b4X7F4O
 OY8Ci1UmWFkxzv3OtgX94MIeeMuGGUS501CZgO0M19TiQabgel3oBNLZd4GyzdXB/reH
 HlaucejaIE+0AlxyPpYBKbXALV4xHiGQ5SRnNe2f/lYntsBiPOj8r+3Cyz1WHKeana14
 RyYj2QoBhlPpJxTdW2LYYmfwC09CA1Wr1AQ4QML3DJIfcXxPQLaLQU1cyimufNwUI11L
 SAY5sHtdEE5173g3q66bioP+Fk0Eg2ItUOsZ5UPaWDSklmqoTFT3ju3vtk1wzPRucvxV
 XxnQ==
X-Gm-Message-State: AOAM533qHD+jjDBM/e9ENF1iw+jr8+zmuWBLjjYPj9iAbIIL/0o5WdEK
 0xsAzbNkxXv2kiucW4xAZv3W8CnYEoLkPiQx92CTWf/iPw9VBID3Dbk6CGOoqR5naEtVts0Po61
 PVfDP1DEDibgR7wgqDX4lFFOMSW9c7aTNmAAlTMcGR5BrG71DP+u5ZoSnhqB0mkZ9
X-Received: by 2002:a1c:4b09:: with SMTP id y9mr8084481wma.45.1631545795810;
 Mon, 13 Sep 2021 08:09:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPJAayN1Bry45J1Nld/DgkYRlBZ/R3Jzjo878CBBLGi96lG94JkqjZsN3yyLwlE1sSfKK4TQ==
X-Received: by 2002:a1c:4b09:: with SMTP id y9mr8084451wma.45.1631545795537;
 Mon, 13 Sep 2021 08:09:55 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o10sm8563963wrc.16.2021.09.13.08.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:09:55 -0700 (PDT)
Subject: Re: [PATCH] qapi: define cleanup function for g_autoptr(Error)
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210912124834.503032-1-pbonzini@redhat.com>
 <87fsu959rr.fsf@dusky.pond.sub.org>
 <7337ee08-cc7d-4ef1-dcc4-3b0facc8b7b1@redhat.com>
 <87tuio3jq8.fsf@dusky.pond.sub.org> <87tuiomxlj.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5b8f6bc5-c331-45ac-01c4-96cf9a87ebbb@redhat.com>
Date: Mon, 13 Sep 2021 17:09:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87tuiomxlj.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 9/13/21 3:08 PM, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> On 13/09/21 07:23, Markus Armbruster wrote:
>>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>>
>>>>> Allow replacing calls to error_free() with g_autoptr(Error)
>>>>> declarations.
>>>>>
>>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>>> ---
>>>>>   include/qapi/error.h | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/include/qapi/error.h b/include/qapi/error.h
>>>>> index 4a9260b0cc..8564657baf 100644
>>>>> --- a/include/qapi/error.h
>>>>> +++ b/include/qapi/error.h
>>>>> @@ -437,6 +437,8 @@ Error *error_copy(const Error *err);
>>>>>    */
>>>>>   void error_free(Error *err);
>>>>>   +G_DEFINE_AUTOPTR_CLEANUP_FUNC(Error, error_free);
>>>>> +
>>>>>   /*
>>>>>    * Convenience function to assert that *@errp is set, then silently free it.
>>>>>    */
>>>> I'd like to see at least one actual use.
>>>
>>> I'll have one soon, I'll Cc you on that one.  (I wrote this because
>>> Dan suggested using g_autoptr(Error) in a review, but it doesn't work
>>> yet).
>>
>> I recommend to squash this patch into its first user, or maybe put it
>> right before it.
> 
> I went for a walk, and now I have more substantial comments.
> 
> I'm not sure g_autoptr() is a good match for the Error interface in its
> current shape.  Let me explain.
> 
> Use of error_free() is relatively rare: a bit over 200 calls outside
> tests/, compared to more than 4000 error_setg*().  This is because the
> most common ways to clean up are propagation and reporting, not
> error_free().
> 
> As is, reporting errors doesn't play well with g_autoptr().  Example:
> 
>     Error *err = NULL;
> 
>     ... code that may set @err ...
> 
>     if (error is serious) {
>         error_report_err(err);
>     } else {
>         error_free(err);
>     }

error_report_err() seems always called within an if()
statement, so an alternative is to refactor this pattern as:

  void error_report_err_cond(bool condition, Error *err);


