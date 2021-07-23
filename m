Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918E93D389E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:24:47 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sMI-0006Js-Ma
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6sLD-0005dl-D6
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6sLB-0005PZ-A2
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627035816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2v6BAcZ0RKbl4C4655RZXNYynYNRH0HKxXJSVbj4cE=;
 b=faSUmV2z28MPetIVZZCWXVbPrEr4WJF6G03cprw2xDFAwPs0FEoEG0lGyELJeo902S83X+
 UoHJlnQ6NXILq9223dFKgFtPjtbJMNOl0SUf3hhJHrOwMuU2LknkpbRh9Z0S6YIq6P9DOR
 gqiQ9YrLJJcoTLN22KL5xGH6rStqQBI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-BtnN-M87NCyUmd2tsPL42Q-1; Fri, 23 Jul 2021 06:23:35 -0400
X-MC-Unique: BtnN-M87NCyUmd2tsPL42Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 15-20020a05600c230fb0290218ad9a8d4aso1270784wmo.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 03:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G2v6BAcZ0RKbl4C4655RZXNYynYNRH0HKxXJSVbj4cE=;
 b=sgeH+vAggxEKsn7d16jp2DU2SLQ7T42rRKCIFa1PSrjwykZxK9sgD4Va54SANgFVY5
 gYE6oIIjESl2Vvle9Vl/c3S8jgEh0iHxBxpXd/BszlJ2P2ToGLeI7q4a6tfXbhZcGxgk
 H6vR2tpNGkUibekgA+cPxnknLiJpgjtPCwtF9dS/CsiovfqbkUATK9ZsjLjmkQm1qNXO
 qkJ3f/TSM0eN/ssSHsPHS7Rx/kI3FxitVyoLLmamTMy6htPN/i7Nrk/CwNsxhwOaGkDg
 yjU9e00xvD2MUpmKRsDpY7IDCI0KztzXamXuJHJb3b6zW1tpCfzgDR0qStKwbGI2vIO4
 J58A==
X-Gm-Message-State: AOAM532oZkaX36A/sskLV/DdYgJjUMi5krTVOAN77FtSBqG+l1sMCUEn
 dwK5+HVM5g7p/vU8a2UcbaXCfHzLXRoarqHTrJYfASQ2qxnT1V12wDd6x1ymsffhAzQzlonRNU4
 DuRMM9j/ktOO8Y2++IOIBCYSyYhYnDg3mVNCHgoqQa5sWn3Nkks+8Y+eegOs7+7Ib
X-Received: by 2002:a05:600c:430c:: with SMTP id
 p12mr13704257wme.16.1627035814093; 
 Fri, 23 Jul 2021 03:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUh4PalOFpOvSzxFofaq9xaa43/tbOjCTtY0ljcCFv5MrYT+80b9JgA/2KClbsCuJOKbuLDQ==
X-Received: by 2002:a05:600c:430c:: with SMTP id
 p12mr13704242wme.16.1627035813915; 
 Fri, 23 Jul 2021 03:23:33 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id b16sm32673676wrw.46.2021.07.23.03.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 03:23:33 -0700 (PDT)
Subject: Re: [PATCH 2/3] MAINTAINERS: Add Peter Xu and myself as co-maintainer
 of "Memory API"
To: David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210723100532.27353-1-david@redhat.com>
 <20210723100532.27353-3-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f703ed50-de43-8943-2a07-fb6babf85ae5@redhat.com>
Date: Fri, 23 Jul 2021 12:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723100532.27353-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 12:05 PM, David Hildenbrand wrote:
> Peter and myself volunteered to help out co-maintaining "Memory API"
> with Paolo, so let's update the MAINTAINERS file.

I'm very interested in following changes in this area
(although I'm not assigned to work on it, I have genuine
interest and found some flaws I'd like to fix one day).

Might I be listed as R:?

> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 420c8a48a1..190a90b541 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2452,6 +2452,8 @@ F: tests/tcg/multiarch/gdbstub/
>  
>  Memory API
>  M: Paolo Bonzini <pbonzini@redhat.com>
> +M: Peter Xu <peterx@redhat.com>
> +M: David Hildenbrand <david@redhat.com>
>  S: Supported
>  F: include/exec/ioport.h
>  F: include/exec/memop.h
> 


