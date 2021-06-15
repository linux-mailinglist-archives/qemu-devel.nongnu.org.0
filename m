Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1843A832A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:47:46 +0200 (CEST)
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltALx-0000rt-Qd
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltAIm-0004yv-AX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:44:28 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltAIg-00044r-Sh
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:44:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so1568702pjb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0qsaxlyOIhSmsUd0KcVpooQvUcEoQDH1QT8uCxb5vTQ=;
 b=mQ6UjbrTHsVzw/nYZoDPIZu3jNwtUUsK1ihjkV67PAN/JLqH2WAukcyHVDbeQXkYtA
 E9AkGE3sQGlys/yYoGFGpRMuXwHAt0nEgxuZTPbWZ8PfmaMtp0Qzmmfl9ZcGlV4rKeKu
 lniRhS5mjhoLpD35od8lRZwza1KAH32if0lovt9hiH/3Do8YvYperv+lJN8a8yumflRg
 aoQeZWbOhngzDz18sIBUyzVs2FDtHnTjqWnddvJtB+eQAFnMD8ZSDRxr//H6qCNfvWWV
 ki1TZ+ZLkRdZdMuCAcdcKSE308khCcPu5EuwwXbw3aumZCUaGzmVIkRj4buvR5uLKWK1
 rvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0qsaxlyOIhSmsUd0KcVpooQvUcEoQDH1QT8uCxb5vTQ=;
 b=STp9ssO1TpXOezbf6vNBKZcL7TVnhy/HWepOmQSynnx9J6Gdu4fIOrcmyap9ycfywB
 iDBFjn9sDU9UJW+EwcycdOXYrtRawn237jsEr7LZ0kaxC7EkFtKJfBqbt1x83o3/FFox
 Lw8FAotqxzHnz0VArBQA8JhWSkW6TKCEmIaPbUHGQW2ndCHEMVMdBGaxXXORZMI+MswS
 ItBVuNsFkPRK5wIFJ0zpC9SLZpaP0ssoovipPCwnFfSYteb9dBmTNiYNFBmyDNi3p4r3
 PjrW/Zkh2FmPArXcJZgt2fDIDAvnJkOepeXPRyWHQueBORslGg799XSkvg/gWu3J0HYn
 XO1A==
X-Gm-Message-State: AOAM532CzlaHvytN2W+qKzutxHmcjkYS66geESbpMnlviTg73vh68Xp+
 EIsGkQnJasNqjiH1ojMlXwU4ig==
X-Google-Smtp-Source: ABdhPJx4gfpW85cSvgODiUMW5ZjwE4bwc7NBsyCmG038D2h/KsiXQfU/64R0eiBW16YiNkyH7+CeBQ==
X-Received: by 2002:a17:90a:c7d0:: with SMTP id
 gf16mr5178504pjb.78.1623768261126; 
 Tue, 15 Jun 2021 07:44:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u24sm16553091pfm.200.2021.06.15.07.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 07:44:20 -0700 (PDT)
Subject: Re: [RFC PATCH] linux-user/sparc: Implement v8plus signals
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210526011340.440284-1-richard.henderson@linaro.org>
 <a8938653-3f26-ba97-3672-ff10e56a9a60@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a3fb13c-d793-c910-7f86-0b021d2c1642@linaro.org>
Date: Tue, 15 Jun 2021 07:44:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a8938653-3f26-ba97-3672-ff10e56a9a60@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
Cc: mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 11:48 PM, Laurent Vivier wrote:
> Le 26/05/2021 à 03:13, Richard Henderson a écrit :
>> Sparc v8plus is a sparc64 running a 32-bit ABI.
>> The significant difference vs sparc32 is that all 64 bits of
>> the %g and %o registers, plus %xcc, are saved across interrupts,
>> context switches, and signals.
>>
>> There's a special marker in the saved %psr value that's used to
>> indicate that %xcc and the high bits are present in the frame.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>
>> I have been unable to find an extant v8plus distribution with
>> which to test this beyond compilation.  Thus the RFC.  I know
>> debian used to have one, but they have moved to pure sparc64 now.
>>
>> Thoughts?
> 
> In my test, I use debian wheezy, and it seems to be sparc32plus v8+:
> 
> $ file chroot/sparc/wheezy/bin/ls
> chroot/sparc/wheezy/bin/ls: ELF 32-bit MSB executable, SPARC32PLUS, V8+ Required, total store
> ordering, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux
> 2.6.26, BuildID[sha1]=3fdfb5b9f829824f6110b7a2d91efd9947614263, stripped
> 
> I get wheezy from http://archive.debian.org/debian
> 
> If you want I can make a try with your patch.

Yes, please.


r~


