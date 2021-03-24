Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED6F3482ED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:33:13 +0100 (CET)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPABk-0008U1-JL
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPAAA-0007ON-Nz
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:31:35 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:38433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPAA8-0004ej-SB
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:31:33 -0400
Received: by mail-oi1-x232.google.com with SMTP id f9so22188308oiw.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c55LK+OlWOV+NveRSCm0Wfc7LminCw4CFh9pJMVsnPw=;
 b=g6v1OTJKcC19dOoFK7M7vw3Nfct4iXgpPePG8K6gUWveZ5KwBWoPxaUF2nXHt/DHna
 w2RJUzL11Zku6Aj8g5rVG6YJU6wOIKF6XopiwBGv1OQ6AyFKyg6PTXgMeyJCQCy2NaOw
 pebxexfjpz2cUfnoTbQW/m1xNeoMe7NpHEzg1B4qsWIDEGhPOl25S9+feU7t9p7VI2rj
 xaoXbZ+ui9bIZYv4ws9rGbHC5Q7lhOg9N6SFOJ3qR8ehS9ZNE5WgUlFRQTDcrBFPNocy
 kzYZzvBnHk9/LgP3N+hhBKldGPXVEBrpgPtRKj+xarEwjJE2jVEWE5t3Jo4p/9ki3U3R
 4B9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c55LK+OlWOV+NveRSCm0Wfc7LminCw4CFh9pJMVsnPw=;
 b=rQdN47cXV0qkIRotvDkMIrHgy/BfJqHpmppTOsyUDIF7FDE3ypYrfCCIdyFWLIPoy5
 4kFMyPi2MJ7qQCDgd9SEXTq+BmeWz3aOF+VvleeD0+MbgGQDBhGf/CAwH/CqeQTdn+mP
 /8/yXB/UjcDMJDyt1So+bHaHJHNi1l6atYl08E4Q45nr6L33SP2jVyJDDWEodoqiL3F8
 WrmC1eV/ztBtMB3kmyS8dEFn+6C/2GQugdZgtAH1XaIbRHbNDSNjYfMnx6wqi4RxpCrd
 p8zmyLqsXFsaJ5NPt6fs7XlX+SOCbxZqblbrwimlQLS4sik8X+uDN/f1H8j0OZkyFJ3b
 BfJQ==
X-Gm-Message-State: AOAM532q/AsrO6Ur6X9BOx0PsD+CbYfiEMHJaLTF0OXKqPPU2DOCBgub
 D8tltEuIOJkP1zc6HRIwKmZrY+kHWm0rO65+
X-Google-Smtp-Source: ABdhPJwDAh4bkLSLw/jSyS3tGpx4f3HNtwZM4Se3Mg3DRAdN5al4WAvjI2dDfGCkhUCVzlpA1vJ6AA==
X-Received: by 2002:aca:ad51:: with SMTP id w78mr3601556oie.83.1616617891205; 
 Wed, 24 Mar 2021 13:31:31 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id e4sm609583oie.23.2021.03.24.13.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 13:31:30 -0700 (PDT)
Subject: Re: [RFC v11 21/55] target/arm: move arm_mmu_idx* to cpu-mmu
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-14-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d37dacc1-f4c9-de1c-a517-e85413635444@linaro.org>
Date: Wed, 24 Mar 2021 14:31:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-14-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-mmu.c    | 95 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper.c | 95 -----------------------------------------
>   2 files changed, 95 insertions(+), 95 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

