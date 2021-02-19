Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2220931FD0D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:22:41 +0100 (CET)
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8YC-0003LV-3r
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lD8Nx-00049Z-2G
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:12:05 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lD8Np-0005tZ-Vy
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:12:04 -0500
Received: by mail-pj1-x102b.google.com with SMTP id fa16so3959183pjb.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=595R75jp6aA/qFqLhq14f0hccd1YYdJDQfsUxH0wtEM=;
 b=mXzfG6zKxVKyNrgVFLzi2hFYWxDY5s/WaKrI/kwoX7/EB8OkqwbwTGovm8s2j4o+Uh
 UhuvA+jVEJjbHlbgTPTW5H55TdiucSf+Jhj5M1h9221qXuKJacusAEVxaHd0q7OnsqkD
 hqx7M2oo8xfmErgm0Qj3FOoxsfCbfPdTxqW4MGtku/4W30iefo0jOOsl1oDcytgmUwtK
 MsIvGdPNOb8Dl/bY8H1GwL3ZLcos7+EqlJwBAGSuWxvFhSkIwbz+A/eWvk27775DHwah
 bZB9Z8W92rUiDoJKdnbr6i6VcvuI0vwE2FCEGGpO/27Sw8kXkisY0EybwAlUtij9osmw
 c/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=595R75jp6aA/qFqLhq14f0hccd1YYdJDQfsUxH0wtEM=;
 b=ZNTVAmbanfNWnrTinpPOpP4NR4wfRWXKnSdy618PvLu3qKBMdQHdMu7XAww73xbaUe
 qSZAgDPqiX0TpUqMVzBI9ZlJpp9HFNOMPw4VO2K2QTe5HnpN9Puf+Hp7qOAH/qaLmD/k
 NkzoWq3Ix4Xs9UitEBGr0UZmFsaLLofmpo24iuMp5yVF/VJw1Zefw7xCnc98qPCVgrRz
 80h2HX28vzwZbsvempZ4VTkzARMe7VQEVp+m6svK6sG9WCp1bgg47YzJdke8fFUcCHYZ
 FVFPZ6M+zZCQTtzIlmGo4+1eWJyAOAx11XqDKS3UM4dvIGzq44zablLo6kjDoGbaYOWu
 Y52g==
X-Gm-Message-State: AOAM5301Us5ndA4ipTjXNQ+OgXqSqa5PQQgu08Fjtsn4rGbdSOB+4m7E
 Wj0cUfoU2lFZ0TtaKeHte6TMCg==
X-Google-Smtp-Source: ABdhPJzhkYSHMs3dNXwRhgzZbH1p1IWTy+LHaXyWNkpfaOHTa6QmG5mWIbhfEsL7YqEvc/SOsVEskw==
X-Received: by 2002:a17:903:141:b029:e3:9ade:bbe5 with SMTP id
 r1-20020a1709030141b02900e39adebbe5mr10072425plc.6.1613751116455; 
 Fri, 19 Feb 2021 08:11:56 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id j73sm10623284pfd.170.2021.02.19.08.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 08:11:56 -0800 (PST)
Subject: Re: [PATCH] target/riscv: fix TB_FLAGS bits overlapping bug for
 rvv/rvh
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210219095902.3602-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cd7260d-4c09-696c-6a8d-0a74920adcdd@linaro.org>
Date: Fri, 19 Feb 2021 08:11:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210219095902.3602-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 1:59 AM, frank.chang@sifive.com wrote:
> +/* Skip mem_idx bits */
> +FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)

Why not just add the mem_idx field to the list?

The separation between the FIELDs and TB_FLAG_*_MASK is unfortunate, and will
be a continuing source of errors.


r~

