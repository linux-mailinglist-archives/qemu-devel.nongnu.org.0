Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C522621BBBE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 19:03:39 +0200 (CEST)
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtwR0-0005YV-Ir
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 13:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwQ0-0004hs-KS
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 13:02:40 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwPy-0003OR-2D
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 13:02:35 -0400
Received: by mail-pl1-x631.google.com with SMTP id d10so2502150pll.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gWcLucJnGxYrpGRqzUQdksfPn1jJPKGKlyNi7TdNJKA=;
 b=McwYl2ybFw8/20koLbDXdHrCj/Xm/6Z+ATlHw4C0ZVEXeLwrC4jsnmMrhJZniaA6dK
 MhwL3PtdchHk/1nGGx0AjG8f6jp0wRvmO7cBSiyMIJZG+ae162Z/JCCbvCXc+cx25I2g
 aNij70THtc203UMg13izKPURG67X8HSGuJKg7ee2aeNEpGvCBECwrLphJ7GCuNVI6JE/
 E1Dd5PtqepYtRpym0BKI3v2olV0Dmuvy/jQRpI1WK+85IxxVDxv28BfDxqR3mFBzDhze
 gvPJ5ulxgHrHIvQ3eqAA0V3UNcGuqFACRgXtVJi1Y9l6K/SQ+n5iWPKwsKOhpqFNL7pW
 XRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gWcLucJnGxYrpGRqzUQdksfPn1jJPKGKlyNi7TdNJKA=;
 b=hdFhRDv6sGvxekvbyiZL/dkf1jlauukO3OlJhinKYGYDf0dqaPFft/bB2dNkiscrZa
 wl1rb4vMObFcpKg2/Id/lFkETyBtZ4hVsBuXrGTb0uzXzVXKPtskDJtq7hJHPIA609rk
 N9XKC4U4qCU9UUZ8Q67h5igZWCcWD7lSXiv9azmP+Ny9JpuUBXjZSyEC6tMWiGYzjLb+
 wFS9DQ1SKeTOzHwRvWr+XmJhhkpRRppjjlNRhrHd4JaVXc5vFuViyRIsnZ2Gx2Zgjnf6
 Jq9s4MxZqNMDEzBdUuZ7Ikr45H21pKyDIxO701xKAESUhwOP8vYz1xkdO4wf6qJMIgKc
 tF/Q==
X-Gm-Message-State: AOAM533CRkM/6Lvb/t35/euMdc8/oPAiHvLQ/YkTwie/EkYPPzxHMhEJ
 Is6q18wET/AGs+LhS2KqGWfbCw==
X-Google-Smtp-Source: ABdhPJyb/KY5QrdPq6mAZ85+4RX1jYWrR1ShBGxb6H1jMhG+Q3iYSiAmp8SsowbuYVx+NUbTXYKLGw==
X-Received: by 2002:a17:90a:a393:: with SMTP id
 x19mr6903137pjp.228.1594400551460; 
 Fri, 10 Jul 2020 10:02:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y200sm6423227pfb.33.2020.07.10.10.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:02:30 -0700 (PDT)
Subject: Re: [RFC 06/65] target/riscv: rvv-0.9: add vcsr register
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-7-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a867a80-4761-637e-95b6-2bc2eec2a49f@linaro.org>
Date: Fri, 10 Jul 2020 10:02:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-7-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> +    [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },

As long as you have the vext_spec argument, you need a separate vs_0_9
predicate function, so that this csr is not available to VEXT_VERSION_0_07_1.


r~

