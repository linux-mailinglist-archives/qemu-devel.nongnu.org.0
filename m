Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B782ED6AA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:23:29 +0100 (CET)
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZwW-000335-Ez
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxZvO-0002TB-QR
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:22:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxZvK-0003gw-ET
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610043732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NaPM68rwqSs0WmjU8iTFofmmoUGDz1Y0hshD323O11Q=;
 b=EysNLF8sKT+zA7Gi2/dM8vrplBneQPcnl+WCswfpvjWulW0E9xKw2cFBeQiM2JtWLU6TSx
 06QXsdvR8xTlfvyEwbGwhGOEY1UapkDumzKxl1+fWOb4gxy1vo9eBBH68qRUDEbM/mV5/v
 NU5bAtvU1XTH19cDv3gpiLjIz8wrqLc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-jj-NVA6eOQueVyePmPxmXg-1; Thu, 07 Jan 2021 13:22:09 -0500
X-MC-Unique: jj-NVA6eOQueVyePmPxmXg-1
Received: by mail-ej1-f71.google.com with SMTP id gu19so2716746ejb.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 10:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NaPM68rwqSs0WmjU8iTFofmmoUGDz1Y0hshD323O11Q=;
 b=UHS1oIJ6CeVEmIivPRVEV4y6HeoIlpu/JGbXDLYHQzvtSVJd6WWeZoSDDp4qr8z5re
 OUL9EHP6IWZNPKnDPWyQnypB+DfAsNyQJJHK3jOVytXxYLHsWGsbTooj5sHshPP++xu5
 nY271ChAi0sZ+BBTjLTU64TQekEGmfhYzE8LEyfhePnTb7ksSo/efaVOw9aZbWKhyKMH
 r6PvK4myKSM8T97cEXqg1tSZbmPqZornM5YQUApAfFc3UfZasWPSIX2o4oOpq+9ZmUaP
 DWBCIrsTjF4TfG4xFlkbX0/IBjmiLMM2cMtFLvaFW95E0LnOa/86C2Q5Ag3IOh3L1CE+
 pC8A==
X-Gm-Message-State: AOAM530cmqPC17zNewhbF13R/ojEMk/HDYuLC1FDxVew8zVa4+vMDP+I
 7ruVeihCYVjQQ9D6zDfPmDmWd6EG2HzdVrhVD3aRQtTAmz7SRA02sFRXFh1REw3jf6Vgpv1br/F
 n3RITu0aovBkr6Ms=
X-Received: by 2002:a17:906:76d8:: with SMTP id
 q24mr57061ejn.306.1610043728302; 
 Thu, 07 Jan 2021 10:22:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB1dxPS+kUxQ6+urVfYR9MU5EtLZ4Ahsz1y3ixyxVL1SGmGhp71xvdu0V35SDcytuKKgIuXg==
X-Received: by 2002:a17:906:76d8:: with SMTP id
 q24mr57042ejn.306.1610043728137; 
 Thu, 07 Jan 2021 10:22:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k2sm2688932ejp.6.2021.01.07.10.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 10:22:07 -0800 (PST)
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
 <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
 <X/cvK5Xkh6+1Qn1K@SPB-NB-133.local>
 <86bebbbf-ff0f-263d-96a2-4e6df9f85776@redhat.com>
 <X/dQb7xj/RYiT00R@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <74d3e1a4-3f0e-f3bb-6079-03043530bfa5@redhat.com>
Date: Thu, 7 Jan 2021 19:22:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/dQb7xj/RYiT00R@SPB-NB-133.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/21 19:18, Roman Bolshakov wrote:
> 
>> The real issue is that Meson's implementation of link_whole for
>> library-in-library makes sense for one use case (convenience library that is
>> linked into another convenience library) but not for another (grouping code
>> for subsystems).  I cannot blame them for this because link_with is a more
>> common case for the latter; OTOH QEMU is using link_whole a lot in order to
>> support the *_init() construct.
>>
>> I really think the correct fix is for Meson to use objects instead of
>> archives for link_whole, similar to how QEMU Makefiles used to do it. This
>> would also remove the need for the special .fa suffix, so it would be an
>> improvement all around.
>>
> Does it mean that we need a kind of object target in meson? Do you think
> if this interface would work?
> 
> crypto_objs = object_library(..., dependencies: public_deps + [aninternaldep])
> crypto = declare_dependency(link_with: crypto_objs, dependencies: public_deps)

No I think that Meson should simply explode link_whole libraries to 
their constituent objects.  This way duplicates are avoided.

Paolo


