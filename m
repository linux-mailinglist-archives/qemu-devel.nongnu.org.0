Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11C939225B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:51:57 +0200 (CEST)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1RU-0007Cr-Ss
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm1Jo-0001lY-V2
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:44:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm1Jn-00053C-7B
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:44:00 -0400
Received: by mail-pj1-x102e.google.com with SMTP id q6so1557159pjj.2
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TRg2Hui1AlnWg3U7d3xySeeMQ78B+HEPop+eBOsiEQg=;
 b=knkLpTav5ih0zhJgzl2+PIX+abSMMkGyf6STnTzNDpiTW1sHdyC3d6Bby7jE+9YCcb
 6Dfs4VAXy+JZpDreS1Wq1muZqo8NBG7chfTAJA/iBFvhfQLVWVWJz/x+EPHLzSanmqmw
 MLmEH/mmCnBI5ph5e7jA4+6YdMdDZToKXJ+NnOwMuOGqObI1VT60JGuW4RutMSUF/3xP
 S1mznfQ3dAjXbHGPo/s/3yQWbVZ1/5Wv4TXA2gdcK6Ul5lgpUWKIz0bQdJ8Zh3YoZzYW
 n3y5sOqxFiuR2fDYpyuvSawr4yA/oEigqiF50+93FH005ozQ7mXcr6jYi4lwfVNUALGD
 0sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TRg2Hui1AlnWg3U7d3xySeeMQ78B+HEPop+eBOsiEQg=;
 b=HSkddzEt1Z9hJaAkjhlsdoh3CUkmExW2HlKbK9MKKH+ZmDZAP607INQMPZ3Exv1UN6
 e6lFp+ww+IWfalIJ+Cp9qIz/DOTDnCwfgkHlxjnKN0AvzRcIW0+LBvoXG8gjg7mtzOG3
 kUU0IPxh0JtXy8wnvfLHfqYlsxHmOby8zW0Q0bmq9om5MqYEMTOFVwl3fZheUJDNcZeO
 7LugVl91ItCY4YdYWkgjQm8iIemLaSWLWEm/j5bdUQB59afoczt+NRaDOwsX4eht/XAI
 /apnuGSyi2gC5qlurcEJ/9h3xehSFokFBBG43rZ9ye5qUpRP26cn1Y17qRJNRXE4cizM
 byGQ==
X-Gm-Message-State: AOAM5327ZTJoaIMc4+WHr+lE2+teqD2496A4r5/Loh2K76IL7QrOu5NB
 tik6EJPdrpF9CKbR6XlULd3yLg==
X-Google-Smtp-Source: ABdhPJxh4M+K41GJCJEdGMB5Pn2ordHorbcE1vqXO/sHZoVElMKN7y7W0Fu/KkctgxG8TQ+Ub+czzg==
X-Received: by 2002:a17:902:c155:b029:f3:57f4:65d9 with SMTP id
 21-20020a170902c155b02900f357f465d9mr238746plj.10.1622065437570; 
 Wed, 26 May 2021 14:43:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m84sm153203pfd.41.2021.05.26.14.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 14:43:57 -0700 (PDT)
Subject: Re: [RFC PATCH 11/15] exec/cpu: Make
 address_space_init/reloading_memory_map target agnostic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-12-f4bug@amsat.org>
 <30a9e423-5d2b-ae00-3f40-2487f3a5b467@linaro.org>
 <24280e0e-f1d8-ab92-cd04-f199b745e91a@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <454f75f9-8904-2b78-f1e0-0ef78e49acd1@linaro.org>
Date: Wed, 26 May 2021 14:43:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24280e0e-f1d8-ab92-cd04-f199b745e91a@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 2:32 PM, Philippe Mathieu-Daudé wrote:
> On 5/26/21 9:01 PM, Richard Henderson wrote:
>> On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
>>> cpu_address_space_init() and cpu_reloading_memory_map() don't
>>> have to be target specific. Remove this limitation to be able
>>> to build softmmu/cpus.c once for all targets.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>>> ---
>>>    include/exec/cpu-common.h | 23 +++++++++++++++++++++++
>>>    include/exec/exec-all.h   | 25 -------------------------
>>>    2 files changed, 23 insertions(+), 25 deletions(-)
>>
>> It's not clear to me why the declarations moved file, instead of just
>> droppig the surrounding ifdef.
> 
> hwaddr is target-specific, cpu_address_space_init don't uses it.

hwaddr is not target specific.


r~

