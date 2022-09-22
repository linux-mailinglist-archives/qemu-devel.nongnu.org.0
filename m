Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F975E6B51
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:56:54 +0200 (CEST)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRNV-0006Xr-7j
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obPqL-000776-NF
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obPqH-0005oK-9B
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663867108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXF4gTE0yoBdYHkWrUx2jq795YIFr62T1BGu33CXoQc=;
 b=fS6lbTN1OtcS4qNkIz8voCDwUoG+fb23kxQEGbJyCaEpCKGn8aoQeDwYOa5tLfqfWuRWCP
 G8E7zrB4AfvgQYwmaWtNObRw4W6bJWzUBGOAp5hy8oaMJKLL15tzSllVVoeABowQqIa3mQ
 DeCbDK8AnziYenigow3sGqaipWSRXkY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-298-8dvbs5JLNIyVhccWu6LPAQ-1; Thu, 22 Sep 2022 13:18:26 -0400
X-MC-Unique: 8dvbs5JLNIyVhccWu6LPAQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 14-20020a05600c228e00b003b4d065282dso995511wmf.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 10:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=aXF4gTE0yoBdYHkWrUx2jq795YIFr62T1BGu33CXoQc=;
 b=A7B07hgghqSrekGi33q2vT22mBfu0rgh1mk/B+OjIh3Ty73Jl3u3MOhIMpgtDsXot9
 tEeXA7+qsy8xlJeVKdwxLNHANlWG4q4zps40YstgVRj2V5YNhtym5QlxsdSGdvNBSxi4
 HOkXwY+hMXMtRZXE4KY5upbLHZE8ZzLYe3FPAKonFYbca7NjJuBmfcVQ6xWNF2o3KMW+
 Su0Gy5hx6S9Mb56Xr3eWVvTXCylDP3cwlx08ke0vT8T8Vj7+4dNa1z9emKTqAzk6uT6R
 cVo6S3WJi0Uq5b79PWetYhRJ9l2p45w3tqUljdjSHpsRe5UboB4nb6Iuv1+i5xEzfii6
 yKAg==
X-Gm-Message-State: ACrzQf0ynPkEGNxnv4bxA6OFKzKAIvlumQBn6q3W3Ao/PM9apNeCb4UW
 D9CV1PZSG2SUpt88CuPgs+1gk5dSkobYuJxM+FQpTjyI4WOA4uJyUKC4XbJsYe6HJfabBMXZjGc
 J2axrFz1wR/LQQmY=
X-Received: by 2002:a05:600c:3d8f:b0:3b4:aab6:4a97 with SMTP id
 bi15-20020a05600c3d8f00b003b4aab64a97mr10371007wmb.82.1663867105808; 
 Thu, 22 Sep 2022 10:18:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM41pLpkm34hTkWUGnnZOtUt/9POMfjrU2AuDDOOMcLrfy1EbJ99z48l05NIh0e7nNFFKqGzBA==
X-Received: by 2002:a05:600c:3d8f:b0:3b4:aab6:4a97 with SMTP id
 bi15-20020a05600c3d8f00b003b4aab64a97mr10370982wmb.82.1663867105488; 
 Thu, 22 Sep 2022 10:18:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2200:d595:cc20:2e3a:fc5f?
 (p200300cbc7082200d595cc202e3afc5f.dip0.t-ipconnect.de.
 [2003:cb:c708:2200:d595:cc20:2e3a:fc5f])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c0a0900b003b32aa0fabcsm188847wmp.4.2022.09.22.10.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 10:18:24 -0700 (PDT)
Message-ID: <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
Date: Thu, 22 Sep 2022 19:18:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 22.09.22 17:55, Thomas Huth wrote:
> On 22/09/2022 17.38, David Hildenbrand wrote:
>> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
>>
>> In order to fully support MSA_EXT_5, we have to support the SHA-512
>> special instructions. So implement those.
>>
>> The implementation began as something TweetNacl-like, and then was
>> adjusted to be useful here. It's not very beautiful, but it is quite
>> short and compact, which is what we're going for.
> ...
>> @@ -52,6 +278,9 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>>                cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
>>            }
>>            break;
>> +    case 3: /* CPACF_*_SHA_512 */
>> +        return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
>> +                            &env->regs[r2 + 1], type);
> 
> I have to say that I liked Jason's v8 better here. Code 3 is also used for
> other instructions with completely different meaning, e.g. PCKMO uses 3 for
> TDEA-192 ... so having the "type" check here made more sense.
> (meta comment: maybe we should split up the msa function and stop using just
> one function for all crypto/rng related instructions? ... but that's of
> course something for a different patch series)

It kind-f made sense in v8 where we actually had different functions. We 
no longer have that here.

Anyhow, this is just the same as in patch 2/2. So no need to be fancy 
here ;)

-- 
Thanks,

David / dhildenb


