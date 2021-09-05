Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F55400F24
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:35:10 +0200 (CEST)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMpUT-0006Ij-DT
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpSV-0004JA-4p
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:33:07 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpSP-0003d0-L1
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:33:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id m2so2440400wmm.0
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gmEqarQRcKLmW4eMPYIcG001/2gnVPrpQmk+9koGdbY=;
 b=vDC5kgEemJi6pLaCZ5qbYX7s3u+yA/Q+TsNCyf3mnutuoTDOAZeS4Jc/cVyp9B76lZ
 YF1x40zVhMvQxfWsPM3px6o4nhCjgh0B2NSfbrUZVWGU8gNYzJBjj5HHD0dcgy2zA9fO
 oldMfpjPfu7jLqJf87tPHCQSSHBcxPxTHIgg+NX47VQx3wS/kUPn74av1r7N/58uEYaK
 VfwbXASwC3UofNGdWGcvPslQEhBTtUZwe5EP+Vc1KqaFMEVtjpxyOU+05myzHmwH4kHH
 oQoEg3+urQ/Ikgu1VpQpvNRPMnJOMc0rZAwzmNdkWoBZQ7j6cxCO0SYP5PR0GY5DBCo5
 DuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gmEqarQRcKLmW4eMPYIcG001/2gnVPrpQmk+9koGdbY=;
 b=OwGpvLX9utbX9Y/iOnsCllGFZunDEtyAapq05mN3VOLsjJjV2CSlC41wx6ZG5ldJcj
 YNNZObKKIaX8CutpbNCJdsnHGc+ssMb1BJGPtaduqFpBB/7tBMCMOApJ/eDrDeVsHHKo
 c0WlGOCGC9KTwwwyapKjo//QuxktqCiKEUEC8RRBleqhgsyH+aUblDLxM8LYIZNR+GyJ
 qS23T/IqRoYgYET2/dogs4qbIxJj3tEQUjV0HIcxe69WjHVW+aYW8hAmZHhC2pCWds3Z
 x6vpRflK3yAsaTjL1RE1H8ATYqjGQdKt1Q5d1rs8sAuVH8gjdbeQTe3HP4Zhu4E6nryG
 bs2g==
X-Gm-Message-State: AOAM532mpfP5anO/tu3bP/NZhENQD8H6S3GtiyIZRiVpzt4NRxhC6fpY
 eZimSQP6ilQDEJHL0/AUx1qG2Q==
X-Google-Smtp-Source: ABdhPJzvqjFfA83EF+1f5FTsJ2hFLcW8CZ3MtwHiSkBAE1D1CCUk5dxxS8PZgxTUAhhMTncuQmQr5g==
X-Received: by 2002:a05:600c:4f85:: with SMTP id
 n5mr6492536wmq.1.1630837979990; 
 Sun, 05 Sep 2021 03:32:59 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id g1sm4694640wrc.65.2021.09.05.03.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:32:59 -0700 (PDT)
Subject: Re: [PATCH v3 27/43] bsd-user: Implement --seed and initialize random
 state
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-28-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6705436a-0954-31ce-f93b-b2cea448f294@linaro.org>
Date: Sun, 5 Sep 2021 12:32:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902234729.76141-28-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 1:47 AM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> Copy --seed implementation (translated from linux-user's newer command
> line scheme to the older one bsd-user still uses). Initialize the
> randomness with the glibc if a specific seed is specified or use the

FWIW, it's glib, not glibc.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

