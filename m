Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B6169842D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:10:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNA4-0006lT-6w; Wed, 15 Feb 2023 14:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNA1-0006d8-Og
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:09:45 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN9z-0007ww-AL
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:09:45 -0500
Received: by mail-pj1-x102e.google.com with SMTP id gd1so8389439pjb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cfCoMOpTocewo43Z2oD1MQ167Q1PuBwWmFcMlgHOYbo=;
 b=Ock5Txm6qDzGGrURc9flw4ydoJFhHf5ZozB855WjelEG7Ua6hAB+o8IWBt/43Sj51t
 e+6274DZCxeacxKpv+ikm1NocyuRrfuqqxS/Pd5v7cb34nFB4yjD++tGq+ZjCP8rZ3kq
 bNxmOCKXkV3xOxJ+UP/aoT/V0iULq9IvnqRQUGqYxJbS3MACKwX2MXdrOL4Ap/gBoqmz
 /999xa6KOhAgPurbOgxpgXE1S0WuUC3id8RGrtWKrYIauuwlEcMwJoK8inltfUVrTF7j
 m4VJhWVOoNc/I9u9l/b7542Fuu/pSBJWP1ji2z0wbjISxlICPUMraAPabMFjxX0KT9R7
 Qurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cfCoMOpTocewo43Z2oD1MQ167Q1PuBwWmFcMlgHOYbo=;
 b=iPdZ0DZGwb4QANw3Zw0vUh3A3onFcGCTftDOoEhBroCS/LyBy9TSbkknv3RqGx9ptn
 CooI3E0/GFfSC1m9pJqVQHbD1tSwCs94Jd7QFjKXM/uUwEToe2q99OyDA/aXBo1TP3H8
 FOh96ZWhg3hEHuVLYJ+NRlbsoVk3SB/FlMJnhtQP0r3w/lqvagXHBjNkgL+6omhSzimp
 s0iPp/g/xRqRSOmsnxT5uadUI/MJzNyT3zTh6cNDiqrcua+l81WBGZDC9Ga05lz5c8N0
 zqvQTkteXbERVoNgDNjQJeXG9gMMGZboTtvkTVmdfo4ofwEt3O06jBqinvX8DMUkZAs1
 soWA==
X-Gm-Message-State: AO0yUKUD5fBAwdn6DtEEGKCwHdZ/LcmSC0RaPbUNG5o1OoPwPkfGIi6O
 0fvy7d8+pNFwKSvPiYFWxJn9pjwxMhUDYiy6c4Q=
X-Google-Smtp-Source: AK7set/6tu0mAEWPnDDuz3jELpyHc/OR6I5bWDj0pcsBNrIkIumZ4OWv4Z0GBfiVB4Xw0ziEWxKmLg==
X-Received: by 2002:a17:902:fb4d:b0:19a:aba6:f223 with SMTP id
 lf13-20020a170902fb4d00b0019aaba6f223mr2524997plb.21.1676488181802; 
 Wed, 15 Feb 2023 11:09:41 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170902aa9500b0019a71017ab2sm10540629plr.91.2023.02.15.11.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:09:41 -0800 (PST)
Message-ID: <d1614df3-cd27-38aa-7927-e0dc79951f02@linaro.org>
Date: Wed, 15 Feb 2023 09:09:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/20] hw/ide: Remove unused 'qapi/qapi-types-run-state.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 01:26, Philippe Mathieu-Daudé wrote:
> Missed in commit d7458e7754 ("hw/ide/internal: Remove unused
> DMARestartFunc typedef") which removed the single use of RunState.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/ide/internal.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

