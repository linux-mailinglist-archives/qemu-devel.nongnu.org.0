Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773C3484A6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:33:32 +0100 (CET)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPC4B-0005Ir-7v
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC13-00040H-8A
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:30:18 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:45946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC11-0007Hp-QH
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:30:16 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so68685oty.12
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p0L4V+oXsAo+KrnZXhCWmj7508K2rjbEZGBNk5ochBc=;
 b=EKtYtxK9JXETUxZW+Si5m6XY7eXSMP5J8idUT3Ef2F9aRkKaWqA0yITCzj2LfAhbon
 HsOLFM3BDQ6mwnmMR8no1GRqJv0fuFNXjYbpyKmS8XB2/HO3L9i6EZiNXhrNZ6SZDzI3
 rg0cYuYLmGYair2D+BDSLX9E2Ry0/2g02Apt3Y53N8q0YiRKhOZ9Z9lXAibrybERO/Kw
 BMwyMuS5oX7B9JqlDgH7saFG6xX6MZCs48NKlTsV1YLD4zAoT66d5qpbw3kic+U8Okyc
 3zEkTX7mxskQ9kzVTh2UHO57Mql0V/J/kdZDcMCalE/JZNm3Svry+Kdi90ZibsZU0f1N
 uDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p0L4V+oXsAo+KrnZXhCWmj7508K2rjbEZGBNk5ochBc=;
 b=VyAZje5945y18DdvxueuEQBG5ENvD+lAKuWmm0t1zsxRF+xEdT1Tvx7NqiY2nQ/TzH
 +iyn6pJMNmIo/N9LlqWkYyRX3UwiA3wxrmdLbjPugXz9GR6fRHyONNhpd7dfA7qEv97q
 raYljAY+k2zhMaQtwk/0HaFBAsQEO/1X+3Zg3P4rOHG/Uaal+ItwlLQrGkDSHM0uLotb
 IBdicdnZ5LfhSvrnn0CfcKB2SeU2RYJnkFhets3pRFT5hMKFeUEUJiMHaKQXryeja4aV
 8sbsBiR/+3DDkLgI7oaWvHE1EY0SJ+rQ8BHxquYjnZf8JwSJV1hqnuDmINbec0bIpFBD
 RaFg==
X-Gm-Message-State: AOAM531F9Ao8AeYi24cTstxJ+cCtIMNZEW1uh0iaEfVN3P+8MO/qaG15
 w2e++t+DqSJUHbZZHpqwS2M/bg==
X-Google-Smtp-Source: ABdhPJxKpxwt4WwJQOZebJYmgEpP3OcNTG6i09JTq14oqGIoACHVg8cPrO0jTP6n53XgPNHnELVgPQ==
X-Received: by 2002:a9d:2f45:: with SMTP id h63mr4832514otb.372.1616625014594; 
 Wed, 24 Mar 2021 15:30:14 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id t14sm834691otj.50.2021.03.24.15.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:30:14 -0700 (PDT)
Subject: Re: [RFC v11 30/55] target/arm: wrap call to aarch64_sve_change_el in
 tcg_enabled()
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-23-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <980021d4-e881-1749-947c-93b9adb476d1@linaro.org>
Date: Wed, 24 Mar 2021 16:30:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-23-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
> After this patch it is possible to build only kvm:
> 
> ./configure --disable-tcg --enable-kvm
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-sysemu.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

