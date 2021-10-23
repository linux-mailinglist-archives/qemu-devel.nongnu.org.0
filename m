Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03488438586
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:17:28 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOON-0002e0-3n
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOMg-0001lk-Bs
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:15:42 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOMd-0004xr-U8
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:15:41 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 187so6820854pfc.10
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6N2kGH4J2c6/2QREbPtINQzMpG9bzzNkvihSlu38GFA=;
 b=KtG/u+6NJTsq4g30ylUSivttOw8+ezf2DzFm9PwCZt7HnFth+Oe2E9SAttRI/02BIy
 FbFWYfJq4ZkOtdRORki8RMY3tdv+ilCsKOYTe7PPg1Cm1txw0XhvCzy/IXO9izmkoVcU
 kL2JYQpse6d3/dTBypbwlW9WwVkqmAHKr9pZHOUkOloPEAYnTPq0VobKkdPG1aE68UA9
 FRNnnGKNBl7x1iHPdqeqMik0rXdCnZaA+hn316QeAtIsmJya4rSQuEe3MW59MCauxUSO
 QbclLskbnUUBUn9vgPr3XGqOJ5hhVzYtinpg/3Wn4SW65pmqkPVC3sp2eEWN9PB/CTDG
 bjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6N2kGH4J2c6/2QREbPtINQzMpG9bzzNkvihSlu38GFA=;
 b=hy5BaiRy0sQ0RnQksFrAfOWkKtMURyvv3Rj/81E9ike48+DqdTAy7BMhNcY9TmSReF
 MlO14XhHd80LGshtW3qx+b14iu5JBeB3QjNILd/qyvepEA4ogFbrtqCKXDFWJ0UYdUH+
 emo6gP92gvld+mDBQcdwxo2OOXtMvqy1/rpHie8dJC8Sx+nUTqImFCJLS9mq/YmfAM+F
 toYSr2NYAyytoF1tqUyLqpnnylzhPt5WYyWVbFVbcOsfNkVVvKsVVrU93CGPtnec2EQP
 ucUUXE7WVd0MF/aFBV55Yzofy26srIu3zPmEY4NA74R2SVI/d18on4MJ+mb6LW/kZerE
 mBsQ==
X-Gm-Message-State: AOAM533eIh/hAFSRSiXDJ8LWIGTwEKpXpMPqQUJFCU0yZpIEY0fmdlfG
 xnmKTM7E3S2R9qZYw9pl4JlKNw==
X-Google-Smtp-Source: ABdhPJwpLlG8j6ekoPWEGAfGYywVYAJS+dQE+VS37USZb2PZ/Suh0M8XJWhLu4C/rX8R8opzLa7WZw==
X-Received: by 2002:a05:6a00:1311:b0:455:c1f8:4637 with SMTP id
 j17-20020a056a00131100b00455c1f84637mr8389127pfu.83.1635023738469; 
 Sat, 23 Oct 2021 14:15:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q15sm10710841pfk.16.2021.10.23.14.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 14:15:37 -0700 (PDT)
Subject: Re: [PATCH 30/33] target/ppc: Implemented XXSPLTIW using decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-31-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e4879451-fd5c-f5a4-0eba-195f2f746395@linaro.org>
Date: Sat, 23 Oct 2021 14:15:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-31-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 luis.pires@eldorado.org.br, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Bruno Larsen (billionai)"<bruno.larsen@eldorado.org.br>
> 
> Implemented the XXSPLTIW instruction, using decodetree.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn64.decode            |  6 ++++++
>   target/ppc/translate/vsx-impl.c.inc | 10 ++++++++++
>   2 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

