Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2238F83B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:34:28 +0200 (CEST)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMtn-0005zT-E2
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llMNs-0006Rz-5Z
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:01:28 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llMNo-0000DE-3x
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:01:27 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 27so20183362pgy.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 19:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IfqqPPROiGQRv/0IuudxbiCSd/mNyUc/5CraLBXS95k=;
 b=JSmiN/AD4wllsaelLNwSm+vWq4JD1TYDMzWdEm8W9aVA3uddx2xHH/W4pHVKuk8lxN
 PO6nTYOmZsY+8QkSsPQYeAIIj3koS3CU/Mwqxpvsrm/Jelf494fpOVziWPbdnKk5+TxD
 46+QT0WOCAt6HYR0mndgWKfqTJpbckqA30dqH6ai1YUgeAHWkk3O/wlpguWhgod6coep
 8lyX1p4r/h3KBy47MtgPFtSm3reHyN6w4I7ZIF7WNLa/QngJBvrhbDTR7mPjact1xta9
 4jGMifT8o1hFbppquRJ8aKzwdVm8wWfSbI5CST7kPbF1vWe6yq2CZjKfnZ4H8bdW7g11
 qVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IfqqPPROiGQRv/0IuudxbiCSd/mNyUc/5CraLBXS95k=;
 b=b2SJO1uqwI4K4HRyqWQ5Epf0RTzSBAY6HPDJlqwa1tnT4LPifqdL75HKs/PnjsiE4H
 0sqIGhjVEFSLjNj2LzveHxpbILNNTbt1a1Abe3MYIQUcy7hDB+2IiEqegk9U62UjGRBC
 ucydJfrlOQCOyUFcApaW2mxOpGSk9UVzuv3LB6LqDn6yC190Qt12k/ThYoOrsmHyfFi2
 i9s4PKzfUj12AeYejzrOSWyasZaE+xaFaADPc7kVjGIcp7QLAHLSangSXjcBiDnse5Gi
 YXPf2gStCsQdoGpCVnJjJgu+VojaGdwbQZpFCkyMBNEGVhqrnetVwy7r9f2UR1qp1rCi
 lEVg==
X-Gm-Message-State: AOAM533EQ+veNP4jXrJQ+EdircAIuIrLrFVr4ye9kKPn5Jd6955j1sTM
 1/uU9UfosTNGqiuRr2OCRnc3Kw==
X-Google-Smtp-Source: ABdhPJzKuJstYTDblxz+DG1IdPSxgIpWWti9Zb4PvNX2ffm32vghoVgBd4pWwvk8xLjGJdzQaAPIlQ==
X-Received: by 2002:a65:464b:: with SMTP id k11mr16530678pgr.407.1621908082477; 
 Mon, 24 May 2021 19:01:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 l62sm11957486pfl.88.2021.05.24.19.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 19:01:22 -0700 (PDT)
Subject: Re: [PATCH v3 4/9] target/ppc: overhauled and moved logic of storing
 fpscr
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-5-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d9a521f-4f1a-e91b-fe1a-4f0e14cebd6c@linaro.org>
Date: Mon, 24 May 2021 19:01:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521201759.85475-5-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 1:17 PM, Bruno Larsen (billionai) wrote:
> +    uint32_t mask = 1u << bit;
> +    if (env->fpscr & mask) {
> +        ppc_store_fpscr(env, env->fpscr & ~mask);

Oops, missed this during review but:

   fpscr & ~(target_ulong)mask;

Otherwise we clear high bits of fpscr incorrectly.


r~

