Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EED3D263F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:53:19 +0200 (CEST)
Received: from localhost ([::1]:45770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6a4c-00032e-GD
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6a3H-0001HP-27
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:51:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6a3E-0007Kq-Sm
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626965512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kudo3N347FJLfmw4INBRuC/7TrHexBfiLujlvuB7F8=;
 b=WCpjF+O+YjxC7cI7nj8QUdd3F+npyg7ZyUbAwow6FtQIZZdkX2TPSy0npNDIEy7ehzT9Ee
 4duDwequllSLsXwiNR02dwd5ZOCWjp8+WwOF4f1lzerV1n+9r9Rj1lEmRWxWUN6NrS+w12
 qs3C15qHRElQrjDDgP0EzIRm3NL2o+E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-k3nMgccdMW2n8jFwJ7jjOQ-1; Thu, 22 Jul 2021 10:51:51 -0400
X-MC-Unique: k3nMgccdMW2n8jFwJ7jjOQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z5-20020a7bc7c50000b02902152e9caa1dso785473wmk.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 07:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7kudo3N347FJLfmw4INBRuC/7TrHexBfiLujlvuB7F8=;
 b=SKsYRpUIvxTUMoZZnkMQnjqpkJYFQXEtS16tLQVk2/5CK8gr51P5189kOL3dlfEE7v
 fS9IScuoyfnG4n4j38jfJW8JTLgW3r7ZrJH9lrBIlsV8J7gZpBuc44Dm9OudP66bScMK
 5rsfGJaokEkrz9GyYDNG/Uhm6/dTJJoGSY5LE+Apr9t4R7N2anntBZKdveClQQgESACk
 ii5dRhFyrTZAJoCZ2TNHw4Fx9/vp/d0Bi8h83bL0C+36BqvgBRWYrigRzBIu7aUwaJTf
 UAhD+GvDxMfurj9LF4rAA5e+71VMaoAtLX22nwwHL+hnFA+6mRvGhwGO3reUTVnaVGlr
 nKGg==
X-Gm-Message-State: AOAM531hQDGHFcYKAE4WJNL4aB2Y9kZpgk+8OPMMoSltA6IVPq5QZZnQ
 SMIltE86apLUD/ZlSYfChPQGaMZs48FdOKE5sajDBiHvbVQxCEaSb1fNV8tBPcXjLFlpU1y9Vyd
 Cu+414rFAsKo8QJ8=
X-Received: by 2002:a5d:644c:: with SMTP id d12mr309571wrw.129.1626965509911; 
 Thu, 22 Jul 2021 07:51:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4fp2nMWu6xZQgBmt3niAX/VPJnfw6uMg8QpQ5ykt4dVqWyV25tIe12s66hFet+54w448gXw==
X-Received: by 2002:a5d:644c:: with SMTP id d12mr309556wrw.129.1626965509704; 
 Thu, 22 Jul 2021 07:51:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6970.dip0.t-ipconnect.de. [91.12.105.112])
 by smtp.gmail.com with ESMTPSA id f2sm30024493wrq.69.2021.07.22.07.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 07:51:49 -0700 (PDT)
Subject: Re: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
To: Peter Xu <peterx@redhat.com>, "Wang, Wei W" <wei.w.wang@intel.com>
References: <20210722083055.23352-1-wei.w.wang@intel.com>
 <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
 <b39f279ef6634325ab2be8d903e41001@intel.com> <YPmF1BAHA059yYln@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <ab4a5e1e-ed7f-5b4b-88e6-d4c56ed5a256@redhat.com>
Date: Thu, 22 Jul 2021 16:51:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPmF1BAHA059yYln@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.07.21 16:51, Peter Xu wrote:
> On Thu, Jul 22, 2021 at 09:57:13AM +0000, Wang, Wei W wrote:
>> On Thursday, July 22, 2021 5:48 PM, David Hildenbrand wrote:
>>> On 22.07.21 10:30, Wei Wang wrote:
>>>> When skipping free pages to send, their corresponding dirty bits in
>>>> the memory region dirty bitmap need to be cleared. Otherwise the
>>>> skipped pages will be sent in the next round after the migration
>>>> thread syncs dirty bits from the memory region dirty bitmap.
>>>>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Peter Xu <peterx@redhat.com>
>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>> Reported-by: David Hildenbrand <david@redhat.com>
>>>> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
>>>> ---
>>>>    migration/ram.c | 74
>>> +++++++++++++++++++++++++++++++++++++------------
>>>>    1 file changed, 56 insertions(+), 18 deletions(-)
>>>>
>>>
>>> LGTM, thanks
>>>
>>> Reviewed-by: David Hildenbrand <david@redhat.com>
>>>
>>
>> Thanks. Please remember to have a regression test together with Peterx's that patch when you get a chance.
> 
> I can continue to try that; but it's slightly low priority to me so it could be
> a bit delayed.  If either of you could help that would be great, as I still
> don't know last time why I didn't use free-page-hint right (note: I definitely
> checked lsmod for sure; so it's there).  So I'll need to figure that out first.

I'll give it a churn.


-- 
Thanks,

David / dhildenb


