Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB52620AEE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 09:07:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osJck-0006et-IJ; Tue, 08 Nov 2022 03:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osJcL-0006SQ-CQ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:05:57 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osJcJ-0006KR-2z
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:05:57 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so8562908wmb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 00:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d4Uerldm30hREKQDU0I95au2Zp6K+hEs6toI+38dSpg=;
 b=rMKquLWTfxDk8+Tb6LGEJWfIPWTZdxM8j7+BXcXsUmhBsFS17LMSg4bddHIWlDw8CS
 8GcXbLQOH6+O0b5wdCScFv54rmdFb00lK72MltRf8LDj9hxeqQC3lXsR6wfiTxB7eI5g
 esWfwSKFzYZb4LCeXZDof1PPeH5FB1lO2KNgeTFVFI6LP/7+o7FJGwpClo2v3AV8krMe
 g4eOYAlFymVV8NEXW/XDslO/XAA9jY3xdTXwuEXSeCQEhGnYW49VxTT1K733hT9ck/EE
 kx7hT0X+0RVFLnSINMEja/SnWcE1SBbY9h+hQFJkaqFp2b2FrsnQq7v77v1sAmcUKglb
 Lh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d4Uerldm30hREKQDU0I95au2Zp6K+hEs6toI+38dSpg=;
 b=adP/FsMCIfZ++nQUz2uZCSVbuoZ7yoJdUS++XcWl6PyjZfb2/NROv1Z7qjM50Hh9BO
 3L/gl7EdCpATwOWOVNADG/VnaZhbfIf9jsFD9Y0Ryvt7ykN4YRLleHLn5TdYYcS89xSm
 6krx0YuK0WIupuPPJhzgSIQNl1UiqRlSB2MRsA+NfcgNO7BhG6u4C0+vv5rJ5l1G5uGl
 XbVUyH0YC2vXe8uJrjJUqK5m5aTqjsUPtUUdnVuyxdr7HokRKY+5lE/og8tr2lhGTr+j
 /cVKxllUNgKO07OkPoTkSG89X+nRst3YVeqxxCe+HlYqDtb+qkVOopeK5/RHBmKIpOIJ
 b9pQ==
X-Gm-Message-State: ANoB5pm2DMATMxKxfDpJO7yXSsQ8P6fPpmDbfeLkuIWwd3gHyr26QQl+
 xkrWQGjk7qKMSIjqvEkMxiiVGQ==
X-Google-Smtp-Source: AA0mqf4/Z9etsmJ6tz1zWFFDUbmiqXH8gcbmfukRkwTHvbqlncWjlsGyGEw6xwmwDJnh+PUfPJu96A==
X-Received: by 2002:a1c:2505:0:b0:3cf:b89d:6ae8 with SMTP id
 l5-20020a1c2505000000b003cfb89d6ae8mr1297913wml.31.1667894753189; 
 Tue, 08 Nov 2022 00:05:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b0023691d62cffsm9502643wrx.70.2022.11.08.00.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 00:05:52 -0800 (PST)
Message-ID: <ccdc710d-2816-502c-ff91-e3e166ad3856@linaro.org>
Date: Tue, 8 Nov 2022 09:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] LOCK GUARDS: replace manual lock()/unlock() calls to
 QEMU_LOCK_GUARD()
Content-Language: en-US
To: nyoro.gachu@gmail.com, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, samkergachu@gmail.com, Samker <nyoro.martin@gmail.com>
References: <20221108051120.6859-1-nyoro.martin@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221108051120.6859-1-nyoro.martin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 8/11/22 06:11, nyoro.gachu@gmail.com wrote:
> From: Samker <nyoro.martin@gmail.com>
> 
> This is patch replaces WITH_QEMU_LOCK_GUARD() call with the
> QEMU_LOCK_GUARD()
> 
> Signed-off-by: Samker <nyoro.martin@gmail.com>
> ---
>   softmmu/physmem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index fb00596777..907491ae17 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3115,7 +3115,7 @@ void cpu_register_map_client(QEMUBH *bh)
>   {
>       MapClient *client = g_malloc(sizeof(*client));
>   
> -    WITH_QEMU_LOCK_GUARD(&map_client_list_lock);
> +    QEMU_LOCK_GUARD(&map_client_list_lock);
>       client->bh = bh;
>       QLIST_INSERT_HEAD(&map_client_list, client, link);
>       if (!qatomic_read(&bounce.in_use)) {
> @@ -3143,7 +3143,7 @@ void cpu_unregister_map_client(QEMUBH *bh)
>   {
>       MapClient *client;
>   
> -    WITH_QEMU_LOCK_GUARD(&map_client_list_lock);
> +    QEMU_LOCK_GUARD(&map_client_list_lock);
>       QLIST_FOREACH(client, &map_client_list, link) {
>           if (client->bh == bh) {
>               cpu_unregister_map_client_do(client);

This patch doesn't apply...

$ git grep QEMU_LOCK_GUARD origin/master -- softmmu/physmem.c
$

On what is it based?

