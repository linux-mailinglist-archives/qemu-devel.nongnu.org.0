Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929442F2346
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:17:16 +0100 (CET)
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7N5-0004gN-M3
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Ge-0000IT-Ft
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:10:37 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7GU-0004sM-KA
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:10:36 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x18so405342pln.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dd62GxI47Qg5ur99WgAfy8RqqlPGaSImffJfdafuMuA=;
 b=dkE5bz/C1E8YU1xyVaO/99esRZ4rd2Mdrn+pCdZBch2dWww+V1E9vac5Ga8B31A9+2
 BRxw3/bMnbliYw4M8CIdCylXnSb5XteWmoW8oeZT8bliYjweW7lTclGm8aFMliA06d3s
 FzL01vQiCLHKrJzhhf489UJsOwFPmpTMkG/QrG1cqA04X02tb/0tcpfBtyxC22wUx3wp
 5uuWlatHoF9/YOOeUxEIzKbKQ5mzcM7kxAR/bqSrEhgCaq5MgnkKOQO3slc0KpvOuROx
 pfRIJMZ3sw6ZMAnHi2yRL60TmBkALerlGloyVyf3Jk1QYUGuKoTmXVxI9sckuBo/nzb3
 QQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dd62GxI47Qg5ur99WgAfy8RqqlPGaSImffJfdafuMuA=;
 b=V6/ZLs8YQqAzps9YcYNRGMhHxOmh1RGH6DDQiMDoCzGiZf5iWQ0oJVGIh/xKdXLwNG
 GPSV9id3m8+XZByVyEhZGTP89wcKNJ8X2u0pWtOIUjr87VIIz0EKEaY0Y0MlINjOtL5W
 aWcqOM79zc9AnMyX7qtBFU7OAo9lWktCdn3B+bb/sExjbUgabQvs/ernSfshlgkMiG4P
 wnlVDP9S8AKHipO8yhGE9EvuqP/vjOQr0oS41bM+jGb+11QjAH6CjUo0SDoleKy/5aGP
 8MXJx5rOxOI408cQi9Fx6nWoQ7/29BpLFpBoSyOmgD/K9HMIFA43t7gqPA7DXptf7hxS
 0Mow==
X-Gm-Message-State: AOAM533AEZj7kW0pdcWcptWO5XzSwD2/sMlhJ1JVX+MsD+uvuQ5nPW0S
 eFZJPf/klzPZgrKSk3eMPyvrM90+fFz+oA==
X-Google-Smtp-Source: ABdhPJxUnQdQa15z2moPjm0Xv8MfY9zX01mWzyJ/fu3aX6MIlzC+6Vs9iBR+ZPH2TpFrQCxmeFafMQ==
X-Received: by 2002:a17:90a:49c5:: with SMTP id
 l5mr1449165pjm.116.1610410224798; 
 Mon, 11 Jan 2021 16:10:24 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id y15sm625420pju.13.2021.01.11.16.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:10:24 -0800 (PST)
Subject: Re: [PATCH 15/18] target/arm: set HPFAR_EL2.NS on secure stage 2
 faults
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-15-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b4e8adb-168c-34fa-2ed3-89b883a93295@linaro.org>
Date: Mon, 11 Jan 2021 14:10:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-15-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h        | 2 ++
>  target/arm/helper.c     | 6 ++++++
>  target/arm/internals.h  | 2 ++
>  target/arm/tlb_helper.c | 3 +++
>  4 files changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

