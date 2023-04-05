Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764096D7F65
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:27:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk45v-00014D-1A; Wed, 05 Apr 2023 10:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pk45s-0000yo-6a
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pk45q-0000Bi-Cg
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680704793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L/746hNUK6zgxJCZdtTvcblOHXpUtBaerzH23eH8mE4=;
 b=ZsPWJa+AyIe7vg48qYZ19XMFa7rO3FlfQQvpKHd6De904Guow6cGvz7vrc7EA/cAyIkJEh
 RM2YllZ6T3C1Vp06MaorUovoNbFBxAehVrQKdysptLU7ZbnyuldlDIirs64Hvl8rb5MgtL
 pZIOy/C79iyOIktV/GAdept7mGbhyYY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-YUpC3zruPmyiKsnHvRYuwQ-1; Wed, 05 Apr 2023 10:26:31 -0400
X-MC-Unique: YUpC3zruPmyiKsnHvRYuwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 hg24-20020a05600c539800b003f066c0b044so531868wmb.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 07:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680704790;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/746hNUK6zgxJCZdtTvcblOHXpUtBaerzH23eH8mE4=;
 b=17LbS6d6buIUtPLE/B/8XpE2Ev3j9QyJYyxQoR4jIToO4QeGqTWjNc5rIydezcsse5
 oJowAPi8PpcwJUejURZczDH0U4DwiDMzxUr+i9m/kSW9LfEAkeVnN5cLFpsprGdwT4EP
 /yRYAIVwHP37pr8EnHAeeq7OlkKdxuhFscw0+J5iSs0th6djdtIXqErc81hwD7jdyDDD
 BdYc/p2u647v/fzLxTW2dAZW+j9ju1TJ60UzoGwcXHphWys6HYgSLnASFSynJX7x64w6
 SYxQ/92a4Pk6fNxf9UCJ3TMiAYb8Rxwbv8G4XWbvZmrPvpwBO0VnvgXzpwTwS/FL7SEP
 sNvg==
X-Gm-Message-State: AAQBX9c6aCmIfnpzYB9U/qbwPK0oMg7xGckUBVaGZKwb8tYVVth1N0iR
 mdk5nTqHP629+OPdBK+FFKk6jfQgqR9G70XlneJ0IQZMkeyKhvzbAgA+6MYtuWNvHBYh5qfetRZ
 JjLg+0YULQr5GJm4=
X-Received: by 2002:adf:f312:0:b0:2ce:a893:e45f with SMTP id
 i18-20020adff312000000b002cea893e45fmr4920148wro.15.1680704790587; 
 Wed, 05 Apr 2023 07:26:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQeEJ+89UIur3GRhEoB4rIGBesGGM/q61WGlOwA172JHzw91clQjXgDfkdpzZgF5LkKQBTVg==
X-Received: by 2002:adf:f312:0:b0:2ce:a893:e45f with SMTP id
 i18-20020adff312000000b002cea893e45fmr4920131wro.15.1680704790283; 
 Wed, 05 Apr 2023 07:26:30 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d00:ca74:d9ea:11e0:dfb?
 (p200300cbc7030d00ca74d9ea11e00dfb.dip0.t-ipconnect.de.
 [2003:cb:c703:d00:ca74:d9ea:11e0:dfb])
 by smtp.gmail.com with ESMTPSA id
 y13-20020adff14d000000b002c55306f6edsm15175424wro.54.2023.04.05.07.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 07:26:29 -0700 (PDT)
Message-ID: <f3d172d7-dcdf-1252-13b4-989bfd80f490@redhat.com>
Date: Wed, 5 Apr 2023 16:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFC 1/1] memory: Address space map listener
Content-Language: en-US
To: Antonio Caggiano <quic_acaggian@quicinc.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230405125756.63290-1-quic_acaggian@quicinc.com>
 <20230405125756.63290-2-quic_acaggian@quicinc.com>
 <81993f24-41fd-d52d-baa0-0328d414cf20@redhat.com>
 <f72d5432-9300-dfcb-d6b5-0902d67601c6@quicinc.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <f72d5432-9300-dfcb-d6b5-0902d67601c6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05.04.23 16:25, Antonio Caggiano wrote:
> Hi David,
> 
> On 05/04/23 15:23, David Hildenbrand wrote:
>> On 05.04.23 14:57, Antonio Caggiano wrote:
>>> Introduce a MemoryListener callback for address space map events.
>>>
>>
>> Why?
>>
> 
> Please, have a look at the cover letter "[PATCH RFC 0/1] MemoryListener
> address_space_map callback" with a detail explanation of the issue and
> the reason behind this. While I think it solves the issue for my use
> case, it might not be the best or even the right solution for it.

Oh, you did not CC me on the cover letter, so I missed it ...

-- 
Thanks,

David / dhildenb


