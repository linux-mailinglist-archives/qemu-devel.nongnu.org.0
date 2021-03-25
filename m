Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657753491EB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:27:51 +0100 (CET)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPP5a-0005RM-GK
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPP4I-0004wH-B8
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:26:30 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPP4G-0005dz-UN
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:26:30 -0400
Received: by mail-oi1-x235.google.com with SMTP id x207so1937877oif.1
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=btukKRAegBqKw3oDKX+a+vdezSO2nTm4M+3DH8u3tNA=;
 b=fJPdqa4+joXYBkiqnnG2tCow18rPpCg2IOWfQ6j20CbSbxJHEQordeHCG217qdsnnY
 iO+nqNks1MxLF3HP2g8N6nK2cIjqo9cyKl0rsnTkyl0HGbqFmY0TRpdbTIHsvK1z/0vm
 nrfnn0VQmYBl9Hsy2BQ3uZte2YPaxS9QFIkfP0EO+vfTg00O4zpyCJZT904PJ/gGlrM8
 V7YXmqkOyGw/X+iRsfE7eYVgd31rTIykHa+PnJe2FGQ+45zMQ5l0bP0Lqvm/aQFVgky6
 CS8Pl+kmVc7hN4LGgbLqvB1+eayRVwAqN6HObhrDKKknXLK/fPSna/lQQyHjssqdk7UM
 vRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=btukKRAegBqKw3oDKX+a+vdezSO2nTm4M+3DH8u3tNA=;
 b=Ot10kN/zkY1I51fYDMRSSx5d4hWQ3BkDTzm+SIaJBFCOZI4iEohP784zEmhEuVVPzU
 vjxydSYbXyJXaEzlqCS05rX8iItYyJmUnZ04aU04qd5pW8F5HT0qN2KGb1CKzmqyjURA
 VNtf9AKGbz2vtpFzP3PhqPlG1EoUhEINlqEddv+qf0aEj4FxugNPwo3PFe598+skbeij
 /4lB7qRIqQJE8SzNtz5YecligYHib12u64ybkZZgBtS4XyRC9ypMFnNWTJ+biipHUNQ8
 ARbbMth2T7gBh5nrITkY5M8BKwmHjT0Pii+cr2Ur+XbrSEIcM58i9zrexVXbMxjWq0nM
 gCRg==
X-Gm-Message-State: AOAM5311ZsLpBQRqpYZ4ip3cMh8fXaItbCTKmHkdkmTniRQOXfi/4sIr
 Y3g3WVjZk5Qywm9yA6DBPNFV4Q==
X-Google-Smtp-Source: ABdhPJytIvoqjpkEWp+JqhdxOZdPqqWRlRT3GLaup6iCHaMMBQv4o6oCy5l0Mb/wPau6kItX1EYahA==
X-Received: by 2002:aca:f041:: with SMTP id o62mr6132737oih.114.1616675187550; 
 Thu, 25 Mar 2021 05:26:27 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id u2sm1075028oic.28.2021.03.25.05.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:26:27 -0700 (PDT)
Subject: Re: [PATCH 3/6] hw/isa/vt82c686: Let ISA function expose ISA IRQs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210324175438.680310-1-f4bug@amsat.org>
 <20210324175438.680310-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d779119-ac30-9bfd-838b-a2c90703cf22@linaro.org>
Date: Thu, 25 Mar 2021 06:26:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324175438.680310-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> The 2 cascaded 8259 PIC are managed by the PCI function #0
> (ISA bridge). Expose the 16 IRQs on this function, so other
> functions from the same chipset can access them.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/isa/vt82c686.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


