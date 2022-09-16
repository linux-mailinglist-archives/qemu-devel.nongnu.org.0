Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D973C5BB026
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:26:20 +0200 (CEST)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZDEQ-0001kF-I4
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZD8z-0004uc-3u
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:20:42 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZD8v-0007Ju-IB
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:20:40 -0400
Received: by mail-pl1-x636.google.com with SMTP id jm11so21712776plb.13
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=y6zMUBnafEZyvmU8r5bgD8JubS5Zm4HTf2SMNW1n9kE=;
 b=fuS5iAoY9lZJzaqX9Yvn/e2BoadbtVKCw/bfvguplMdfj9hmPC8hFyUdX3nCvtpgie
 ygIvIamBNbp5RSseHBW1pJiVCu4faw8mqzu5o1mVcI6bR5pDunR6mCGfYhiYiP2qYA33
 lIPNXquOBBNoDjjX4v+GJQ4NYJF23jXpB/1NuQ96EUaKj7AxbdP8BHjY8GBdGkzNirDg
 XbX7xVkz+96b5dJujdoLTSYy7MCNbDt15nRwC4Ar9ow7aoj5m+H9d1YDwwGnx1LPdLyM
 PjtmQd06IEu1h/Gb9dG/QgjitZzG64U7RbtoGc+/nlgwh+ucpF/hDsxEAqMEo7o2Msvi
 oTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=y6zMUBnafEZyvmU8r5bgD8JubS5Zm4HTf2SMNW1n9kE=;
 b=HQST/dkNULI2z2ms8Iqezi9gXdFnBWsuxw01HYv5Um5P96n1s2q9zB2SGauoTl47wP
 rP3RPjqlj1oeaIgECQ6FtCSsRhuV8zxYb20zw5TODxbm8zST93RWCFexSWyIqzGCV51D
 t+IQzF2cX45JTmRrdq1bK5HdbsqM5a0D2Ng8cc6Ii1zEIvQl32P0kpx47GGpK5ASgYMf
 b3VGbFR34JYG0W0O3g1T40aFJNpwX9139MMh43wxNS43NXAXY0GhwludPqnsvkgAYTk3
 Dh0xnaottceTYgxA1r2wHjadjq10hABVhbtpSIRU4kgDn7NPA3mXNDsTTAKKiVce+w2e
 a8nw==
X-Gm-Message-State: ACrzQf3dPqcX4A36YQ3H1CAR94lfpG92IAmBSN2cYUkR2SVErCMH9Kfr
 kN+dSmVntXVu++gIpm+pyAs=
X-Google-Smtp-Source: AMsMyM4pe2Ls8wGjMJ4faZEXhAj0AX+Ihtj+Joj/zcLHUOafSUlxSd5VrUP6wJaS7pk2g79QC55yKA==
X-Received: by 2002:a17:902:e80b:b0:176:de36:f5a8 with SMTP id
 u11-20020a170902e80b00b00176de36f5a8mr324402plg.127.1663341632911; 
 Fri, 16 Sep 2022 08:20:32 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a17090301cc00b0016be834d54asm15147626plh.306.2022.09.16.08.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 08:20:32 -0700 (PDT)
Message-ID: <73571860-778d-6f70-5d8b-98572c8bfda4@amsat.org>
Date: Fri, 16 Sep 2022 17:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 21/30] Deprecate 32 bit big-endian MIPS
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Pierre Muller <pierre@freepascal.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-22-alex.bennee@linaro.org>
 <8d64e197-7002-79fd-4e97-cc224099f26f@linaro.org>
 <68abfbc9-929b-92bd-071a-11e2dec7adc1@freepascal.org>
 <9b3aa9b3-f657-7087-9d4c-06e071f7da4d@linaro.org>
 <d63b636b-aaf5-461b-d83d-827ee41616b4@freepascal.org>
 <YyROcDHO7u9QL582@redhat.com>
In-Reply-To: <YyROcDHO7u9QL582@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/9/22 12:22, Daniel P. Berrangé wrote:
> On Fri, Sep 16, 2022 at 12:10:30PM +0200, Pierre Muller wrote:
>> Le 16/09/2022 à 10:38, Richard Henderson a écrit :

>>> We are not intending to *remove* support for big-endian mips, as 99% of the code paths are
>>> shared with little-endian mips, which we can continue to test.  But we are now saying that
>>> big-endian mips is not "supported" and might break.
>>
>>    Thank you for your answer and the clarifications!
> 
> In practical terms the lack of CI means that we can't guarantee that a
> new QEMU release will compile successfully. We're handing off responsbility
> for keeping it working to any interested users to do adhoc testing of their
> own. We can still accept bug reports & patches when people discover problems.

Indeed. This is the situation of (host) HPPA. 3 people still build QEMU 
tools on it and report (build system) bugs from time to time, or send 
patches.

