Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983443E8E2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:13:01 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgApg-00080n-M9
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgAmh-0005oD-IU
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:09:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgAmg-0001EP-2h
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:09:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so8690740pjl.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 12:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FVLiSWS8TKlX3iBAjXDjRJpcjWMeYYjNMRm+gnd1CBo=;
 b=T0dmqxYtvv2mX1/y//roOr57pnEoUHYemu25bDXPSc2DB0CzswcjLI0RaghXzEOnLB
 sTKjwsHaHHF8mc/crW5f/Z24gfvzIKQuTRuGM3KAd+e8dAJtQRhuDxxsS8jjtCyoNDEm
 hl61Bpc4nxXTfVplOyNzGe1h7/LcRZJNBLQfuwI17ro9KX0iiQdBVVf8uuHsLUd0L/Sv
 R5x9clBT2XPZgyeuuAbFWO9dZIwnGCyQel8GhrpAT6DhOdDsphVhkXb+F0CzWBCqWs+P
 TexlzwpXgGWduQ4GXHzPs8vIRFzlpUm3y3lZ4HTBpxRlObIlW2C21IqVbkD6KpxuFHVR
 RQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FVLiSWS8TKlX3iBAjXDjRJpcjWMeYYjNMRm+gnd1CBo=;
 b=IHCTgq0s85Gt5m85xAYZP2EXaYJIm7St8jr377xSROx30cvouqEf72jc7W4uByt3Ri
 HX4GIcxe4fx2OHDWh34CeLG1g+A6cjnGPbVlrQm33tUc0R+BsvyBXwSckWG7IKEczcrM
 x2bYEIq5OZgtL3l7rf3X3N75erRHQaclv+G+E006LopAMrezIWfWaJhGvcKoCWxuQIQE
 tDRN3z2Rll103XGXdexkj7muemKLJiHUrmtFu9XLj1gouk3DVLULDy5k83UUkmFnJet6
 rT2MDVNgvxxd/K1UdziZCGihkEnCSjYE6ZKYI3wmsDjQMLrCZHpDl5I1axFE47Ha8XMU
 3NgQ==
X-Gm-Message-State: AOAM530VbIO2HeTKprSvOSyDkmDDoHFnZBcJKTz4biCSamk5g09Ss8GD
 as8BObLqIj37BCkeHTWR/HxwkA==
X-Google-Smtp-Source: ABdhPJybpRq7fcoUMFwgeMe9+AROcEMbD8YDTP9/gFtwdrVLcwR8j7R6dAdgXIviWKqYzfdLgU1UzQ==
X-Received: by 2002:a17:90a:1a4c:: with SMTP id
 12mr6418579pjl.175.1635448192547; 
 Thu, 28 Oct 2021 12:09:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h2sm3642507pjk.44.2021.10.28.12.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 12:09:52 -0700 (PDT)
Subject: Re: [PATCH 1/4] softmmu: fix watchpoint processing in icount mode
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
 <163542168516.2127597.8781375223437124644.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ca64e11-611e-4620-ad54-4cbab8e6bd2e@linaro.org>
Date: Thu, 28 Oct 2021 12:09:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163542168516.2127597.8781375223437124644.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 4:48 AM, Pavel Dovgalyuk wrote:
> Watchpoint processing code restores vCPU state twice:
> in tb_check_watchpoint and in cpu_loop_exit_restore/cpu_restore_state.
> Normally it does not affect anything, but in icount mode instruction
> counter is incremented twice and becomes incorrect.
> This patch eliminates unneeded CPU state restore.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: David Hildenbrand<david@redhat.com>
> ---
>   softmmu/physmem.c |    6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

