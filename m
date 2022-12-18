Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4B0650523
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:44:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p72OV-0000VV-2N; Sun, 18 Dec 2022 17:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p72OT-0000VD-5Q
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:44:29 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p72OR-000146-Ls
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:44:28 -0500
Received: by mail-pj1-x102a.google.com with SMTP id fy4so7406026pjb.0
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 14:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6prTFcD2WVjqdnMOkTomeWaQT8fBpShoZCg2xfmKjCY=;
 b=Ab5hxsBxNGmcPB91eUIy6lXEehc0kjwFN6tA7s0d8rA+zy9NKHygsdbHQCbQD9YscC
 rctwi6gVgE9QJPxek0R90dTDJjw7avOHJlxCDbpxUcAsvQc+19+H9HCb7cyHcFRK2Ka9
 +/Zk5/xJ9pAU5AgBsMwxRuM6GP2jRytHb2Y06VjnsfFmmTXbqy0ziWccFwoBWOMS6nNd
 8QEBVdSdPkYU0x/d5drqMKc1vcjca1KatRSoFSqmaSzXFCsaQtc8VFvTkBF8XaAeDQoY
 mjXvAIHmf0pROyKrWw8Qo9iRFYHYZgyFhFd9oyqreZyax1BWxAXhgnpys4oHCjBYt6a4
 LWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6prTFcD2WVjqdnMOkTomeWaQT8fBpShoZCg2xfmKjCY=;
 b=zmvEIGgcwgbONM3WY1mu+r5ITbEkLssUmdUvsRj/xUCGDD8JrS99CIZpsBUZXKZlBP
 cMUnIS4A6tqYLUTDzrYZdDLuixLtByyopvAgNv1ZaA5a0IHzn66TD8VH9s/GMjb0JqMF
 AQDJZWuhuevvxqala5jUOw1YGO6GXZJfnljYYnilICgBDaNgpwuvbxP7iqFodzUBA3ZX
 qGnoFj9x54X538V+UYjRSZ6a96hppQkXEm9GcRM25IYeR/R3sdeO3rW/K4fxPoxwkLFU
 6o4PDyBu94A97dWrsKuA3CW2Eq/es1JGO4p8YD7/bJgMgMXYOZy85xlfpEaUWNMadEYi
 ts1Q==
X-Gm-Message-State: AFqh2kqIHxJMs4NnajflqPRDGhU8UhSGVx1CiKstV8ikYY6Q8q7Vt6Am
 dB9iZ0fGMmX5E849JeHMOPvDjA==
X-Google-Smtp-Source: AMrXdXt7Gofz0lenlAFzayBUiUGnTt/AqTxVfW7QdpOufP0BnX3Gg3elTqWwuKSvCVyPwKRkw+JxLQ==
X-Received: by 2002:a05:6a20:1bd5:b0:a9:fddb:9eab with SMTP id
 cv21-20020a056a201bd500b000a9fddb9eabmr7940978pzb.41.1671403466017; 
 Sun, 18 Dec 2022 14:44:26 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3808:f064:41b8:eb9e?
 ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a63101c000000b00478f87eaa44sm4913950pgl.35.2022.12.18.14.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 14:44:25 -0800 (PST)
Message-ID: <765ef583-ae13-bc35-7f3d-032f4e6dd427@linaro.org>
Date: Sun, 18 Dec 2022 14:44:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 20b/27] tcg: Vary the allocation size for TCGOp
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20221213212541.1820840-21-richard.henderson@linaro.org>
 <20221218211832.73312-1-philmd@linaro.org>
 <20221218211832.73312-3-philmd@linaro.org>
 <aea9ed5d-93d7-6684-1e47-9aaf4860641b@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <aea9ed5d-93d7-6684-1e47-9aaf4860641b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/18/22 13:49, Philippe Mathieu-Daudé wrote:
>> + found:
>>       memset(op, 0, offsetof(TCGOp, link));
>>       op->opc = opc;
>> -    s->nb_ops++;
>> +    op->nargs = nargs;
> 
> We can move this assignation before the 'found' label.

No, affected by the memset.


r~

