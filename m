Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3701241B4CC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:14:51 +0200 (CEST)
Received: from localhost ([::1]:47020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGgr-0002k5-OF
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVGg1-000231-2j
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVGfy-0004An-Hk
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632849233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=he93yaRqjLkNIulv+vJdxMw2h7JDQWkCu8uQeHxd8Dw=;
 b=W+jG9BK0ycxNJoyIXKNCFxW4ACu35KqagwPlVeFA8bjzKt9hG1dJLrJdqE3jdDkeexXCJr
 XXGCFCGfhTC1CzkEUrWKSSbYdjljrxmqNHpGLUXtWYzUyMicVa1RpSoqYyfapqmIcSFDNI
 VsOYIR45jpMFLmnLfjEsEk9PgX1Y8SE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-xaDCqmwrP9KLGLDh-A9mdg-1; Tue, 28 Sep 2021 13:13:51 -0400
X-MC-Unique: xaDCqmwrP9KLGLDh-A9mdg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p25-20020a1c5459000000b0030cac3d9db1so2350792wmi.6
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 10:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=he93yaRqjLkNIulv+vJdxMw2h7JDQWkCu8uQeHxd8Dw=;
 b=2BAj3sOXa/lqYEWKad4y+6CHiJyiPD6K1hNKxDgI4PFtgvzVqGb8lKavndBeI60b+f
 /2/bKsXkwOVVKy2X6hrJUYUbIHj+cScCuQ7qrTLQAJJCKgz349MAI+FfHXqZchWk4iRX
 M0AFIlxZpKFP+pm7S4iQfhCWfUMBgppo/AzuajgGnxvR9b+a1wgpAZ2ddLKM03iaec1P
 dpN/J2Jy5OMHm/2T0Hxo9IFyYMw9JQu3r09tkSZotbwny2m+wkGGy7KWlN1r5N2BRGuu
 10FkF0/B5DBI/lnZkdxsjAhfSrOex93B22BbaYAsYchQN1Cr9SZM5djA7TDsTWx18TC8
 OAsA==
X-Gm-Message-State: AOAM530mPYDyAq9ZmWS9ndzpMMZSJg41RseoiRWBHtxAU+lMVwQH/hKf
 pRGjj5K5lDrUa6BNslNZdigfuIdE/X/AFFe5Ozk63CL2lB+DnDyHfMbF6kd3Lz4viqiUJZG0lrr
 puxx6BMA14eFS13s=
X-Received: by 2002:a5d:568c:: with SMTP id f12mr1426704wrv.79.1632849230320; 
 Tue, 28 Sep 2021 10:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn4F0j3bYq/VFTu0sRNswZ6M4T5Vc+N3LVmsASkgG8AMLrylwEaoyjYC0JhSb0Jl7HXdPf6g==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr1426677wrv.79.1632849230095; 
 Tue, 28 Sep 2021 10:13:50 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aaf.dip0.t-ipconnect.de. [79.242.58.175])
 by smtp.gmail.com with ESMTPSA id j5sm7185960wrw.39.2021.09.28.10.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 10:13:49 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] util/oslib-posix: Forward SIGBUS to MCE handler
 under Linux
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210816094739.21970-1-david@redhat.com>
 <20210816094739.21970-8-david@redhat.com> <YVNKCkH1azn1iMH5@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <000bfa33-40eb-efe8-6277-f8bc44d256d2@redhat.com>
Date: Tue, 28 Sep 2021 19:13:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVNKCkH1azn1iMH5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.09.21 18:59, Daniel P. Berrangé wrote:
> On Mon, Aug 16, 2021 at 11:47:39AM +0200, David Hildenbrand wrote:
>> Temporarily modifying the SIGBUS handler is really nasty, as we might be
>> unlucky and receive an MCE SIGBUS while having our handler registered.
>> Unfortunately, there is no way around messing with SIGBUS when
>> MADV_POPULATE_WRITE is not applicable or not around.
>>
>> Let's forward SIGBUS that don't belong to us to the already registered
>> handler and document the situation.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   softmmu/cpus.c     |  4 ++++
>>   util/oslib-posix.c | 36 +++++++++++++++++++++++++++++++++---
>>   2 files changed, 37 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks Daniel!


-- 
Thanks,

David / dhildenb


