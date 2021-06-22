Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3410A3B0162
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:30:07 +0200 (CEST)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdfS-0007jq-7w
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvdWW-0007w6-V7
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvdWU-00085M-D9
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624357249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vG+8UAc2CIiieMIoDsFj3lXhoxReDatXuXH4mUo02Y=;
 b=eRtp/vPHJqpAW8rspvc0I4aRWpKIFVLMHEtMiwL8dU87t6hBfXcna7y5ktdwot4nj9t5pH
 E8JZOTg6aDRUNrtB6m6L2lrLyWRZVeeAwedDNyz8Z3MFC6tlxq+MVUiXw+TJDvAdgrdny7
 /nE/IoJUbNo3cmtvEhdMPdWcMrR3sPk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-lXFZCwxfMiCpu39jSFe77A-1; Tue, 22 Jun 2021 06:20:48 -0400
X-MC-Unique: lXFZCwxfMiCpu39jSFe77A-1
Received: by mail-wm1-f71.google.com with SMTP id
 m6-20020a7bce060000b02901d2a0c361bfso561120wmc.4
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 03:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4vG+8UAc2CIiieMIoDsFj3lXhoxReDatXuXH4mUo02Y=;
 b=uETeBtGlKfIXq4NhQkI8F1Cqt5wcXztPsIS6xoAn0tkQzrPwOCqsE403zFc7ks0CRi
 juTam+qpwOyC54X4Pugr2nk5c71m9X1QXQ+yMK3C62wyrksvBH1zrY0gSgjRRHtySHhB
 g/Ku+rCfaS+siRxVGNPLu2uVTsv9m2haIVnorDeDChVQbDhOPS61BF89yzYe1E8Zvf/m
 6BqhwwPELrC5xRpBftFu0XlwuwaqYeS33Jo6h1ZcUIkEDUECODzxrEfbr7kblmGM76Xl
 1ZxbPbeZrJq3Oum8/BSHaYrGWcZOqDQz2r3ovMy1FHPxQ/NnVyFAfMwygkQbXVNb78Xf
 JZuA==
X-Gm-Message-State: AOAM533pAPqjWLBlz9EazkHaAXBx8fN1hK4CzqoRZY99dyHtH/o4PyKI
 W+6qx2Qpok8MKZHhrNedz42rCNsScWiWSyedQ+IzvIsKRYgJOQ8e16A2L0vyon96DbXXZQo0zUd
 L83VZvghZ9P9GmVI=
X-Received: by 2002:a1c:c911:: with SMTP id f17mr3483083wmb.60.1624357247146; 
 Tue, 22 Jun 2021 03:20:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqJ8WOXA5s+VDEmvCBb7mDOKfUDwBcz8gRzyd0rXQv7HZag48tZ//qYeXFigVXLbQBMFw9dA==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr3483057wmb.60.1624357246845; 
 Tue, 22 Jun 2021 03:20:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k2sm20430508wrw.93.2021.06.22.03.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 03:20:46 -0700 (PDT)
Subject: Re: [PATCH RFC] meson: add option to use zstd for qcow2 compression
 by default
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210617195128.66675-1-vsementsov@virtuozzo.com>
 <8d3711a0-2716-3bc5-3710-990042e16c0b@redhat.com>
 <YNC3b3S8tLM47PJn@redhat.com>
 <dca75636-dc66-26e6-a3cb-a073cb8d6f0a@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f7fba787-e9a6-d2b4-d81b-ffa920ca1103@redhat.com>
Date: Tue, 22 Jun 2021 12:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <dca75636-dc66-26e6-a3cb-a073cb8d6f0a@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: den@openvz.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/06/21 12:16, Vladimir Sementsov-Ogievskiy wrote:
>>
>> Yes, this is more extensible.
> 
> Looks good, I'll try. I'm just not familiar with it and followed the 
> pattern of zstd option.

You can look at -Dmalloc for an example.

Paolo


