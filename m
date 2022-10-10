Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A905FA14D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:42:04 +0200 (CEST)
Received: from localhost ([::1]:57646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuuo-0001U0-R2
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohuly-0007xU-6N
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:32:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohulw-0007oV-0F
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:32:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i3so11049365pfk.9
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ZgMj2y4HYSUOyzgC37Vq3Ksx5mK0Idmca+C05WU2GU=;
 b=NXV1GXZeJInFyHwmcueguRypsBcHyH56gF1dZHWC9MKKMwoMKm4jkuOdKd5kYentZW
 WPlI3Qxh7dQtb0vy+UVGhAkw4SUkjxAgkCMg1WtckG5KaACWRLDRuDVSllLuhHdL1b4Y
 5UGvph1FSeRYYLsCdPyD3+rI2A9S9T6vvITSKMDgAs70arhoYQfOXezirWiTBFLy47Bl
 +HXnRvkxchkWqb0XKZlBm6z4JGrS5TG25kKsISyrVaRfU8uCXBU4cPQpnKNPtGgNJ21o
 FbhBcbF4DXv7Kx9o/xHYztGznuuSPHqavuzfO9edRe5jvpQjnW+1Cmu3LKWof71MGMK3
 9Y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZgMj2y4HYSUOyzgC37Vq3Ksx5mK0Idmca+C05WU2GU=;
 b=aRfbKEp23Ho6xSdxOVgbkNWzzqbJqY/Ep6AuS5cki2tj9JoVlcYe/ol03dJQ9r/gpX
 ZeCE1P3gTgkOQ92mw7+KLr9ePHHKvBKH6PS3Bi4g7asBmWPEHfcLYz/Zqy9WQyXJwp3l
 +3Zl0f7Odo3Znsq2Io9ublLQ+E07HGGFpE0QdzEQ8wwd1h/WN3pUQHWGBXj6dBCNOw5d
 eC9Pn/A1kYA/3D1BZR8jocmiGWzLDBxul3iWH1pu6ue0kuobHiLNMzsff8Kg6byVUVCI
 z+N9R2yt9YwhqBGEuZZAvCNQyuXpo0LOMUskXPueza7rp30feAc5SvRMyt0AYV8l48LY
 Bfow==
X-Gm-Message-State: ACrzQf2NWLZJJtrVz2yz9/BSw6R90uKxv+JPs4rGIt7s6JRZLOg2ZJx5
 u8ZLzJ8LdvMDlnRvxtFJuyRmFt2HZwKz1w==
X-Google-Smtp-Source: AMsMyM67sfBiqFOgpxZQOFPhNmV9U3MzGKAj3U3z0oBjUyxLXwp/qlcav88mE6Yanqf0+ioW70iAUg==
X-Received: by 2002:a63:194b:0:b0:457:7295:8de0 with SMTP id
 11-20020a63194b000000b0045772958de0mr17381296pgz.612.1665415969460; 
 Mon, 10 Oct 2022 08:32:49 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a63d94f000000b00461b85e5ad6sm2592951pgj.19.2022.10.10.08.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 08:32:47 -0700 (PDT)
Message-ID: <d56e7a78-fef4-b10b-5757-5b2192145c95@linaro.org>
Date: Mon, 10 Oct 2022 08:32:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/3] linux-user: i386/signal: support FXSAVE fpstate on
 32-bit emulation
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221010142127.295676-1-pbonzini@redhat.com>
 <20221010142127.295676-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221010142127.295676-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/22 07:21, Paolo Bonzini wrote:
> Linux can use FXSAVE to save/restore XMM registers even on 32-bit
> systems.  This requires some care in order to keep the FXSAVE area
> aligned to 16 bytes; for this reason, get_sigframe is changed to
> pass the offset into the FXSAVE area rather than the full frame
> size.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   linux-user/i386/signal.c | 129 +++++++++++++++++++++++----------------
>   1 file changed, 77 insertions(+), 52 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

