Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2286E8D57
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:56:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQ4M-0008WO-4r; Thu, 20 Apr 2023 04:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQ4J-0008WG-Ky
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:55:07 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQ4H-000764-0o
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:55:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f939bea9ebso380480f8f.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681980903; x=1684572903;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qxXhayKx6VYeHXFBtcG6Ps0lfyCROOacwoH2pN4Vfbo=;
 b=hzZgMfByM5Yz5cQTay1St2Dr2SjM+WgUSau/J5jzv9AGovQOLFx6ExXc1/RMTSIRde
 rVGb2zgGOm5WL7zGjhFhqdy2CbOjq199ZZ/QXvaEtquEaUVUEHD6BHLWkBTxpsJ/6/gV
 yWTG1Cz8oCLG4QwVq5lIzZ1wDnQFtvgXPmCMohRYZz3MtOqHuYYWyyobUzmErMAKetQW
 ZeR1TWneA6Q3bKMC+Us0MJZT/ZY9RXeS/8yC+mLpmmaK1a/a/Oy/HvObsU9W3Ki/XASi
 hMl33VvbOZBleHOF3DxkwhegqCBDompT/tHlvmK7FJ5s6YNeXsb+0TpbzMyTmPeO4RMf
 I78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681980903; x=1684572903;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qxXhayKx6VYeHXFBtcG6Ps0lfyCROOacwoH2pN4Vfbo=;
 b=dfUhF07TcRGCvahn+Bik2zZEUDZU4upLgOgN4LykjhmHwQiCqQ6NEtnKd3h7x82XLP
 +OczeZnToCmXbRKu72vMYwvZ31KOncFfCcTOTqz4vzWl6VjNSr/+pWcid3WuNRQXwXzI
 t23APkAG7c/s71AXrAB6QMDvaMgei7xa62MxwvXG9UBirPZAgqem6C+KyogLdceWtOwS
 Vl9nKpdMVJpMdM+BgFpXmWBUEw2DCtxn1n8oSrhPIiLAlgFs2ewLiq9cTkp/cOYf6WGw
 8f3+ZqjnCDCM49iUInspI4KEBW/3jXt8c6orG06poXsGvr5//pft6CiRnV8WgME/ha7i
 xNzg==
X-Gm-Message-State: AAQBX9d0Sb9oC09TaTAFoQtYZIg2iiIC8rRtzfRjKW5zQMiqLSBcGTcH
 eJNl5p5KP7ODbjBcVO8beiFZYg==
X-Google-Smtp-Source: AKy350bInOgTMT1N9xmWxmLqJzAyHkrUlAPC7DiDlUVSqT8O2+0cqddqWUoCR3vAzzgRT9M0aaN+pg==
X-Received: by 2002:adf:cd85:0:b0:2f6:a7d5:adbe with SMTP id
 q5-20020adfcd85000000b002f6a7d5adbemr792154wrj.37.1681980903580; 
 Thu, 20 Apr 2023 01:55:03 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i6-20020a5d6306000000b002fed865c55esm1365919wru.56.2023.04.20.01.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:55:03 -0700 (PDT)
Message-ID: <d9ae9941-4301-7b07-d7e8-b7acb878ce0c@linaro.org>
Date: Thu, 20 Apr 2023 10:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/10] accel/tcg: Use one_insn_per_tb global instead of
 old singlestep global
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417164041.684562-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/4/23 18:40, Peter Maydell wrote:
> The only place left that looks at the old 'singlestep' global
> variable is the TCG curr_cflags() function.  Replace the old global
> with a new 'one_insn_per_tb' which is defined in tcg-all.c and
> declared in accel/tcg/internal.h.  This keeps it restricted to the
> TCG code, unlike 'singlestep' which was available to every file in
> the system and defined in multiple different places for softmmu vs
> linux-user vs bsd-user.
> 
> While we're making this change, use qatomic_read() and qatomic_set()
> on the accesses to the new global, because TCG will read it without
> holding a lock.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> In discussion on v2, we talked about combining this with the
> 'nochain' flag so as to have a single 'tcg_cflags_global' that
> held the flags for the current (one_insn_per_tb, nochain) state.
> I have not attempted that here, because it's a little tricky:
>   * util/log.c is built into some binaries that don't have an
>     accelerator at all (the tools), so it can't simply call
>     current_accel() to get the TCG accelerator
>   * the initial value of the logging flags is set before the
>     TCG accelerator is even created
> So I leave that to somebody else to have a go at if they like.
> ---
>   accel/tcg/internal.h      | 2 ++
>   include/exec/cpu-common.h | 2 --
>   accel/tcg/cpu-exec.c      | 2 +-
>   accel/tcg/tcg-all.c       | 6 ++++--
>   bsd-user/main.c           | 1 -
>   linux-user/main.c         | 1 -
>   softmmu/globals.c         | 1 -
>   7 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


