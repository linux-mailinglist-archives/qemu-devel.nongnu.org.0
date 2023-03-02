Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447056A84F7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:13:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkbJ-0001PG-0H; Thu, 02 Mar 2023 10:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXkbG-0001P5-Kz
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:12:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXkbE-0005CY-DZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677769923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPbiP0o5ykeHcPcel1mokpnM4BKWwaeHLxfbcZXRQyc=;
 b=HLIZvEZWwmgs3lvD2CkRHMGpjaSofm2hIgsDuuJE7xs3bUup9nVdLry4vZ225BCJRBjToI
 kMIJskv4kDOrh8FAKlC41l+cf7KqIOMfwlFRgMkqhL+csdJlaB9xZQT2DvbFODGJyFETWq
 EWAfN7LU1TICtW3SporwAQNSD/LJaVY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-IWP2XQyaNEWyXHdEA8BkeA-1; Thu, 02 Mar 2023 10:12:00 -0500
X-MC-Unique: IWP2XQyaNEWyXHdEA8BkeA-1
Received: by mail-wm1-f70.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so5880541wmj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 07:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GPbiP0o5ykeHcPcel1mokpnM4BKWwaeHLxfbcZXRQyc=;
 b=aJkV3BpiImoK7XO5AHVr2hrGfXFfhLW7tcp+GHkU4fuN5vvLK+13YM7BQAzN3awWwD
 gX+wbeVOLg4RlFU8iICxVYUziwkiFkM/K63PmGDG70Byzuw2EKIYtREeY29RYjoza2cB
 w24MFiLifz/YQly+AIp6Xu8hvfi4cESGBxqHFCjoy6NG/anYpQPS4ZGfAdGvKsvTaq9i
 nvQGtCB9WpxIe9t7xqBZS4GyNpf7/vrqDQTKVlRti4a35ARtm15oY9q/0uUeXcLkFiRd
 fiWJyzboHM1cGE7qLZqR50uxndszHhHwkNuhpyC8Yp685el1OhTf/y2k9VUFhjtlP2lC
 YN2Q==
X-Gm-Message-State: AO0yUKX58NeNPothw7RhxmLgX2YPZkIyq0kbXr6hUzA4SuPhCxZmx+/M
 KDS6hjdh7DYFtUCzGJIPtBMWaKmb3Z5bnScXqSseOZ4AC616Wlhm4HoXOzO8k9J51pDitmsTxJJ
 zX9RK2QKDgWOpc6A=
X-Received: by 2002:a05:600c:1c9b:b0:3df:e6bb:768 with SMTP id
 k27-20020a05600c1c9b00b003dfe6bb0768mr8179244wms.24.1677769918189; 
 Thu, 02 Mar 2023 07:11:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/7/2yGppRiwtbbElkLM6z7hCDOzfygivRotQIX5BbIubE8SGNK6XthDAY1EImaFmDfVVEcbA==
X-Received: by 2002:a05:600c:1c9b:b0:3df:e6bb:768 with SMTP id
 k27-20020a05600c1c9b00b003dfe6bb0768mr8179225wms.24.1677769917844; 
 Thu, 02 Mar 2023 07:11:57 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:4f00:87ba:e9e9:3821:677b?
 (p200300cbc70e4f0087bae9e93821677b.dip0.t-ipconnect.de.
 [2003:cb:c70e:4f00:87ba:e9e9:3821:677b])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c310d00b003eaf666cbe0sm3487273wmo.27.2023.03.02.07.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 07:11:57 -0800 (PST)
Message-ID: <4f130497-1200-8c42-7d48-cadf54f3f6a4@redhat.com>
Date: Thu, 2 Mar 2023 16:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230225163141.1209368-1-peterx@redhat.com>
 <6c75e2e2-5ba9-bc52-2c6c-a0bfb5f5b56f@redhat.com> <ZAC2ccoQpFLa07ZK@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
In-Reply-To: <ZAC2ccoQpFLa07ZK@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 02.03.23 15:45, Peter Xu wrote:
> On Thu, Mar 02, 2023 at 10:46:56AM +0100, David Hildenbrand wrote:
>> On 25.02.23 17:31, Peter Xu wrote:
>>> [not for merging, but for discussion; this is something I found when
>>>    looking at another issue on Chuang's optimization for migration downtime]
>>>
>>> Summary: we tried to access memory_listeners, address_spaces, etc. in RCU
>>> way.  However we didn't implement them with RCU-safety. This patchset is
>>> trying to do that; at least making it closer.
>>>
>>> NOTE!  It's doing it wrongly for now, so please feel free to see this as a
>>> thread to start discussing this problem, as in subject.
>>>
>>> The core problem here is how to make sure memory listeners will be freed in
>>> RCU ways, per when unlinking them from the global memory_listeners list.
>>
>> Can you elaborate why we would want to do that? Is there a real reason we
>> cannot hold the BQL when unregistering a listener?
> 
> Yes afaict we must hold BQL when unregister any listener for now.  I added
> an explicit assert in patch 1 for that.
> 

Oh, good!

> We want to do that because potentially we have RCU readers accessing these
> two lists, so here taking BQL only is not enough.  We need to release the
> objects after all users are gone.
> 
> We already do that for address spaces, but afaict the listener part was
> overlooked.  The challenge here is how to achieve the same for listeners.

Ouch, ok thanks.

> 
>>
>> Or could we use any other, more fine-grained, lock to protect the memory
>> listeners?
>>
>> Naive me would think that any interactions between someone updating the
>> memory listeners, and a listener getting removed, would require some careful
>> synchronization (to not rip a notifier out while someone else notifies --
>> what is the still registered notifier supposed to do with notifications
>> while it is already going away?), instead of doing it via RCU.
>>
>> I'm all for using RCU if it improves performance and keeps things simple. If
>> RCU is neither required for performance reason and overcomplicates the
>> implementation, maybe using locking is the better choice.
> 
> For ASes, one major user RCU is memory_region_find_rcu().
> 
> For listeners, the only path that doesn't take BQL (afaict) is
> memory_region_clear_dirty_bitmap().  Maybe you'll have some points here on
> the side effect of taking it because it's in either virtio-mem or balloon
> path for page hinting iirc.

So, we could end up in memory_region_clear_dirty_bitmap() when migration 
starts (clearing initial bitmap), while migration is happening 
(migrating one page), and during virtio-balloon qemu_guest_free_page_hint.

There should be no direct call from virtio-mem (anymore), only from 
virtio-balloon. I don't think taking the BQL is particularly problematic 
here.

I guess the main concern here would be overhead from gabbing/releasing 
the BQL very often, and blocking the BQL while we're eventually in the 
kernel, clearing bitmaps, correct?


Indeed, memory listener registration/removal doesn't happen very 
frequently, while traversing the listeners can happen very often in 
migration code IIUC.


-- 
Thanks,

David / dhildenb


