Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58576653FB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 06:47:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFTx9-0001K3-IW; Wed, 11 Jan 2023 00:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFTx3-0001GN-Kg
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:47:06 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFTwX-0003Yv-4E
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:46:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id d15so15672608pls.6
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 21:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6pPHxgnaNk9PRHf50nmGpMTL8NM0UT/eRMaJksGzcOM=;
 b=f1ntgOZSOIstpCHFKJsz5Y+er9bCIaJyPLH57V111lDGKBxAZPuzRux8x3gB9LLP62
 YoO+xkM5LZbZYrQiytfUjH3+H/ejR/eU9NrB/akjVFT0Q+mNYn/k9YVhsYVDhS61jPFG
 wYf5jr8C0LeURLzXoAv4m9s46EekZV5Q03aoKPWkinMWv0My+LwYG4HrbqdJaaxoJJVI
 qrw132AigZEf4PMDbrmV/8Pn1c8IR6WhzXBrSgAI0cXSg2xfIruvU4PUCbXV4Nr4d4FW
 qVJNSj9CMA4W6r+0J7JVJCriG+a8aAAD7dUGaFBv9QrfbeQMFmhNSig6YuRy1mhHA9O5
 CRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6pPHxgnaNk9PRHf50nmGpMTL8NM0UT/eRMaJksGzcOM=;
 b=VfJAtu2C3UcUsD37R7RcpWCryobEim0iVs4yjwgaZ9DtrE7PrySj7MLO+5c7y1G69f
 z9qnFYnvMOXKB47gTQsLvrOi2wASaPXjWUYkXEFSLoNczX01G7R/uSMrHtIao2+/zBhx
 8lGZ6yAAQc3d83GvKqoe78PpHKp7ATtTtt/XfOlJA4sNZUX+vfLd0FY+WulOQUewIp0K
 B0mMPxj1tzf/zzeoXkj12MiPNzyBCcN+uxcoCm/TQstCOZcfbR+v+brtJZpeM36WDbkF
 f/IvHOZP0YQHHPDX28yeFUBSvkUoue2burtWoDlwEvDtbpgSoqJoPZdBvkcdrCyVQFHf
 3Pbw==
X-Gm-Message-State: AFqh2kqDfVd01UgsAG/Imoq7aZ3BVS7Vcc4hKKtzQnYd8fC7tQq5rctR
 sfjlggaNHPzzxc5r83DiaehOig==
X-Google-Smtp-Source: AMrXdXvmEQjEMdHnESMJgMojIOdiU1fHMt4HU8mtE2ccOr5QTanBLl8JeKA5QDljB1w8loDO86n8Eg==
X-Received: by 2002:a17:90a:ab09:b0:219:dc24:7595 with SMTP id
 m9-20020a17090aab0900b00219dc247595mr72262108pjq.19.1673415991464; 
 Tue, 10 Jan 2023 21:46:31 -0800 (PST)
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net.
 [63.157.97.90]) by smtp.gmail.com with ESMTPSA id
 p13-20020a65490d000000b0048f8efc53a6sm7653818pgs.80.2023.01.10.21.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 21:46:30 -0800 (PST)
Message-ID: <523f2bc1-a64b-0112-0309-dc107936d9e2@linaro.org>
Date: Tue, 10 Jan 2023 21:46:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 17/19] target/arm: Move regime_using_lpae_format
 into internal.h
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-18-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-18-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/9/23 14:42, Fabiano Rosas wrote:
> This function is needed by common code (ptw.c), so move it along with
> the other regime_* functions in internal.h. When we enable the build
> without TCG, the tlb_helper.c file will not be present.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Richard: this cannot into ptw.c because that file is softmmu only
> ---
>   target/arm/internals.h      | 21 ++++++++++++++++++---
>   target/arm/tcg/tlb_helper.c | 18 ------------------
>   2 files changed, 18 insertions(+), 21 deletions(-)

Not thrilled, because of the size of the function, but I have no better suggestions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

