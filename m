Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6CD458E1C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:19:25 +0100 (CET)
Received: from localhost ([::1]:51664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8I8-00021I-Gp
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:19:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp8GF-0007yG-Qi
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp8GD-0005QI-Iy
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637583444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtaloi5R+LH/p1amxef3z86CYMvQ7bGT240F6mebXq8=;
 b=efpjBfvganhWL73hYbnPH+8N+D71XcAQ5PaMk8CeYTOvV1JkZRTYY0oPCEVJkvjDKrttW9
 b/k182OOo4+fJi/MmlmE3SfV+CIeyKkwn2Wv/1b4xfi1ipLYi1nw4vA9xcOUCf01vM8bUf
 Ya6RPE/0+o4UAoi99wcfU8U1TIyQ2C8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-Ein6ymQkMhmhp2Ifyrqxpg-1; Mon, 22 Nov 2021 07:17:23 -0500
X-MC-Unique: Ein6ymQkMhmhp2Ifyrqxpg-1
Received: by mail-wm1-f71.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so6726691wmb.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xtaloi5R+LH/p1amxef3z86CYMvQ7bGT240F6mebXq8=;
 b=L1ncDw3kOyj5yOFsi2dqn8ufaCpR/jD8f6G8GDraGpULVhyMrnsEkyRVKAAeKwwRth
 kwq+kuRZ9RmqQ/zGv0FgcPSUvdNh7Id7Vgi1cWItfxe7huvvNIYajW1LKFhi3U9dkO6K
 WaBkxg+lGiiQP+Xnlyx1Z+TP6h0QUYcxoGkK6NhN9SOnu4/dap4ZPjrWNoOYMiJfCvHc
 cjbZZcFMoD0oEWJWMosy/8ExmyvGpGbbpjgHZVs7X8ljnog/sydtVj2ZUTkmaa/2BUAr
 8/t941AXC4vSFT8fyklRuDbLvH88dWgSUXnjoXsBMGM1mjhgdbNnfNNUpnYQeYmMaDH6
 vGXw==
X-Gm-Message-State: AOAM5320kZRFTtpsje6x+tpQ6B9xUXQWpmYAYiNwuLJSvKej/evEXC6E
 B7P1QMv3V9AJPxoeRH4Fjf8L/ti/dzadHtjrj3lEtOePPWlZql5o5orrd/s6ySLx6Ure9aXFX/g
 cQvHHi8vWLoDwkAc=
X-Received: by 2002:adf:9bcd:: with SMTP id e13mr37090401wrc.165.1637583441894; 
 Mon, 22 Nov 2021 04:17:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyut/Tst1nlHd4W6dCshnzM2Owz2NdBVxKRr1JGcEeOrdYRXxyVzXwhsY7m9j+SyWQCF3LZjA==
X-Received: by 2002:adf:9bcd:: with SMTP id e13mr37090359wrc.165.1637583441651; 
 Mon, 22 Nov 2021 04:17:21 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n7sm8684577wro.68.2021.11.22.04.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:17:21 -0800 (PST)
Message-ID: <a605fb86-d86f-e200-de80-e5802254f52e@redhat.com>
Date: Mon, 22 Nov 2021 13:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as a reviewer for Hyper-V VMBus
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, qemu-devel@nongnu.org
References: <b145dcf08ae606e9d29e55b2f701a3fe4f16b347.1637433881.git.maciej.szmigiero@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <b145dcf08ae606e9d29e55b2f701a3fe4f16b347.1637433881.git.maciej.szmigiero@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org,
 Roman Kagan <rvkagan@yandex-team.ru>, "Denis V . Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/21 19:46, Maciej S. Szmigiero wrote:
> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> This way there is at least some contact point for incoming patches.
> 
> We'll see whether the code still gets just a random patch a few times
> a year or whether it requires a permanent maintainer to take care of it.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3879aa3c12c..7f57e7fda73b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1729,6 +1729,12 @@ F: include/hw/block/fdc.h
>  F: tests/qtest/fdc-test.c
>  T: git https://gitlab.com/jsnow/qemu.git ide
>  
> +Hyper-V VMBus
> +S: Odd Fixes
> +R: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> +F: hw/hyperv/vmbus.c
> +F: include/hw/hyperv/vmbus*.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thank you!


