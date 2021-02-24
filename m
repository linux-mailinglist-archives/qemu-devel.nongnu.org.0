Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005F323476
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 01:26:02 +0100 (CET)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEi09-0001MN-11
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 19:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEhys-0000Yd-G2
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 19:24:42 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEhyp-000193-GM
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 19:24:42 -0500
Received: by mail-pj1-x102e.google.com with SMTP id b15so110395pjb.0
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 16:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P+X1jyPVaSm88wlOkg0ikS6NZgZAq3nP6EG3RpoPC4g=;
 b=kv6k4/Sl+nd1t3hyHiEdACwtzpZ5QdHC5NbYohc/IKDi+io/2X5mKxh7tNTyDhI9k0
 MPf4roNzzbSSx8EoBjlFJmVq3h22AnBytMi0TprLDvFWnyltGjFtjH5gZT2usdbis5Qg
 yM8KAaSdi08Ej/SVRM81rgM3znJuO2hnHmbV4R9BichDNgEZg4leQ8TLZi5oI0i9Ozng
 6FUnpnQNo+VhVRu0tc0/OGgiecwwDQG754ogg35jR+VN/AMxqHXqnFQXACV1RHnN7w40
 1vlJllh1u55bAf+4KU2i88ZgnxNhc+5Do0o3VW92MFLMSscdxJmiY3b+7oHkSZs2h+XY
 lmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P+X1jyPVaSm88wlOkg0ikS6NZgZAq3nP6EG3RpoPC4g=;
 b=D2jZtA29SxX/266aXDMnMUof7ft4TqaX4PDf0Xtk8OtfmS4cJjqycZkEBUec8x7E3M
 6fS3jEptJkqf/H5wl3kPwFvdNONVlAtf57JQdJJTUVSmbZId6+dor/lD39cRLkeqBYBR
 S9M7tPFIT+XUwi+w3yroQ6SLrjiqSIZYJz2FnEpWEe1QS8hXXaYv4H2JEBNWrLEmug1e
 Vkg8ZmBhb/7gEyXCMUXktPb01eDjiZL9c6cJF4xYaU4u+kAXB41dFiGXuzmFsh1FqvQv
 OMVcQJhgj3Oo3GtWFUNFG87mYweoKjYsbj08bihRdJvXzhJkfkmQsIhQ7N2l8kxc2HPr
 r2RQ==
X-Gm-Message-State: AOAM530wraRC8UB2L7hQ2k82E6AGiWqr4iHWzfARuvz8mNdcrg8IRQio
 9KFZGUS00VceTDXurHBVmH9MUw==
X-Google-Smtp-Source: ABdhPJzI6TQMk/UG3n8DJLI/kRWQyFe03NxzwvCFqs2YbfWcP1BB+b6s7j/Uy+8knxImdnP5Y/6eJg==
X-Received: by 2002:a17:90a:eacd:: with SMTP id
 ev13mr1367298pjb.85.1614126277964; 
 Tue, 23 Feb 2021 16:24:37 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id br2sm259505pjb.40.2021.02.23.16.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 16:24:37 -0800 (PST)
Subject: Re: [PATCH v2 1/2] target/riscv: Reduce duplicated code in
 trans_rvh.c.inc
To: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
References: <20210222184940.43169-1-Alexander.Richardson@cl.cam.ac.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e124d23c-f14d-493f-5657-5dcfb7194927@linaro.org>
Date: Tue, 23 Feb 2021 16:24:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222184940.43169-1-Alexander.Richardson@cl.cam.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 10:49 AM, Alex Richardson wrote:
> I rencently merged CHERI QEMU up to 5.2, and we have to modify all
> functions that perform memory accesses. Factoring these almost-indentical
> functions into two shared helpers makes our changes a lot smaller and
> should also make this code easier to maintain.
> ---
>  target/riscv/insn_trans/trans_rvh.c.inc | 199 ++++--------------------
>  1 file changed, 29 insertions(+), 170 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

