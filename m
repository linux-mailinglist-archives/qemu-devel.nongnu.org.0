Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945343086B3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 08:52:58 +0100 (CET)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5OaP-0004e3-7g
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 02:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5OXc-0003kJ-1d
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 02:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5OXZ-0000Xb-JQ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 02:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611906600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yyT7ljPAJOw7efUdqwpwE7JHJhtQxFtsvtnJrgCkJc=;
 b=NgkrqmsibO5AdQZ1HkaNs7EMgaiv2sAN8ollieHiUeb/XaMGfAkl4bpSqRVtHN7wAj7mJ0
 dMuf6EUE6yC2Ib3ZiATlDEX6ZiMFt98LrWVCMJedi/FFqY5y4SfqZquYAPmyu53ZITsMxz
 7EgAyFaNQhqlFh9/6kcxepoF/OtahLA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-JAfU95BfPfm2_9Skp516iA-1; Fri, 29 Jan 2021 02:49:58 -0500
X-MC-Unique: JAfU95BfPfm2_9Skp516iA-1
Received: by mail-wr1-f71.google.com with SMTP id l13so4592071wrq.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 23:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1yyT7ljPAJOw7efUdqwpwE7JHJhtQxFtsvtnJrgCkJc=;
 b=g6xqysgy6nyE+XAUtJEsg305Kr8Z/wBY51JMiljyJIlSB8SvbhGwLNhN0Cn+SyGU1x
 Pgau6n0E0IqLAd8+Y/nuvk+Tvks69BWOAKIhdCtBI71T64sTp54YKIvEN2YCYwe9Aa/Q
 Ss3LEVfknYtp7iOTN58ce+eHxO+DsEQUS6w5sx0qJmntWKxg0luHl6o051Qt4/wZXYdB
 Wy1DfxP367NycC+6922HItX0cDwb0WjIHrw+bH5jLIRdqp46OzaocHav5PpTxfF8Annv
 1Y6zr9yKtRSmhNpK0D7qRD3AmcbELbUX77p6w1eeHA3xc+jnPQQliS1STmJ3B8W+uIwu
 0x8A==
X-Gm-Message-State: AOAM533dpmDCPb9hat+ntE1tGzRczogPcUtEnQo0nzlTD4qW+3f7z4t3
 3/XF+yDbHGDhF2a+bfFKOJBDfS3QWhWbvn/Is2rnTguowmncOGUlskGV2QRYyUDviKs8HsYEGa6
 9e3kPxE4k4eQcEf8=
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr2560621wml.110.1611906597496; 
 Thu, 28 Jan 2021 23:49:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDFGpbezKiTrCMsmxMYQCYiSK9dl43X47/SK9aR3Jb2/k0ygfkskH+fEoXwF8N0TUMDIzrbA==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr2560597wml.110.1611906597264; 
 Thu, 28 Jan 2021 23:49:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d17sm4591500wma.2.2021.01.28.23.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 23:49:56 -0800 (PST)
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
 <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
 <20210128200223.GJ2951@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d6825e67-3533-ab81-abdb-16c2ab71cfe7@redhat.com>
Date: Fri, 29 Jan 2021 08:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128200223.GJ2951@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 jiangkunkun@huawei.com, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/21 21:02, Dr. David Alan Gilbert wrote:
> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>> On 11/01/21 08:34, Keqian Zhu wrote:
>>> +static void vfio_listener_log_start(MemoryListener *listener,
>>> +                                    MemoryRegionSection *section,
>>> +                                    int old, int new)
>>> +{
>>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>> +
>>> +    vfio_set_dirty_page_tracking(container, true);
>>> +}
>>
>> This would enable dirty page tracking also just for having a framebuffer
>> (DIRTY_MEMORY_VGA).  Technically it would be correct, but it would also be
>> more heavyweight than expected.
> 
> Wouldn't that only happen on emulated video devices?

Yes, but still it's not impossible to have both an emulated VGA and an 
assigned GPU or vGPU.

>> In order to only cover live migration, you can use the log_global_start and
>> log_global_stop callbacks instead.
>>
>> If you want to use log_start and log_stop, you need to add respectively
>>
>>      if (old != 0) {
>>          return;
>>      }
>>
>> and
>>
>>      if (new != 0) {
>>          return;
>>      }
> 
> Why 0, wouldn't you be checking for DIRTY_LOG_MIGRATION somewhere?

Actually thinking more about it log_start/log_stop are just wrong, 
because they would be called many times, for each MemoryRegionSection.

Paolo


