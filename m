Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881F1533C3C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:07:08 +0200 (CEST)
Received: from localhost ([::1]:50466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntpmp-00071g-48
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpfz-0004hA-JW
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpfw-0000it-Br
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653479978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nxb4fSAIarMacD14/9tF8pNsk7gaRzrxr62i2CR0joc=;
 b=a5yBfIgJt826hnMOZLktZ+0CuYhGBQ8nCa8UrbFBLYjNUreF5YGOW3Oejy7skZjrMdvQix
 cJj8DcRntdXCcx26SQ1Yde943FR0aGySm0TLASCZYaAlM5yotVyCRQW5Yto/fjMcrdbBGJ
 965+jxIzL1A7lFdS3DWvCixpDD8DVbE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-Dn5AN6BPMr2uIkZhtCUjbA-1; Wed, 25 May 2022 07:59:37 -0400
X-MC-Unique: Dn5AN6BPMr2uIkZhtCUjbA-1
Received: by mail-ed1-f72.google.com with SMTP id
 s9-20020aa7c549000000b0042ab6ab62f0so14654840edr.14
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 04:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nxb4fSAIarMacD14/9tF8pNsk7gaRzrxr62i2CR0joc=;
 b=QCvK95agw72lTGoYSk2TBQFyLGP7D57+ylVXPM+6seVIMVjrKcyLLr4WzYT0kjHSZM
 J9oDRjHNfSkMR51M3yCQnMx8agzWPL5aoCaPaUlAL8TY2Zd4tCiJWstO63LYcu2S5iw8
 rQWq/29XQwD34dwXLABdrqhe23c/+nklFJqG7r1M6czWPqUnWr17xxC0G6J6Xbd8+ley
 gGxysDI2OLWXjWSE3PZbIIab9sN17CD0FM11gaKBtYVFoclHNP3o8N3VDDWLKCG9BpJM
 takMnBWmVSeNcf40H5930r/+mg2x34/Vy568BICQdJq25YjGnB6O6WbrezlwjFMr98qR
 e8jg==
X-Gm-Message-State: AOAM530un/7K8ZaLuWocl8s2NsQeLErXSuVCRz4sRzhFS+8bMqskT72r
 kXJVzwdOQ5si1a+N4YjRJ5UTjVzCEx/C0qH761utbKPtPaT4BUHNdNy87r/u6nplaMf2/qPjd0K
 6KlSXo75c/cr/wqo=
X-Received: by 2002:a05:6402:11cb:b0:42b:6315:7cde with SMTP id
 j11-20020a05640211cb00b0042b63157cdemr16730335edw.264.1653479975963; 
 Wed, 25 May 2022 04:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHr8ZH5o8nI1Sm71dVAvrlMg7EzczB98HgEjR8UX8XdtpwmyWBQ7Fx79Vne/ul9pOhhuEteA==
X-Received: by 2002:a05:6402:11cb:b0:42b:6315:7cde with SMTP id
 j11-20020a05640211cb00b0042b63157cdemr16730321edw.264.1653479975779; 
 Wed, 25 May 2022 04:59:35 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 zl20-20020a170906991400b006feb479fcb4sm5333798ejb.44.2022.05.25.04.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 04:59:35 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v3 0/5] i386: Enable newly introduced KVM Hyper-V
 enlightenments
In-Reply-To: <87pml02qau.fsf@redhat.com>
References: <20220429075451.292638-1-pbonzini@redhat.com>
 <87pml02qau.fsf@redhat.com>
Date: Wed, 25 May 2022 13:59:34 +0200
Message-ID: <875yltstzt.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>>> This series enables four new KVM Hyper-V enlightenmtes [...]
>>>
>>> docs/hyperv.txt                | 34 ++++++++++++++++++++++
>>
>> Queued, thanks.  
>
> Thanks!
>

It seems these patches didn't make it upstream yet but there's a
(small) conflict with

commit 73d24074078a2cefb5305047e3bf50b73daa3f98
Author: Jon Doron <arilou@gmail.com>
Date:   Wed Feb 16 12:24:59 2022 +0200

    hyperv: Add support to process syndbg commands

which did.

>> Would you please convert hyperv.txt to rST in docs/system/i386?
>
> Sure, it's on my TODO list.

I've sent it out some time ago:
https://lore.kernel.org/qemu-devel/20220503144906.3618426-1-vkuznets@redhat.com/

but it also conflicts with 73d24074078a now because of 'hv-syndbg'. I'm
going to send out 'v4' including the conversion to rst to (hopefully)
facilitate acceptance.

-- 
Vitaly


