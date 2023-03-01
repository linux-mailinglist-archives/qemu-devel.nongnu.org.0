Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B2F6A6B10
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:48:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXK0C-0000OB-3c; Wed, 01 Mar 2023 05:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXK09-0000KN-NX
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXK08-0004bD-Ba
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677667679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9svbQGE7EKDQ2J2hKb8il/iNnnRb9xygX32doFsloI=;
 b=bDe74Nl87ctwPtedt+REJfG94BY1dxUgkumCzQ3oHsZ4sJ62Rg9oYli6r6tlyw3F5lYDF3
 lMlcFQsJrEGty9d+OpGRUePcQDAq6ofD5ocNKSEPbhnzyugOIIFc03S4GYDhDnK9X0OT/e
 ZqwchiZQKWTVR37pecPwh1Toh//RTQ0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-t1MBLs14OFWB7z4xZ6iQNg-1; Wed, 01 Mar 2023 05:47:58 -0500
X-MC-Unique: t1MBLs14OFWB7z4xZ6iQNg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u5-20020a5d6da5000000b002cd82373455so1337568wrs.9
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9svbQGE7EKDQ2J2hKb8il/iNnnRb9xygX32doFsloI=;
 b=gCWLNQz+z79x0TTFQxPtLV4RzPbAin0VnPTGJ4qzIqaURLRtkvGfbg9YiNubHULzEB
 vZige+wBHYt5OIDfoyKNZKw10we4lAid2HnlFIZVKzDILz64r1pY6XHJJciK+66sGcd9
 Zk6fyAnQrr+V9Ji1rxrMXJdLJfSdl/J0b+h3h3xER2fL969lk715dRhnwlwLkg6ZJQJP
 NZ0JEXaZuJBvddW/5uT89JPNLWn/GfrlLvGO3jhr+CrCDXK1fNwYLa6+tfz18IQ4PRNE
 hHxU/DW1QYEiUfuhVy63mhJg9SiOayMXqQt4d8Bwdo1eaQcUwfRUfo8VBG6AEeUn7QGX
 fiCw==
X-Gm-Message-State: AO0yUKWmdMo/Nuu9rCl6kfTVjwWv1+g8TqdmLaMWclMk4RMsGWUuYtxN
 mozt4/nbfFzzg18ri/eSmA5zsZEtgiw742xwZ7SgbB78FnZWKPgiOVQuo7LDV/PWcqsvmF93SGC
 ypgcEQD4lJ8KN0I8=
X-Received: by 2002:a05:600c:4da5:b0:3eb:2708:86ca with SMTP id
 v37-20020a05600c4da500b003eb270886camr4962840wmp.28.1677667677007; 
 Wed, 01 Mar 2023 02:47:57 -0800 (PST)
X-Google-Smtp-Source: AK7set8Tp/vEvxjem4v3ZE2KXqF0mQ4yhyx99WISVwzBSm8iMrbWqSZxVZ2squTT5h6fBH/UWAHOUQ==
X-Received: by 2002:a05:600c:4da5:b0:3eb:2708:86ca with SMTP id
 v37-20020a05600c4da500b003eb270886camr4962828wmp.28.1677667676724; 
 Wed, 01 Mar 2023 02:47:56 -0800 (PST)
Received: from [192.168.8.101] (tmo-122-219.customers.d1-online.com.
 [80.187.122.219]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c4f0400b003df7b40f99fsm20319663wmq.11.2023.03.01.02.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 02:47:56 -0800 (PST)
Message-ID: <af65f089-ee9f-9bb8-0842-74534645f351@redhat.com>
Date: Wed, 1 Mar 2023 11:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] test: Check vnc enable before compiling vnc test
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230301104450.1017-1-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230301104450.1017-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/03/2023 11.44, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/meson.build | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 29a4efb4c2..62eecf2edf 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -309,10 +309,12 @@ qtests = {
>     'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
>   }
>   
> -gvnc = dependency('gvnc-1.0', required: false)
> -if gvnc.found()
> -  qtests += {'vnc-display-test': [gvnc]}
> -  qtests_generic += [ 'vnc-display-test' ]
> +if vnc.found()
> +  gvnc = dependency('gvnc-1.0', required: false)
> +  if gvnc.found()
> +    qtests += {'vnc-display-test': [gvnc]}
> +    qtests_generic += [ 'vnc-display-test' ]
> +  endif
>   endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


