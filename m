Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E746443B75D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:38:02 +0200 (CEST)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPSc-0001UI-1B
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mfPOy-0005mk-Gj
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mfPOw-0004Od-4s
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635266050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Qgz6Via96HkR2nFJAQOwvUo/uFRIoXzqo+BreND9YY=;
 b=EJ/Uk31Ynd9OgGWoYOsOWBPawDk9/c2wqwOW94W4+w/LMREn8FvzMCtH1RuO0G8HOu0qST
 hsls/DoaO9qIrIQO+4bLwT0HxPIj1tykPzHy/1CFPvlK+6Tvb8TWQ6710Hzs6oSffbDftJ
 TsAPZjMrqN1ppkGglEfZXC+BkEaNIjM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-EeF84KrwMKezgxLDUk-lsQ-1; Tue, 26 Oct 2021 12:34:09 -0400
X-MC-Unique: EeF84KrwMKezgxLDUk-lsQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w7-20020a056402268700b003dd46823a18so7714351edd.18
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Qgz6Via96HkR2nFJAQOwvUo/uFRIoXzqo+BreND9YY=;
 b=PJiX7pvt5hZOfK0/QWr4CiDG8CHyr+i820vZefnoCDPfJzHr0lfHXGmnhRH2wc2Aih
 Qf6Uz6fcnLHa0Ww337MTLhNymY1cLVdjaMftjPF1x4L3y6+Z6Kfwj4AHA8rOS8ZTOmz5
 eJoW0ITeXZjmx8whjYd5hh8sK3s5ukR28uoceOjiqujV3NLM42RNvxUMf4iH++Ay0fCP
 CooTjJ3TvXR/BSepAVHnXaGiefNRlkk+CqAY7cTcEbzuY8hy7tK6EEueTHmiYmyYzqje
 wr7NQBxuo1+rsXG8Jm18W+oivMfmSO9NasanI40M/kz0ijoOup+eAzPCRWehezn3TO1K
 xx0A==
X-Gm-Message-State: AOAM533jj6lxY2euZBRkjl7T+PHqWhvAKNENDkAd0+KWOKF/xu8Sgywr
 W3SfuYWWHr7llDjq7Dth5sBalebS4tuTepziCMeqTQlejY8dmr29hwNmu43etkgxUauyxU31v/H
 SmWGHZuAhc6jPbcY=
X-Received: by 2002:a50:becf:: with SMTP id e15mr38422228edk.114.1635266047841; 
 Tue, 26 Oct 2021 09:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrIvylJlMlckvS4AjFc8JrblkxeTwROxV53yTzadKGtU++GM/j2l3TB30z3cf5C1+JPbfwOg==
X-Received: by 2002:a50:becf:: with SMTP id e15mr38422190edk.114.1635266047582; 
 Tue, 26 Oct 2021 09:34:07 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q2sm9595377eje.118.2021.10.26.09.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 09:34:06 -0700 (PDT)
Message-ID: <af0511ea-1322-76d5-a3c6-bcfc577c4987@redhat.com>
Date: Tue, 26 Oct 2021 18:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hvf: Avoid mapping regions < PAGE_SIZE as ram
To: Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>
References: <20211025082558.96864-1-agraf@csgraf.de>
 <6c9b6035-276c-1e15-7b7f-81094473368b@redhat.com>
 <a19cfe8f-a013-b2da-7893-50d7c1ecfecd@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <a19cfe8f-a013-b2da-7893-50d7c1ecfecd@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/10/21 21:10, Alexander Graf wrote:
>>>           }
>>>       }
>>>   +    if (int128_get64(section->size) & (qemu_real_host_page_size - 
>>> 1) ||
>>> +        section->offset_within_address_space & 
>>> (qemu_real_host_page_size - 1)) {
>>> +        /* Not page aligned, so we can not map as RAM */
>>> +        add = false;
>>> +    }
>>> +
>>>       mem = hvf_find_overlap_slot(
>>>               section->offset_within_address_space,
>>>               int128_get64(section->size));
>>>
>>
>> Queued, thanks.
> 
> 
> You probably want v2 instead :)

That's actually what I had applied. :)

Paolo


