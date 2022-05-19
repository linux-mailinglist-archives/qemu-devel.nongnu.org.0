Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA50752CC32
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 08:49:43 +0200 (CEST)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrZyg-0003xX-UB
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 02:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrZqd-00023n-Hm
 for qemu-devel@nongnu.org; Thu, 19 May 2022 02:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrZqb-0008Ua-KI
 for qemu-devel@nongnu.org; Thu, 19 May 2022 02:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652942481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mxgh/81NN+Kgf1kC8XgOakXg906mc5QCZLADIoE5t80=;
 b=J2auJ5jVKsre0HBKnHQePlzNtO0vG0B7xnTCxmWWE3b5Ask019+AQekjOCZUY5QCosP1KN
 uOUqDo5NN8Vjp7f9o5NDG5pAadCQViPlT8PVVAxLlDwXzVrlsb4MgOTKIDkJSwMh42V+Fw
 m8l99zkeNAuvTbXl05VK4qO0R//i4No=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-_ZHeWT5KOmmF59ll3Ww1Cw-1; Thu, 19 May 2022 02:41:19 -0400
X-MC-Unique: _ZHeWT5KOmmF59ll3Ww1Cw-1
Received: by mail-wr1-f70.google.com with SMTP id
 o13-20020adfa10d000000b0020c6fa5a77cso1159701wro.23
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 23:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mxgh/81NN+Kgf1kC8XgOakXg906mc5QCZLADIoE5t80=;
 b=YTwGaJAX5LHTqysqAcbWUfGjKU0ViIsZwC9fI1a0wzp3nA+eIpibocP94kj9AaCzaS
 9LUCzTDZVcG3tbH63/YUn+XFJS4OWOjBeoH/hIbGKxA8e77mTT/JXj8cJIcPVIiyd9vT
 CZlE4gFCqUULXeKC0e2RkJgqI7ce1MF4wrIut6iGqrVCHAv5DgcZMXFDIGvTK+naqGqH
 UwsMr596qJ+lTvcs7THUFlYtHwdZgpE6Z/IqC2I8MVUhKKYvbUJgHcvVtUMjYNaIenD0
 U+bLMwHWZETo7eBfz2h1eGbiuhKW+/qmzStBBVMbf97xveqV/MEL/S1bjqiSrhqxY8qS
 AlFQ==
X-Gm-Message-State: AOAM532UuCpNKn3UxGmbNWWYJOF5PnErdreDhYHS1bp3ykS/qSzzzyCJ
 qNDbZOHLvDELWVq43F5Pm4u5QQYlHZ/8Gs6yiZi80lYfYW5xLPg4V/wayWxhS2hIdhDxRG0gZgZ
 rMpXVAhDzJJOlc5Q=
X-Received: by 2002:a05:6000:1f17:b0:20e:6626:5ac7 with SMTP id
 bv23-20020a0560001f1700b0020e66265ac7mr2505518wrb.489.1652942478526; 
 Wed, 18 May 2022 23:41:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx33//n5MHWkANXB5xJHebLuASYCJddzaL4Mu2qStfrSEjuQak3nqWkYgMLRykacjLm+4/WwA==
X-Received: by 2002:a05:6000:1f17:b0:20e:6626:5ac7 with SMTP id
 bv23-20020a0560001f1700b0020e66265ac7mr2505508wrb.489.1652942478355; 
 Wed, 18 May 2022 23:41:18 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 f1-20020a1cc901000000b00395b809dfd3sm3289485wmb.12.2022.05.18.23.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 23:41:17 -0700 (PDT)
Message-ID: <b731f02a-f579-2918-db83-c5e57ecc53a2@redhat.com>
Date: Thu, 19 May 2022 08:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com>
 <20220518154100.7yoqrgdsdgnwhepu@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220518154100.7yoqrgdsdgnwhepu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 18/05/2022 17.41, Eric Blake wrote:
> On Wed, May 18, 2022 at 03:44:45PM +0200, Thomas Huth wrote:
>> The "-display sdl" option still uses a hand-crafted parser for its
>> parameters since we didn't want to drag an interface we considered
>> somewhat flawed into the QAPI schema. Since the flaws are gone now,
>> it's time to QAPIfy.
>>
>> This introduces the new "DisplaySDL" QAPI struct that is used to hold
>> the parameters that are unique to the SDL display. The only specific
>> parameter is currently "grab-mod" that is used to specify the required
>> modifier keys to escape from the mouse grabbing mode.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
> 
>> +++ b/qapi/ui.json
>> @@ -1295,6 +1295,30 @@
>>         '*swap-opt-cmd': 'bool'
>>     } }
>>   
>> +##
>> +# @GrabMod:
>> +#
>> +# Set of modifier keys that need to be hold for shortcut key actions.
> 
> s/hold/held/

Thanks, I'll send a v3 with this (and the nits found by Markus) fixed.

  Thomas



