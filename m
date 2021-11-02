Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715BA4434CA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:47:07 +0100 (CET)
Received: from localhost ([::1]:55472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxsI-0003LE-8w
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mhxoi-0001ZW-Ql
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:43:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mhxoc-00010c-7e
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635874996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgPtfyDypRzcfl2tNV/WHkjCsdS8NVOIkpergCsYrCs=;
 b=DWaUM6/lfN0pe46bDg/OETArbSAGWntkj+m4OXOCQp91UVofg0X/+5X1g4wMNGNnhmzDMg
 /huiu6QlHOtv3m7sjg0Uqwiqw8YemdPdY/V0+eyWg2UnwssmlN1j8joK3VdgAaW8aQ5heC
 u+dGyUcC/D0i4SyeVdXCthxq/KmqY8g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-CUdr2SaxPaiQVyrBhyLJkw-1; Tue, 02 Nov 2021 13:43:14 -0400
X-MC-Unique: CUdr2SaxPaiQVyrBhyLJkw-1
Received: by mail-wm1-f70.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso7296312wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RgPtfyDypRzcfl2tNV/WHkjCsdS8NVOIkpergCsYrCs=;
 b=I0GID2SvvN1uzXdquhoK5FLIGLovIN8gDkSarqprjf9KhEHfZN+LCviYVEQ+Xf0BNM
 FTkFwe3e0w0IcSGgYc4OSO3iFzOByEl9pRH5hma2px2kH62jbUdu8pwTEmhAJBrARB5J
 ZB6TjJCD8iIfR83veDKwzcmhpfxHsYoE023Mfcf45wknuePFI67GeMNC/bOwi3Y1wO31
 Xd2+J60HLdVRR8I9FagUs6BTebmhVaTVDZSmL3T5JFqdO0/uCLS9hksrEqkTbHU/erg/
 AUZGGp/bOgUosTpDhjgZk1HE50KFe+Xk2zAf0f/tuGYyfR5Ckn4nAqP4+J0IEE4QsA2Q
 iw1g==
X-Gm-Message-State: AOAM5300B9uon3wdHIWdxx42jLk2gtOi83Zq66GpCOxoBSXtQr5ZvoD1
 DDoER+WdyopFoH2qet1E2I2m1avoyLG1wm7d8tYOHDlvQGdUctctNH4ALMOtE5U4ddc2OcV2g0r
 eeY/Wlt4T4SPofgg=
X-Received: by 2002:adf:e682:: with SMTP id r2mr17526462wrm.281.1635874993655; 
 Tue, 02 Nov 2021 10:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd5V6Ca5sPugRmNLQZMhhk5285g+kypwLe+5qifrTsXPAtmQ6oFDqyAo7pms1wn7BaFB7ZFg==
X-Received: by 2002:adf:e682:: with SMTP id r2mr17526422wrm.281.1635874993390; 
 Tue, 02 Nov 2021 10:43:13 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.14.190])
 by smtp.gmail.com with ESMTPSA id l7sm3504262wry.86.2021.11.02.10.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 10:43:13 -0700 (PDT)
Message-ID: <38137e90-fa31-85ab-8c25-53b4773e1f72@redhat.com>
Date: Tue, 2 Nov 2021 18:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-3-lvivier@redhat.com>
 <20211102110043-mutt-send-email-mst@kernel.org>
 <5139c0a8-6aa0-48df-f353-84a15ffc4dd1@redhat.com>
 <20211102130811-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211102130811-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/2021 18:08, Michael S. Tsirkin wrote:
> On Tue, Nov 02, 2021 at 06:06:51PM +0100, Laurent Vivier wrote:
>> On 02/11/2021 16:04, Michael S. Tsirkin wrote:
>>> On Wed, Sep 29, 2021 at 04:43:11PM +0200, Laurent Vivier wrote:
>>>> As the guest OS is paused, we will never receive the unplug event
>>>> from the kernel and the migration cannot continue.
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>
>>> Well ... what if user previously did
>>>
>>> pause
>>> start migration
>>> unpause
>>>
>>> we are breaking it now for no good reason.
>>>
>>> Further, how about
>>>
>>> start migration
>>> pause
>>>
>>> are we going to break this too? by failing pause?
>>>
>>>
>>
>> TL;DR: This patch only prevents to migrate a VFIO device as failover allows
>> to start a migration with a VFIO device plugged in.
>>
>> Long Story:
>>
>> * before this patch:
>>
>> - pause and start migration and unpause-> fails if we unpause too late
>> because we migrate a VFIO device, works otherwise
> 
> 
> confused about this one. can you explain pls?
> 

Sorry, I've been confused by another bug: with ACPI unplug, we don't wait the unplug, and 
so if the machine is paused the VFIO is "migrated" and we have an error message on the 
destination side as the card cannot be plugged back.

but with PCIe native hotplug ("-global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off") 
we have:

before this patch:

if we pause and then start the migration, migration hangs until we unpause the VM. But the 
migration can hangs forever if the VM is never unpaused. Normally migration of a paused VM 
should not hang.

after this patch:

if we pause and then start the migration, the migration fails because of the new error.

Remember that the migration of a VM with a VFIO device normally fails, so a user should 
not try to migrate a VM with a VFIO device except if he knows he is using failover, and in 
this case he should know he must not pause the VM.

Thanks,
Laurent


