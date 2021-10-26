Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586343BB63
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:06:49 +0200 (CEST)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfSie-0007vM-B6
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSfC-0005kH-Jo
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:03:14 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSfA-0003Dd-SJ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:03:14 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 y1-20020a17090a134100b001a27a7e9c8dso2850575pjf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1cLMxJ7CcXtPna0GD2nyy7r80b3Ys3zUNzhvEL1FD/U=;
 b=G5GEQ5DCofHWb1fgL6Gwxde7Mut41JuMNSUL/I4DiZgeISn5Z8J3XKy6LM8kNG3EzB
 zzG0n60HP3cK+b7KbeyCktP9WpkAq3obIk6lhUrNV8cis1FYbiAKeLOFtzjcUeOZESqJ
 3vo5MiMBCYlywm8SxCAnw/Eqxt+pALCqcSPWVrtKlE15cOzMQrAuR4D4+a1RmTA2zZlr
 NtFN5FN9T4AZ+kKzJ4Q9f1OyIilgESxSvKuNLL0AVZxTWlzBo8efCDLzHm9a+TmJ966p
 6U7K0/q/ahULpHbD+ACbfHstW4k+yK/NnOavTLaP1vDkdkxz/yCsX5W/sP8zkV4i9lRA
 ln9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1cLMxJ7CcXtPna0GD2nyy7r80b3Ys3zUNzhvEL1FD/U=;
 b=Z1EOtiferqBOdcr65L4VVo8rOwasvVfBG2r45SFQH32Nu7ZMBWCh9pSs9D89HfXzcv
 rvCSKT8XE6Zk+JUw9uvu6dsPZI/73bNcleCAlu1r+yRi6hA2TWUYvqJHRz4x++qLXseU
 Fa1u18TQOiC7LU6qwcw3ZUGGcBQW1WEhCQ2Duy7RPVql4XGIxwSWz1wo/+QZIscKg5BB
 TgfPhnRlJzb5uyuOLW7gkidgqTWHkIzM7VaotgWfl/Kjqq3cy3EqGo47zgllYUxbfrJn
 Dz83BCfxH4Gw3vIXx58gj3Hbyv8JekFw0OSezo6X8vQitN3Dbklh3oqPpe8p2tLGm3vp
 cyzA==
X-Gm-Message-State: AOAM530b2WMD2smxNvxVTFHP9rR7gPqO7tvQBeEDCpbnzUP54of9dcu/
 x+awD4AL1b/4icr86KTkXUey2g==
X-Google-Smtp-Source: ABdhPJw9vsrVTL/zSRzomNXCfhuZfcWoWwwtxy6J2K38X4Y2SMoH8WGTAdUkW4AIwGsOAdIXhhNWYA==
X-Received: by 2002:a17:90b:1c0c:: with SMTP id
 oc12mr969995pjb.124.1635278591495; 
 Tue, 26 Oct 2021 13:03:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 8sm1543312pjt.46.2021.10.26.13.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:03:10 -0700 (PDT)
Subject: Re: [PATCH v1 12/28] ebpf: really include it only in system emulators
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <036c7bef-4093-6f0a-2e68-8db53c436ff8@linaro.org>
Date: Tue, 26 Oct 2021 13:03:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> eBPF libraries are being included in user emulators, which is useless and
> also breaks --static compilation if a shared library for libbpf is
> present in the system.
> 
> Reported-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20211012162252.263933-1-pbonzini@redhat.com>
> ---
>   meson.build | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

