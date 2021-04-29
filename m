Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B798736E5B7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:15:19 +0200 (CEST)
Received: from localhost ([::1]:54234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0tK-0004EI-P6
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0r1-0002rn-Mb
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0qz-0003cZ-WE
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axa39zPjbCPNhE3YwiZwI9a4D5uwDM0qB20GSee3gSE=;
 b=iqbFc/Be9WPrTsE+aGXcO1MUaRSW11pyAsUG/qXO/krIz2NCSgLmre/QhaXimClPTAXUyN
 QMNV7kcWEw2dn3ro9i8o//s/q6CNncR7i5Tgtg1BznrmfClT6PD7+O9pJbk0exbDqrEAJc
 brDhsw7/Pj1dfMFE43eVvTw5W0yhnjs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-EoFvea3XOCSmmKK316snew-1; Thu, 29 Apr 2021 03:12:51 -0400
X-MC-Unique: EoFvea3XOCSmmKK316snew-1
Received: by mail-wm1-f69.google.com with SMTP id
 g199-20020a1c9dd00000b02901355dd71edaso5681249wme.7
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=axa39zPjbCPNhE3YwiZwI9a4D5uwDM0qB20GSee3gSE=;
 b=Gi2vPsYuZvOjd9M17X8QiGSZPjoxHk/7U7cCGrCMYvPzyyDMkARZb5RRAgL3jFxOOR
 HjEz6l0TXSc7xUeYGb//lZANbK5TO7LluILxBCnw4Ja3v15QibbVBF/KOYbXGQvL6Goo
 bfBUKssichRrRTvc8jJrJO8XM1fs3etjY2UmkwWrRMQOfQAANizY+VCJ7/Qd2I4RNxiq
 MihNiClKyh/nujFcPHfK6byJTsQHnHxhyhT9LZLX7NS26CR21MQ6ohgIVGwUYDUWS5sG
 iOeDn6lPHqh19VNZYrduHs6s4Y2eCViVnRj1c4vqTppFuYbffW8z4xmZPA/X2UoVa08r
 0TYA==
X-Gm-Message-State: AOAM531yNZsJAnCha476qfGWQrRmFx4jjip82Do/smKUX9bHyqW+F90V
 EzqW6lmmcMYckEYiwi9VM1s7o8+C9ghhI+mkcoKYuuMMAysgbz5pnbdftfwOaQi01Rhz46+J5uB
 krysvDafNIJG2bn8=
X-Received: by 2002:a1c:f402:: with SMTP id z2mr8843236wma.21.1619680370660;
 Thu, 29 Apr 2021 00:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLPNKPTcLd7KsYyezADtEZImb4zdxo1gOpf+mzOT7zDM6bCLePXj2VRS84e1roejbo/2vYxw==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr8843213wma.21.1619680370401;
 Thu, 29 Apr 2021 00:12:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 v15sm1986824wmj.39.2021.04.29.00.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:12:50 -0700 (PDT)
Subject: Re: [PATCH v2 05/15] linux-user/s390x: Fix trace in restore_regs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-6-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <ac53cf2c-02a1-5abb-046b-6a8f838f4372@redhat.com>
Date: Thu, 29 Apr 2021 09:12:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-6-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 21:33, Richard Henderson wrote:
> Directly reading sc->regs.psw.addr misses the bswap
> that may be performed by __get_user.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index e455a9818d..dcc6f7bc02 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -232,16 +232,17 @@ give_sigsegv:
>   
>   static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
>   {
> +    target_ulong prev_addr;
>       int i;
>   
>       for (i = 0; i < 16; i++) {
>           __get_user(env->regs[i], &sc->regs.gprs[i]);
>       }
>   
> +    prev_addr = env->psw.addr;
>       __get_user(env->psw.mask, &sc->regs.psw.mask);
> -    trace_user_s390x_restore_sigregs(env, (unsigned long long)sc->regs.psw.addr,
> -                                     (unsigned long long)env->psw.addr);
>       __get_user(env->psw.addr, &sc->regs.psw.addr);
> +    trace_user_s390x_restore_sigregs(env, env->psw.addr, prev_addr);
>   
>       for (i = 0; i < 16; i++) {
>           __get_user(env->aregs[i], &sc->regs.acrs[i]);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


