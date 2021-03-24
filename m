Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B6A348073
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:26:47 +0100 (CET)
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8DO-0003mo-9W
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP876-00006s-Hs
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:20:20 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:37437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP875-0003uZ-1i
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:20:16 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 c12-20020a4ae24c0000b02901bad05f40e4so6050101oot.4
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MGjTn6xadG1YMDg3/UGeHjx96B3Lahu3is/MHbGnXLo=;
 b=CJD7KLRyYsd9Cq0zIMFCctCimW8eaa0iy4nTC6Qv7N+whtugWjIea3RxOPdJDB5Reb
 asI6Abp/ztY+ttUd01iV/W3sJECOtcwQwMsriPhK7Ty8T+g6pg0/hShUOxKIYHai8naD
 g915vK4V+Fsj54KMEJmm2WjtRCKWVDTHVGbiHLCStw0enYLuG+41/UIJysflqbGyzgRs
 oNNNTpJiODrYa/Xq6T4Rvhq2kFgE+Y7/9CXUpM5JTaeOHEOaMx0QJGjg9tlxuVCn2s5F
 K0K46PMPX4+lHtej5j+WCrekGKwsx/Ne1nGZiV/Yj7Zg1386VLHOqZ9l3c62gSuTTLIE
 Iyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGjTn6xadG1YMDg3/UGeHjx96B3Lahu3is/MHbGnXLo=;
 b=LdJPAo37+Qfs7pCijETQ6JDR8PKPb5aXTv96MCYszVccUBGqsAUyFsTyiQ583OVDpf
 DU+gjpncEgB9yXVTJB3dmSVDvGsRKZsem4qxLvsikLVhf2/9PR79cRqjuH81WitYP8eU
 Su2EJLCXYDvYHiYm4yvzMcoqvHMPXt630SM/d+8OGCyVqwAvtXHUdyTAwMBYL78gWqo/
 IbUXHvzb3h4twDOAwqO/NNOdROXJExyDBhs0GCsAojmH6+BkDkLlZ3BBR8DjM4VQPNDk
 EPbqyBoosrAU4X6xHc0+gaWtCORO3VVquRfXbDZ9tBkdwodvljy7rzecEkEr63uRIfQ1
 dYXw==
X-Gm-Message-State: AOAM530PFcFqzTNeJw6pTq1+GUhXYqMcOikEEUQfUaqBeNWTKvkbn1CS
 g+4cmXJPfPf6V4uopahs7Acjaw==
X-Google-Smtp-Source: ABdhPJw6WVRK0EVSjOFp7+ThsLA9eCLCsMD2b94rwl63Ysnke7sChnsyqGKP9llqx3JoMMsSwBbQiQ==
X-Received: by 2002:a4a:2511:: with SMTP id g17mr3925852ooa.22.1616610013911; 
 Wed, 24 Mar 2021 11:20:13 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h12sm728419ote.75.2021.03.24.11.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:20:13 -0700 (PDT)
Subject: Re: [RFC v11 07/55] target/arm: tcg: split tlb_helper user-only and
 sysemu-only parts
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323151749.21299-8-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93b198c9-8aab-5d89-a9a3-91634ce5e074@linaro.org>
Date: Wed, 24 Mar 2021 12:20:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323151749.21299-8-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:17 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/tlb_helper.h        | 17 ++++++
>   target/arm/tcg/sysemu/tlb_helper.c | 83 ++++++++++++++++++++++++++
>   target/arm/tcg/tlb_helper.c        | 96 ++----------------------------
>   target/arm/tcg/user/tlb_helper.c   | 31 ++++++++++
>   target/arm/tcg/sysemu/meson.build  |  1 +
>   target/arm/tcg/user/meson.build    |  1 +
>   6 files changed, 137 insertions(+), 92 deletions(-)
>   create mode 100644 target/arm/tcg/tlb_helper.h
>   create mode 100644 target/arm/tcg/sysemu/tlb_helper.c
>   create mode 100644 target/arm/tcg/user/tlb_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

