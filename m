Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD46C6CED
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 17:08:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfNTF-00046U-Go; Thu, 23 Mar 2023 12:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfNTB-00045b-Qy
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 12:07:17 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfNT9-0003yi-QT
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 12:07:17 -0400
Received: by mail-pj1-x102e.google.com with SMTP id x15so11562995pjk.2
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679587633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TfrkDEPzeSnToo9JKD26xzGQ6EMGjiRlJJQXXUSjMTY=;
 b=DXIdF472g1r6Rc2IEg6UwjLoM+1qAMG/cd28R75QjlUcOfZPgmHejQCdRjTG+yOn7a
 R8pI9XXq/WrXMZaT6nOoFEgMd3avMUp5JM3AGO06Vb2NBJg4D83zPvvAzD75D/7OZc5D
 JjQ72Km7z0S4QuUA3UzcdtnWjEKaRiZh5UVSw/Loy/cmAVK05MOYh4BAYeo07/6QMWKB
 UAgO1VMKRkaTwENhqCLVvmHpxAKRik55cjI29YpyQpVMqn0dpku9V8TbB7o8ZkzREFm9
 HYSiq4x43YTtcA0Ay5A6hSQKIxzYyx4buzRDK/rXo7ype0sVf+fwICuS9kWevKANWTCV
 nWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679587633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TfrkDEPzeSnToo9JKD26xzGQ6EMGjiRlJJQXXUSjMTY=;
 b=Jeg4BnDd0ts0opV/m4za3kwWLqc9QlbmJDikl4TD+/3bXOwlC3hLqW2PgUWn0d/XfS
 L+Nt2CZRmmpsYbJ6wqPevAC9cr7yZpTCmRKvsMgDGsBY2PwtidV1PbGwfRLQ3YyWzM2j
 EMIMFhpS8fLJbWtoR/O0R13luCxItDG3IwhsF0ueCcsQyqelffoLNpWdUuGiLqf4eLNA
 ANhzH0hD//HTnEbYf3hKpxv8RwiqyUy8N8zt4WUgck+CDxxmRV+ifkBzfhiwcl+AA39F
 IP33aP0ZSNG6dsTAsVGqKUxTqmM6SbGzdXD0BQ6vhXLtkHkMgSeL6CS28wvcFfkOMmwq
 ZyYA==
X-Gm-Message-State: AO0yUKU4q6xrjux+8mFVmK1hraNBX7bzBKAf0Vfqzgq5wfY622KYCYdr
 04JIMM/8NyeR/KPbRMJQrYWCQg==
X-Google-Smtp-Source: AK7set8Z8Cb4YGcTBrVW2aEZhsxr4TwGBRqqeVti5Z2qsTdre/bx0Z4GbkxPzKXRFk8QBbeOGqV4vQ==
X-Received: by 2002:a05:6a20:891d:b0:d5:2a56:15b1 with SMTP id
 i29-20020a056a20891d00b000d52a5615b1mr164632pzg.5.1679587633261; 
 Thu, 23 Mar 2023 09:07:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a62ed0e000000b005ac419804d3sm12125400pfh.186.2023.03.23.09.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 09:07:12 -0700 (PDT)
Message-ID: <ab0db790-b577-6ffb-a424-7b243b7019f2@linaro.org>
Date: Thu, 23 Mar 2023 09:07:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
 <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 3/22/23 23:00, Wu, Fei wrote:
>>> +    ctx->priv = env->priv;
>>
>> This is not right. You should put env->priv into tb flags before you use
>> it in translation.
>>
> I see some other env usages in this function, when will env->priv and
> tb_flags.priv mismatch (assume we have recorded priv in tb_flags)?

You are correct that they should match, because of tb_flags, but it is bad form to read 
from env, as that leads to errors.  Since you *can* read the same data from tb_flags, you 
should.

The read of misa_ext and misa_mxl_max are correct, because they are constant set at cpu 
init/realize.

The read of vstart is incorrect.  The TB_FLAGS field is VL_EQ_VLMAX, which includes a test 
for vstart == 0, but the smaller vstart == 0 test is not extractable from that.  Thus the 
usage in e.g. vext_check_reduction is incorrect.  One would require a new TB_FLAGS bit to 
encode vstart ==/!= 0 alone.


r~

