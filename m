Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5116C144B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:05:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peG7v-0005og-8J; Mon, 20 Mar 2023 10:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peG7t-0005oK-Vv
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peG7s-0001y4-B5
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679321079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BauqkQYyj5gh6vZYXpCPFICZUqjwI/+9qjhU879dctY=;
 b=Zy4pdm+oGLhwOtriDaasQ9sbWZ9OemQTAnCMVJp8WgTBn2V/k8gP5SxBCp4/+rSwy/FvoO
 x2LWGtI+/TnRVDfKfOXYWuU8haMESd2OAzDf0Y9Ukpl80fUcveJ5hHjRS/+CqjC+aINYU4
 aKQlfl9YQ1AgN/4oFC4hsEp72c8MPz4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-61HQG_mXOJ6DDJoVVSRHXw-1; Mon, 20 Mar 2023 10:04:35 -0400
X-MC-Unique: 61HQG_mXOJ6DDJoVVSRHXw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i8-20020a05600c354800b003ed59bae33bso4505317wmq.5
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679321074;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BauqkQYyj5gh6vZYXpCPFICZUqjwI/+9qjhU879dctY=;
 b=P8xsMAml+H8XHpX2WFF817Pe61cqBMu8v7UOvncKuuFp+a8fPguCCKxHPMj2wMTcsn
 9xRsNkRiLr6RaH+vS1Zj3aJasIqnAvsYhykcj4qIir2XgWPfGhiB2RuoXKko1uGEK/ui
 yBK+vurl1TdZAGVgSdIRX/wnMTkSKc34MsZAVq5weJ2riab7crtc9h/6saqNMdG+RgEw
 XbvOcZYqB4F4t+rb7LHUYRfZbNzMF9EXg8Z757K0bixbbbC48C3BUWXpS/jsknvmZxQv
 9GEZfiLNb5hWnefJN3bZxT1urSRxEwsLsDRczDStVxBQvQ6+Lcy3jO4RrbERyftb74kB
 NsqQ==
X-Gm-Message-State: AO0yUKWypx1EygLcZazb3Fet/dT/b61oj4YcG9DKprfqXDQHuEruWj7N
 JF8loW//VFOt/NJudXYqpSs1npzgBYFFCH7pJ3goT4S5GTYNmizCX+EJt8oyyGNqNurTi5WHJSu
 Wl18Hh6nkbs7TRv4=
X-Received: by 2002:a05:600c:1c1a:b0:3e1:e149:b67b with SMTP id
 j26-20020a05600c1c1a00b003e1e149b67bmr9754781wms.18.1679321074120; 
 Mon, 20 Mar 2023 07:04:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set/Y/793RW1rArwhQ7yIdg8yXmjiYBPExKRzu47HxVGNULE/eygP6LQR5Xf2YD/V9Nyxnj1HMg==
X-Received: by 2002:a05:600c:1c1a:b0:3e1:e149:b67b with SMTP id
 j26-20020a05600c1c1a00b003e1e149b67bmr9754760wms.18.1679321073787; 
 Mon, 20 Mar 2023 07:04:33 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-234.web.vodafone.de.
 [109.43.179.234]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05600c45cc00b003ee0eb4b45csm1505480wmo.24.2023.03.20.07.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:04:33 -0700 (PDT)
Message-ID: <7921104c-65e4-3b09-3a01-16b5f4ceb76c@redhat.com>
Date: Mon, 20 Mar 2023 15:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH-for-8.0] qemu/osdep.h: Do not declare function prototypes
 using extern keyword
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Sebastian Wilhelmi <wilhelmi@google.com>,
 Eric Blake <eblake@redhat.com>, Sebastian Wilhelmi <seppi@seppi.de>,
 =?UTF-8?Q?Simon_W=c3=b6rner?= <contact@simon-woerner.de>,
 Bernhard Beschow <shentey@gmail.com>
References: <20230320131426.16348-1-philmd@linaro.org>
 <ZBhfRmJc0M93s1F5@redhat.com>
 <42cc3cee-b148-aab0-cfd5-a684ce55d7f6@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <42cc3cee-b148-aab0-cfd5-a684ce55d7f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20/03/2023 14.47, Philippe Mathieu-Daudé wrote:
> On 20/3/23 14:27, Daniel P. Berrangé wrote:
>> On Mon, Mar 20, 2023 at 02:14:26PM +0100, Philippe Mathieu-Daudé wrote:
>>> By default, C function prototypes declared in headers are visible,
>>> so there is no need to declare them as 'extern' functions. Remove
>>> this redundancy. This also fixes when building under MSYS2:
>>>
>>>    C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: 
>>> standard attributes in middle of decl-specifiers
>>>    1075 | # define G_NORETURN [[noreturn]]
>>>          |                     ^
>>>    C:/msys64/code/qemu/src/include/qemu/osdep.h:240:8: note: in expansion 
>>> of macro 'G_NORETURN'
>>>    240 | extern G_NORETURN
>>>          |        ^~~~~~~~~~
>>>
>>> Reported-by: Simon Wörner <contact@simon-woerner.de>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1541
>>
>> There's already a fix for that issue included in a PULL request from
>> Thomas:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05225.html
> 
> Not the same patch. I'll rebase and post for 8.1 then I guess :)
> 
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   include/qemu/osdep.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>>> index f68b5d8708..79c26c748a 100644
>>> --- a/include/qemu/osdep.h
>>> +++ b/include/qemu/osdep.h
>>> @@ -237,7 +237,7 @@ extern "C" {
>>>    * supports QEMU_ERROR, this will be reported at compile time; otherwise
>>>    * this will be reported at link time due to the missing symbol.
>>>    */
>>> -extern G_NORETURN
>>> +G_NORETURN

Removing the "extern" sounds like a better idea than swapping it... since my 
PR was not in the staging branch yet, I went ahead and replaced the patch.

  Thomas


