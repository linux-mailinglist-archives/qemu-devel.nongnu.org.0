Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85536DCF7F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:48:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm36a-0000ly-JR; Mon, 10 Apr 2023 21:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm36V-0000jn-Du
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:47:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm36S-0003KK-Rq
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:47:27 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2467cc6dd4cso237564a91.0
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681177643;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tj2QkuRqtoTf+6Ske/YxMHcjyvAOfeUuFoPlt+O7SpY=;
 b=zZWGnGgwOYmTPtCUpoQUha4jSD0/uQ9GLaePmi6Wo2G7/ZSAjdzBh0VTc4I6iKCllu
 4en2F/n548DUCx0Ufz07psjHlEJDMIMGy6omqRlmywbZ4wPF6MjrZ7EyWdROkeY8pQ8d
 snC3gpGvVmgWfaMByiqCH/4OlztWBPMNqG6UBvvGmD1T2guJRrfeFGMv/fD3HEi0DgfO
 SiTJsWe8M9UePFhbnwWARlAa0YmlKX5ccog4qgUM7UOeUXx3Z9yPJcL90RjbCtGGAFGw
 dZTqxQEJVPyTOXf1WD1OmsfxeT6GM5gQhcvpGdU5ekKYscrQqjVAiyWo90Iv2T+ZVL3Y
 PmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681177643;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tj2QkuRqtoTf+6Ske/YxMHcjyvAOfeUuFoPlt+O7SpY=;
 b=MfQBsqFPEiZQRPEcrlLE0+QbCUa0/kutyYXshNGJAtlMWzYJdGuyTFZLbnDNi/69rb
 4XrO5wqe5KvZKKIIVnkNCuMBFZsOLq7ABJ+ys+8t00cEgm/VXTQsdQX8w87tc1TFItlD
 Pgcu7Ddtxssh7dJzloTJO85uw1EMAGo142kPMP+H5UvfejveLNI9KCadkaMSSBDgGVhx
 TFKSYm5+LrkyGEHw9214RrdviABnsu1JVlovHbuA1jxVJoUkZ26V+j5dj5FRjWPLNXof
 nhdLZhbFvXvLhwKcu9gg8DRA2MAxJ+YWkVVAm7TlwYw/5Y0jijWmMYW9lBYbhWvRRllI
 sQcw==
X-Gm-Message-State: AAQBX9ceqUEmu+zE6dRWKFFrdJoZUhd+VWeR06+nkRMsPjjQ/Uj9IiNX
 A2fEkVaZ90DY05THa+R2Gf4W+g==
X-Google-Smtp-Source: AKy350bgcchkx+kkFzN8r6+p2Gkj+Ttl+odxOiLiQ78rYICjYZmXGP+wtQv4wm37nlcmB0PAT2XUYw==
X-Received: by 2002:aa7:96b3:0:b0:627:fb40:7cb4 with SMTP id
 g19-20020aa796b3000000b00627fb407cb4mr1151402pfk.30.1681177643166; 
 Mon, 10 Apr 2023 18:47:23 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 i16-20020aa78b50000000b0062d7fb53652sm8532221pfd.38.2023.04.10.18.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:47:22 -0700 (PDT)
Message-ID: <58021b23-dc58-bf3f-b83e-ddaa5be90e14@linaro.org>
Date: Mon, 10 Apr 2023 18:47:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 2/4] target/riscv: Add fcsr field in tb->flags
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
Cc: Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-3-mchitale@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410141316.3317474-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/10/23 07:13, Mayuresh Chitale wrote:
> The state of smstateen0.FCSR bit impacts the execution of floating point
> instructions when misa.F==0. Add a field in the tb->flags which stores
> the current state of smstateen0.fcsr and will be used by floating point
> translation routines.

Are you certain that you require a new bit?

Could the same effect be achieved by forcing one or more of the existing 
TB_FLAGS.{FS,HS_FS} fields to 0 within cpu_get_tb_cpu_state?  I.e. for the purposes of 
translation, pretend the FS state is DISABLED?

These bits are scarce, are we are nearly out.


r~


