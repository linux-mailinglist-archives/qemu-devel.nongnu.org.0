Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE11D34BD1E
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:00:55 +0200 (CEST)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXqQ-0008RT-Pp
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXof-0007ea-6A
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:59:05 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXod-0003l0-2Q
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:59:04 -0400
Received: by mail-oi1-x22f.google.com with SMTP id i81so10838079oif.6
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hb2h8c9OiUrKoBh86Hw6gm55i6DnPuaobmXWtZiF8IE=;
 b=LNEhtsS//pQF1nbSf1Rbkc1LKmErJ9LRnJwyj6FTmVVNpqaArAHM1mMGNjrlTtAVio
 JXY/qViWhzbwRvKO9bxpkGXVKMX49P5Ws+wK6o9axwCTaeNbcJ/szSKTYGDvLyv9a1fP
 c56nKq2KezsnOHDpoKeEwEnziv0ZhEGkbkJDaXh9AMiJYqSC3iInODVV6ibqlkrs5HIL
 fBeNG1ULcryvuCzczfa7rJ0N7YG64XciO3h0KIz4rIkX5M/7b2goE1ooISJFnBrJPkCM
 h/PNnOsgLmYPC9QoMKFyqIzViwvJUpln/ZH8dK49pD69+d2V9elS0/J8VBW/4w7WcAnv
 cPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hb2h8c9OiUrKoBh86Hw6gm55i6DnPuaobmXWtZiF8IE=;
 b=tS5VgS+XTtAd0+jNSczD2Hb5/gKkzldv2NBtE2hZzkZTvQzqRS/t4G9n6ydAA5e9eI
 spFconF+ISP+9XPJ0c6TGbLbHucSviIiFvj9fk7E3VThFq0DIDUIWKJSSpl+Ypu3q7KW
 bDah+m3rWniIlpCl0IYANw/gdryFlSsxtCdHVzIgPyGBHnOfcOJDhk6o53ZRywTPrla0
 7zsauTDX2JGBAWRPdx6cPzimQj9xsxwNbS7iLqcrPIizWLfTb4/b4y1Fi33b75JybHsB
 BjjK3nvKBEuklv3yP/mefntjQDF2q1dnK/UeGHrFi8eTJV94DDYcikha+1A7OCGy43gr
 H43A==
X-Gm-Message-State: AOAM533+db2hEUH0LLwPAlfkPNujSPoqz3soC3fcgxnMlcVT+/Y5dTS4
 BolTwdqVYDhOXp84hsI7YJdOfA==
X-Google-Smtp-Source: ABdhPJzy4Ouk8GwPAZFN1287OQ4bHl0UGFggRT+X7aQVc4bHQ3zXmnPwprOxIyqdM6fq/bwsQP+BQg==
X-Received: by 2002:aca:b7d5:: with SMTP id h204mr16233211oif.18.1616947141883; 
 Sun, 28 Mar 2021 08:59:01 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id u1sm3768969otj.43.2021.03.28.08.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:59:01 -0700 (PDT)
Subject: Re: [RFC v12 18/65] target/arm: move cpsr_read, cpsr_write to
 cpu_common
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-19-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <870ae431-b40c-fe14-2551-d60feec447cf@linaro.org>
Date: Sun, 28 Mar 2021 09:54:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-19-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> we need as a result to move switch_mode too,
> so we put an implementation into cpu_user and cpu_sysemu.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu.h        |   2 +
>   target/arm/cpu-common.c | 192 +++++++++++++++++++++++++++++++++++
>   target/arm/cpu-sysemu.c |  30 ++++++
>   target/arm/cpu-user.c   |  24 +++++
>   target/arm/tcg/helper.c | 220 ----------------------------------------
>   target/arm/meson.build  |   3 +
>   6 files changed, 251 insertions(+), 220 deletions(-)
>   create mode 100644 target/arm/cpu-user.c

I'm a little surprised this isn't going into cpu32.c or something, since it's 
aarch32 specific.  But I guess it's ok.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

