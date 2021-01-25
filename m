Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5812D3026B3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:11:29 +0100 (CET)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43Wa-0001P9-Bq
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43Sj-0007Nr-Pc
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:07:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43Si-0004Yr-54
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611587247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zODQ8l5qRXu5X5bCbVDKdjbjSPrA8e6ZXx9R1Jumy0=;
 b=IW8McwMgaI0QIrXULgtYL+0ELlINg1wb/D60CN9WHFQOR0srCBLswQ7GWZ4RaRuOSLiaBN
 QEnXWvUgRfV356VwW6nwTFlXBUyz0DGiK7wbQh1DYI4UKR5aZlviEc4LifFllka8HRgP9I
 AFoXK86QAZ9E3Bi+I+wnzID4GQuTQu4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-c9dBMzvLMiOyKwiLNG9FUg-1; Mon, 25 Jan 2021 10:07:24 -0500
X-MC-Unique: c9dBMzvLMiOyKwiLNG9FUg-1
Received: by mail-ej1-f69.google.com with SMTP id f1so3881624ejq.20
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5zODQ8l5qRXu5X5bCbVDKdjbjSPrA8e6ZXx9R1Jumy0=;
 b=luFjI9LZ0zHm3MDDSLGUXM/TguFmhS6JY2VIR8jzwXrY4f2AxUMiHCXZMx5WRBc3BY
 xBOxteddHHxjhHrc5RBvwVMi/FUHUfdHu6VHYKPn1qQDxDYLARufBXdMAPbyb0jdrFII
 CQorVWzuHAc9//C6mVibFnN9bN2SItSuPyrNST4L6iBomQwd5BLnCSnk5Snz1MROQKrR
 /qWC6DO5mfelXWaVlxbdY/TxOQN27DoLBEZVjiUr9ABoyKWzVKYUK9LX8LCZodCGNOLg
 5P07/X0nVLV6cUDibTXtHoOx/Pne5X/8yYPITPRDAl6ExrREAaiIjL5RJ5ec/d/N7YxV
 6nvQ==
X-Gm-Message-State: AOAM530aIQLJx7cLCSsfnTMABlgOn3AUKbsCsX8zNucLGSBTNAqMjknI
 yXq8yQXq9MI6JSaZw0s0KMJXjseo4MhMpBHi5CJfUTzsbmhKzuEFUq+o8HQUYsPu66fC4jLUL58
 amEvwOeUggM/DIwU=
X-Received: by 2002:a17:906:5958:: with SMTP id
 g24mr623764ejr.377.1611587243577; 
 Mon, 25 Jan 2021 07:07:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzSkX4MekpdopvGNCpcUdE0QDAyp6YlHfdemKzwaswEwAj41/2ve7teoqdIoD++jBgTrrW0Q==
X-Received: by 2002:a17:906:5958:: with SMTP id
 g24mr623708ejr.377.1611587242784; 
 Mon, 25 Jan 2021 07:07:22 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id co6sm10695143edb.96.2021.01.25.07.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 07:07:22 -0800 (PST)
Subject: Re: [PATCH] error: Fix "Converting to ERRP_GUARD()" doc on "valid at
 return"
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210125132635.1253219-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7fc8619b-b3a5-e82a-d898-e7c253758afe@redhat.com>
Date: Mon, 25 Jan 2021 16:07:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125132635.1253219-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 2:26 PM, Markus Armbruster wrote:
> Setting errp = NULL is wrong: the automatic error propagation still
> propagates the dangling pointer _auto_errp_prop.local_err.  We need to
> set *errp = NULL to clear the dangling pointer.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/error.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


