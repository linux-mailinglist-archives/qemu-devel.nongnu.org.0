Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD77B3DBE84
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:48:52 +0200 (CEST)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XYx-0003ve-R3
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XUV-0008Oj-SA
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:44:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XUU-0004YD-AH
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:44:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so5028960pjb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uoxp9NPDlELL2FQ2gu3nyY1FzoXUrdVppwvHGKm5LFk=;
 b=vzsjN2FrJjF6ZUnWjnL72RGEE1lElpq0GrBCoh0C31e3KNQr2upOFuJuJB2wrk1Ffd
 Xe/I0b6wFTl75l3d+1/UjlVuHftms2TxGtu3UuVOVYdzO2ojzKLf5f7MQsAYRojXzNFW
 Nkhip8acBz/1h6XuWbIIYrTBHvzn7L4D2MXNBMatPUjdi1ZUyTvhZiXnrf4FmK5T/Tuo
 f2ZrkjfCeSCZcvrRuEiKIvtb0Fw2cn3CxgwaBRknLloI3dGYUhtYY3T09iiKSC4jY1i2
 MfJ85tZ8qzZdLqsLD+mEkpBobF243aw875jBp9azwi4pX88C/ouPZy5FBmjhjo5zPGRe
 NSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uoxp9NPDlELL2FQ2gu3nyY1FzoXUrdVppwvHGKm5LFk=;
 b=C6zISEMk0V+Vucu2Ak4wvUHamapZIbEekoUmlLbn7ELHvsSQYgBuOO1SXaTYDhw4lN
 mnnOMbZaQwRf9ZE1bQJLavo+3C4M5MkHIZX7JiUa/t+RB4hau1FwfHy8VcmtjSp2ITrE
 F1ogvHSAbpvlVWRxLrN60wMoCa6DXskXiYp3dsT7xy36+Y+YBAkDLZ2QgcVIjDc+S+Tw
 pHNjFZl1Qr+5o64I9BpLmECpO26p2rd6XQtfGj6itxTJe771583Bz7fmdaVnVxwTKYEv
 cTGJ8I7A0+p3Wnkv2XlPDBP4MkcYVcfIfGeIY11cERjZ8YVvH59kolXzwOihtzY+tj5x
 kpOw==
X-Gm-Message-State: AOAM533PFL/n/vkoI7c7vVzaZbpGM/hGpx8i9J5lryzfPJDoLfgANy2C
 Hvox9XMp/0L5wTT4mKddoYtiZPEz79ZecQ==
X-Google-Smtp-Source: ABdhPJzEpZHgE4a26+jv76gJBNfcNOiQ1JNseQkp3Bzyjv4MHc/3JuBKSsecdZuyFuDzx4Odyq1iAQ==
X-Received: by 2002:a17:90a:7185:: with SMTP id
 i5mr3903977pjk.236.1627670653118; 
 Fri, 30 Jul 2021 11:44:13 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id h9sm3045388pjk.56.2021.07.30.11.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:44:12 -0700 (PDT)
Subject: Re: [PATCH for-6.2 5/8] arch_init.h: Add QEMU_ARCH_HEXAGON
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9f8e70a-3a72-1db2-6d26-c82fd935b133@linaro.org>
Date: Fri, 30 Jul 2021 08:44:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 AM, Peter Maydell wrote:
> When Hexagon was added we forgot to add it to the QEMU_ARCH_*
> enumeration.  This doesn't cause a visible effect because at the
> moment Hexagon is linux-user only and the QEMU_ARCH_* constants are
> only used in softmmu, but we might as well add it in, since it's the
> only architecture currently missing from the list.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/sysemu/arch_init.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

