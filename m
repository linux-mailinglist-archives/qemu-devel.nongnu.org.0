Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF93C4119B6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:23:41 +0200 (CEST)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSM4x-0004ve-UL
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSM1W-0002cW-3L
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:20:06 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSM1U-0001dn-5B
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:20:05 -0400
Received: by mail-pf1-x429.google.com with SMTP id m26so16746869pff.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GyAdnwk8e8OYiYp0Zr+lZZLbYlHeAlkVJrBZU/eLdO4=;
 b=xrrMQqNuGuUYUJAghbcWd2mPgMJell+WNg+KuuZpWQu7sbzceqFz6zAm+VMZ1yKGcX
 WFm/Z7xtXkMMdatnF8miCNX7lBpcHMQZKUfrg+KgLPhS0w6x1Qt6auNMtf18U821+1LS
 mMkau9SbUwFKzENgly+nG4kpo6Jw0/U8E0nHkmcOBJRdOwZv+A1/XQi4xAe1VoiGJxsW
 2qziEMFH/cbchctSLiB4F162GNbKQdFHdlD1RrlGCC0RqYbBDsJ3nkqtekwLPHUtNDNU
 Jl6ut+6oKlSPIEQyv2je9KCwG2JLcJUBWFiGygi77EU0gZXwOEifzKHIISr3ozJiSLq5
 YX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GyAdnwk8e8OYiYp0Zr+lZZLbYlHeAlkVJrBZU/eLdO4=;
 b=iOb3l6NGJXbhDQtbxCm4KQ/WTtxlafqH2lqHQGKpUvbGAqBO73hnOw5kkHGmYsDQur
 VJXpvRYKSICoMSR7NllAoSnOXDBpPFz4pqd+gX/bpWrQOkODjM3muaP2RFqEaigmdyPb
 +qcR+FnLr1srlBswNdABZOrmESVIhKWhXUaXq+rowZQO4V+WSXgIgXD5CTZ+4BxNzvhY
 +sHbWwY85dFZjD+Q0LHilPTq6g68kubQaQbXw/iif5nX2wdlg9nEYZGDQzb9shfH5jJH
 hOmFEIxOxXtrekmYs+sqZc5ntJRQoBIjiQwhVzje4J7a0sSSuv3HE8/za9vFlr94C5xd
 Efdg==
X-Gm-Message-State: AOAM531bsaSP7GqBDc5CoT2YndyAH0d3ubYfJLSs9SQvFmpibk1/MtT1
 /KFrnd1UIeX00HtVCu30ToSUpidxmLEw1Q==
X-Google-Smtp-Source: ABdhPJw0Oe5Fe70uVoLfXynYmT5LuXfs5X6AvHlLc5fSxr3FMrFOvu1VAW58ipQBxvWjz801TGidkw==
X-Received: by 2002:a62:4ecb:0:b0:447:a583:ce8f with SMTP id
 c194-20020a624ecb000000b00447a583ce8fmr8501718pfb.59.1632154802592; 
 Mon, 20 Sep 2021 09:20:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y25sm14826165pfe.28.2021.09.20.09.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:20:02 -0700 (PDT)
Subject: Re: [PATCH 19/30] tcg/loongarch: Implement br/brcond ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-20-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65a138c8-9160-f5f7-f4bb-3323a0e26961@linaro.org>
Date: Mon, 20 Sep 2021 09:20:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-20-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
>   tcg/loongarch/tcg-target-con-set.h |  1 +
>   tcg/loongarch/tcg-target.c.inc     | 52 ++++++++++++++++++++++++++++++
>   2 files changed, 53 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

