Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2A3484A3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:31:04 +0100 (CET)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPC1m-0003fV-En
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC05-0002zd-Fl
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:29:17 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:44689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC03-0006pl-Qs
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:29:17 -0400
Received: by mail-oi1-x22a.google.com with SMTP id a8so77904oic.11
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FPzqpdgj04KCimIrErQaZEc3E3soj6nME3Sa+guq/bE=;
 b=nh4mez0gKSTOhWM7kE4SCNFGfXNWRYRj5a1YSWKpWyQCcY3pYV/F1DOukGmL4Vo0YP
 5ZoI3bVD7J0zPsLRXeGuSTWWHAiB2bpgyps1Q7mjjwUeTgQQoxYDruRmWNVD8MoBmLSf
 C04SggjOKO4eLIulzCaRKLMzQbDS2niyPwMhlbiWImDeb/X6xbLNsxsmVQBlaGhVAhZ/
 9WKOs8rRJCU3beuCNFFdKcVJKsyWreKdUHikiKNDNhzFDDQKlej71+4QQimpsWcXhbRz
 B2SMyJq+teLJ3eg85SbhS/BC2qSUxhQP7qhKz9K7E2RB6eBMR9cyOEWsgUEP33Tdwiyj
 AweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FPzqpdgj04KCimIrErQaZEc3E3soj6nME3Sa+guq/bE=;
 b=toRu6cYmdZbq36DvGA++S4WrUKQRmnylem2sAnzZ1nZc3MrLrmJfL8hOuCAzyadFBL
 MtnzcnniHr06wHkZBsFzv/iwS/XhEFKjYcY7IS7BXc3Uc6sIOHrvtYDf3mFgPIV0kKN4
 KTOjV2udLIheJd2CeNF68Z1dkeHVWo3zBAbYiK+dGDcUDDmlMoaND5xc3H97X9wFfXWf
 AVJPrRltHFbpLiGdfGKeM10eZA741OPIo/YunnO+R0e2UDK04kfEV3rGJywVZ6Y1oAyt
 w6y/2FVCNWYm5KJdRRgTg1Mbt07lwzdmtgIh4XsWmpwZ8Ec1k/0S3bXc6mWtWrCgN4E2
 gSHw==
X-Gm-Message-State: AOAM531vXR9nHiz3c1xQsWNEOLPOLeX/uOpBG1NMaNQnPKDcB0lJmJ3r
 /s5rK2ILUU8NA5v00bmf1+tG8Q==
X-Google-Smtp-Source: ABdhPJxfYoL319ur0R04anE7/w7zFdYb/e669LxvJ5MxVXVbEr4Y954Ux10uZDAcQwvsrDkTRabV6A==
X-Received: by 2002:a05:6808:2d2:: with SMTP id
 a18mr4005566oid.152.1616624954051; 
 Wed, 24 Mar 2021 15:29:14 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id w16sm891241otq.15.2021.03.24.15.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:29:13 -0700 (PDT)
Subject: Re: [RFC v11 28/55] target/arm: refactor exception and cpu code
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-21-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47ea27b1-a11f-b10d-a084-0f7698691a6b@linaro.org>
Date: Wed, 24 Mar 2021 16:29:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-21-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> move exception code out of tcg/
> as we need part of it for KVM too.
> 
> put the exception code into separate cpu modules as appropriate,
> including:
> 
> cpu-sysemu.c
> tcg/tcg-cpu.c
> tcg/sysemu/tcg-cpu.c
> 
> to avoid naming confusion with the existing cpu_tcg.c,
> containg cpu models definitions for 32bit TCG-only cpus,
> rename this file as tcg/tcg-cpu-models.c

Obviously all of this should not be done in one step.

Isn't tcg/tcg-* redundant?


r~

