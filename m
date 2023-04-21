Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66926EA39B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:16:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppk3T-000512-It; Fri, 21 Apr 2023 02:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppk3N-0004vS-NP
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:15:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppk3I-0001wZ-73
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:15:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso809107f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682057721; x=1684649721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jBhw5+e07BV70UD2Ou3dYbxg7egkxAJFj+Mduwrt+Xc=;
 b=GaL8lsexlZ8ayy5NR5T/02B9ncvwagBg+v7hPVE3IabqjPXF7FozFZ3shZti58FXqp
 lD0GxgHjwEp6eMg9QYchYGr7NZ2yBlHvwZSQKh+ME+6bi/MH6x3kcE69vCOOft1kgLMc
 Q1zBwVJfEEs9JJjeMPaIduikXf6IUL5tw+EC6+BsEal2ZqtGVGLkRejKBMrLcxsahvVb
 ZLkNiLpsKRt0pVbyKS2Gnm/jqWVHC0WsGkjL1/uUTX9C0r/Z/CWZ2C4zNEJnyv8WeJSA
 xnh8UWUl/Jznm5PlBoxxzXEDvFMnuSLYTbnSP3wk6VX7iwjlHVVNW06VMRVF+DYSHYo7
 moZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682057721; x=1684649721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jBhw5+e07BV70UD2Ou3dYbxg7egkxAJFj+Mduwrt+Xc=;
 b=mFFy3khE972ru+j/xvEcGXOAPEFgn+D/hcV/P+damTeZucAzP9QD/tze8UPvEXO4OO
 o36VH34vVk6SnGiOXTp/i/yykBrXw8epQLtvOVOG4fSykLkHaQlrFJwEV14upk88kVCK
 gGYss7N12e+PpB2dK1wFnvmy0CTy0wc//UMv2GbmvmX7mQD2wP05aiD4OkPM4PNd2RRq
 8d3JmZLlWtLI4JCk0/r5bZB26xV7sQ4Dgm1xcSN82ROQa3SfbuHkXgnCEo09GsAjUJ9v
 5ADKSFxc2hTLU2okfn1pElpqVLi5DgihRaul/2d29xp33Gs9Oplo2m0BA1QSth8dA9z9
 BJag==
X-Gm-Message-State: AAQBX9fsaSzLlFGHvg9jOgrrKt24f5z/Qa3wDX31P2wuCyg3yUrvWttF
 GSOhGpLsf7hhcMDE5TnOUOAhtQ==
X-Google-Smtp-Source: AKy350YksRlbN2/9wJvyBv71CCUx/5bfEtnn0IfwgbJtxnQQD8HI1caCu31u7tIrE03RCkiZdVfDaw==
X-Received: by 2002:a05:6000:1811:b0:2f4:e0e5:aaf8 with SMTP id
 m17-20020a056000181100b002f4e0e5aaf8mr2496262wrh.68.1682057721450; 
 Thu, 20 Apr 2023 23:15:21 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 d9-20020adfe889000000b00303b72946b9sm877085wrm.50.2023.04.20.23.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:15:21 -0700 (PDT)
Message-ID: <a6d0f507-c4df-d34e-29dd-9a058de6f23d@linaro.org>
Date: Fri, 21 Apr 2023 08:15:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 8/9] docs/devel: mention the spacing requirement for QOM
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-9-alex.bennee@linaro.org>
 <6dcae2f9-9b0e-06a8-40fb-e4fec583e54e@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6dcae2f9-9b0e-06a8-40fb-e4fec583e54e@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/4/23 21:32, Mark Cave-Ayland wrote:
> On 20/04/2023 16:57, Alex Bennée wrote:
> 
>> We have a more complete document on QOM but we should at least mention
>> the style requirements in the style guide.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   docs/devel/qom.rst   |  2 ++
>>   docs/devel/style.rst | 29 +++++++++++++++++++++++++++++
>>   2 files changed, 31 insertions(+)


> A couple of points:
> 
> 1) It is probably worth removing the typedefs given that they are 
> handled by the various QOM macros
> 
> 2) There should be mention of the fixed names "parent_obj" and 
> "parent_class" for
> the first declaration.
> 
> How about something like this:
> 
> 
> QEMU Object Model Declarations
> ==============================
> 
> The QEMU Object Model (QOM) provides a framework for handling objects
> in the base C language. The first declaration of a storage or class
> structure should always be the parent and leave a visual space between

s/should/must/

> that declaration and the new code.
> 
> For a storage structure the first declaration should always be called
> "parent_obj" and for a class structure the first member should always
> be called "parent_class" as below:
> 
> .. code-block:: c
> 
>      struct MyDeviceState {
>          DeviceState parent_obj;
> 
>          /* Properties */
>          int prop_a;
>          char *prob_b;

Should we mention "We recommend placing instance/class properties fields
just after the parent field"?

>          /* Other stuff */
>          int internal_state;
>      };
> 
>      struct MyDeviceClass {
>          DeviceClass parent_class;
> 
>          void (*new_fn1)(void);
>          bool (*new_fn2)(CPUState *);
>      };
> 
> Note that there is no need to provide typedefs for QOM structures since 
> these are generated automatically by the QOM declaration macros. See 
> :ref:`qom` for more details.
> 
> 
> ATB,
> 
> Mark.


