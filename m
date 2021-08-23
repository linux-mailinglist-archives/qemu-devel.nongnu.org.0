Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E53F47B8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:37:20 +0200 (CEST)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6ON-0007M8-Fk
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI6NL-0006gN-KF
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI6NK-0005CI-3S
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629711373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAjeXvxFQzm8ZCaq1ZojnvnvGKAOe6InPVFXd2hB/ss=;
 b=ObA5afYTuWXIDLSdUhptL1v5/du7gJ48xvbwTdlhSOaTJfOJMeR9HDqbpnm5t7DnlJptY/
 wjZuwhOXWWuPN1bVjheB5Pqy2SJfNIo+PmLA6motooyno33iVEeloin1ABBRIr83TAFMC7
 89zyzLit9qr2spyMvo3Uu4u37gU2s8U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-mZ_i0qWRNKqJSqwyt8Ux-w-1; Mon, 23 Aug 2021 05:36:10 -0400
X-MC-Unique: mZ_i0qWRNKqJSqwyt8Ux-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so2788428wmc.3
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RAjeXvxFQzm8ZCaq1ZojnvnvGKAOe6InPVFXd2hB/ss=;
 b=IANdmMBwq94O8OIgC/taDupCdyr26XTW1wLVEJAQPbGrZp6FKePrZIf69yeU5UwThe
 k4j/QloEp3yTz/PxDUd9+ED5LhKubk/pNIJKae6bA3N70dUype8P03cBm5Gsl07StvoM
 bqcQQF5U0Lk3TGM7le5RahgNCCHE3TpmnXs/dUTkC8/ht79njL0905GPTBCpL4tUvTkO
 RcvmD0wbuBRH7004zTJ9ljwSSneV+3jVLg9D2K1w6BQEVlggRucYZqQebeJwhJNCoN0z
 yMSNhbO6Vuw5xWgi5uRL8CFF/OWqmJ9ViTkOs+sXJnmEfC+V0EVIs3+bWVuoFE2P6uhG
 Wyag==
X-Gm-Message-State: AOAM5330XbmMUxPHegdZvrVslPTj8okslqiqL9pD/tBEtluu0ArKRKQ6
 6o3owolTp5jf/Qxvyp6X2XLWiNK/C1Mpt1c7IfBjqpJR0Xt0ARfpzoOILO4R0guI26CzJ/5SrdA
 GAQihrkF12UKpF+s=
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr8173554wmq.55.1629711369708; 
 Mon, 23 Aug 2021 02:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx01kAd4spfqnugn8pZXZrAu+fWdkQVSRocw6deX/Mljj6t5ePBxI0rq3VAwwEUXXN4JXUrYQ==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr8173533wmq.55.1629711369489; 
 Mon, 23 Aug 2021 02:36:09 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id g21sm17917704wmk.8.2021.08.23.02.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 02:36:09 -0700 (PDT)
Subject: Re: [PATCH v3] memory: Have 'info mtree' remove duplicated Address
 Space information
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210823085429.597873-1-philmd@redhat.com>
 <8743192d-225d-c091-ab53-c747daa86f46@redhat.com>
 <CAFEAcA8ok3RL41upiYt3mUeuFc8Nr_HPsQ7h4HvEPM9VH3jmiw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <499a2d67-9234-30ec-2645-4e0f77dc336b@redhat.com>
Date: Mon, 23 Aug 2021 11:35:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ok3RL41upiYt3mUeuFc8Nr_HPsQ7h4HvEPM9VH3jmiw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.21 11:28, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 10:20, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 23.08.21 10:54, Philippe Mathieu-Daudé wrote:
>>> +static void mtree_print_as(gpointer key, gpointer value, gpointer user_data)
>>> +{
>>> +    MemoryRegion *mr = key;
>>> +    GSList *as_same_root_mr_list = value;
>>> +    struct AddressSpaceInfo *asi = user_data;
>>
>> Reverse Christmas tree?
> 
> This has never been part of the QEMU style guidelines
> and I would oppose our adding it. It would gain us very little,
> the codebase doesn't consistently follow that rule today so
> it wouldn't be preserving an existing consistency of style,
> and it would be yet another weird stylistic issue that trips
> people up and requires patch repins.

Ah right, it used very inconsistently in the QEMU codebase and even in 
this file (I spotted it's the case in the entry of mtree_info() and 
wondered if it's the case for this file -- turns out it's absolutely not).

-- 
Thanks,

David / dhildenb


