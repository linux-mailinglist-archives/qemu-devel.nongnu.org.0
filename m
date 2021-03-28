Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5F34BD16
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 17:56:04 +0200 (CEST)
Received: from localhost ([::1]:42334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXlj-00050b-7T
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 11:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXkd-0004ZS-8N
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:54:55 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXkb-0001DX-NE
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:54:54 -0400
Received: by mail-oi1-x232.google.com with SMTP id n8so10810248oie.10
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 08:54:53 -0700 (PDT)
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
 b=JEXRUHFT6+nOQxlnS01MI6dSJRAEJLevynMXx258+FhOEM8hMM9iQo+ZAIaf7V2uls
 8j8nM6/NLIR4EXXqMeIYsBYX/hTIP/JWxHw0IU79667fpGEdjesTtlK+eFvFddV7vJ+Q
 FkkJPZ3wwLKqqZGfprwrQ1YEZiY4uYXC/Dde9sm6gBdOomro6IsvEeBFesjBzau884Lt
 NJ54ntH90hwm2+s+Ao4F+z8jqo3UHE/ieoS83mtYvqoASKRDtNljZNz71w5f13/r8sKI
 G18ZePIEozFL08cPFZjFuQ2RtNT2L+OkBJF1xKRPy/eNIE5OEVY/sOtn6SG9ClgTV8A+
 8HFA==
X-Gm-Message-State: AOAM530CK2+QR9079wBgwS9zcmLL1k1EEkjY/FLbIO7umGgKpg1O5WeG
 KP95l4P8CfcC2zRf1MxrroDVHA==
X-Google-Smtp-Source: ABdhPJzlAzWaiBAWoKWS0lgKzcptlw1YoWRRVANdHABA3Lh97lM/jbD2xHTdKjBRl5XqJDr1KBgUrg==
X-Received: by 2002:aca:f4ce:: with SMTP id s197mr15979932oih.94.1616946892669; 
 Sun, 28 Mar 2021 08:54:52 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 101sm3771817otj.44.2021.03.28.08.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:54:52 -0700 (PDT)
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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

