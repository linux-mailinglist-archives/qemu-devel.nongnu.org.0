Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A2B33DC5B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:17:17 +0100 (CET)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMEFo-0000jD-Kz
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMDZs-0000dX-6w
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:33:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMDZp-0005Gd-Px
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615916031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJMB1pyU5rQhuXEqD7J/QzwSWZ8XR9MfO2SMCODi9qI=;
 b=dfahPHtJtvlUXPoaT5F+cEqGEG0SpuZIHyEH0EUucr6vuIfAds1HbRG35Z632nz6iDf64b
 Df/LELhVJkmdt3sw0ZvplG2EFnkcpR7gZR9xYh+3CmKM495twAPMFKXCGwDUEG1fj3fL6L
 1KByoRDX3WLU91e8w3NPmL/YLgBZHCg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-CPhBNUQEP7OHNYD_JglPlg-1; Tue, 16 Mar 2021 13:33:50 -0400
X-MC-Unique: CPhBNUQEP7OHNYD_JglPlg-1
Received: by mail-wm1-f72.google.com with SMTP id a68so3928057wme.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RJMB1pyU5rQhuXEqD7J/QzwSWZ8XR9MfO2SMCODi9qI=;
 b=mWFaBM562EF+/Utwu9Zj+3dLCJt0k/VlZLdIimeEtXSASxA6Hyxtg2n9O+FwoyIXYX
 rwlUF0aldrmL76qGjvd1cmQeS5cP8H8MpxcmCLQu6XEd34QGFrjL+3J/t7y6G0kSjPDn
 +xY7QW7gRiyLJpL3v1Z0jw5kMj3wYaIppH8c0ROX+igdUA/PhVWCcaxDH6d0HNI3mz4F
 qNK/UVM6D6OzDWgBiOVWSjTVXBpNtuVPVBB1aDX28+Ocv+1J7BNfEgnULsOJQ8XJdR0t
 WVYrjgqJLjc83+ArLeew/3OBhZZM/YmKmQfk1BoR0eeuI/LQfrgYbsBNnDv9RladZWSy
 niZQ==
X-Gm-Message-State: AOAM531LEqfrEM616I9z4IrgdTaXKD7n4tIcyywEKrBX73SLigBm0LLQ
 KucpIxWkwup12wvjN+q0Rm4taU+JgLFuk0q7CT2+ZPzIq2A39IwxQwi60cnKVGKMVY/l38h4nZu
 F9wa5PYamJL38/0A=
X-Received: by 2002:adf:e60e:: with SMTP id p14mr101696wrm.221.1615916029241; 
 Tue, 16 Mar 2021 10:33:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfe54IdunA923fJHp4RdFrHzBJcPDI68xkw+26ftwtPmLl5o++swY2f8A9NmCDRGXs3428Lg==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr101680wrm.221.1615916029029; 
 Tue, 16 Mar 2021 10:33:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x11sm109178wmi.3.2021.03.16.10.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 10:33:48 -0700 (PDT)
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
To: Igor Mammedov <imammedo@redhat.com>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com> <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316015503.GA1008366@private.email.ne.jp>
 <20210316131304.220a53b9@redhat.com>
 <9e2e1d83-29c1-053a-fd43-187f6f824b39@redhat.com>
 <20210316141044.311688bb@redhat.com> <20210316174914.50efc26b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6cd8d02b-aa48-5fa9-a1fb-bc3fea43b1e2@redhat.com>
Date: Tue, 16 Mar 2021 18:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316174914.50efc26b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org,
 Isaku Yamahata <isaku.yamahata@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/21 17:49, Igor Mammedov wrote:
>                         | smm=on     | smm=off    |
> --------------------------------------------------
> QEMU6.0 pc-i440fx-5.2  |    pass    | pass       |
> defaut smm-compat=on   |            |            |
> --------------------------------------------------
> QEMU6.0 pc-i440fx-6.0  |    pass    | fail       |
> defaut smm-compat=off  |            |            |
> -------------------------------------------------|
> 
> so it will break booting Windows on accelerators that do not support smm
> by default starting from pc-i440fx-6.0 machine type.
> 
> It asserts in: 0xa5_FAILED_ACPI_TRANSITION_ACPI!ACPIEnableEnterACPIMode

Since smm is part of the guest ABI, can we just set use "!smm || 
smm-compat" whenever we use smm-compat right now?

Paolo


