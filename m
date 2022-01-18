Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2334921A8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 09:53:36 +0100 (CET)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kFD-0001tN-Fr
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 03:53:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9kBt-000850-JH
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:50:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9kBi-0000ZZ-N5
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642495796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBeGDoGVjJCxZ6LZ/FrgPWFnbU5C9vkO4eNJ0srcHaw=;
 b=VmABwDU/fpfssnl/G/N++EcauovdsnV9kJV1yZ5/tB2xL7xdOIjqy6QyIuV7s1okXDoXVA
 ML0ZbGSC+vALyo1XXBEJRN4aaJ1naYwBp6nifla52kq9HbAOqtzGZqQEASxkyCMFOmRFMk
 C7P8k320/YN+CaIz0GLzhT7DmlO1CGU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-X6qoMNq0MymvGgddKS9gUA-1; Tue, 18 Jan 2022 03:49:55 -0500
X-MC-Unique: X6qoMNq0MymvGgddKS9gUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d64b1203aso362269wma.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 00:49:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aBeGDoGVjJCxZ6LZ/FrgPWFnbU5C9vkO4eNJ0srcHaw=;
 b=dCrWNpuONXZ5qPzAvfYzqDXWlelQG2LYccvmnXHpGWDVK5kZTi6KzfsqlsSLWseFWO
 SQRZdPJleV+1Lq8ixCvzpmJ7z2CO2Js0w1PY+PRJHLdEF0pkjcux7K2Z8xlkC1lHKV76
 2+SRcsT0zstLK455mWzTOMTmr3QkMJT82pGP/XvA8Iq3Gz/69fYdODM9W7u06QytKcAk
 bUaUxYVWjECy0a7PsDHxJlC6hQr9UL3KSm+HG2eoVmktlX2B8sag0dt3+U0K6fXzrAp+
 aWvLJ0lLuG4xfVht0LzFEqcbLYmAgpuBxL6+3cc5vuZhFFT7BLUufDihfp1HSPKIb6Oh
 go5g==
X-Gm-Message-State: AOAM530jAS28sBwebmPHFe+ZQDCAU0dVsyGpEbfqS2jpITZl8FSS/zf0
 EMcQFRLv/JrXgKKkmoPr7vwhmApV96VIfM0FPKKrqPKwn8IFAgODruB+tG7B8n+U4WrKPxZLtyu
 ds+wrXwttdjEd16Y=
X-Received: by 2002:a7b:c457:: with SMTP id l23mr31042524wmi.57.1642495794125; 
 Tue, 18 Jan 2022 00:49:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEtnjiDgMWYo/zn975BdAwpuFF6U3s+7dzBWbqaUF2OWY9g5FU05dka9WqXnYsqenrqxHtcQ==
X-Received: by 2002:a7b:c457:: with SMTP id l23mr31042499wmi.57.1642495793828; 
 Tue, 18 Jan 2022 00:49:53 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d5sm16273164wrs.61.2022.01.18.00.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 00:49:53 -0800 (PST)
Message-ID: <44b4ce3f-030a-993a-b959-e8e722c7cee4@redhat.com>
Date: Tue, 18 Jan 2022 09:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/i386/pc_piix: Mark the machine types from version 1.4
 to 1.7 as deprecated
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220117191639.278497-1-thuth@redhat.com>
 <YeXNoKzsFeIPSy6E@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YeXNoKzsFeIPSy6E@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/01/2022 21.12, Daniel P. Berrangé wrote:
> On Mon, Jan 17, 2022 at 08:16:39PM +0100, Thomas Huth wrote:
>> The list of machine types grows larger and larger each release ... and
>> it is unlikely that many people still use the very old ones for live
>> migration. QEMU v1.7 has been released more than 8 years ago, so most
>> people should have updated their machines to a newer version in those
>> 8 years at least once. Thus let's mark the very old 1.x machine types
>> as deprecated now.
> 
> What criteria did you use for picking v1.7 as the end point ?

I picked everything starting with a "1." this time ;-)

No, honestly, since we don't have a deprecation policy in place yet, there 
was no real good criteria around this time. For the machine types < 1.3 
there was a bug with migration, so these machine types could not be used for 
reliable migration anymore anyway. But for the newer machine types, we 
likely have to decide by other means indeed.

> I'm fine with the idea of aging out machine types, but I'd like us
> to explain the criteria we use for this, so that we can set clear
> expectations for users. I'm not a fan of adhoc decisions that have
> different impact every time we randomly decide to apply them.
> 
> A simple rule could be time based - eg we could say
> 
>    "we'll keep machine type versions for 5 years or 15 releases."
> 
> one factor is how long our downstream consumers have been keeping
> machines around for.
> 
> In RHEL-9 for example, the oldest machine is "pc-i440fx-rhel7.6.0"
> which IIUC is derived from QEMU 2.12.0. RHEL-9 is likely to rebase
> QEMU quite a few times over the coming years, so that 2.12.0 version
> sets an example baseline for how long machines might need to live for.
> That's 4 years this April, and could potentially be 6-7 years by the
> time RHEL-9 stops rebasing QEMU.

Yeah, 5 years still seemed a little bit short to me, that's one of the 
reasons why I did not add more machine types in my patch here. I think with 
7 or 8 years, we should be on the safe side.

Any other opinions? And if we agree on an amount of years, where should we 
document this? At the top of docs/about/deprecated.rst?

  Thomas


