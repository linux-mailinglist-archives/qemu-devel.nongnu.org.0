Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2D9448217
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:46:09 +0100 (CET)
Received: from localhost ([::1]:51342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5uS-0007d3-UF
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:46:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk5ra-0004xl-AF
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:43:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk5rX-0000le-0T
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636382585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foqTTjpqHQY0zUTpt4aH8vtPssaszFfnkmMvglYI9D4=;
 b=cHsNXfDZRIDkOImzg+iDBA0bjYi1XmG+U+DNerxLFnGv+kL5CuIp1R6QakgmOT6JWXnE/z
 I5KZXznvKgxNcogoN/QG22ynTE/RKwrleUQwDU+qSNeK3n9i1L+2v0m0vRXCkpqI/2YeQf
 zVMrTIsiBSc8IfrAN3AH5Emf8BXwr2g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-mFBuIW_fPcG8Qf0RJWSZKg-1; Mon, 08 Nov 2021 09:43:04 -0500
X-MC-Unique: mFBuIW_fPcG8Qf0RJWSZKg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso1040wmq.2
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=foqTTjpqHQY0zUTpt4aH8vtPssaszFfnkmMvglYI9D4=;
 b=f/q34mVgcrTcyGtCVNQZfODWM9+j61P9bpx7byqtRBbiOWeKI8l01hCA7fPpp/XuSG
 clAZyFnR7DOyys/atfKY6KW2fRc9pAgulB7jOQhZzOo3yPV+hjWyv447Pze9XuAzfoCl
 NJWX5dw7NZ4avawWxjiaKQRVPIvX7KMFK07Z7d1VIRu+XgE5F5X2rHN2nvtr1/Oo42El
 upKRIKwalya+jKyjlLI9x/GQftSQP2J/o287vct604AuKzQ7ef3Z80vsFDB51VWtr1WW
 KMYUkKIGX8wgXDY7SQ+A36cuIZyF4BomFA7VvrRgXoUArEZhwMk6Es/2Dn6s4NX08/L5
 BYCg==
X-Gm-Message-State: AOAM533SkyjUzdwvaijLQi1X7GSKLUrysCIu/oxkxgBKDNVPPRaor8Sm
 uX3R/q1Jnw+CYgSxawPm1kEn4RwERQG5beWU1fKU9DeKkimOpmBdTLIJNBkbjod1nPcmcPC0omY
 pbLKvjvk+vME28IQ=
X-Received: by 2002:a5d:6351:: with SMTP id b17mr259629wrw.151.1636382583353; 
 Mon, 08 Nov 2021 06:43:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzV6TqnX9O+rsrcVRFJ10NG3Dp/2n5iayYSoVMENI5Mcd62AWukP49czi0a6xv8eRHGhkoDZQ==
X-Received: by 2002:a5d:6351:: with SMTP id b17mr259599wrw.151.1636382583197; 
 Mon, 08 Nov 2021 06:43:03 -0800 (PST)
Received: from [10.201.33.14] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id o5sm2822667wrx.83.2021.11.08.06.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 06:43:02 -0800 (PST)
Message-ID: <f7a0afff-d4a2-8056-c3ac-ab3a27cdd344@redhat.com>
Date: Mon, 8 Nov 2021 15:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] microvm: add missing g_free() call
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20211108130718.840216-1-kraxel@redhat.com>
 <20211108130718.840216-2-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211108130718.840216-2-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 14:07, Gerd Hoffmann wrote:
> Fixes: CID 1465240
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/microvm-dt.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


