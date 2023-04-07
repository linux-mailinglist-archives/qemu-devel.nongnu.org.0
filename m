Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E916DABDB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 12:59:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkjnY-0002dE-Nz; Fri, 07 Apr 2023 06:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkjnW-0002cn-J1
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 06:58:26 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkjnU-0001NT-Je
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 06:58:25 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 f4-20020a9d0384000000b0069fab3f4cafso21949603otf.9
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680865103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VM6FM2LJRJxH65LWMfFSUM8govz4lfog5Hq1kdZZyzk=;
 b=phKrHTA3Kh3wUCfmntHEfHqbdirrZ8jSXSL6YxnS0Uzx4prU+Wv0xYgVxSb7aSbxvM
 GE+HgziLue7LR0OYYop13II4T2nRSagPYrgJFB0XDahR6JP4qFFiXBpDJkPHBYNDXdx/
 tgVAtzrMILhP89iXJoASCMwQFx8Uk2PjcLRwq76JUQuUJnZfAj1xZoTv1MJGcs/DQ5Nd
 kS7Sizh+LFcqvxNZKlsNajB/urc14HsAFsmYqTmHVUrq6p68XLR//OFyx+EzEXUmcYME
 2K2TvauYHKvNZN7QM4PNFomtusve/VANW4OB1RmDyzGCy5EBxZcym+s1vJHXvUZYf2Eb
 e1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680865103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VM6FM2LJRJxH65LWMfFSUM8govz4lfog5Hq1kdZZyzk=;
 b=AHNV9PL2EOxGFRpjkl0Dp5MQwtX7CjeB62qq8ivK47MOJqkYrs4wyxbHBYvzEvkKUt
 F/9URW7MmVMXrjUo+Pfw7T2ffkCyDeIjh44YmlOtvnv/Z6QixFbK7+ESKe8wycqBGe6h
 DE8cRm6rzsWEA1+6CIvebSIFLfoWcTArdHOyYCqF43TqOWuSj2UIYPP4dAVySltPLPQ1
 PyoQc9drRcQP6+UDxADiaH6Q+qT1wlVONACcC4VsGK37qLTKaKrbG/h7DRN/vCVNwe1V
 ALFL9sgtwMCZUuHhfkFaL74XGn1O7AnN/BKfipTh5LzYRk8nzyIEh8iNY/HIWlIvVt+f
 MiUA==
X-Gm-Message-State: AAQBX9dzJOXMK7WG6RByORHT9JAKLM3b42KuqxL6s9My1KJwly9Qx/7O
 A1NmjWmA6I/vEf7+ZhybOWn7JQ==
X-Google-Smtp-Source: AKy350YVBmsWgbOK0FsVha0lhicJHNGa+1F9+X6egmPZLHVnRZ2ORdWopFXAKnqpMhItoEK0NSBXfg==
X-Received: by 2002:a9d:3d5:0:b0:69d:1f1d:4629 with SMTP id
 f79-20020a9d03d5000000b0069d1f1d4629mr4559410otf.6.1680865103264; 
 Fri, 07 Apr 2023 03:58:23 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a0568301e5a00b0069fa776d3c2sm1608326otj.18.2023.04.07.03.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 03:58:22 -0700 (PDT)
Message-ID: <c65a5831-ce79-f198-f491-37707abf9f81@ventanamicro.com>
Date: Fri, 7 Apr 2023 07:58:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] target/riscv: Mask the implicitly enabled extensions in
 isa_string based on priv version
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230407033014.40901-1-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230407033014.40901-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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



On 4/7/23 00:30, Weiwei Li wrote:
> Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
> super extensions can simplify the extension related check. However, they
> may have higher priv version than their super extensions. So we should mask
> them in the isa_string based on priv version to make them invisible to user
> if the specified priv version is lower than their minimal priv version.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cb68916fce..1a5099382c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1709,6 +1709,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>   
>       for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>           if (isa_edata_arr[i].multi_letter &&
> +            (cpu->env.priv_ver >= isa_edata_arr[i].min_version) &&

We don't have a way of telling whether an extension was enabled by us or by the user.
This will end up filtering user extensions from the isa_string.

IMHO, the way the logic is working today, we can't enable Z extensions based on enabled
MISA bits alone and disable extensions based on priv_spec at the same time. We would
need to check for priv_version when enabling these extensions implicitly during realize().
Another alternative is to not disable any extensions at all based on priv spec - we send
a warning about the priv mismatch and that's it.


Thanks,

Daniel



>               isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
>               new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>               g_free(old);

