Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04F4C9303
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:27:06 +0100 (CET)
Received: from localhost ([::1]:38850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP7DF-0006Vv-7S
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP7AQ-000551-Qo
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:24:10 -0500
Received: from [2607:f8b0:4864:20::102a] (port=43811
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP7AP-0004nt-Ad
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:24:10 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso2961670pjb.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 10:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DSheRycdDeRG7OKdDtLwk2sF/5q29jDrs7ZK5nn8ngg=;
 b=A48FGflbDJEr8OSeg7gx9c2h2a9bUkfsDhTTlxls8Swa2gxesahblPTsSJLgTiCMbU
 QR+PO4vQqZWR678S4IQxUCWvP7qzUrUhu7/01D4c9hjBgsQHbyThMMDFSK1NOZIUZA8p
 cbdyQdLnC+oQny8bJFxRJbSEM3d+m6z9SSbpzZc698YKNK1SX/oavM4dVvIGDzfFxvSp
 6+HGE460Ch7KfFFB5iS5CgA3n+NZ3WtwBJW6/iwJ6Awrzyav72uprn0rY5TjNTe9RJEn
 r9tjGFNzkYNL5HxojF4PMMJ5CxwGkg1ZVz+YvR2E+dnV+BEn0LUiHnPJHM4hb/o2UPeh
 qq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DSheRycdDeRG7OKdDtLwk2sF/5q29jDrs7ZK5nn8ngg=;
 b=KOy+4FIxpatkibqpGhFuImKc9zy5zvVgNxqfvfaGjBCoN1+FMU5q10TeO6qX/JQPW4
 onnhDFV4fX7AINr695wPE5T4ijVIbIHoyuIHtFK1abjGZNY80gAAj+aqLyHrj4GxeNFl
 HhcPgjpdytgzypNEjZ7U8kEoSVEhV9pcuhMnxI6uHcodwCfr2Aje38qkRSRQ94XPs00Z
 PD71OPPYQo3J70bpfS/Nx2NQJFIMSOoPWnb5wjXLg1Fsz1B6lIoOLDUliuyAvgQocvLN
 PF3dkxRD7THm6FNUg36SSG6U5X0j5weaEPYhtMda49iYkZwPBv/rwuDcd769xVs3YMBV
 Zv0Q==
X-Gm-Message-State: AOAM530/+LPKPACQHYrYZPDdZy6rwyicqmZ2jjHv0w0JdGPK90QNIavP
 9Ji6IPHfIrPoa3jc/s+BqjsduQ==
X-Google-Smtp-Source: ABdhPJzxnJbHSKop8cwoPzBggGTB3phrpzBfcAvgu/0pclzRcM4oHdA+002sOZdXq30WBo6Li7yRxA==
X-Received: by 2002:a17:90a:ab08:b0:1b9:c59:82c3 with SMTP id
 m8-20020a17090aab0800b001b90c5982c3mr22891161pjq.95.1646159047833; 
 Tue, 01 Mar 2022 10:24:07 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 s33-20020a056a0017a100b004bf85a94ef2sm18900019pfg.183.2022.03.01.10.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 10:24:07 -0800 (PST)
Message-ID: <4b3307ab-0d90-6bdd-e5eb-84df496da01a@linaro.org>
Date: Tue, 1 Mar 2022 08:24:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 09/14] target/riscv: rvk: add support for sha512
 related instructions for RV32 in zknh extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220301115828.355-1-liweiwei@iscas.ac.cn>
 <20220301115828.355-10-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220301115828.355-10-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/22 01:58, Weiwei Li wrote:
>   - add sha512sum0r, sha512sig0l, sha512sum1r, sha512sig1l, sha512sig0h and sha512sig1h instructions
> 
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn32.decode              |   6 ++
>   target/riscv/insn_trans/trans_rvk.c.inc | 100 ++++++++++++++++++++++++
>   2 files changed, 106 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

