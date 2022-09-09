Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5C65B360F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 13:10:08 +0200 (CEST)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWbtd-00056y-Dj
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 07:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oWbm7-0008EP-Qf
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 07:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oWbm2-000556-4k
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 07:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662721330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=552oMY7StYxcNv74FqiwwC+bER9EAS86HhvPvxTkRvE=;
 b=Znr4EI9zy9h83Qs30eeAJpt/ZhugP5rKvctult060GB8WSeuFMjVtTNhuE/oEojdJ5N4gg
 L2R9rOIcVkphZ0kmEHYmxZsVh0bePXV2XnFDgtBayUwpT26mcGjTdauher+w9oDZYM3YTH
 ZXq52HLSYlhKO6/RhcrV5HdR4rIqCdI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-3xEWoAdpMGa-4_U2a3d9QQ-1; Fri, 09 Sep 2022 07:02:08 -0400
X-MC-Unique: 3xEWoAdpMGa-4_U2a3d9QQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j19-20020a05600c1c1300b003ab73e4c45dso2623079wms.0
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 04:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=552oMY7StYxcNv74FqiwwC+bER9EAS86HhvPvxTkRvE=;
 b=GttCbrg4PtpwG3ML+JVZNA3Z3chj2dUdKJ296fxBLs9cbEbLrnQRolg96uVaA2jq9T
 7+bKWjmpgw6Iro3Um/TVg2FLrvZJ04I3iTlnRy9FrKjbzApmzw2lvSmf/euGBdm9wq9E
 yGihdEJNTVUu5o6Ajnop4bDnM+EjE2j2BM2zWNvhE9UoHrMabU6eklwIApGjh+baGGKD
 DkFZVpJ9DAERPe4t9Dr87cbleQYouTFUttG5ftvKHsBiJdTaiVjGNZGb0l+vszass3cm
 iMJc60aU5J7Jm4fb0XazXcuebtIqAYEtjfZyuWtE6Y8TdCmIE8UrFIdJukuCGWpk4aQt
 1VGA==
X-Gm-Message-State: ACgBeo1Gy0njdTVHMjxZsTONRWaQMuWWNVVXEzeTESsFLldLsNTq3IV8
 FhnR/OWAxrjNnyNxl0U1ivNaZcwaPHIIegORNfQbDMIgm9KcbaAcrPCo/UdBnSCz1HPKIIx0Uwp
 +Tk+UNGKHGJcAnek=
X-Received: by 2002:adf:edc9:0:b0:228:60de:1d4b with SMTP id
 v9-20020adfedc9000000b0022860de1d4bmr7840948wro.306.1662721327697; 
 Fri, 09 Sep 2022 04:02:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6XrE6BUCNUNrNXlO+Yq7s10DLek+7dAPopvXjQd5tznH4HCs4Zzv6Wb4RjFhFEk1Hz/MJ9mg==
X-Received: by 2002:adf:edc9:0:b0:228:60de:1d4b with SMTP id
 v9-20020adfedc9000000b0022860de1d4bmr7840932wro.306.1662721327450; 
 Fri, 09 Sep 2022 04:02:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:6300:1fe0:42e1:62c5:91b6?
 (p200300cbc70463001fe042e162c591b6.dip0.t-ipconnect.de.
 [2003:cb:c704:6300:1fe0:42e1:62c5:91b6])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b003a540fef440sm449486wmp.1.2022.09.09.04.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 04:02:06 -0700 (PDT)
Message-ID: <36a9dc69-d045-7ca4-a0a8-995c63951a9f@redhat.com>
Date: Fri, 9 Sep 2022 13:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay kvm_vm_ioctl
 to the commit phase
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com> <Yv6baJoNikyuZ38R@xz-m1.local>
 <CAJ6HWG6maoPjbP8T5qo=iXCbNeHu4dq3wHLKtRLahYKuJmMY-g@mail.gmail.com>
 <YwOOcC72KKABKgU+@xz-m1.local>
 <d4601180-4c95-a952-2b40-d40fa8e55005@redhat.com>
 <YwqFfyZ1fMA9knnK@xz-m1.local>
 <d02d6a6e-637e-48f9-9acc-811344712cd3@redhat.com>
 <66ed2e5b-b6a8-d9f7-3fe4-43c974dc0ecd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <66ed2e5b-b6a8-d9f7-3fe4-43c974dc0ecd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 09.09.22 10:02, Emanuele Giuseppe Esposito wrote:
> 
>>> One thing I forgot to ask: iirc we used to have a workaround to kick all
>>> vcpus out, update memory slots, then continue all vcpus.  Would that work
>>> for us too for the problem you're working on?
>>
>> As reference, here is one such approach for region resizes only:
>>
>> https://lore.kernel.org/qemu-devel/20200312161217.3590-1-david@redhat.com/
>>
>> which notes:
>>
>> "Instead of inhibiting during the region_resize(), we could inhibit for
>> the hole memory transaction (from begin() to commit()). This could be
>> nice, because also splitting of memory regions would be atomic (I
>> remember there was a BUG report regarding that), however, I am not sure
>> if that might impact any RT users."
>>
>>
> I read:
> 
> "Using pause_all_vcpus()/resume_all_vcpus() is not possible, as it will
> temporarily drop the BQL - something most callers can't handle (esp.
> when called from vcpu context e.g., in virtio code)."

... that's why the patch takes a different approach? :)

-- 
Thanks,

David / dhildenb


