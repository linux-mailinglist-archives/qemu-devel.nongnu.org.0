Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D390838F412
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 22:05:10 +0200 (CEST)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llGp3-00085R-Vi
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 16:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llGnI-0006Nc-GD
 for qemu-devel@nongnu.org; Mon, 24 May 2021 16:03:20 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llGnG-00069R-PW
 for qemu-devel@nongnu.org; Mon, 24 May 2021 16:03:20 -0400
Received: by mail-pg1-x52f.google.com with SMTP id i5so20941984pgm.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fN7x5gE/uVA03+Sf9tHKJBZNqFKtXZqVfvSfmZS9KDo=;
 b=Oltmw6Qi+m8vVhxfERGzQRxHkJ1gu+H6/rJNYc4WQOj/tVQTeTlYSa8Zy+Rsg8LRm5
 lnPHjAbYyUy7PO47HUfcmhMrwmmF23lTlor1fToeAxC/wJlfCocIIdpj9ESgTNXfM8u0
 Ky4VCeouqTDCLgPMzwPLiVvt279EyhYjZ44G2+4k3QbbdwwIJY+B0Ov514/Kzu5YXYKg
 6JCT45g/MfDXG44KtUQ7epK4BqVLlqbh4BR/afR0hcqQZJV1boc0mEXeSX6twzB2m5Eq
 wPZSchsD/O6xK0Yy/vGbLpQMbaNjeE6XkxMh2QgqQiGjS/oQ6t6gn2wjLKgnozYQzigH
 xuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fN7x5gE/uVA03+Sf9tHKJBZNqFKtXZqVfvSfmZS9KDo=;
 b=QUojTjtzJwVH6fMr1BzoQMnkGqyLOuju84LBAFk9n2BqFsznXGAtpzRaRJMNKAtVrX
 Yd+X/RlIpdK3xyte35++AwB9WjJz8qqGTjsLjOa+xw2gh69muNMnlgc1u2VQDjRM1nJ3
 QcM/b4umK57A9Sbyum6fB4TqAJr6xkjyRIBp/E70nOfrWVF3CadVpCId0w5L1f9iGdAm
 1VG4ztbGdqlLcj4ygiDpnE2GMSouvQbL+dgErglqaK+XLdDjM/3RxauZvvci1bafvzfF
 auMbJe/2dz1CqQ66nSXxtZOrD22+k73EOj3Qlx7jWyLAnhSwKJWXdeHhDOx/8Xow2xN+
 gO6g==
X-Gm-Message-State: AOAM531PhFK7O4zLqs4Xq0GfTWoBC+1GvN0gjaRzBAvD9VkE00BcwTch
 SOu2kcy9nd36gTciga+ryJ3/dA==
X-Google-Smtp-Source: ABdhPJxb0U8gRlljRf2dwpeaMQ+YAiKRZOXS6AcEgNcp0SJ09pdnURQ/pFpg05oZbNS5l7GydEIkyQ==
X-Received: by 2002:a05:6a00:b46:b029:2d3:3504:88d9 with SMTP id
 p6-20020a056a000b46b02902d3350488d9mr26288886pfo.39.1621886597051; 
 Mon, 24 May 2021 13:03:17 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u11sm11314732pfk.198.2021.05.24.13.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 13:03:16 -0700 (PDT)
Subject: Re: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with
 ifdefs
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
 <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
 <240414de-a246-9878-397e-402a86f70698@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cc121590-0ff3-fcf4-7356-2ba7259224ac@linaro.org>
Date: Mon, 24 May 2021 13:03:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <240414de-a246-9878-397e-402a86f70698@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 11:01 AM, Bruno Piazera Larsen wrote:
>>> +#ifdef CONFIG_TCG
>>>       cc->dump_statistics = ppc_cpu_dump_statistics;
>>> +#endif
>>
>> We should just drop this entirely.  It's supposedly a generic thing, but only 
>> used by ppc.  But even then only with source modification to enable 
>> DO_PPC_STATISTICS.  And even then as we convert to decodetree, said 
>> statistics will not be collected.
>>
>> We should delete everything from cpu_dump_statistics on down.
> 
> So, now that we have a version of disable-tcg that is functional, I'm inclined 
> to look at this cleanup. Just to make sure I got it right: everything related 
> to ppc_cpu_dump_statistics and the stuff related to ifdef DO_PPC_STATISTICS can 
> be removed, yeah?

I would imagine a set of patches:

(1) DO_PPC_STATISTICS
(2) ppc_cpu_dump_statistics (which will be empty now).
(3) CPUClass.dump_statistics (which now has no setters),
     and cpu_dump_statistics (which is closely related).
(4) hmp_info_cpustats (which now does nothing).


r~

