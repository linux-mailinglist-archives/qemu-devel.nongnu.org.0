Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD64FA96A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 18:07:31 +0200 (CEST)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDcY-0004WK-2t
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 12:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDZI-0002Zl-DW
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:04:08 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDZG-0006vA-PH
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:04:08 -0400
Received: by mail-pj1-x102a.google.com with SMTP id bx5so11244245pjb.3
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 09:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=gGCGx5EezHg+skNnBJnxAKw201VV5IuJ/C4nvPSxVeE=;
 b=VFYHCmlesMJgWtFqk0+sQpH++DQWi/ewLRcQshc5Xs8zlkAu+98SstNPdZTxUuABDJ
 m9Wmdvnk4FkG++kDvpLB6q7HsOVvjSnLe3s0bqI0qaLu6IoEMNjfAqnQLEGkLo8Qpzgo
 foUxdF71A0jZmP1Fuv9/+tdqpJ7D9udJFtw/m6yVFkvhm4XCXsW8oWz8XNiX1+Kuf/HP
 I+I0UwByUm3gqBesJvYkYO0ANKjrc7JRqzoIiYNhohRZvYIa+oT3oSvn+XYU1IlszsTY
 e5zoi+S2llQkf2V3vsDen1qhuTZQWfFLp2O7XerprwSfF1GfndzeflwC6N5Hy/OuGRtu
 Vnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gGCGx5EezHg+skNnBJnxAKw201VV5IuJ/C4nvPSxVeE=;
 b=Pf/3y2jUhsaETBWXYJirTzj5pKuT89AXlcbJBRasfUpAvHtfgpbp276kF9NU/cdF5d
 RM6olbYHANi2jsKoAZLPfq08JHnHY+AtgtmNH8/5nIR9y4TMkrnAHverj6F0QB6kdHI9
 N3T4oyboWa5XvtkFdXykH53L4p+MEXZYxIRG8sGJRjlKj66LO33oSEBE7w29oHDL/rwI
 vm3EJN37qXo31cPbWVjmGz5UxWeGLTYwQ7YYZ++Slpumn2+qGNa4v/cW6/ons3qvfdmQ
 w4563OzA3QyUDWIfWD+akQ6qENozFmUGC78vk/Qq4TTCRlcDVbwYN8gDYdajhks6Q+u8
 SYdQ==
X-Gm-Message-State: AOAM533NmnFnZ6aLmVFUuZYvaLK2t9IULvFYDVYyUDhocHH97mn/8uqC
 MM99Fs1t6eqla8SnfFWiYjvUww==
X-Google-Smtp-Source: ABdhPJy1NizOW/qCjycRipJLUgc1RV0cjraPLxCwNABtNhjWLg2sEvpJuHoOXUOCm7yGPiHqqb9VGA==
X-Received: by 2002:a17:90b:3613:b0:1cb:66f4:fcad with SMTP id
 ml19-20020a17090b361300b001cb66f4fcadmr2696197pjb.82.1649520245162; 
 Sat, 09 Apr 2022 09:04:05 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p34-20020a056a000a2200b004cd49fc15e5sm31756186pfh.59.2022.04.09.09.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 09:04:04 -0700 (PDT)
Message-ID: <574f9a26-f6fb-fc02-8d9d-e31bbfb9d2b6@linaro.org>
Date: Sat, 9 Apr 2022 09:04:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 07/15] disas: generalise plugin_printf and use for
 monitor_disas
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
 <20220408164742.2844631-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408164742.2844631-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/8/22 09:47, Alex Bennée wrote:
> Rather than assembling our output piecemeal lets use the same approach
> as the plugin disas interface to build the disassembly string before
> printing it.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   disas.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

