Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23640651226
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7L6l-0004NU-NQ; Mon, 19 Dec 2022 13:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7L6g-0004Ms-Aj
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:43:22 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7L6e-0003Fz-3R
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:43:22 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 fa4-20020a17090af0c400b002198d1328a0so14673077pjb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 10:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=st5k9o2jxx7yPgpGI/mm3SAMDYs39nV2bHtPW2aePnU=;
 b=xAX/HWi4NH86GJRBuS7zUdpNuEICiSW/AAqU2tr1VXLQuJh9Q/pZwqq1i22Ie7HcIF
 mmZvD3hLrOiQHy418j5z1+5tZj3lkFbwHXARn6x5pELY3IY0AN5o6RayCBO3R8x5Fuuk
 9PwLpQgQk5hfe0V/s6wm9JjGqK6eN4aO9zL8hr6sVWPQzEJeVcWjoIEW3TP3bmqQ2pCS
 yfQvmsmOEA9jB4bpv7OXv+PfDWcA/cuTMCSyChmdnr+TLoTEVFuUbjNFyte6RZ5SsVig
 lKLyz6Fmgm0XrwRy3UMsRnvAB7Wv2et4mJnLQMpTuasz/DJ0izn0TNgb1cE4+Is9M5pr
 tv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=st5k9o2jxx7yPgpGI/mm3SAMDYs39nV2bHtPW2aePnU=;
 b=PvcaGC5gCnmHXuEuR2b8CziSPKOldKNhTxAr41s/1XWff+p2zBTVEdqGH4k+0uLzv2
 04/jtVkieWnqeGOQ9MDIQX6Nyn3TsYEojmZe/TWlxQ3x6DJ4N5f+9GEr2XUK5rgHSSKc
 AB0G3tFbdLd8CE2tceREMwLdz/Fc2Yto4jre1Jt3mOfbOMhfIDhAbu77NNr8Gy37SjyM
 F2nCJH6UUXWsry5PM0cDLARIaeVBAHe+giCiE3wzAPCisRxhKywNH1VeSN7EiLGS0hih
 nswONcdObY9UujzrC/fy4UZOLPSeYaUywPuBuZp0Y1ASggvwh2AvFawNFjqqEx3p8FyI
 fHUg==
X-Gm-Message-State: AFqh2krbWc2qEeNnkR6Uio78oBoevgP+1CnyAhzMtUJVVOAld4w291nm
 45grNSrtyqap/g9Ctqp+VwLiTvQF+6oVNizk
X-Google-Smtp-Source: AMrXdXtQtBmvuDN6FvskYFI54u2MabUrPbI63E/L+9s05MbKQU7vOPqRTa9ZgeWMLQBoJDIN1fuDOA==
X-Received: by 2002:a17:902:e993:b0:189:e290:c65f with SMTP id
 f19-20020a170902e99300b00189e290c65fmr9365176plb.66.1671475398620; 
 Mon, 19 Dec 2022 10:43:18 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170903245200b00177e5d83d3esm7539500pls.88.2022.12.19.10.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 10:43:18 -0800 (PST)
Message-ID: <86d75ccb-edc8-27df-dba7-39f720435236@linaro.org>
Date: Mon, 19 Dec 2022 10:43:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] tests/unit: Restrict machine-smp.c test to system
 emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20221219170806.60580-1-philmd@linaro.org>
 <20221219170806.60580-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219170806.60580-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/19/22 09:08, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daude<philmd@linaro.org>
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/unit/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

