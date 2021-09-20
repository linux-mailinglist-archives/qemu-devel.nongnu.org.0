Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544714119A0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:18:59 +0200 (CEST)
Received: from localhost ([::1]:36540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSM0Q-0007ki-Bg
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLxs-00062A-I4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:16:20 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLxq-00077x-0a
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:16:19 -0400
Received: by mail-pl1-x62a.google.com with SMTP id bb10so11413851plb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GSuEVBq2pFQSZkx3es4SCDmILneqpevOQrLVr7YXF+E=;
 b=tzQT5IsA+EE9PGsMfQ/Gqhhf2p+5XUcMqJxupl4FQcQ7k1QSy7vHAZ0niv4xX0RifL
 HNmK4OaBUtfRvzSgqEIWewI/z6UkvMt3ae70HKXmnnI/Or2XT12YuyjmnTbZ7IqmrKeT
 sbsognaPjCWpxCrhAcDjLKlY2vX514M56dy0r4Th4kfMi5StVM2eAH9wzFC+BDjwP0hK
 HI+cQG6P3djAhHpLokCJpyGvPWtM6uxe2ldyeyZYW8t03KN5ZWaDECUWYW16FahsTxRs
 9xXEImAvYuCxxBoDCsvl3a0+SUMcjHkbhrK+yP0/1noNbdMfxNr424VFqNuVxG3UCzL8
 TaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GSuEVBq2pFQSZkx3es4SCDmILneqpevOQrLVr7YXF+E=;
 b=JDfCIxWFRTFtWBFBYO2n0aHNDYljw/s1jwYBAciMtjGdKXWs4/6QVKl2VY6e8ly7qY
 ej13r1Lx1srCpbZ3gd5oQtJCwRvwm5XzSZI5FzEn2+PWfaNbnFoFp+UxjJlA76Dutum9
 V23nakPBXFM88J/JTdgu1+3LWUZ8U4zqZxvlkahromiPnCOvDW+e3q0HGv4kxPmQPOYB
 EKDTfGxtW7XfMPmy5xPgVk4W9H6XyJChOTYoaiYEvU9goSUInvB0awYhTf+fbicaK6tz
 EhNtDP+FNd+z4dVWnyVGsyBpzfWRDk1L00EfhxgN8qfbIYH90WD7HxTwd4zE1dz6VXtD
 woFQ==
X-Gm-Message-State: AOAM533oatlwXOfOvf0s6nkFAc04KoNTT1CYL4lvu1htaUiD5fcuEMNp
 qA1rVQNJbrLR3c2fLSbztGM81ANArDvb8A==
X-Google-Smtp-Source: ABdhPJxJ9nvk1bGWCAgTIyCu58/VhyiqvXr/JExP71OaHd/0TDuqdiFsGIEJNBGAarpysDEGAEgZGA==
X-Received: by 2002:a17:90a:7345:: with SMTP id
 j5mr39326640pjs.48.1632154575677; 
 Mon, 20 Sep 2021 09:16:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n185sm15795862pfn.171.2021.09.20.09.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:16:15 -0700 (PDT)
Subject: Re: [PATCH 17/30] tcg/loongarch: Implement neg/add/sub ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-18-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d360d8fd-6f8d-9977-342c-b23cdb484510@linaro.org>
Date: Mon, 20 Sep 2021 09:16:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-18-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch/tcg-target-con-set.h |  2 ++
>   tcg/loongarch/tcg-target.c.inc     | 47 ++++++++++++++++++++++++++++++
>   2 files changed, 49 insertions(+)

You shouldn't have needed to implement neg, since tcg should have figured out that it 
could use subtract from zero.  But anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

