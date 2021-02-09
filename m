Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7ED315604
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:37:09 +0100 (CET)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xsq-00043p-F4
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Xn5-00079D-4S
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:31:15 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Xn2-0000Gj-Pe
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:31:10 -0500
Received: by mail-ed1-x529.google.com with SMTP id q2so25151673edi.4
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j9MxuWEcaN1Y/HgLrW3kDnHFLpw8WAdczmF6p7ffszc=;
 b=AmMZXEpVY95Tnd+njwRS383LdQgPHSpx4afhZvvpH1vVxWqCVjUQDDg+pgmkCMu3lU
 PSNCL6VaXUG7FnMuyNoJ0nms2drAFHadVgP4NHGOSwnnVstueWTNdNJZxuKN6TM0o+EJ
 6of6SFLHVr/Gp2U2FtElxwOVDwsLqFQxqeu0OxsUS6aG5x3Wr4Xoxn/rZLT1SkZCsVJ8
 tMwlkraB1q1sEf1RbLA5JnlM/De1xjqW9+orDLob4DMCXCAEQOKIZYQYh7P5MOwA6HOs
 H9MRyZjpqjUuk/sXZGMJslN/LS1TBvrThh/LVB+/49dRomgwpz/cFHyPVIUmulK0E6vM
 thXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j9MxuWEcaN1Y/HgLrW3kDnHFLpw8WAdczmF6p7ffszc=;
 b=pcdSARDX/IarBzlzUq7riy+HDOJ8WY5+DTpUBq64K1Q8ppK1iy9I3SVvNw8H+jIVDT
 k/zHKcIGFRtNGYTFragZyxchoRb5ROlGCHbEx2Qb5swh8GYf2crCWvjYB90llovhkPtK
 DFPjhVZwZaWqNerwI1i2bS/BUQbm+Zb0mad3gqD3h3bIZA/JZqwhV/zz56RIhIMR5TDf
 PtUjvUjcoYdqsyI14KqQmS3v2J8GS4dw+v4VjQItAACTNlsNrNg7P5LEcqJUwAEN7HcG
 NX8PExjLTMn0tj2VhjWm6rMGHnPDoPuhWWTEV0/0B+y2WZIRhuamkyh6lv8d6QKGo86A
 /E0Q==
X-Gm-Message-State: AOAM531JDQzpCoJOVVzgCIXPqGpspUsW4yszdvBCJCIMSRzAYsgFFOfb
 halKt87U9/3uBjOkE6YYPaY=
X-Google-Smtp-Source: ABdhPJwbnn/7v6YAANQ7F9Po/5SQ1aSV1ScMJ6i0jHO6JipiRW1SKC/5xbP8pNajbf67CwW5+u7NqA==
X-Received: by 2002:a05:6402:6cc:: with SMTP id
 n12mr22620040edy.69.1612895464933; 
 Tue, 09 Feb 2021 10:31:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t11sm12064029edd.1.2021.02.09.10.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 10:31:04 -0800 (PST)
Subject: Re: [PATCH 0/4] linux-user: Support o32 ABI with 64-bit MIPS CPUs
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <1800efb3-fd88-8bfe-7347-85c2fc8d656e@amsat.org>
Message-ID: <d44f948f-1f1e-a759-1526-9d45f1d89bca@amsat.org>
Date: Tue, 9 Feb 2021 19:31:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1800efb3-fd88-8bfe-7347-85c2fc8d656e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 12/13/20 4:14 PM, Philippe Mathieu-Daudé wrote:
> Hi Laurent,
> 
> On 11/19/20 5:17 PM, Philippe Mathieu-Daudé wrote:
>> This series allow building linux-user emulator to run ELF
>> binaries built for the MIPS o32 ABI on 64-bit CPUs (binaries
>> produced by Sony Linux Toolkit for Playstation 2 for the
>> R5900 CPU).
>>
>> The new QEMU binary is named 'qemu-mips64o32'.
>>
>> The binfmt config isn't correct, as it matches mipsel/mipsn32el.
>> I missed to understand how mipsel (o32) and mipsn32el (n32) are
>> differentiated.
>>
> 
>> Philippe Mathieu-Daudé (4):
>>   linux-user/mips64: Restore setup_frame() for o32 ABI
>>   linux-user/mips64: Support o32 ABI syscalls
> 
> Until we figure out the issue raised by Maciej in patch 3,
> can you review/queue patches 1 and 2 which are independent
> of the outcome?
> 
> Thanks,
> 
> Phil.
> 

