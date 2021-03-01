Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC8327635
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 03:53:16 +0100 (CET)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGYgN-0005W8-TU
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 21:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYen-0004lR-Mj
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:51:37 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYel-0005vF-SS
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:51:37 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t25so10586944pga.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 18:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T+bWCqBT0yEZKsT1fQmx9shdI6w7CNT+CBhJJn+xYPc=;
 b=e0gOdF5wMige0oscjURLZRmvbMqnk0UEb8x+X70Uep3GGmsFyCn/waDF5nf/f7T+gc
 90UZAMCOsKRoVpM/VkpmF8pBikKcqzuZxAi8LkawL6eanbkoUtv2pKM8MbnvT6TdVee0
 573p+BJSyvhzH7fuyHZ6c1Bj9EzN8/uD1TiXRyNFasW2phbyJAnl9kodrg/qbgRDBqKz
 a9hzTIFzW/keIXa6ybZSjMKDOJlKRG2mNoLyn40YW6wkk2/rdILjMhMHQOL7Uvw3zmwj
 QcEr3w+WnNeN80E8Vy8ZVJ1WxQ47DkplJtCFG+tbIdjdyz79sXwU1AKrj6VLSOfw6Mc3
 pSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T+bWCqBT0yEZKsT1fQmx9shdI6w7CNT+CBhJJn+xYPc=;
 b=sXExYDK1hSBF3bBzqVtm1WjPsB50FqnCrhNlOTk+wqQwJg1GSaRFe4RV4PVoEgwn7A
 BnVXm2JNF/C/QN6Xw/J11eT4906JIguQUeuCYv9QRKIpBIza9Hhqurr5KAirx2b1Xsm6
 WyxU7gWZgttPScQ9+OlV9Mu3M2pukHD1/E5W4TJImhDhQkhM1lP2UW0X1UtP98ZGSPdX
 DLnSP3XmKxcv0X1o4xIAUaON0K7WGX7DM++5glEIWV+ui9o+R65c5JvA1Bl2DRQknjve
 /YqLMnJ8/4+gfALVMdPih+JVBmtQjknTezYeW/eNrj8Rzy2VmwBlamTowhabiydn+KZs
 mvAg==
X-Gm-Message-State: AOAM531IKfOJAawtQPt/cSwuPnnHB45jKkDFyank6rfeCqD3P8PXaUVE
 Lo8pnbvp4ozwO0PHeYYbp7+5mg==
X-Google-Smtp-Source: ABdhPJyPOojhJrKHqWW5gtlldX/IT4saNSJ7T9skWIKFkNa6LTuoKJXwPHnyqVvJi7TQw8lwjx9C+g==
X-Received: by 2002:a63:d057:: with SMTP id s23mr2539571pgi.171.1614567094171; 
 Sun, 28 Feb 2021 18:51:34 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o5sm15083879pjq.57.2021.02.28.18.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 18:51:33 -0800 (PST)
Subject: Re: [PATCH v2 02/24] hw/misc/mps2-scc: Support configurable number of
 OSCCLK values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38a7fee9-4f75-b3f6-a1b7-0260cd67d176@linaro.org>
Date: Sun, 28 Feb 2021 18:51:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Currently the MPS2 SCC device implements a fixed number of OSCCLK
> values (3).  The variant of this device in the MPS3 AN524 board has 6
> OSCCLK values.  Switch to using a PROP_ARRAY, which allows board code
> to specify how large the OSCCLK array should be as well as its
> values.
> 
> With a variable-length property array, the SCC no longer specifies
> default values for the OSCCLKs, so we must set them explicitly in the
> board code.  This defaults are actually incorrect for the an521 and
> an505; we will correct this bug in a following patch.
> 
> This is a migration compatibility break for all the mps boards.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> It would be possible to avoid the compat break, but we've already
> broken compat for the mps boards this release cycle (eg in commit
> eeae0b2bf4e69de2) when we added Clock support to the armsse code, so
> there's no point in trying to keep compat for this change.
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/misc/mps2-scc.h |  7 +++----
>   hw/arm/mps2-tz.c           |  5 +++++
>   hw/arm/mps2.c              |  5 +++++
>   hw/misc/mps2-scc.c         | 24 +++++++++++++-----------
>   4 files changed, 26 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


