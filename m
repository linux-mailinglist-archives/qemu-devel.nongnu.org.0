Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF246A6887
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 09:02:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXHOH-0006Db-8t; Wed, 01 Mar 2023 03:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXHOA-0006CW-V8
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:00:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXHO9-0000VH-Hb
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:00:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677657636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QaIxajCKSrx5W1tuiQPT/9oAloHkmhX9nUR3/OSeTK0=;
 b=cIlwltqHBZwxA38wtfwKBAahg0MIc9ZiXye6wCJIo1WJ8On58MYRyB6C5KtLKgr6dW3KFE
 X4RKtmIR15geuwS0JZGD/9oppD3qm+2PY0sQ58maTuM89sg64Iw0ru9/OuQOg4jWuFBy5U
 scpKqINHx+ARif6PxB8KliIRzvmZjFY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-Br2E9yJzMZGXCUoTvDivxA-1; Wed, 01 Mar 2023 03:00:35 -0500
X-MC-Unique: Br2E9yJzMZGXCUoTvDivxA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u19-20020a05600c00d300b003eb24ce58ceso4293848wmm.9
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 00:00:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QaIxajCKSrx5W1tuiQPT/9oAloHkmhX9nUR3/OSeTK0=;
 b=K/j+m8yi84SfSxLRea3fXmcJXMbnBcIcp+wxQxO2YPcn2zj7jaJfixOJWjkxY1I1sK
 zBqPxKQlp2GDf4nPfqJgO7tqHhyOH7jZVCmA7t/opeMHfknDfbrrddmeS3UdDCuedk8P
 ++MPtm57veix2jrrumZTAlYFUjsEM4SWWjVooNySjYYSjrTteQi/UfUj70lv0y0yIWqB
 nRwZAppU11830QOrwpSLGmorS1uNoDCrVmH+Owu1XRcYJRhbSa2C0BlYvgC99LliizYz
 6o41kl9STz4eer3kY7krK3wqE5df1UqT2jiuTI3JfT5+IdEUrVKWxPE+oEehT97xKWKe
 PbTg==
X-Gm-Message-State: AO0yUKW9UU3g9dakTvi2qRa75ICOu2tvYRO4A6SRooeKXl5pSVQTBAn9
 mMO4INivT3uvT7hwEGbY2J/nMP0Ghx+CmN8vLf4IUg26aQgUD5CpiN9rHYh6S9vm7kmSBVKp9/u
 oPHtOHxtCxe/ymRA=
X-Received: by 2002:a05:6000:1367:b0:2c7:f56:2892 with SMTP id
 q7-20020a056000136700b002c70f562892mr4038148wrz.40.1677657634270; 
 Wed, 01 Mar 2023 00:00:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+0Gl5pQgxAuzoHm74lophms0MeKUq7YcEwJndUbxl2DeBwgiJDgjquIhjx6ol8k2WnBPJwRQ==
X-Received: by 2002:a05:6000:1367:b0:2c7:f56:2892 with SMTP id
 q7-20020a056000136700b002c70f562892mr4038129wrz.40.1677657634002; 
 Wed, 01 Mar 2023 00:00:34 -0800 (PST)
Received: from [192.168.8.100] (tmo-114-247.customers.d1-online.com.
 [80.187.114.247]) by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b002c551f7d452sm12136181wru.98.2023.03.01.00.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 00:00:33 -0800 (PST)
Message-ID: <19b0fd52-2bdc-ca64-d132-f9ee282ee4f8@redhat.com>
Date: Wed, 1 Mar 2023 09:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [qemu-web PATCH] Announce Google Summer of Code and Outreachy 2023
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20230224011006.1574493-1-stefanha@redhat.com>
 <618f8617-8240-4d48-cbd4-6c16695eae1c@redhat.com>
In-Reply-To: <618f8617-8240-4d48-cbd4-6c16695eae1c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27/02/2023 17.11, Thomas Huth wrote:
> On 24/02/2023 02.10, Stefan Hajnoczi wrote:
>> QEMU is participating in GSoC and Outreachy again. This blog post will
>> draw people's attention to our open source internships and increase the
>> number of applicants.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   _posts/2023-02-23-gsoc-outreachy-2023.md | 46 ++++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>   create mode 100644 _posts/2023-02-23-gsoc-outreachy-2023.md
> 
> Thanks, pushed!

And now it's finally online (after the CI is working again):

  https://www.qemu.org/2023/02/23/gsoc-outreachy-2023/

  Thomas



