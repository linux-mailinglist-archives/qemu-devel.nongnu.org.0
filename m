Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A18133904F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:49:46 +0100 (CET)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKj6n-0007JI-5a
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKj4i-0005M2-83
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:47:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKj4f-0000fL-B6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615560452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hulSkwbMzVsrMXEP7ezTY24IOXvblS8qEmCBDXX5FIs=;
 b=b88AjIYRDK3OOK8ZIChhPPbT2bQtywuGv5AMv8/+d3Sxu2ehgHufquKQWEyTdNhVy/DJUf
 xP6ii11xZFKVn6FRSolKqv6pqToGvaZzkpGZ/k/sYy2SoleBA9+LQ3T9GzvjHXgrFlDOCj
 R+lityOTrmypzWm7jRtnM4hZha1lB0w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-qNkvjw4-PWmUn5UWv2jvXw-1; Fri, 12 Mar 2021 09:47:30 -0500
X-MC-Unique: qNkvjw4-PWmUn5UWv2jvXw-1
Received: by mail-wm1-f71.google.com with SMTP id m17so2127574wml.3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 06:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hulSkwbMzVsrMXEP7ezTY24IOXvblS8qEmCBDXX5FIs=;
 b=WOhCmKWA+MksEimHeUY3BSvLsApmkLXwSnWsG97w2edUFoUm0Z2CJo+vjuCstfezfA
 iaX8CPh1DqRDSRG2Mjli1vjanCXzcN7/AGc5xEcDIz8rZn6gEEL20NyzcjR3Uqyy5ij5
 tFIuNKbVF8XPo7dSyIM2ZskuGX2/F4q+rl5vRk3f2g2SeTZohTfHuLOCEv0ne+Q94X+7
 1YU+udP5n6Mwwp3SofEfqZwnzMkCK3/rF6o9K8lSKX8ny8tNKyVKJQ2nDpIOt7Z9ixRf
 AdH/+o7eN/ZE6wTrIbEsp3vjEr6w29ldozuydznPSjQ0K4aH/7eDpfGfA5B4LTwTKNGb
 sqyQ==
X-Gm-Message-State: AOAM530ccwyHm5/UTgbPQeaQzVJ0NuFYPQ5Z9/lQzgMjYhr46FBpUg5Y
 8rC+ZEpJx+e6xZ6KJf4cF83W2eKRZ0ndDC/Fq5Vvv0EmfdrMmrmoVGx92e4HYghzVvG5D2h+iiV
 n4VKoH7PCMAYTMtU=
X-Received: by 2002:a5d:6312:: with SMTP id i18mr14604204wru.149.1615560449478; 
 Fri, 12 Mar 2021 06:47:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQA4mtbr5afbIDxF21cQ5b2k72+FcJNrSsfOLDWaDmroYZM/zU13JItyDSWgJYfM6I9+MtNg==
X-Received: by 2002:a5d:6312:: with SMTP id i18mr14604186wru.149.1615560449249; 
 Fri, 12 Mar 2021 06:47:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v18sm8295329wru.85.2021.03.12.06.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 06:47:28 -0800 (PST)
Subject: Re: [PATCH] qom: Support JSON in user_creatable_parse_str()
To: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org
References: <20210312131921.421023-1-kwolf@redhat.com>
 <d34b0a01-c655-8f09-fca3-15fc7db0cee7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d851c062-5f9e-934e-92ef-28fcfbf32ab0@redhat.com>
Date: Fri, 12 Mar 2021 15:47:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d34b0a01-c655-8f09-fca3-15fc7db0cee7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pkrempa@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 14:59, Eric Blake wrote:
> On 3/12/21 7:19 AM, Kevin Wolf wrote:
>> Support JSON for --object in all tools and in HMP object_add in the same
>> way as it is supported in qobject_input_visitor_new_str().
>>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>> Based-on: <20210311144811.313451-1-kwolf@redhat.com>
>>
>>   qom/object_interfaces.c | 32 +++++++++++++++++++++-----------
>>   1 file changed, 21 insertions(+), 11 deletions(-)
>>
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

Queued, thanks.

Paolo


