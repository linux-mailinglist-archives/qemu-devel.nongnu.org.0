Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241A943D854
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 03:01:43 +0200 (CEST)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftna-000607-8u
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 21:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftjp-00023A-Nb
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:57:49 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftjd-00018U-S3
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:57:49 -0400
Received: by mail-pg1-x529.google.com with SMTP id s136so4699675pgs.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7FG6SLWC2naKwBmkSSytP+dh+kNtZLJ2iEqRbDNc1Jc=;
 b=ryIwVI+V7WcfhWVS4N6m8sGsKYrheGSOEsb740Sk9/mtS44gyP/C7+DU+bJQdb98oT
 DfSV61KE9V9qAsfRf9pJF9sr1Ssq3YnC66lnKnyr+NINvGg+vBiBTUpuNOTGXbXYknCF
 UtPTOrTaDN9Ma4Jn+b6xma+2C15pOOI7TUCzXFgCOhgjpTohmP8uh+DT3DYyqdWmYFtC
 Sz6eBs9E4bmcrqrtGrGQYRJNZRia0eTpbBBKl78iPtQzuBIFIa4z9TkGyw60H5ly7oin
 izarQkwFR+5bDE4QPWqP2Afwb0kbTpKE0hIKtVradr6xdXRcB5058iRjqpOu+O0L2ZmN
 qvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7FG6SLWC2naKwBmkSSytP+dh+kNtZLJ2iEqRbDNc1Jc=;
 b=t1s6WRaKgodxxsKWyKNV/Dgvsfn9WbbWU19WCwuKE2zgenIku8pi8IYiW1UV2FZcbU
 /eSnkJN3W0wgTgNCaBnaK9ovR50yGuRnzqM+mn96H7fW6EggHOgMFlANoK66fhYaHSIc
 6Yo/gDtH/8qru0UQ0WjsQoSaKum4WSSCjSgJF9ONf1/D0SGnzqnhw1jMeaALYGAB426r
 LN3OFjdHHmrXJao37Vh1c69yh3z9NZ6BqxkUsZSG10CEc/52P3JJIbeBLTn7JmMLXf+s
 CMfIzU3QBmNTCaQ3t3AB2WiAQvk6Zmd2I5M+1/Y2kz8u2BRlk7Rhnr9ehEvia5GifzeR
 1kVQ==
X-Gm-Message-State: AOAM533APGnf8kOsr37YMU1PqSdoQQLlsdWIKUeNFu9glq3aaSu07A0k
 2IN5COAWli2M7YVNauLZUC+ylw==
X-Google-Smtp-Source: ABdhPJzc2uuv/MxdTO3+5bQS7enKrLeJSBtuDmFhJyNX+MyNABfTJOX7BiptZPbkON6jxsOj9aGsZw==
X-Received: by 2002:a63:ad49:: with SMTP id y9mr859908pgo.352.1635382656375;
 Wed, 27 Oct 2021 17:57:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t40sm1180724pfg.142.2021.10.27.17.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:57:36 -0700 (PDT)
Subject: Re: [PATCH v3 16/18] hw/intc/sh_intc: Replace abort() with
 g_assert_not_reached()
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <7552416b2ce900eb7abeba1b97ed959bd9b51284.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6418977-2399-a4cc-cde9-e16c84cca7ed@linaro.org>
Date: Wed, 27 Oct 2021 17:57:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7552416b2ce900eb7abeba1b97ed959bd9b51284.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> All the places that call abort should not happen which is better
> marked by g_assert_not_reached.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/intc/sh_intc.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

