Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22F5B6BAA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:32:58 +0200 (CEST)
Received: from localhost ([::1]:48684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3Dt-0001no-1w
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY38l-0005gr-Fm
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:27:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY38j-0005Zh-L0
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:27:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id h8so13050644wrf.3
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VpcnUfphQQabVQ+JGASkjbkYx/4txkFTFctoBJctcg8=;
 b=d4ZsYMx0J0lgqn7gHWK8YGeP4OMHDQGplp/YkS6vB3SQ8XlOR0LeDx64ReA2rTuOOa
 00/6CujXdXyUDm3UZVkxqUsvs8sGgR+TZ6dZ0IrDB+11Cke5yazBJZ/LAupMjzz/a8ey
 HFwQlOge+1KHMrRxkTnY6j8woaTKjBNIxR4KD0CtIwIAShx4Lcq1ptDbyhTubprbFoVu
 /127r9zVN0gZffDbroavSHuMeQnB7Gn5KYaIFmp/DesvBt3+GZHyvem4/7I6P2fkzDAN
 gaxHYgsBVXm24VoC0pLgDNFWEpaWGEfGIhXHRFDx6MP3HpMU2sov/jpobCL1FU3/V0F9
 Xi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VpcnUfphQQabVQ+JGASkjbkYx/4txkFTFctoBJctcg8=;
 b=fcwCFiluuQB9F2Q1zNH0fTRq9f43l6Ngvay12FuzAzV0cFMYheh2/NL+ya1D6kqKNN
 LGUta35O0Hjis/k77YSZimIQkuF8wVRfVEVodYIREHxfPgFAnD2oASl6M2JQwWO9Kfwn
 KZLtxO19J8pT9mBCKJkCDbQ/auYLWSNmoXnbC2gi0H2yW15Bg29Vm8AoIP9dFt7OhZmF
 xVEWRBvaTEKtmiv1rQobxcjzkaFSc44LT6sMIWmqPRYwMFbXIVMN2D12XQ0Kav7KM+eL
 08Q3P7yucqmLYLVWBx0miQ9cFeFIcQpRO7Z9QYFUKz0+MEC+lTAvbXHaK+2weBV1QOGf
 1LxQ==
X-Gm-Message-State: ACgBeo1HhEmTHd4Ah1JbeGYwAN+tjlG0SGJRTDAn4ZlfLAaEPs6KNqWs
 TfONvmMFI19QS9Nz32Ync2dZrWFfbgBLirxJ
X-Google-Smtp-Source: AA6agR7CxemQ9oAoEu+BgxEHhPciVSItpCyKRnoZsLrO8Vi/FHO3VOYClKNPE2AsIa2Gfxt2n6PQag==
X-Received: by 2002:a05:6000:1c8:b0:22a:5a6d:c77a with SMTP id
 t8-20020a05600001c800b0022a5a6dc77amr7463204wrx.242.1663064855746; 
 Tue, 13 Sep 2022 03:27:35 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b003b4764442f0sm10355406wms.11.2022.09.13.03.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:27:35 -0700 (PDT)
Message-ID: <f6993ee3-5797-fd3d-8f27-fbc16043ed3a@linaro.org>
Date: Tue, 13 Sep 2022 11:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 32/37] target/i386: implement XSAVE and XRSTOR of AVX
 registers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-33-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-33-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
> +    if (rfbm & XSTATE_YMM_MASK) {
> +        if (xstate_bv & XSTATE_BNDREGS_MASK) {
> +            do_xrstor_ymmh(env, ptr, ra);

Paste-o on second line.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

