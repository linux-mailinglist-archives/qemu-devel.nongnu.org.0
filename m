Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F765E4E9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 05:56:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIIM-0001gz-Ra; Wed, 04 Jan 2023 23:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIIL-0001gQ-07
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:56:01 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIIJ-0002e2-EZ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:56:00 -0500
Received: by mail-pf1-x429.google.com with SMTP id 124so24542807pfy.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 20:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ikcn1eL9lUlqNzBJJya+olf4qITBLo3o8+simmK6nDE=;
 b=OZqvC5+3jWf2iDgi/bSy8tpVZxtNuricQNuhpeyplQtj+/OeoA7Zei1c508cYYNAg4
 nb8lgagweiO6AmrpNImVp3VIgMWPp1opRk6bkH3gTzWoynFOa+MxfveA2IwaXX5VxaZl
 uT3jQKtXaZJcMmbCEISSnARyqUi+SkGljB5/fhAulXZnNLVrdDSf3iRqmroakN7lYyDl
 t4pkvMvSQlkw9SeWvtry3UlZnV/z+Kwc5deYFC5zAIRvaDrKNBwcIYwb6Erov2hofgyB
 imjh63qr7HbRwVapJQmC3dhzqQehAVtLDFylQyyPibE8znOS2Dbej1OsqbPJNHTPbJ3W
 0H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ikcn1eL9lUlqNzBJJya+olf4qITBLo3o8+simmK6nDE=;
 b=pvFrl0XfIG6pdgvvuTuyP3HE4e/giPY56SjKV2lk3a6A/OKo3RkNp+LHjsOBq3Ic3B
 zsBHLjRcCrVxT0A9rHABf59U+GCYdPJMhk6f50S1lVk0OF8Cg2hsOeMniZycYelE86B2
 HlEUwjC2pkjkZ6RpIo8JQ8G1Hx8OyOTdQAO/AsPIpqDRoGSkKcZoKM8GAMR2jJmDcG43
 wvRMOIab2t9q66rrytlkzXVpbx7QCCaWoGRUOHlOBmkGH5J6toVIRgHEnd+yysPqKV0V
 tUJCEX4+VwmUQWxygzomxN6bulAopadhzbzNlzoJeHXazvk89e1gCJAwB4CYytTwPO0I
 RoTQ==
X-Gm-Message-State: AFqh2kq9iqkevktW06NwEA6Pw0hrSPrUyNy9FwPSUxC1D8qMwxwhVjrf
 iYX4ne1u22ZQ3hTSmgzULv8v3w==
X-Google-Smtp-Source: AMrXdXtDUtmcrgprinje/GJw+w1UdC01gIrYF8Wa0zVd+ju83aezUNPZDWyGJHawSIZ8lJWz8zXsbw==
X-Received: by 2002:a62:b617:0:b0:577:b52:4ec2 with SMTP id
 j23-20020a62b617000000b005770b524ec2mr46784564pff.29.1672894558046; 
 Wed, 04 Jan 2023 20:55:58 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b00581fb8e665csm10886271pfk.67.2023.01.04.20.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 20:55:57 -0800 (PST)
Message-ID: <bfa16e80-799e-a6b8-a469-4665c43f8c93@linaro.org>
Date: Wed, 4 Jan 2023 20:55:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 18/27] target/arm: Move cpregs code out of cpu.h
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-19-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-19-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 13:58, Fabiano Rosas wrote:
> Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
> a cpregs.h header which is more suitable for this code.
> 
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Extracted from:
> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
> ---
>   target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h    | 91 -----------------------------------------
>   2 files changed, 98 insertions(+), 91 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

