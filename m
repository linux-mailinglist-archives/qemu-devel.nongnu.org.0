Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE0510DBD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:13:03 +0200 (CEST)
Received: from localhost ([::1]:58252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njWEo-0008Dn-0G
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWDY-0007Yo-8f
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:11:44 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWDW-0002Ri-J3
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:11:43 -0400
Received: by mail-pf1-x429.google.com with SMTP id y14so286569pfe.10
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KA9/3Nk2cvJszmQoaVGD1itWi08CC92ftzuOFWfgb/k=;
 b=zWk4wWl16uv2Nl3cvMay8IUy7UQ/ZsiIHvHpLXuED7iO00mp4+jJ72vV607eozIATI
 lQ+BgKNKvt3uG+LnW/sQHBHhKq2Ixv5GBR56tbon4Opb1wPNwXodzzc0qOAmDe7+XMt4
 ENuFJOdSYxNcFb7CpG6rWfNcp/j+5/Jb0eV9ucKAsY/nY142/rsquYiP+h8ykv8IyCn0
 tByLi1v1sQLiUNINBYFh5TYbN5Fdw0jN0Uj7sEzxVlcJ0qmH9LdGsx9QBo48fmyGRJH6
 kjDl+8ZnCPe8+4rZ+sQNrj+BhvSFvSvfqXex7h3GmGQJJJSlAL2jY1huB767nBDPIlMk
 ti9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KA9/3Nk2cvJszmQoaVGD1itWi08CC92ftzuOFWfgb/k=;
 b=uFLiXbcmjUjcGAz6NF0yOBq6I5agYLD5NCVlHWz8WifgXiYP137PS4/vV26X9m3o48
 wJGW1ZY2vPZjrORJYbBQAfAkf4HpxdrbKfOGgrspbUisaxC0C2a2+hbWLUkPfDztw31X
 9xr3yv1ufPWkm/8sg4Jh/6eGfA8DEfnvfiv4RA5lWkaAz1mQ8+dl/0Iv8s15bNXYQDek
 UCgcTrYmfMxtqdrWjZfP3FiRoWVb5sY55DAiCu9uvxXkwmLuiGeZB09+N1PrzFSMMIeW
 Dz2srC0vxbJpyrt2djHWVmVkyxnqlPnwcdqir8qAKvJVk0XZy2gy0U2FR8OeVQdLKWXK
 P6pQ==
X-Gm-Message-State: AOAM531RWP5uYFjsZFIYNmMLCYGqluMeLzTRBFAsGa0MeGwVCU/G7+3l
 RBeA0rmU9K4D6x77Bh6VJ57FAw==
X-Google-Smtp-Source: ABdhPJw52ROQPveD0yBcet/5m0iGw5CAgGInbNLS3a3U1lfxBmMT1kR2NQ4s6sNJaw6fe0LiFSbEvQ==
X-Received: by 2002:a63:5518:0:b0:3a8:c75d:8536 with SMTP id
 j24-20020a635518000000b003a8c75d8536mr21827867pgb.366.1651021900901; 
 Tue, 26 Apr 2022 18:11:40 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c2-20020aa781c2000000b0050a7ff01d2bsm16271550pfn.30.2022.04.26.18.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:11:40 -0700 (PDT)
Message-ID: <0616ce86-711c-d7a9-3105-3a6f5e369143@linaro.org>
Date: Tue, 26 Apr 2022 18:11:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 14/26] os-posix: replace pipe()+cloexec with
 g_unix_open_pipe(CLOEXEC)
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-15-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-15-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:27, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Suggested-by: Daniel P. Berrangé<berrange@redhat.com>
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   os-posix.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> -        if (pipe(fds) == -1) {
> +        if (!g_unix_open_pipe(fds, FD_CLOEXEC, NULL)) {
>              exit(1);
>          }

We could do better than exit without error message, though pipe failure is pretty rare.


r~

