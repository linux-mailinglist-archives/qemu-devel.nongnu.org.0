Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6565E503
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 06:17:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIca-00087n-Rs; Thu, 05 Jan 2023 00:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIcY-000879-PZ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:16:54 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIcW-0006T4-Sz
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:16:54 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso910699pjp.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 21:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AvDCK3v/YAIQ5dVj+jc/0Dp9A6RoPuFTEl+MPJ7HJ/k=;
 b=K5gn7/CwdLJqQX88CfJILSfT5Ma1Yo+/4YZMZDf0huATPeTn3eFjmimiKTQGkkCn2Z
 PgCBpxRuOJ2I3mNN9u95pp8xgSAKTcLAF2WeCTwvDQ3PTdgIUkYfrVW1kg/PNp4o+WJ+
 0Hy/0ZQLWrIkIxDGkVqa1NzaY1uPxgczCejNj1klaVt/Bnrm/R/HSCw54EZmuRa5zEUX
 ogZmTgln7p0fijmFtZxDCp3Dqd3mp5Kl/XcsZzHLqwpE0QqXYYN9VFBYXdiIxyDIxzNH
 FjL6d5hkmTa1XP9D6XRAOuw6uiXJVsW5pBm/MKXkq4cj4J7U6wy6uJzt+1cf1bmEF9Jb
 hjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AvDCK3v/YAIQ5dVj+jc/0Dp9A6RoPuFTEl+MPJ7HJ/k=;
 b=lutV9zjhdheyz9yuP2McNbpmiUwUjLQ2QtIUlfY2taoqoxdro4NK/W1GCl1QRlCEnM
 mtPcv0yQcvMXMj71z5DVr75jTrF2PBg/e6UijTC/5ITYMcCPhGC3UM9GBGJvlUYleM1c
 MV2xr6Xl070PbrkOIZHwUstuYAGHs2mLsrazwf7REcWVM8+ZG1KUAwieOw+sG3pVmyyf
 1yIoR/41hI715RzBDts6P/JjO/nohCv40q30GZ8YBQxuROUqdtE7v3z7wvd/NAFpv7/G
 Eb631rzg4b0vs6fRJuG9SZwkQbQN3yn9lF+7l2fYRa1SnsguZeBpbYBSs6QpLiOE0DI3
 qF4Q==
X-Gm-Message-State: AFqh2koZfZjWAoXLgRk+lZwkki8UY9c82J2BkfvSalfdwSnrSRxV6Wsa
 ZN5fKaRd6yWPsTyoYsIHhCbw2g==
X-Google-Smtp-Source: AMrXdXsIaDindmYGJoPfWIlPHwi2GjsFHyOMyg3padDUXISJkn9JxYUwNWV7lzZ+Fk6B2nLfe65t1A==
X-Received: by 2002:a17:90b:2688:b0:225:f8ce:5cd8 with SMTP id
 pl8-20020a17090b268800b00225f8ce5cd8mr35826463pjb.4.1672895811201; 
 Wed, 04 Jan 2023 21:16:51 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 on16-20020a17090b1d1000b0020b21019086sm2660465pjb.3.2023.01.04.21.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 21:16:50 -0800 (PST)
Message-ID: <3a3842e0-9d1b-08c2-6a25-ceff8d80a640@linaro.org>
Date: Wed, 4 Jan 2023 21:16:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 26/27] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG
 code
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-27-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-27-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/4/23 13:58, Fabiano Rosas wrote:
> This struct has no dependencies on TCG code and it is being used in
> target/arm/ptw.c to simplify the passing around of page table walk
> results. Those routines can be reached by KVM code via the gdbstub
> breakpoint code, so take the structure out of CONFIG_TCG to make it
> visible when building with --disable-tcg.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> This is the least painful way I could figure out of doing this. Let me
> know if there's a better way.
> ---
>   include/exec/cpu-defs.h | 6 ++++++
>   1 file changed, 6 insertions(+)

I take it back.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

