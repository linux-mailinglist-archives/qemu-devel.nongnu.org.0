Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765F022EBB1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 14:06:33 +0200 (CEST)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k01to-0002yn-J1
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 08:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k01sp-0002WC-UF
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:05:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52555
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k01so-0004Ff-Ar
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595851529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8mkkVY8KP9sab5itXrjqRqhl+1pFFQzdqtVI5ZqXC0=;
 b=FVqTWdWplcVbXo5y1FB1IfmTixuToZ/bTSFz/oM/4CFA5MffSQE4sOVZe0AGV6+WqdLYPD
 9ENk8ak5f52k+PnablQ1rqTZHN0f46v9GBzKkxXQ52cT5r8GGUzY8XHiYEIAqQOzY4cAuD
 mIBME2gweJ34uw/Euo/eHYw98m362TU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-4NfsOrzDNlCqXj6qCkZuLw-1; Mon, 27 Jul 2020 08:01:56 -0400
X-MC-Unique: 4NfsOrzDNlCqXj6qCkZuLw-1
Received: by mail-wm1-f71.google.com with SMTP id v8so6056877wma.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 05:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N8mkkVY8KP9sab5itXrjqRqhl+1pFFQzdqtVI5ZqXC0=;
 b=KXJu3/OmfJLCePberQQXqpkBtm5ZAXrIEiVHPUXlLDZB69FK7EAceuxxvmoICB8zNg
 DtdyNYTkAXfZcOlC0FBEUs9DrzyaxqH9df9RJNnUvx7a6/+giolrccy4QV+AprU4xAO7
 3U2fLHLRmGPmS0GuwpYPxVDoi2zZ+mTppC5ZP7vIeKRy9AygqYxIjWjECFwFVsQjaIgq
 26bEILoaNPnUtxu+6fWb/qaT2Jqxg3eyskzHMXzDUcRxh9aL+dHnXiBOPoE83QR+vcoI
 HqcvDnBIzN69Ko6caV81zhKBgetRJrrLHglxYaxTNE/rJ43A4ORAZl6i/U0HYlNgN1sX
 kfZA==
X-Gm-Message-State: AOAM530aYhgnTEwLfVahwYYC7WOFr/77kTuV56Hw9rfKgZMEkBtAX8MS
 hi5w3dxUIZXV4G1c2NTNLglUZVniPlG5gk/SP3cuignqpfsCD/n46p5ZDfVNfJXjX6OP11Kgsub
 n79j5msB9w/qnSNo=
X-Received: by 2002:adf:e647:: with SMTP id b7mr14502283wrn.220.1595851314999; 
 Mon, 27 Jul 2020 05:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynVJUIuu9omtAx+Z4F4YMtUSXRMtxicEFgUFPCMQBpryNskIy4w4lON7qB1uyGsYpJsD/ytQ==
X-Received: by 2002:adf:e647:: with SMTP id b7mr14502260wrn.220.1595851314690; 
 Mon, 27 Jul 2020 05:01:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4502:3ee3:2bae:c612?
 ([2001:b07:6468:f312:4502:3ee3:2bae:c612])
 by smtp.gmail.com with ESMTPSA id j5sm18316627wma.45.2020.07.27.05.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 05:01:54 -0700 (PDT)
Subject: Re: [PATCH 2/2] i386/cpu: Don't add unavailable_features to
 env->user_features
To: Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
References: <20200713174436.41070-1-xiaoyao.li@intel.com>
 <20200713174436.41070-3-xiaoyao.li@intel.com>
 <20200713184841.GF780932@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <99c4c60f-1d4f-6157-0390-a07f0504be24@redhat.com>
Date: Mon, 27 Jul 2020 14:01:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200713184841.GF780932@habkost.net>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 03:37:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/20 20:48, Eduardo Habkost wrote:
> On Tue, Jul 14, 2020 at 01:44:36AM +0800, Xiaoyao Li wrote:
>> Features unavailable due to absent of their dependent features should
>> not be added to env->user_features. env->user_features only contains the
>> feature explicity specified with -feature/+feature by user.
>>
>> Fixes: 99e24dbdaa68 ("target/i386: introduce generic feature dependency mechanism")
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> 
> Paolo, do you remember why that line existed?  It doesn't make
> sense to me.
> 
> There are exactly 2 lines of code reading user_features, and both
> of them are inside x86_cpu_expand_features() above this hunk.

I think it was just to be safe in case in the future something else adds
features automatically, in the same way as the cpu->max_features case:

            env->features[w] |=
                x86_cpu_get_supported_feature_word(w, cpu->migratable) &
                ~env->user_features[w] &
                ~feature_word_info[w].no_autoenable_flags;

It would prevent the unavailable dependent features from being added.

But yeah, it would just be enough to place it above this hunk.

Paolo

> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> 
>> ---
>>  target/i386/cpu.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 9812d5747f35..fb1de1bd6165 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -6370,7 +6370,6 @@ static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>>                                        unavailable_features & env->user_features[d->to.index],
>>                                        "This feature depends on other features that were not requested");
>>  
>> -            env->user_features[d->to.index] |= unavailable_features;
>>              env->features[d->to.index] &= ~unavailable_features;
>>          }
>>      }
>> -- 
>> 2.18.4
>>
> 


