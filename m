Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA3B277979
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 21:38:04 +0200 (CEST)
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLX47-0000qv-6t
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 15:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLWxA-0003Yg-Nx
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 15:30:52 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLWx8-0006za-UW
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 15:30:52 -0400
Received: by mail-pf1-x443.google.com with SMTP id l126so370737pfd.5
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 12:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j/gg4xqgCEGdqiNVwMfGhH5aUoz73cB+0rSN9bddhEg=;
 b=l/+L4D1/2WpQnM3mb6u8o3mGhmpvKNezgDSLd9qsAFADjJ745XHzr4JQu3DmgHLT7t
 pwS9x/kE/vmGtVo+Q+ql2XTZCDiphdyTZGsxmsVMYswVbtTMhB0f9r8NlyG+xemzsGgn
 kVu3EI+PqaF+FNfzCu5/ksFYMRX8AuBfsBwUGfKTtf+23Ytgilb10HNQ2EDLBbhS1XUb
 Mx93eiJdDKYhrGPdct+jPZNO2Di9TGfNfizlT+77BrRjNYRF4p4hpn09nAFaYAnCrtSJ
 VyQFoLxFWfzd4EtWLH6ZGuikILhzeb0Stu+1X5G3MnUOuJYXjP/CORczocG6F6ouMjk2
 cwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/gg4xqgCEGdqiNVwMfGhH5aUoz73cB+0rSN9bddhEg=;
 b=fpbpgi6FPP85g17HgoJ4sU1FSUgY/F3lS4Fo9+2P2RsdNFR0wy/Rw6+gzBvqntFMpe
 7VK+7QbiRPqoRhEL/+rnHanUEZjP/wNi+506NoJFzjowtbddO4wlxc+VsApfik0tdQ72
 AukaPJjCRXk8IGk2KMqrV6NhTlUfMQYUFKklAKCxCBbieMNSDlyI6ddagRVE5viZ2b4n
 1YFxg4oMFQ25VntbPOn2BCkLnRYaG0RywKYouSzg2h0xap+czgEooU3cJuIt4E8mdkhe
 mNFH3Qy+Zw1jgvoVHz4XbdvHRN88Ie9cQpy1TjSv6YCbuSGOq3r6+tshCzPq5CpZHIvs
 p/gA==
X-Gm-Message-State: AOAM531aIGdzNc90VG7tTddG1D4NG6pzjco84M5P7zGVRPOecAuck0NG
 wqRh5ypJaWeoe9O2C/T25+q6EeFlmBbhjQ==
X-Google-Smtp-Source: ABdhPJyDwWCwz9Vln0NjP5dJEryCzJxBvdZBVIpG6fGVKc8iYtZnIZVHWj34eaA+LVDncK+020TLXg==
X-Received: by 2002:a17:902:465:b029:d0:89f1:9e2a with SMTP id
 92-20020a1709020465b02900d089f19e2amr714706ple.6.1600975848954; 
 Thu, 24 Sep 2020 12:30:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 137sm248516pfb.183.2020.09.24.12.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 12:30:48 -0700 (PDT)
Subject: Re: [PATCH 4/4] qemu/bswap: Remove <byteswap.h> dependency
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200923100220.674903-1-philmd@redhat.com>
 <20200923100220.674903-5-philmd@redhat.com>
 <CAFEAcA9XOpCyWr0QXn6T_y9nh4ZX5Op2ztonefr-pV2oQfU3iw@mail.gmail.com>
 <fd8a9c3e-45f2-caae-25ab-5e1365fd9298@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a2cc60d-2d30-eb38-369e-0a26f0eac9bd@linaro.org>
Date: Thu, 24 Sep 2020 12:30:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd8a9c3e-45f2-caae-25ab-5e1365fd9298@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/20 3:30 AM, Philippe Mathieu-Daudé wrote:
> On 9/23/20 12:16 PM, Peter Maydell wrote:
>> I suppose if we wanted to just use the __builtin_bswap*
>> implementation on all hosts (ie drop the special casing
>> of CONFIG_MACHINE_BSWAP_H/FreeBSD/Haiku) we'd need to
>> rename our macros to avoid potential conflicts with the
>> versions in the system headers there in case they were
>> pulled in via some other path ?
> 
> Yes, this is why I couldn't get ride of everything
> 
> After reading Paolo's suggestion to use qatomic*, I
> am tempted to suggest qbswap* but I am still looking
> for better alternatives...

Hum, maybe.  It's pretty ugly.  We could just leave those alone and hope the
system version is decent enough.


r~

