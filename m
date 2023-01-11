Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77B666240
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:45:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFf9n-0005fD-Dv; Wed, 11 Jan 2023 12:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFf9g-0005f0-F4
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:44:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFf9e-0003rS-MD
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673459089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kP7BTcLjPu2zuQdfCbrlqShXu7QWLIE5U4DJ8YE/HM8=;
 b=KandD/oKbNhom+2/1G9xck6EckXqqombUxi6arhKp1ZUfHRWNWXn4l5h/8rseZLVjCu5ls
 zKgPQNGLEpn6NknBx0NX+a5nhuitCfh8k4OWio4c7ww8zlxSFqC0d3x4WDXtEybNzo+9sy
 KYxNp1ejOa//8cN7tc8cKz5Lr3/k7BA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-4mGqY9fWO7ud3TUsjwllLw-1; Wed, 11 Jan 2023 12:44:48 -0500
X-MC-Unique: 4mGqY9fWO7ud3TUsjwllLw-1
Received: by mail-wr1-f71.google.com with SMTP id
 u15-20020adfa18f000000b002b129dc55bfso2948596wru.11
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :content-language:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kP7BTcLjPu2zuQdfCbrlqShXu7QWLIE5U4DJ8YE/HM8=;
 b=UUVdOOvBLqw6U5k1Lc84gPKWn7P6j+8wSeXvcd+QCCWiP+8QpUvFScPHvc9gCOGGWx
 d7eECNcvd5uTNxnWAsvhTW89AsYaYdr9avTxScIjUWVfkel8su6F9ELxpSkGXnO0VtFi
 pLGqVytXcG86GXdvJemK3w1p2kLMlwdRfgMza306SF7IWxb9ZOiElHLsvqnJ8ZEJXKJH
 GCuDaqQI+O6iKE7j2g0/nWIEwlrMooPoosBZLylnSkqbXsEyKwBVpVlPha3x8bm2mujO
 fDV0VW2IYqE+4IhRiHUl1iztxVe7+X+RnXi5gIcJd874gS9BRlNbfMlJ3MG4lxfa9vdw
 W/yQ==
X-Gm-Message-State: AFqh2kqVVyjxIibRDlxXpv8nHmDAgwhDxA8A5by953nJjKQBRrhhtbvp
 njyMFJWNUrk0s3GMd/TEijug+HfxoEOuS0suBFF6eEqAbZraYc0fwjnUph6SN8JtJnAJirRMGk5
 xW2alPSKGL5V6aiA=
X-Received: by 2002:a05:600c:4da0:b0:3d2:3a53:2cd6 with SMTP id
 v32-20020a05600c4da000b003d23a532cd6mr53653820wmp.9.1673459087481; 
 Wed, 11 Jan 2023 09:44:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuo9Pmop64X57jEr3E12qC5B0IjK6XApkNyWjaIPWNWNUv6xJOOFrvFGysS2ysJd8haSSfUrw==
X-Received: by 2002:a05:600c:4da0:b0:3d2:3a53:2cd6 with SMTP id
 v32-20020a05600c4da000b003d23a532cd6mr53653807wmp.9.1673459087197; 
 Wed, 11 Jan 2023 09:44:47 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c228200b003d9e00dfccfsm16319705wmf.8.2023.01.11.09.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 09:44:46 -0800 (PST)
Message-ID: <1711a861-c3a5-0851-347f-0106ade37976@redhat.com>
Date: Wed, 11 Jan 2023 18:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com>
 <Y7cFplyGc4hIrYZW@x1n> <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com>
 <Y7xw4RqLQUFWZyfI@x1n> <460b6ea0-67a6-891f-f8fb-a5f23e9985c4@redhat.com>
 <c6a66296-94a7-e1ef-e0c1-098071f961d2@redhat.com> <Y73Er/n86CgQTMYu@x1n>
 <fbde8341-660b-0ed1-4f74-0afe565d5be5@redhat.com> <Y77lb+tUxWGKuQbo@x1n>
 <6c017410-cdb6-6a7c-ab02-a8412e37ecba@redhat.com> <Y77xsBnqW2per5sE@x1n>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
In-Reply-To: <Y77xsBnqW2per5sE@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

>>>
>>> Not against it if you want to keep exploring, but if so please avoid using
>>> the priority field, also I'd hope the early vmsd will be saved within
>>> qemu_savevm_state_setup() so maybe it can be another alternative to
>>> save_setup().
>>>
>>> Maybe it's still easier we keep going with the save_setup() and the shim
>>> functions above, if it works for you.
>>
>> I'll happy to go the path you suggested if we can make it work. I'd be happy
>> to have something "reasonable" for the virtio-mem device in the
>> analyze-migration.py output. But I could live with just nothing useful for
>> the device itself -- as long as at least the other devices still show up.
> 
> So, let's see whether we can go back to the load_state() approach..
> 
> static const SaveVMHandlers vmstate_virtio_mem_device_early_ops = {
>        .save_setup = virtio_mem_save_setup_early,
>        .save_state = virtio_mem_save_state_early,
>        .load_state = virtio_mem_load_state_early,
> };
> 
> vfio handled it using a single header flag for either save_setup() or
> save_state(), then load_state() identifies it:
> 
>      data = qemu_get_be64(f);
>      ...
>          switch (data) {
>          case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
>          ...
>          case VFIO_MIG_FLAG_DEV_SETUP_STATE:
>          ...
> 
> Maybe play the same trick here?  The flag needs to be hard coded but at
> least not the vmsd.  Based on previous experience, I could have missed
> something else, though. :)

I could also remember "internally" if load_state() was already called 
throughout the migartion I think.

But, IIUC, it will still make analyze-migration.py produce wrong 
results, because of the vmdesc mismatch.

> 
> Or if you like go the other way I'm fine too.

IMHO my approach will be cleaner on the device side but will require 
migration code changes. I'll try getting that as clean as possible for 
now and resend. If there are more ideas on how to get the other approach 
running, I'll be happy to try.

Thanks!

-- 
Thanks,

David / dhildenb


