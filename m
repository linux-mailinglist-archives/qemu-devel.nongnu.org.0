Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD435B6BA4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:29:59 +0200 (CEST)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3B0-00081w-0V
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY35v-0003sb-RL
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:24:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY35u-0004jQ-3o
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:24:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bj14so19978398wrb.12
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=cjHItKDXSeVZHQYwHOXqd9CNBHGtT1nAObTMnQHQ2vI=;
 b=zkXHUC7/39n5+oHzqyQ7tDEtUgajo2piwegfZ/F3/7W4uTdpnQYS7nDOaHFx5lGttL
 H7H+ntzPpNN25D5pUbwSeALiScukgFvFY5j97LerpS1sgOzdFJ26/wK1kHAbomIIjJCU
 YGvtjkO2mWYbg+MxVxW6ZQhE5+ekEpmuS9ppDPaDquJ9SD9UI0jRqUwU6ob6wKFkFXQu
 N9gpCk/lBx6Lg3iwuZKNIumfdOL2AJvACnDau9BZIE/76tTobqSoE63unYEj9/VjFk+7
 c6xAn08Lf8hz5FmfWuytZ1omFOLribudKEXDRgV6DZx8rrPVcVO1dyWzEs5XLLVVklL8
 WFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cjHItKDXSeVZHQYwHOXqd9CNBHGtT1nAObTMnQHQ2vI=;
 b=1SxTspC1bCn3b/uPQDYf6KrQtrJks1wBCFBczcg0kTysWtX0i/JfPRT+47OSiR8gV9
 fZ84k+pSkmIFpJ+Pz3q+D0cqhW5GfB/92VHHbfLo2O4IjGhXcWGdfAnVWtpfIEVYBkuc
 evcSpUdaBufYMjoUPrMskp927jR+Jgmg6trd7zbvN4Dt9UzXE20c91oVrjHfnd0IkaY3
 KXrbmK1e3YIAwyvySg1i6tiUEXM2duaa0xCqH6oF1oJNvfuwTw4cdMkAbXVYV70aJb2u
 iD6G3K38lRDsYTWb+Sn/LYtHkw+E+ZiM55h07Ie4Wr+mMvHxg7EAvlcbu2uBUu3S7cgf
 UEvw==
X-Gm-Message-State: ACgBeo0FOaRQ72eGCGuVnh7zSe0V1TQXqul1ZHp4alg5471/uwImwZpY
 hNSXAz+sWs6++pMVOZSfeqzepw==
X-Google-Smtp-Source: AA6agR5bOtanUQfDuaEnCyL3AILE8ihItMXFL6WHHJLGmn+f7Qm1XobKe8Vxqjgo4IKags9m0hsLkw==
X-Received: by 2002:adf:c713:0:b0:22a:3670:b08d with SMTP id
 k19-20020adfc713000000b0022a3670b08dmr13883373wrg.175.1663064680284; 
 Tue, 13 Sep 2022 03:24:40 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 cl2-20020a5d5f02000000b0022a9246c853sm5115138wrb.41.2022.09.13.03.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:24:39 -0700 (PDT)
Message-ID: <c35c5eb8-ceea-e19e-5275-3709201ba7d5@linaro.org>
Date: Tue, 13 Sep 2022 11:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 31/37] target/i386: reimplement 0x0f 0x28-0x2f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-32-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-32-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> +static void decode_0F2B(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
> +{
> +    static const X86OpEntry opcodes_0F2B[4] = {
> +        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex4), /* MOVNTPS */
> +        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex4), /* MOVNTPD */
> +        X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4),
> +        X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4), /* MOVSD */

These last two look wrong.  And if you don't have those, you use ENTRY3 instead of GROUP0 
in the main table?


r~

