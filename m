Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C135A8DD7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 07:59:53 +0200 (CEST)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTdF2-0008BZ-JM
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 01:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTdAs-0004kY-Gq
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:55:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTdAp-0003R1-LU
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:55:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k9so20911541wri.0
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 22:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=N5RgRiLtMogzicv1Xbc2Y5MRAq3mHTbkC3LwNskg9PE=;
 b=Idbm0snl2UBfqSuL5Nif/7EwZclbZFCBvtxKsCKKwOKlqWiUk74d7XgYYA65/GH7jo
 oCUFIK5+f1D/8GNwhk1VV+jyF5NHGSGnK8zO75MDFNFMNT+UPNzNMCVfip3I371flFq1
 RdcJeBzMJGPmvEwsXlvbXJ022LiM1LIrhFeLx8CikoMRkby7Sco2UDFvaA9lcDlrU37e
 2ZIKnsEn+HZHMYbE3v+VcsyjCxJH85S7YhmMVe1xU66Wd/KIYlEdGE7GoFOGQars3Z4k
 nrj+hoc+glxaAXcTvoiA+Yvb+46T2M4wtMcTBRy+eRUzr6iMARpZvMhmaZAlXv9UTAzE
 k+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=N5RgRiLtMogzicv1Xbc2Y5MRAq3mHTbkC3LwNskg9PE=;
 b=E71Pk26mwM2Y6LY/gVYJScKdX74c6PXJ3EkC3X3mrG4pLekBW0EP9B2MuKuzA7YYAC
 UuAuvk0s9icmox1SXedDYYTAc1Tpsx+8cJfoCArOF0+2q+YbcqETpvrCoooZC9faXlQ3
 KhLaFKGBL30VmFge/hU1DxAzZupaQsMSfLAApVff32LmFF7lnXuzfd2U9bKFOIU6uKuU
 GzEn/5/1JIj8Sm5vBak7v9l5F7aAcScTnCHX9wfpk/uhQfpKCRol9pX4VmdEsbxd367w
 sWeSLRihML68uvsiNVCfQNRUzK9S5L7K1RlpAtMc1T8t28J4C47O0dEHlDLD06g3+u1c
 AX0Q==
X-Gm-Message-State: ACgBeo1ZRYWkXgH/j3MvTP10fhBkAI7mI6UmYsBDk0OaGEyFC6ntjNeu
 19qb1zDCHseWsjRo1DI6FNSexw==
X-Google-Smtp-Source: AA6agR7XGQnb2WQAMCm2US4tgdGTNVZwOJgNeiBa1SZA3kfFW3Hw7vrZI+4pORt3KmcLCyQJRdNhPQ==
X-Received: by 2002:a5d:62c7:0:b0:225:8657:df17 with SMTP id
 o7-20020a5d62c7000000b002258657df17mr13137664wrv.346.1662011728797; 
 Wed, 31 Aug 2022 22:55:28 -0700 (PDT)
Received: from [192.168.30.105] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5d55c2000000b00226dd738b9dsm8574878wrw.46.2022.08.31.22.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 22:55:28 -0700 (PDT)
Message-ID: <78ddfec4-90f1-94a5-b815-685b9c6105a3@linaro.org>
Date: Thu, 1 Sep 2022 06:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 05/20] linux-user: Clear translations and tb_jmp_cache
 on mprotect()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
 <20220823220542.1993395-6-richard.henderson@linaro.org>
 <570c2b334e7ad5a44bf8c163d82e5bac116e0f0e.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <570c2b334e7ad5a44bf8c163d82e5bac116e0f0e.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/22 00:17, Ilya Leoshkevich wrote:
>>       page_set_flags(start, start + len, page_flags);
>> +    tb_invalidate_phys_range(start, start + len);
>> +
>> +    CPU_FOREACH(cpu) {
>> +        cpu_tb_jmp_cache_clear(cpu);
>> +    }
>> +
>>       mmap_unlock();
>>       return 0;
>>   error:
> 
> I think adding tb_invalidate_phys_range() obviates the need for
> cpu_tb_jmp_cache_clear()? The lookup may still find an invalidated tb,
> but it will have CF_INVALID set.

Quite right.  And we definitely don't want to have to touch a list of all threads if its 
not necessary.


r~

