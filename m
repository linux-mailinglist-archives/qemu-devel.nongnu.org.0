Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309304D02FC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:34:38 +0100 (CET)
Received: from localhost ([::1]:59614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFNd-0006SE-AA
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:34:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRFM5-0004aB-7X
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:33:01 -0500
Received: from [2a00:1450:4864:20::52b] (port=39457
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRFM3-0003Ak-AI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:33:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id g20so20475199edw.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 07:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=05B6Qb9Js6RKra9OqBGvGYKQoiNfNomReXdbiUD2/Lg=;
 b=cee7RGFr2vgVTRkD/36rh7l6UsQ9LpGeL0daEkTXG3gtP/Y4CfL8otbKTffgDBuEm1
 yXSq9UziJ4WubHp6hPrujic4nP+VrYpWY7fg7pkyjg0if3aklkjrrKQ4MKoXirpAeZHD
 Un1x/YzCaOLXPhV/nDiOxm4IrnrwZJAJ7Zq0OrBIYH6Uh5fdIuAcmqvNY9c3hhrohT8A
 zPod0eAqP4jXV7C7Icxzc7BFnD/e/vV2wdtByo1/a+BIZkLg3OsK413oKofoRne/LvJ6
 4R311WUIOF55kYy7PRiFt/0V1bZouTF7joVIODGAdKgFdssv6/fbjQIbkHhEps13vQPH
 qB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=05B6Qb9Js6RKra9OqBGvGYKQoiNfNomReXdbiUD2/Lg=;
 b=NA4wxa/w8Ro2FGRWrN3bUOYVz89fhf99NAEVEO8YVaNvnDP8CFvVxXVSyLRc7ZbjYB
 PHMw/qijvTEmKFohGaiYXJNbFXB/zuSlDVX9YVgp8wZRXGL2J4pwOiIv1AFMGBFT9XAn
 kpET2Oi/GdImSvfPKWyUUJ+tQ89/LyIw2gY5NgUbXJM1GxXMmetT9dXMhJqHcP9JWhhO
 8jRVy9y9HLNN1T3+mwlaRvW4qqDFP8b0FX41TwSHXH8aTqy5A8gqvBdzE5rvi8vqaQA8
 SRp+pnXE++ZNPf+R6MIsTabUf32i0BXYpS0OuknqpAQ8zd5q295CdYILKT/oXEFiJSz2
 swyA==
X-Gm-Message-State: AOAM531Rwym2ZNyPy968TRAHMHdlmSopAI2OnIlXyS6w16plQf2EBxr0
 p6aIFRM0YoIJjbemNY8OFbE=
X-Google-Smtp-Source: ABdhPJyfbqXp7WQTJZdePv4FOsaRvc4MtJo8SaR19U0gk6sKjZXz4BmGpoFTdkjctqib31SnngCzcg==
X-Received: by 2002:a05:6402:491:b0:413:6c2e:bb2c with SMTP id
 k17-20020a056402049100b004136c2ebb2cmr11750300edv.196.1646667177394; 
 Mon, 07 Mar 2022 07:32:57 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 o23-20020a170906861700b006da745f7233sm4810153ejx.5.2022.03.07.07.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 07:32:57 -0800 (PST)
Message-ID: <085b9a6d-5deb-9225-f7d1-81627576020f@redhat.com>
Date: Mon, 7 Mar 2022 16:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] Create menus in iothread
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220307134946.61407-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220307134946.61407-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 14:49, Akihiko Odaki wrote:
> ui/cocoa: Create menus in iothread
> 
> Commit 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 introduced an
> assertion that blk_all_next is called in the main thread. The function
> is called in the following chain:
> - blk_all_next
> - qmp_query_block
> - addRemovableDevicesMenuItems
> - main
> 
> This change moves the menu creation to the iothread. This also changes
> the menu creation procedure to construct the entire menu tree before
> setting to NSApp, which is necessary because a menu set once cannot be
> modified if NSApp is already running.

I wonder if you actually need the iothread/secondary thread separation 
during initialization.  It's needed to run the "secondary" main loop, 
but until that point nobody should care what thread things run on. 
cocoa_display_init() is close enough to the end of qemu_init() that I 
think you can just do:

   main()
     qemu_init()
       /* takes iothread lock */
       cocoa_display_init()
         /* just save a few values from opts */
     ... create menus ...
     [NSApp run]
       applicationDidFinishLaunching:
         /* do what was in cocoa_display_init() */
         qemu_unlock_mutex_iothread();
         qemu_thread_create(call_qemu_main_loop)
                                                    call_qemu_main_loop()
                                                      qemu_main_loop()

This might even obsolete the allow_events hack, because now the main 
thread has the iothread lock until applicationDidFinishLaunching:.

Paolo

> v2: Separate a change moving create_initial_menus (Peter Maydell)
> 
> Akihiko Odaki (2):
>    ui/cocoa: Move create_initial_menus
>    ui/cocoa: Create menus in iothread
> 
>   ui/cocoa.m | 209 +++++++++++++++++++++++++----------------------------
>   1 file changed, 98 insertions(+), 111 deletions(-)
> 


