Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0006FF071
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:18:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4J6-0001fM-Vh; Thu, 11 May 2023 07:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4J5-0001c0-9J
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:17:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4J3-0008WN-Mt
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:17:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so30764115e9.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683803876; x=1686395876;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gcIxXHb/hkMsmwhP4L9l5gZ3wNq54c+SbUD6P3W1FVk=;
 b=EMZIB3qU8Fwg5Cuhpc14gY5SEujAaN24HDoyuc4osQccrCqJqfM4J8Tb6+xWJxTHNF
 A/0VKpVdX7c8MUyw/eqfusIdSiF3HBIaIpFxt4ZG+7DnP+E9fWXs2LjBFkLlqm311l6t
 KC/T4hHvfNGpV08gQwwAKGei15HEd8Lzn2iCFDITWd6qPxkJldFIubV9gJCTM7mm4h2/
 5I4DYHOELfzpsrpP40+h9bT4yR/ppHMaeIn3scelNedOj8WOrMkgGfZoAqWklxtU8pPG
 7/Mr6xKCs2VBue1xb0ZGZGyCv4L7BkgO3yl844GWde4mHfxXrRoxS3uTKrXczUiT3cNX
 9nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683803876; x=1686395876;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gcIxXHb/hkMsmwhP4L9l5gZ3wNq54c+SbUD6P3W1FVk=;
 b=TQyAjyrDXgFScSluQCvnOMHF6jG5BmoWgMNP9qRny1vU7jYq+GfvC/PPZmc6hEgfV5
 OzPJcaMa4WUu1tOCiqpD7vAbSqmPg+YdVigAp6nu73uvwYu8PkkYoinja7ZHRnhqW6+w
 lNWvHDW6axoOR0ZJ9yJCUkBu7XSAnOJWYCQLQDQ1AZtLWM6j+/DHwHLHzRfogHyAJqfH
 qiImOkCHIyIk/6QiIbLrBnKSGo/KYPwvkxIH+MY4bUbNhiCVlDWHtmPLP8+xaux3Wkla
 6yiu+MZZIVdKwaooATF6W+XL1vZKPHQFWJzZIAd1t2U2+bE8U5vbvXnexCrcDCdVBNZe
 mn5w==
X-Gm-Message-State: AC+VfDxQQd6FooOHnTCINXt6H8U/2KZ2O/TzsEXj0pSZsan+izpP0hpc
 ETRZ9hikoIDoVkYHkImButPyMw==
X-Google-Smtp-Source: ACHHUZ5ytmQrxMfXeN54eGrAyvIkGl/fCGW6v2GM4kskzeul0fQNCtDDcQVqNIRmtZXaeRv/CuDjow==
X-Received: by 2002:a1c:f60a:0:b0:3f2:5920:e198 with SMTP id
 w10-20020a1cf60a000000b003f25920e198mr14504626wmc.34.1683803876216; 
 Thu, 11 May 2023 04:17:56 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adfeb91000000b00307bbbecd29sm4152958wrn.62.2023.05.11.04.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 04:17:55 -0700 (PDT)
Message-ID: <0df0bb97-b6d9-761a-c2c3-5e7d387ffcce@linaro.org>
Date: Thu, 11 May 2023 12:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/17] QAPI patches patches for 2023-05-09
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230510081224.3588673-1-armbru@redhat.com>
 <e94e5411-66de-3aa6-3ed2-f16154ec5294@linaro.org>
 <877ctg2ov9.fsf@pond.sub.org> <87ttwjktrq.fsf@pond.sub.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87ttwjktrq.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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

On 5/11/23 12:11, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> I didn't notice earlier, because centos-stream-8-x86_64 failure is optional,
>>> but this has another error:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/4258751398#L4649
>>>
>>> Exception occurred:
>>>    File "/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/docs/../scripts/qapi/parser.py", line 566, in QAPIDoc
>>>      def _match_at_name_colon(string: str) -> re.Match:
>>> AttributeError: module 're' has no attribute 'Match'
>>
>> I'll take care of it.  Thanks!
> 
> I tried to reproduce locally with make target docker-test-build@centos8,
> no dice.

Yeah, we don't seem to have a docker image that matches -- it is set up by

   scripts/ci/org.centos/stream/8/x86_64/configure

for some reason. Perhaps "make vm-build-centos" was intended to be the way, but that 
appears to be broken too.

Alex?


r~

