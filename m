Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77384CDEE7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:48:10 +0100 (CET)
Received: from localhost ([::1]:60084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEqP-0003rU-MP
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:48:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQEmY-0001wz-HH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:44:10 -0500
Received: from [2607:f8b0:4864:20::1036] (port=56013
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQEmW-0001J0-UZ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:44:10 -0500
Received: by mail-pj1-x1036.google.com with SMTP id gb21so8275354pjb.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=No5I+B/UyabHwpWUjLgBiX5KZHyySmaYXtzQvXuRjEc=;
 b=Bv8WcGsUUjhLVzBrjX/FshnF2IQnTTUXIwm0hlpXReA+k50dBqhiE7KOfjwcnTLu4F
 9LVSPFKnVEUebPDS0e6hzCzjFEAZ0mBvyD/1WL/iyQeCJjhNEFDjvflGSZZcvEwcvyHA
 dcydBQAXjjvGxLg6COI2QP1WFU/yfycikXyQqOrIyV9qzjtcFFYtceOLaDPsusMpU2J0
 zeoHXS7k/eRCYUz17I2di4k53edgcWqC6jNPUTx3izPQ0fhvX29fSutPpA7N1/AIe1sf
 OZft9dCYAbkIRzpQnn4raqsR7tF7exYpYVI3taRLnpiELjeDPGggOlSTvyq4bE7CEB9V
 NEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=No5I+B/UyabHwpWUjLgBiX5KZHyySmaYXtzQvXuRjEc=;
 b=H9SShNqtDbHszaFUxc9obZjWESEigFfH4HOyDrkCiGOhg4IPZkEdAEM0ogBg6n34SC
 sPH2c4OrB7YLATojLc0LiWepVEa2ATB0f0evpVdH6mqqmWo3FEL6uw6Rqm09TJjAKOaP
 pr23TNIU57oWimhq9b29hGa0xWj+aNJvgVqTGDkggftWGpEbW1mgA3TlHFMznb3vAzWu
 9hX4M69YeDE9ur/NY+txXkrp6w+ySZZW0Y5bTvVsVYJJKouiB4YeA76cWqMlAm5cT1So
 ZaT57dZQ9syBKpxMzmqnHlWSRLp+y0Hyhb2l1g+94/nMp6azna1TN+B+HFaKsN4WXPzb
 g0XA==
X-Gm-Message-State: AOAM531WuIxJovRPV/QoRvX6BvBdBO2E4e0BAddaHx4SHkwjM55+sofc
 Cm0nPGL1siwJuoRFQlf2zjWO0Q==
X-Google-Smtp-Source: ABdhPJyalyXzTyesJKSmG1dzkKl7Ws0C0ngYgmPFwA65wcdc1c0pY9j83dOIm/UVrHABdIN3razNpg==
X-Received: by 2002:a17:902:c944:b0:151:4288:2ca2 with SMTP id
 i4-20020a170902c94400b0015142882ca2mr128891pla.145.1646426647549; 
 Fri, 04 Mar 2022 12:44:07 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a056a00114300b004cc39630bfcsm6655611pfm.207.2022.03.04.12.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 12:44:06 -0800 (PST)
Message-ID: <aef84322-12fa-6117-010b-d5585befb1ba@linaro.org>
Date: Fri, 4 Mar 2022 10:44:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] m68k/nios2-semi: fix gettimeofday() result check
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-2-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304152704.3466036-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/4/22 05:27, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> gettimeofday() returns 0 for success.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   target/m68k/m68k-semi.c   | 2 +-
>   target/nios2/nios2-semi.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

