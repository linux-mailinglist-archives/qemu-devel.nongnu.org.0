Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD43CBA44
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:05:43 +0200 (CEST)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4QLN-0004LH-Sq
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4QII-0000Wu-1g
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:02:31 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4QIG-0002ky-DY
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:02:29 -0400
Received: by mail-pl1-x635.google.com with SMTP id y3so1137614plp.4
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XP/cleuA2yVETXACpZtjfDJFuYWExfVjyZY9wQsEukA=;
 b=oLRAjc7X2Zy4rKoKrP8Z93nbmiNgm9vqTlLCm8gYQJw+dJXXS6rcn/+LOa4wReSJ6g
 aE63Xu/6FgE/tTJ1UnKaGVpI7S3eM6DWvb3tqoa2e2upQnIxIdfpDZqzYXQOYzqZiuQ8
 06P8ty5jSs50SHuwQuvh0AMs21nzyeKAhmFNjXwNQvc0q6g92/o2ibBTe73viHOu6ezJ
 0Wz/BKQrQSExlbR8xrmu4egx6WGTv0q6iMh49i7n43yXWUyXrzOuEuurqkpsw0WEfIfe
 CRJns+bimYFYCgfc2qIgGvrDbnaH0/iUbQGsx2XmJLck1Bk5HrizIta/Fa24SOGflcx9
 cQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XP/cleuA2yVETXACpZtjfDJFuYWExfVjyZY9wQsEukA=;
 b=TePtxm7Ge5Oxg6UyReXNPVZEqahu8bogpEmMtAmj9hZZ+G3fEb7i6HqanZCMym7sjm
 DYXtVjDdnbWnjZwWXXKAd5zwziXRJJSb1yRZjoi/W1U0E/LUJDErM4DYP/InGb1wqIbI
 VmmfL0l65jM+1gM3APDg4MJyhiC/kYDArAmDwr6XpCncJnnZUKd6xxyzn31jtdzyagT2
 zArx1G1c9PSoFCvAhq+Qsk7w2NXmPJydNwt3jVZQSSWKiuHBWhi/uT7zQkFUCaR6UoyB
 AfezDE0CN9SK5tNf0j/6foOEehg8ZZRig3T2qN9HbpaoXpbrHexQcm5qGUfhrSR4m3pW
 FoVA==
X-Gm-Message-State: AOAM530JqM8caq6Hwgi7+USnL9kNtzEsc/128QOGel+xs576cjQ5CcOT
 cnt+4ojxe+3CC6sXxRn9VU0vtw==
X-Google-Smtp-Source: ABdhPJzFpOo0v3NqopRLptcy/OgXNG0wVDRf986bizarIy6Q73/qdZxNYkTiTU1rjHgEE+Wu89T1cQ==
X-Received: by 2002:a17:902:6904:b029:fb:42b6:e952 with SMTP id
 j4-20020a1709026904b02900fb42b6e952mr8343420plk.16.1626451346868; 
 Fri, 16 Jul 2021 09:02:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t9sm9624077pgc.81.2021.07.16.09.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:02:26 -0700 (PDT)
Subject: Re: [PULL 32/40] tcg/plugins: enable by default for most TCG builds
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210712122653.11354-1-alex.bennee@linaro.org>
 <20210712122653.11354-33-alex.bennee@linaro.org>
 <530cf27c-13cb-906e-6b86-90c23d0c3656@de.ibm.com>
 <a3f05bc9-808d-0572-3e17-df9cf9418b4e@de.ibm.com>
 <79250303-5d6d-3acc-2ae3-94dacb5041f4@linaro.org>
 <e7d7d936-af4b-b6d2-fada-4b3da7315163@de.ibm.com>
 <79129f00-6b82-e2e9-8e1e-5ffdfad02b84@de.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06abfcd6-d33e-cc66-cace-4211276d133e@linaro.org>
Date: Fri, 16 Jul 2021 09:02:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <79129f00-6b82-e2e9-8e1e-5ffdfad02b84@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/16/21 8:31 AM, Christian Borntraeger wrote:
> 
> 
> On 16.07.21 16:58, Christian Borntraeger wrote:
>>
>>
>> On 16.07.21 16:51, Richard Henderson wrote:
>>> On 7/16/21 4:28 AM, Christian Borntraeger wrote:
>>>>   --extra-ldflags="-Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now"
>>
>> Full configure line is
>>
>> ../configure     --prefix=/usr     --libdir=/usr/lib64     --sysconfdir=/etc     
>> --interp-prefix=/usr/qemu-%M     --localstatedir=/var     --libexecdir=/usr/libexec     
>> --extra-ldflags="-Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now"     --extra-cflags="-O2 -g 
>> -fPIE -DPIE"     --enable-werror     --disable-strip     --disable-rbd     
>> --disable-fdt        --disable-xen     --enable-kvm     --enable-trace-backend=log      
>> --iasl=false     --target-list=s390x-softmmu,i386-softmmu,x86_64-softmmu,s390x-linux-user
>>
>>
>>> FWIW, -pie should not be buried in --extra-ldflags, but as --enable-pie on the normal 
>>> configure line.
>>
>> I picked that from the configure script of an older fedora qemu src rpm some years ago 
>> and I use that to do build checks.
> 
> using enable-pie instead of burying it in the ldflags seems to fix things.
> Question is do we still care about this regression?

I don't think so.  Your incorrect ldflags (appropriate for the main executable, perhaps) 
was leaking into the shared library plugins, where -shared and -pie conflict.


r~

