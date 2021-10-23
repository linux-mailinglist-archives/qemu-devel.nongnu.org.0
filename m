Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E964380FD
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 02:36:34 +0200 (CEST)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me51W-0006I2-23
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 20:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4zY-0005a9-T8
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:34:33 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4zW-0003gO-NZ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:34:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id n11so3871379plf.4
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 17:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ih0XlVmKlCVvbOg93OCx23mZaO3nnjpL3p2tpVBBUd0=;
 b=dw019H7YdW5GiJ80Okfj2X7/6x2KbmXBNce6f7YpQZs3BvDoutL2sm3aYYpOo4EcfF
 R1joU29UPGOIAmiE9pvXrOUlvijS9IBjN0lcTvs9hdJT2KzEd/nGDCxB+zgcGBznbRfp
 HpKRflj+fXi1Wlm4wcXyd6n+itbcibdVksEhe96PZapQVxEflrQbLM7mUTCryeJfyy+m
 UqBXFnGybU+O2Fp77NjdiL6+Z6hAbOnof+eYArixKPnM4UVA3g6YjP9MHDPYlBl5XdL3
 qTOswGicr3VWmkS6ZftP29vDvcY/JcxEGvJo2XNe7dNPlQqXQ1jBayzidQ7PzGCqiP1F
 at5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ih0XlVmKlCVvbOg93OCx23mZaO3nnjpL3p2tpVBBUd0=;
 b=baUd4Zr9el9PlvyLo7HzERhri+/vN+cBJSaRpizBiTqXSUVN7AtKG+tVE7HDhOG/BA
 hD/PF7f7gm6bMY02MdXYj0If/uoeh51I7lr+u/SttMEmjdaskdpZWppNYuVypSlTlE2O
 SPgr1wCAw5ek0SL1eKVpAVDIVAdIGAP08j/0zg9Z3los4kn1+SOTbNIfQbkyoreFDAgP
 oby9L0I33yledkbrxWW/7quiUn6T6bO3Ak9t4HQETq2Q5DrpQ7zxPfhwLUMx7+JIYGOD
 lOm8YDaI3zP8lnaMjqci+6L4YgB78ZbgmYZOTsiySIl6OJOSeyj/hTQKhOBh9GoCwvkO
 4WGQ==
X-Gm-Message-State: AOAM5315mv/OeIArrfxjnrvH6E6eVL/hB1hfqubKXgkEJTe4zog2PZSx
 UzrI4YTEgUwDtSMOkVt/Bldx1g==
X-Google-Smtp-Source: ABdhPJz/zlMz+N0AEp0Opvlcmulg1enSgckDYrGnd6BLs0U0TshnY+wLb0C5dg2lApcXZSMF1uifhA==
X-Received: by 2002:a17:90b:17c3:: with SMTP id
 me3mr18352266pjb.70.1634949269238; 
 Fri, 22 Oct 2021 17:34:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g4sm9141062pgs.42.2021.10.22.17.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 17:34:28 -0700 (PDT)
Subject: Re: [PATCH 12/33] target/ppc: Implement vclzdm/vctzdm instructions
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-13-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e979cf1-29fa-8e60-54c7-195c831b8dbf@linaro.org>
Date: Fri, 22 Oct 2021 17:34:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-13-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/translate/vmx-impl.c.inc | 36 +++++++++++++++++++++++++++++
>   2 files changed, 38 insertions(+)

No vecop_list.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

