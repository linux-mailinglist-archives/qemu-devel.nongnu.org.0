Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5466BD4B4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:08:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcq9B-0002GP-Ki; Thu, 16 Mar 2023 12:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcq99-0002Fj-SA
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:08:07 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcq98-00014D-6m
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:08:07 -0400
Received: by mail-pj1-x1035.google.com with SMTP id cn6so2120876pjb.2
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678982884;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jl4BoFSNkm/Dx5PulAYexwRN3z2BPF4NJacUt8sMmz4=;
 b=BYSgAqIrxTWNwgKBXzcNy9B6zkBGsWs9ty5fXSrawOVZNTUhjovGyCGi8Wp6MSvh5X
 fb4jhsec5/tWt3DQjAspN4krFZr5ZOnuU1+Dy3mHrX8z1R3SOeR03AtFW5pcVxzc93YS
 CeAwa4G/3epupDRqUQejIOI4DYJnFUa1WmjzPc36zMuZYMlbpF3tB/iCnSNL35jkbxfD
 q5fGRMhX6850H/Paki9godFtqwEU2VKriW5m6uQ2vw7EJztLk6CKc3jBnke6c0LDSao1
 CY4iSYzisUZR4w7I5cO6nPU5eaKqQpNN7Kj6LxkLecLBUTFoqtki24U1tvlJG3HWBgTL
 8z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678982884;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jl4BoFSNkm/Dx5PulAYexwRN3z2BPF4NJacUt8sMmz4=;
 b=ycLGW2oNT01vMYrvxWDizWSsQfrkNUfaZuq+cKfYFUZ4Jo62ZuhF7n/CT5ikOvCEEU
 TNjyIKeKcOb/+eG+yXfr1wIGD5JKgtsJs1f98t/+JY86H8TuVv1s3SCnXQcTXNBfHSHI
 nJHu3LI0SW4gBx7BBVYShjL3LGat5LtxiWx8Jq/mfMLYDN6hRvSK1r3uoTWIBxuC2OFL
 JazkCTP1Ji6nI+YMXz9/OFPsnZKMlPPKXYCJrmCxB3qdwtnvbdrB6r1fnyDVxX9yL2YD
 v6arkl5P42uzmdTe3igGIbSspr+PGCKdO/iYby+OLSarSEqQdTBo6WSqIjZsLYz1tkvs
 hkEg==
X-Gm-Message-State: AO0yUKVYbjBYzR+NKPqHH+WHFO8aQN+9gQrUNFdXZTfCCajDR/zLsEBl
 OR1R9sPGqEKfmv3TYOCEm13kow==
X-Google-Smtp-Source: AK7set9i2kwM/7ddRrhXtrauQTJ+B8oWAkl74fyNse6LFx14AHp6RBCPqK5JDvDsJWlal/r3CauH9A==
X-Received: by 2002:a05:6a20:a01c:b0:cd:83b1:4236 with SMTP id
 p28-20020a056a20a01c00b000cd83b14236mr5210550pzj.36.1678982883682; 
 Thu, 16 Mar 2023 09:08:03 -0700 (PDT)
Received: from [192.168.57.227] (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 b14-20020aa7870e000000b005810c4286d6sm5680685pfo.0.2023.03.16.09.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 09:08:03 -0700 (PDT)
Message-ID: <b6ff821a-e9b7-01d0-7f8c-e6a1062fe07a@linaro.org>
Date: Thu, 16 Mar 2023 09:08:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/32] include/qemu: add documentation for memory
 callbacks
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230315174331.2959-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/15/23 10:43, Alex Bennée wrote:
> Some API documentation was missed, rectify that.
> 
> Fixes:https://gitlab.com/qemu-project/qemu/-/issues/1497
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/qemu/qemu-plugin.h | 47 ++++++++++++++++++++++++++++++++++----
>   1 file changed, 43 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

