Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3F36DC8B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:58:03 +0200 (CEST)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmZe-0004xR-Td
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbm2X-0001iQ-E0
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:23:49 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbm2U-0003rc-36
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:23:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id p17so7120687plf.12
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jkvnNyrJNLtkG8s5oxoE73q90fnhBeRzcCxq9oauNSI=;
 b=uzJjVVOdkdC1U35tvNko1jLnc+5U5RRqz0InOsvdLIAYBwEMBriiBwALUB71hWckOx
 /X/TIiMltk7LyFFr3fMXGNQeIeuzL0WSZY33MH7YmWFGMLcHpjQlr1j1igZUnDO2iRKe
 g8gGKjcHVAQCL98+cHkYuPnT6CtyzyQSpbcN5a97yJHMM5lCwvgxfQwmNdfFFdnxvwY4
 kUZBC8/4MPpu9iILCRTcxa8uboU1Mq2xuVdui/FdMbvvu5sw2nbVMtDFWDQiDiZIBqz/
 cdYlj5QD6wyT9qDxqYi+zAutLvs6G2k5Ft/IAo9W4sInRTYtODno/uWp90I9hyiT2c0Q
 tDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jkvnNyrJNLtkG8s5oxoE73q90fnhBeRzcCxq9oauNSI=;
 b=Gp6smN762sQ94VPCQSpPGfrXSdAEWD5FUPJApaReURluNAPl/gSn2ANml1Nz0+sIkL
 9qGHAMkJYIOE2a8WqgDDEFgeAIguvnZtgLnF/iP2wRL9lUZAPIZ+4/FgiJxVrNsJyEli
 w0C23/2vTCRuBF6IiLyrTgqag3DTSMNWmQubDoFjdEVo5NCweSnhHDINJCNnm+t7ZtSX
 d1R8EvA9gFaz6OKBNcpH4kkbot+MeTUXZM8NTdIFlkIiF5zzRSSLtkDnnA6d9gdDOjSt
 ZBpx/avrDYmP7YF+qVNXE6JuXeTPxGQnMxi8KIQyKY6/9VVyyHO1xm5bGeckfuOPEeSm
 ZDSg==
X-Gm-Message-State: AOAM533ZflzOojWfos5bNdNYEQ/odQQ1Tn/yJBylOSmnIecyN00cWzqa
 iq0K+qg/zODQ2Z7b8U5WK1O08w==
X-Google-Smtp-Source: ABdhPJzQjFBcFsxezFRiN6yzG3fJwJdYXCGFI1rMRAnUjQeyqU0V+CEQIc1Z0hnKlXnr25JDgHZ3Ww==
X-Received: by 2002:a17:902:b687:b029:eb:6491:b3f7 with SMTP id
 c7-20020a170902b687b02900eb6491b3f7mr30537480pls.38.1619623424257; 
 Wed, 28 Apr 2021 08:23:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id f71sm101737pfa.91.2021.04.28.08.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 08:23:43 -0700 (PDT)
Subject: Re: [PATCH v2 09/15] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-10-luis.pires@eldorado.org.br>
 <6cad49f6-6716-9291-f478-4e0d80034acd@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0d73628-8293-75ad-478e-035d3f1ee871@linaro.org>
Date: Wed, 28 Apr 2021 08:23:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6cad49f6-6716-9291-f478-4e0d80034acd@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, f4bug@amsat.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 7:10 AM, Matheus K. Ferst wrote:
> In our first attempt, we did some efforts to keep prefixed instructions type 
> 0b10 and 0b11 under the same implementation as their word-size counterpart, 
> i.e. trans_ADDI and trans_PADDI had the same signature and just forwarded their 
> arguments to a third method that does the real work. Is this kind of approach 
> desirable? We initially achieved this by using const_elt to set r=0 for addi, 
> which is not particularly nice, but we can look for other solutions.

Yes, I could have tried harder to share the implementation here.  And in 
retrospect, using a &PLS_D argument set for the non-prefixed integer load/store 
insns would have been fairly easy, and reduce 30 lines of unnecessary duplication.

For the MMIRR prefixed instructions, that pain of duplication would be a lot 
higher.


r~

