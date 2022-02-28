Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0539C4C7BCC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 22:22:08 +0100 (CET)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOnT4-0002hI-M4
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 16:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOnR7-0001Fz-6W
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:20:05 -0500
Received: from [2607:f8b0:4864:20::52b] (port=35369
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOnR5-0001M9-Nv
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:20:04 -0500
Received: by mail-pg1-x52b.google.com with SMTP id e6so11241346pgn.2
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 13:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8VTK0fvKDhzO4Mo2bmqP+DqvBJaY1yq28IxZj/ZEfu0=;
 b=qdcOJs5L5St00PAkqHDEVFOa3wbUpXX/hVKOD0ZR/TnWk5sACdQ4GuS3J14sSGLCIN
 SlDgrQVToT4/RroY0hgICic6u7sSK+K7+CZIYfO9BKM/KyWqNGDtnQKaj8LHJjjF8614
 HW+IInxnLCgqA29s6MVV6eLphfdpr/tVpdN7Lrxdu+7eySL4kFjFIF1Z57RH5u29LAIL
 YocUPl1okafNnzdv/Yav1XCnUzqZBlh8aDbay/CBg/aDIbUW63/d+fuWs6uOAemkBq5B
 7a8pYy3EzN3tRWDhkmyO/Ou3NRs1cQK7YV5JqYPDIy6oWygXx3Q3tqR+G12UW0xGn1Dw
 DiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8VTK0fvKDhzO4Mo2bmqP+DqvBJaY1yq28IxZj/ZEfu0=;
 b=HSIBAbQgXp19sjc7RBbP8Y5lcAQif+JMdbTNwCnKJ6JdXbEwI83Sv6Jt6njpQbagiw
 KwYoXfa/TCNGs7HCFafciRX5Z8mbQOgGYtEwRoAkUr9AxM0Tz6qh6ws5WR6XvCTxd9NL
 3nakYgRU+ayU6Dvb3KcpJQtLXP+bzj+9WNPSG+X65dHSVM/WhxMghsPKzWwi9VVgUniO
 EHK4SAJa40ycRFEJm4uxWMqZvi4224OeC9feLVpSkS7L58gLsstoaiL3JHtEQmeWiFk/
 cXnnyv5ko5c6ph0fVpa3q6aOhfouuj5jlDebe1wagSkIEji8iC+znoJQ3GtvFjmVydOd
 0wsw==
X-Gm-Message-State: AOAM533u2NtxLQ4epNhjWe3p+01y1K06yiEt1sVv72F1PHrFzow1GCJn
 QikaAlvoeW0IhMQNYwauasSLlA==
X-Google-Smtp-Source: ABdhPJxIl6qrIVmK560wtttDzkVUWB4S81IoisXdKVitITvKe5Jp4PETB6SUW2MzPiua6NvxmhznnQ==
X-Received: by 2002:a63:950a:0:b0:375:64a3:f98c with SMTP id
 p10-20020a63950a000000b0037564a3f98cmr19405485pgd.22.1646083202235; 
 Mon, 28 Feb 2022 13:20:02 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a63e750000000b00373598b8cbfsm11082827pgk.74.2022.02.28.13.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 13:20:01 -0800 (PST)
Message-ID: <f558ae2e-5b4a-3c9a-6094-6bda70ddb995@linaro.org>
Date: Mon, 28 Feb 2022 11:19:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] meson: move int128 checks from configure
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220228200032.777433-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228200032.777433-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, philippe.mathieu.daude@gmail.com,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 10:00, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> (note: the test isn't working as intended, the next patches fixes it)
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   configure   | 47 -----------------------------------------------
>   meson.build | 39 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 39 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

