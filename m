Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129996A1425
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 01:08:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLcR-0005P4-2g; Thu, 23 Feb 2023 19:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLcA-0005Nm-AX
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:07:09 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLc8-0008Vm-I4
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:07:06 -0500
Received: by mail-pg1-x544.google.com with SMTP id s18so6461858pgq.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 16:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9QpDIqJoI5UdSVtKuuE2YKlIRvnQMTgQ/ABKyGGNvqA=;
 b=nsvL1o4nJSCVoCRa/PhThsGuDK/SnTiA28c+lQFyR5oS4DW/yJZZ5vy3dfobWKlyuV
 IreMoGFTR2wJmNdYUQSkYthGzFYck2uWlfFM1KI9/SkqEHsQulpnfdGMJB8nGeT/L7Od
 wpogVsRFpJBiR8+1CuBDff5U5f2DWQhYIgRnh/PO62x8ps9HfqGD7fQux6A/xtPn2RJD
 aah/nVzkwSKpIB8+GdCdvSS7w9ZqrC9ay5Dvsa1SObeyV4W0SUEgE7mAyf+WanZmvG06
 Hk3wLKIbV56GG4lUceuGJmyfhk0yw3xGXvYcj8FksoQRLQMFhVQuJpGCGWXTKAEBne98
 6ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9QpDIqJoI5UdSVtKuuE2YKlIRvnQMTgQ/ABKyGGNvqA=;
 b=QdhNb1PJkT9SRaqCA4Q7ZgQfqFQs/ePubK8tKY0lAjDlyqUhWNkv8SfYy1sZPiBRPZ
 SW4sOQVzmtYCg8J0TF2x1zDsBONNB15vb02jPFo/NkvteZ0WWmYmxD4TFBbWdCIyccpJ
 Cq3XA704USR6Ipak+gZta3vTgt6ZmVEFL+eEvw9pVjmpHZbaj1d9hn7M/mNZGsJi7Tuq
 FW0/k3CCGcwRgx2B/FCHanVJxliZFHFML+fVG1BA5hcQpR8r4j/A0NkwFGnUcAHwtCE5
 Ge1SHxTJOk/L00dmWhoLxA+cnshCGRIKStbqlMadcSECYwwHV515n7KDhivKkj+uEcVl
 GQeg==
X-Gm-Message-State: AO0yUKXdFus2Acf/vhIssW0oXgTZWLcvLMwTgoA31hgS0L6BsjjLk1zh
 AqN0j9cNQVFqHHdcL96ddO0j3w==
X-Google-Smtp-Source: AK7set/pd+wihN7xEnO4z1GSrveA9Zq5Ckur/HrCeuRRof+omKy3FZ5/s0bgB+MUB8uSnht3k2Hdpw==
X-Received: by 2002:a62:7948:0:b0:5a8:482f:c32e with SMTP id
 u69-20020a627948000000b005a8482fc32emr15276739pfc.27.1677197222461; 
 Thu, 23 Feb 2023 16:07:02 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j2-20020aa79282000000b00593906a8843sm6225333pfa.176.2023.02.23.16.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 16:07:01 -0800 (PST)
Message-ID: <dd0c001f-5f64-a5ca-dc84-b7d7401cf447@linaro.org>
Date: Thu, 23 Feb 2023 14:06:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 2/4] target/riscv: implement Zicboz extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-3-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223234427.521114-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:44, Daniel Henrique Barboza wrote:
> From: Christoph Muellner<cmuellner@linux.com>
> 
> The RISC-V base cache management operation (CBO) ISA extension has been
> ratified. It defines three extensions: Cache-Block Management, Cache-Block
> Prefetch and Cache-Block Zero. More information about the spec can be
> found at [1].
> 
> Let's start by implementing the Cache-Block Zero extension, Zicboz. It
> uses the cbo.zero instruction that, as with all CBO instructions that
> will be added later, needs to be implemented in an overlap group with
> the LQ instruction due to overlapping patterns.
> 
> cbo.zero throws a Illegal Instruction/Virtual Instruction exception
> depending on CSR state. This is also the case for the remaining cbo
> instructions we're going to add next, so create a check_zicbo_envcfg()
> that will be used by all Zicbo[mz] instructions.
> 
> [1]https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.1.pdf
> 
> Co-developed-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner<cmuellner@linux.com>
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c                          |  4 ++
>   target/riscv/cpu.h                          |  2 +
>   target/riscv/helper.h                       |  3 +
>   target/riscv/insn32.decode                  | 10 +++-
>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 30 ++++++++++
>   target/riscv/op_helper.c                    | 65 +++++++++++++++++++++
>   target/riscv/translate.c                    |  1 +
>   7 files changed, 114 insertions(+), 1 deletion(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

