Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DBA6C6D0C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 17:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfNXU-00066B-UJ; Thu, 23 Mar 2023 12:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfNXQ-00063i-M9
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 12:11:40 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfNXO-0005p0-Vw
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 12:11:40 -0400
Received: by mail-pl1-x631.google.com with SMTP id w4so14689596plg.9
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679587897;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gdk22G/eWWKEVeaS8iNIs2GKyLXFIpnS8/TmZ3FsAhY=;
 b=NCt3R3b1xke8oBWkEfv6GgsogaX/NoF5qMRVOyBvBlbF34TbnrTXareAejzqh5VBT7
 c6qbc42ueK4l7Ilj/NBK8Sl7sv94arJTYdjvL7cRfvzKf8QZTOxBNM2fhs6X+JgckQ48
 fKLMT+I3XN0qfs4HBBWVhgxxP/X+lM+7O7m8OOjiPO4vaf/gJiHHAZUTPRzUbgmqM3Jp
 kqhGfYjr6gSR7LUMUYs9HMoYjF99D5JRKsNJjS2X0A/lurlt9wkeaq2JhwnS2/3S4bbw
 5+U/g4toK7CEaKAY+XP42mQrPF8MImqnLMinNPUYKK2JFVvYVofBmqalERoXQpBWGGz7
 hd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679587897;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gdk22G/eWWKEVeaS8iNIs2GKyLXFIpnS8/TmZ3FsAhY=;
 b=J3E7o7WA41b+qBR04WAFnK3sR2xLXK5beSwoQC13E16UCe49yxCKYKqmbOBNYbOP/+
 shW8JLnqLqdsqL8RXsfrdSFBOj8MdCJjCZxeSpbV6B1Uc9sbKQxr+lRt/qUfejYJsawL
 MK+J20THZtK3Vj3HEnyx3MFh1fCpjhECuIYO0hw9wD3FIRjex2DrAXNm/3gohsht6SwF
 mbNHN9PZhX6VhpODaT2NvnL+30EpOCRF3mEx2aBli8EuWOQn5jdAhYGqqs/FQz/uJEzZ
 6pwv8xbyTy7pjYztonX/F119UHPCzuT5SsiE+VFgY4lzPyxV9+cAYfiaDykg5Qz9tZpg
 CuTg==
X-Gm-Message-State: AO0yUKWKEbqp5upkPHoBhRvKVGohrVeCUTzVpKorwncMu5hYi/DJhEVj
 Q8pfVh3mT11+4wVmRAV6DItAbA==
X-Google-Smtp-Source: AK7set+v+RFocpy+u/GHtc5iI86PY/SXz5h+3rMNcM+ylfFKn+SVm7LOS9eL2QCDdpEI3o1ExeReDg==
X-Received: by 2002:a17:902:d512:b0:1a1:7bd7:cc06 with SMTP id
 b18-20020a170902d51200b001a17bd7cc06mr7884058plg.43.1679587897426; 
 Thu, 23 Mar 2023 09:11:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a170902760700b001a1deff606fsm5944968pll.125.2023.03.23.09.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 09:11:37 -0700 (PDT)
Message-ID: <5e93efee-843c-74b4-0b36-fcf89d8d3463@linaro.org>
Date: Thu, 23 Mar 2023 09:11:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230322121240.232303-1-fei2.wu@intel.com>
 <cde0b3bf-7d38-2fc4-c8a9-7241d5bf7339@linaro.org>
 <4c0c210b-7a9a-34a8-b0c2-e32f9328bf07@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4c0c210b-7a9a-34a8-b0c2-e32f9328bf07@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/22/23 17:38, Wu, Fei wrote:
> There is MSTATUS_MPRV and MSTATUS_MPP kind of thing, priv+sum is not
> able to represent all of the status, probably we can just add an extra
> 'priv' at the back of TB_FLAGS?

Yes, I think that's required.


r~

