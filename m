Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88925447B30
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 08:33:26 +0100 (CET)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjz9g-00082F-TS
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 02:33:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjz7X-0006gb-W1
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:31:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjz7T-0004lX-Jf
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636356663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vy07NpmjE3vqxd14i7vOmnS86GY1iLrrFQhK/J26s10=;
 b=a9y/DQ4/FEvT7jyNV6EE41rNULMzuCoL1TufuUfutFOXAfivJAL34eUIWviOBsceyN4UOC
 5CRVSVlctNJcr+MchIk3SHUhkoOx2hTMl1rX9QKEUNoSd7Na50M/or4qpLpIYV52VYjSjS
 ofzk1dC0ioUN6NDxnEDKSMDW2PoduVk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-967ocxVkMkWNTHSdlR0YvQ-1; Mon, 08 Nov 2021 02:31:02 -0500
X-MC-Unique: 967ocxVkMkWNTHSdlR0YvQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so5370808wms.8
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 23:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vy07NpmjE3vqxd14i7vOmnS86GY1iLrrFQhK/J26s10=;
 b=siZ7CisVd0xHFoJwrpnzOG+cN52289XAwuGsuj2lnw3OzbEMIO1644/+sM6nkxSaAf
 XbrUeAcgK1fdkmOLRPUc9G5lIG2e9NAy3qTht03X3ot74sLE2fvFzvHZYKQIlJ2ABQbp
 N/Ep3pWdO6I/x1J3Fuu5JvPbM7ZOYf+vQJjheQg6i9NOxS1jgYR6reFJ1DPGILrCVATr
 y8jC8yc4Q2YQqBnZhnzSl2PlX4qIIe3iXmZkFKaIyr6raXXsIZ4yXxe2tVrNMBWfgksk
 c9UWjZolnMeV+ovw42IGrbNhSg6/0brWuCSyoulFhmiM1msP1kDkSsRrpESxD+pAtCDe
 Q5oQ==
X-Gm-Message-State: AOAM531hBCKERiivTSr+SYfvFK6aBp+bsOBps02G/uYlVCaxsjPtrWPW
 6kXgpljp2roGRRhMOKwaYQV374tF7pi9pjF5jfo6cxc3vMlJrOlTunxheUpwZ0S/hhUK3pB8xNh
 m2vi+m1kTqHlrrHc=
X-Received: by 2002:a1c:4b07:: with SMTP id y7mr50274204wma.188.1636356661007; 
 Sun, 07 Nov 2021 23:31:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYtuFSrnm1EhdMPbYxLwSI91eZc8WbOM/tHJhxSFiJnglHqUFheWG77BijCEvzX5IShp0RPw==
X-Received: by 2002:a1c:4b07:: with SMTP id y7mr50274180wma.188.1636356660704; 
 Sun, 07 Nov 2021 23:31:00 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u23sm8843144wru.21.2021.11.07.23.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:31:00 -0800 (PST)
Message-ID: <96683e8d-9633-7cb8-98ab-0a8791e1c63e@redhat.com>
Date: Mon, 8 Nov 2021 08:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/1] hw/hyperv/vmbus: Is it maintained?
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
References: <20211106134155.582312-1-philmd@redhat.com>
 <e9c29f4d-d5d5-34aa-8311-7ad1fc05b7d6@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <e9c29f4d-d5d5-34aa-8311-7ad1fc05b7d6@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Roman Kagan <rkagan@virtuozzo.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/21 20:28, Maciej S. Szmigiero wrote:
> On 06.11.2021 14:41, Philippe Mathieu-Daudé wrote:
>> This is the 4th time I send this patch. Is the VMBus infrastructure
>> used / maintained? Should we deprecate & remove?
>>
>>    $ ./scripts/get_maintainer.pl -f hw/hyperv/vmbus.c -f
>> include/hw/hyperv/vmbus.h
>>    get_maintainer.pl: No maintainers found
> 
> There's an email thread at [1] explaining the reasons for having VMBus
> infrastructure last time such question was asked.
> 
> In short: mere presence of a working VMBus is needed for some high-speed
> Windows debugging, also people are working on VMBus host device drivers.

Great. Do you mind adding an entry in MAINTAINERS to
cover these files, so we stop wondering about them?

> Your patch makes sense to me, so for it:
> Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Thank you.

> [1]:
> https://lore.kernel.org/qemu-devel/20201009193919.GF7303@habkost.net/T/#u
> 


