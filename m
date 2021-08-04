Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B73E06C9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:32:58 +0200 (CEST)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBKlD-0002nl-GO
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBIJ8-0001sx-Cm
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:55:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBIJ4-0005Sq-LC
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:55:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b11so2600866wrx.6
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jGWdZP47rXmiDGIVCIUXviaDvyKfkqxbop5+WBGIPAY=;
 b=R42QJ9jKmsar4PKMRKtU/yi6eGNbhAY4Oor8oleDQ6IrxjEGI4LyY56SFfrYAZKL68
 JxR2IKq0tA51hH1GJswVpTRSvEbTgFZ5xCrHBxArF6gR/FsZvIOU3Pmz0/oELeDINR2B
 Xtiw5NtPswxDOIUB9hPSIAe5sH4N0KapcdNn1J/WS1Bx1IhbNWMJQB/YPnq1YMzR1xVS
 QkZ9CX5uN1Znkb5FvkKTMKi9aeLdSHHYnn1N8AWRxwNDfEgPSo6QIbIdYM7gOD+8SgNI
 sQhuyArBOtzZVYf5Fn9Ln008bZLHRqgtqkhu4OHnloQk8g0HbdVmSWWwXC8lh/G1ZQDj
 EJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jGWdZP47rXmiDGIVCIUXviaDvyKfkqxbop5+WBGIPAY=;
 b=oM49JqJ1RH7M6EagYkMyN76GryQ6FtUtBGr5w5x2kUUkm27Vql+A7of3j3iLD3kax9
 FhOy9SRQD+t+1ESjIdrqOfh7LJ/BV5q4c1za4J9E6fjKODT+XiMKtawtwotQ09yO4PrJ
 IyC/Si2cYG1V4/sh0K4/JJmK4XksN3FmAf+rVeS0mAikRZuN+EU488ltyirJ+VzH2hh2
 aCQGbKdN+DFSgQtLo0RUcFtinYDFcZglvVUOKTSbBUSxQzkv67+BaLWnnz9ekKXFQyut
 5P/eN3WJZD5biDIEF1mJ2Nao71pudJEr9SjAxDAUfT4g5kvuLoqcwJ+g0+6RcA5zLiLX
 BsSg==
X-Gm-Message-State: AOAM531ZlPeBd5vMLXwm8MFTP5UJIwJvuiBEWFVOCmYAgnwL2vPhCAAg
 O1LITQul0JQa43bIPEau5Ak=
X-Google-Smtp-Source: ABdhPJyoxRNCq/yoUy6yuFfhKV/R9M97UGwqf/7mXNunUls6SbDuaB7RvLKJ9EWRXToxnsIzqHZuYQ==
X-Received: by 2002:a5d:6102:: with SMTP id v2mr28427880wrt.223.1628088941423; 
 Wed, 04 Aug 2021 07:55:41 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z3sm6259470wmf.6.2021.08.04.07.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 07:55:40 -0700 (PDT)
Subject: Re: [PATCH] linux-user/elfload: byteswap i386 registers when dumping
 core
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210803172013.148446-1-iii@linux.ibm.com>
 <CAFEAcA8J1odq1mcg4mKD--EbNj2d01JwqP8DnK-_c6Oz2y157A@mail.gmail.com>
 <d5893e1d-8219-f00e-e860-bea57a4420b8@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ad2ee8f9-fc51-731f-4caa-4a702ac17a10@amsat.org>
Date: Wed, 4 Aug 2021 16:55:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d5893e1d-8219-f00e-e860-bea57a4420b8@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Andreas Krebbel <krebbel@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/21 4:12 PM, Laurent Vivier wrote:
> Le 03/08/2021 à 20:34, Peter Maydell a écrit :
>> On Tue, 3 Aug 2021 at 18:21, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>>>
>>> Core dumps from emulating x86_64 on big-endian hosts contain incorrect
>>> register values.
>>>
>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>
>>
>> Looks like these two were the only two guest arch versions of this
>> function that were missing the tswapreg calls...
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Do we want this in 6.1?

Safe enough, I'd rather see it in, since there are recent interest in
emulating x86 binaries on s390x... My 2 cents ;)

