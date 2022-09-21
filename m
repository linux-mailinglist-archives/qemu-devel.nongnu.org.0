Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38045C008B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:59:20 +0200 (CEST)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1C2-0006OA-CO
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ob178-0008NQ-DP
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ob176-0004uQ-U5
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663772051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzSIUGoy6i8hN39IS0cxOztgrmmKwSDx0aVy9VwPWz0=;
 b=XJB9d1vmST7PDF/MonqokPpZvXQ+ZX5lWUSpZmZO9tXoySnHUVaFszvwv+xlfpWzhzIDD/
 CiqwkQXbQPfgO9zk7wWFwOkxhtyISgmQfHTmfdXvXOomuWTejfXbA4XEmOD3m8wSYss7is
 uueJYxO/YlHwq9yj1b2bYUCFAzWLT2Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-8HDxqB48P4O-e3lAgMA1eA-1; Wed, 21 Sep 2022 10:54:10 -0400
X-MC-Unique: 8HDxqB48P4O-e3lAgMA1eA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so2705459wmn.2
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 07:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=nzSIUGoy6i8hN39IS0cxOztgrmmKwSDx0aVy9VwPWz0=;
 b=MEjijRcnjlwJl2uUViZjskWZkyRSyMTNHs6mH3p4IGnDxDqhHEoMZIyea6e+xDoE3/
 JFEeW/RetrKU3W+U8xXYfe/1XqjSqc/C2Z3+hjzFe0oBf8LhoOVDEjRs2pUAvaOSbP62
 v5btv4uQy6nKJjUqruNqa6Qzb0JcpibnPdNakrk4m3IEKbeylNmbkyDq8gxVrOjiZdS/
 xojwIKhKxbF0AJA9tJBNWzM+Ltnow+DrgzKna1XNYaF6o3p279iGGpe0+Z5BcKJuT+Xp
 LCOBd8f488zJ8s3NZwUYr8bRQ3FoWLeh4UVFzaN/aY/5yV60GEupw1MiQU045DjDIKHo
 2Iyg==
X-Gm-Message-State: ACrzQf0CM5JrXSjNKANBjchQPAV6AoV3np92YLSya+r8aElnsYrv9UeA
 4sLAE4GY90Bl6JPA4C0QSECdcTnJTTOX5YPWmR/y3tsno7Wrx9GAOAqQafW0nyhbhb4kIKOSZyS
 KjJkMgNr6Z0kD0qQ=
X-Received: by 2002:a05:600c:4ece:b0:3b4:a79c:1333 with SMTP id
 g14-20020a05600c4ece00b003b4a79c1333mr6334621wmq.49.1663772049451; 
 Wed, 21 Sep 2022 07:54:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mOGIx306U23N4fpvqiRNvSbmzVitB9BhoSFqSaRtv55L4pcTAOjROxLULXmdUwWk120CrEw==
X-Received: by 2002:a05:600c:4ece:b0:3b4:a79c:1333 with SMTP id
 g14-20020a05600c4ece00b003b4a79c1333mr6334600wmq.49.1663772049126; 
 Wed, 21 Sep 2022 07:54:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:6900:26b8:85a4:a645:4128?
 (p200300cbc703690026b885a4a6454128.dip0.t-ipconnect.de.
 [2003:cb:c703:6900:26b8:85a4:a645:4128])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056000054a00b00228dbaea941sm2908456wrf.26.2022.09.21.07.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 07:54:08 -0700 (PDT)
Message-ID: <b587ca18-945e-1f1d-519f-7f3f75ce32b6@redhat.com>
Date: Wed, 21 Sep 2022 16:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220721120732.118133-1-david@redhat.com>
 <d17620c7-5d52-c41b-66f2-3055a2dc572a@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <d17620c7-5d52-c41b-66f2-3055a2dc572a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.702, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21.09.22 16:44, Michal Prívozník wrote:
> On 7/21/22 14:07, David Hildenbrand wrote:
>>
> 
> Ping? Is there any plan how to move forward? I have libvirt patches
> ready to consume this and I'd like to prune my old local branches :-)

Heh, I was thinking about this series just today. I was distracted with 
all other kind of stuff.

I'll move forward with this series later this week/early next week.

Thanks!

-- 
Thanks,

David / dhildenb


