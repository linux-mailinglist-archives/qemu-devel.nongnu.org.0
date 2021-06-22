Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B333B0BDC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 19:51:59 +0200 (CEST)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvkZ4-0004zm-12
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 13:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvkXl-0003OI-IO
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:50:37 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvkXi-0000NK-P8
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:50:37 -0400
Received: by mail-pj1-x102f.google.com with SMTP id bb20so8350944pjb.3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qu3YRmsXDsVT1SMpbAgAzZuETiefGJlTpu4KqA5lQBo=;
 b=MxUvnGS+7n+0LaDead+NX+GmseO0wPM8UpyY/vkdcIIXOzrYpYO9/obbx8EkbfgZfQ
 UAmYOmE6YPLJnJVfqxiylMbADyIdkDZ50jzIOYBOKMzfYhFV7lPCJWina/cSrH9VWtP5
 TmEnOEidIM8Ci2p5CgK3CJ0Wc22ArMLT/yI2RRKgmgBjWBWm9ZkDYxbWMgmHb4BhFKAA
 s9dlbR4lGIjT5Yq3zYE2y3YDjGf2Amkc+vrxunKao02o6buLAnXID1j8OdWgBLdLFqYS
 GW2qkHfoWmMVQ3qB4TT9ZJhlZ5Nrlwh7J8sASgruaizohM7xWyjzvrHkw1YObzY3jHqg
 Ew0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qu3YRmsXDsVT1SMpbAgAzZuETiefGJlTpu4KqA5lQBo=;
 b=DYhI1aGP18kF8Hs6vgQHHzKGulVLEoNPnc0lGTdWCKDymYqo+ez3dz5UTqcts6hJUc
 95zP8SN02BXLA74w67/EOAqz2DT4F0luGb1mFFtRS7ql1//9aWL3J11sWYmw4NEE8Bag
 bTOzo5TmxnyIeyYfZdf0T9wOrEE1rj180yFTG8ApYYETfe/3XwYYL8Qjrgc+My3F3Rah
 3p17B0bDzhzR84Hx1horWGyYe0VoyA8jvIg8K60KLVEr4v9SWYB2PCgjijTj6OnCOIJg
 fQjoLgew6Uj+FYOAcA9bCgizpi3Xr5vjaF46DU2ajwxSK8RniPe4WAblKLAPdCVLa3Oq
 1tBQ==
X-Gm-Message-State: AOAM531rXalGb5V7LRwfvydiE91DRTMLCeZwOdpJuBL5/w3yOedP4G3q
 TrwXzuMdPOB2JfxQE2CYfmN5xw==
X-Google-Smtp-Source: ABdhPJzs753ybUp7XPc8nJDwYoFRZ30syMleVOD/qROhqpik27cOjZ2C6OQT6Oq8y0/QDd2bvlaKuw==
X-Received: by 2002:a17:90a:8804:: with SMTP id
 s4mr5030199pjn.200.1624384233182; 
 Tue, 22 Jun 2021 10:50:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 205sm11119pfy.40.2021.06.22.10.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 10:50:32 -0700 (PDT)
Subject: Re: [PATCH] tcg: Avoid including 'trace-tcg.h' in target translate.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210622161534.602428-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e6ff32b-a8fb-014d-3cdf-068c38949a82@linaro.org>
Date: Tue, 22 Jun 2021 10:50:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210622161534.602428-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 9:15 AM, Philippe Mathieu-Daudé wrote:
> The root trace-events only declares a single TCG event:
> 
>    $ git grep -w tcg trace-events
>    trace-events:115:# tcg/tcg-op.c
>    trace-events:137:vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"
> 
> and only a tcg/tcg-op.c uses it:
> 
>    $ git grep -l trace_guest_mem_before_tcg
>    tcg/tcg-op.c
> 
> therefore it is pointless to include "trace-tcg.h" in each target
> (because it is not used). Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Thanks, queued.


r~

