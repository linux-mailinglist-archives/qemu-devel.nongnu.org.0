Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030BD561D18
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 16:16:25 +0200 (CEST)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6uxz-0006z6-J6
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 10:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o6uvf-0005me-G2
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 10:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o6uva-0004G1-Vj
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 10:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656598433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xudN7ti7GG9ira4jSb4x0HL8eGdOHFeMA2R9FXBALe4=;
 b=aDM3gyURhHKB2RTFc+CFO0kynUCXJV5kzwTw0zdp2GgLHhmgOYuQ8TuAuBzgNUlLIozGzK
 YssISwYuZquQnnPYYW3Uqak45sg7FYxaDCinxKywRMXRAAIQMQjmcePC92BAlCIlgJXGy4
 uyRKoRrBqMsCU8ShmWDsdx1YrfhUc0s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-k7-iAuwmNeOMoULPjqsAIQ-1; Thu, 30 Jun 2022 10:13:52 -0400
X-MC-Unique: k7-iAuwmNeOMoULPjqsAIQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 b7-20020a056402350700b00435bd1c4523so14413712edd.5
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 07:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=xudN7ti7GG9ira4jSb4x0HL8eGdOHFeMA2R9FXBALe4=;
 b=k3HIzY1cw3A5FQS/4iMF1jiipi3q/I0DOZigs79Y+QyUpeJeqcEz3BzkjsrS9tMBcE
 /0u+ncBcqgfnLI97KynlYyFDsvT1PUZKo7aUZTZXH83qBYF/apIdBm47C4i2BdgR2+um
 j31hxJnBn+moYFEuakvn01kEExIJ5JwbhBBaHT6139BoLAIIJAz431qTA4IPF3EuCEgb
 IvVyG1jfQsEyFjT4H0Go/lMxr7ZBDj6I8P0KFx4lUPOwLAx91eGyjpc2XLP4hxCS6Nf2
 adhRYvekL/TtQsF1dnGppFN/zeK3AVVfYg2974D5IkkKMoV9bropWayRpuJbaTibHj0J
 Mxtw==
X-Gm-Message-State: AJIora8tFt36blJ0SdkQ5B0d87Ghsm/JhQNCWmQ5uHGWCxg0F6erk9Up
 4J7Mqmrjc0S3inQ2DbcBNmYKgfEZtVUwMECC91qTIsy7pxHPLMBZm8LqWSC40ylH02eAT0geXkW
 otJWYqzg50aLZ4YA=
X-Received: by 2002:a05:6402:1694:b0:435:79d2:a441 with SMTP id
 a20-20020a056402169400b0043579d2a441mr12172498edv.55.1656598431373; 
 Thu, 30 Jun 2022 07:13:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vW2IGVMw7kuWIET7aGwFUM1AzghV/Xrd2lEPXj7U0AkHiyqCZl+fE1qOO2+/4Vb6ouArnmwA==
X-Received: by 2002:a05:6402:1694:b0:435:79d2:a441 with SMTP id
 a20-20020a056402169400b0043579d2a441mr12172485edv.55.1656598431236; 
 Thu, 30 Jun 2022 07:13:51 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05640243cf00b0042a2d9af0f8sm13032679edc.79.2022.06.30.07.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 07:13:50 -0700 (PDT)
Message-ID: <879bfc3a-e807-f094-e1d6-7c91810ce0fa@redhat.com>
Date: Thu, 30 Jun 2022 16:13:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] gtk: Add show_tabs=on|off command line option.
Content-Language: en-US
From: Hanna Reitz <hreitz@redhat.com>
To: =?UTF-8?Q?Felix_xq_Quei=c3=9fner?= <xq@random-projects.net>,
 qemu-devel@nongnu.org
Cc: kraxel@redhat.com, thuth@redhat.com
References: <20220627164404.12137-1-xq@random-projects.net>
 <b7546847-d46a-b62c-f5ff-bd851a8e6ebc@redhat.com>
In-Reply-To: <b7546847-d46a-b62c-f5ff-bd851a8e6ebc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.06.22 16:09, Hanna Reitz wrote:
> Hi,
>
> (Thanks for the patch!)
>
> On 27.06.22 18:44, Felix xq Queißner wrote:
>> The patch adds "show_tabs" command line option for GTK ui similar to 
>> "grab_on_hover". This option allows tabbed view mode to not have to 
>> be enabled by hand at each start of the VM.
>
> I’m not sure we have a hard rule on it, but I think generally commit 
> messages should be wrapped at 72 characters.
>
>> Signed-off-by: Felix "xq" Queißner <xq@random-projects.net>
>> ---
>>   qapi/ui.json    | 5 ++++-
>>   qemu-options.hx | 2 +-
>>   ui/gtk.c        | 4 ++++
>>   3 files changed, 9 insertions(+), 2 deletions(-)

[...]

>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 377d22fbd8..2b279afff7 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1937,7 +1937,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>>       "            [,window-close=on|off]\n"
>>   #endif
>>   #if defined(CONFIG_GTK)
>> -    "-display 
>> gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
>> +    "-display 
>> gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off][,show-tabs=on|off]\n"
>>       " [,show-cursor=on|off][,window-close=on|off]\n"

Oops, noticed another thing (a bit late): Considering the options are 
already spit over two lines, it looks to me like this line’s length is 
supposed to be limited.  (My guess is we’re trying to not exceed 80 
characters here in this source file.)  Therefore, this new option should 
probably go on a separate new line.

Hanna


