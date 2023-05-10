Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB66FD789
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:56:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdkC-0006ja-W4; Wed, 10 May 2023 02:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdk7-0006jJ-NA
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdk3-00075B-28
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683701762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qT+WyaCyRDEiFesZoVw1VCwVM0kGeidybcIahusWZ8=;
 b=eZbI0EFUBtsVSk+3l6WmI+6tKDAq+pD7mek8UI0Ra9KMp3o5WrRMIuGyhHZo2GP+/F0Cmy
 HtzuXeOWVll+6uqWy1X3jJ3AWH6gkAz/5shU/hcIlFq+m9KgR8a9wtzMzN/TLSd6yosA6c
 e1R+wprZRk+tHxM4MeFItuY3dK1HGs8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-ytqWp7bPP-igAw5infay-Q-1; Wed, 10 May 2023 02:48:50 -0400
X-MC-Unique: ytqWp7bPP-igAw5infay-Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f422dc5ee5so19569705e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 23:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683701329; x=1686293329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2qT+WyaCyRDEiFesZoVw1VCwVM0kGeidybcIahusWZ8=;
 b=FPjh3shFh2MKus5ud5atW6vtGmyOi+22MgPdS7lWdA9jngkXhwtlRygeei9ms6OwSL
 C2CUlYSClHOZi94O+rHTaqP16pMaC9EyfQsjywbVmb/rXeIFwbpkBd5AL5vZMTVb4UMX
 kpHiAhZxI0n1F54Bz8oP0qLM9i751Bxcara8aCByfHbT4wr0Toax1rKGx8P1hgDby0uh
 ItgyLWw+svGYV7cElhRPPBUhWukkjERIiSnO0KOJSxMxwRFBzzxC7WgAwxVY3be9aBLk
 /Y7OIYn2z8Do4dZlYrbGzH7FcVA/OMeYCiC9GhXI5e0H9sXvTP0KVONv6gtLnXURoBfr
 AwVg==
X-Gm-Message-State: AC+VfDxvq9QIDIWPqER7FCWQ4xpS0LqVoGDy5LgDUP8N7ILVt8lQYe2y
 Xeft7E+tbs74KPEi425DdKsVwd0FBxwTRI8kGoHk6tmoJetMtnpqNUdT0wsA1t65PlVsZepueSr
 4qVRxMnS1oFb8+EAL+Ws9Myk=
X-Received: by 2002:a1c:4b19:0:b0:3f1:78d0:fc4e with SMTP id
 y25-20020a1c4b19000000b003f178d0fc4emr11297742wma.32.1683701329232; 
 Tue, 09 May 2023 23:48:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7y8HiVjUxGrThOSYxA0twUfmYhNb+viCyAhfrhW9ETxBKfz6az2qd//fpHOWLbjffuO6h88w==
X-Received: by 2002:a1c:4b19:0:b0:3f1:78d0:fc4e with SMTP id
 y25-20020a1c4b19000000b003f178d0fc4emr11297724wma.32.1683701328984; 
 Tue, 09 May 2023 23:48:48 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 c15-20020adfed8f000000b003047f7a7ad1sm16392481wro.71.2023.05.09.23.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 23:48:48 -0700 (PDT)
Message-ID: <3f3a93f5-64db-d153-11f7-5f5fa50da05e@redhat.com>
Date: Wed, 10 May 2023 08:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/5] disas: Remove target_ulong from the interface
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, philmd@linaro.org
References: <20230509163326.121090-1-richard.henderson@linaro.org>
 <20230509163326.121090-3-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230509163326.121090-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 09/05/2023 18.33, Richard Henderson wrote:
> Use uint64_t for the pc, and size_t for the size.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230503072331.1747057-81-richard.henderson@linaro.org>
> ---
>   include/disas/disas.h | 17 ++++++-----------
>   bsd-user/elfload.c    |  5 +++--
>   disas/disas.c         | 19 +++++++++----------
>   linux-user/elfload.c  |  5 +++--
>   4 files changed, 21 insertions(+), 25 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


