Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78C479683
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 22:49:44 +0100 (CET)
Received: from localhost ([::1]:47340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myL6l-0007s2-Qj
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 16:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myL5b-00074f-Ai
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:48:31 -0500
Received: from [2607:f8b0:4864:20::62c] (port=42606
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myL5Y-0004vN-RZ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:48:31 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u17so2954505plg.9
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 13:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ntSXbINneTFif6rl4ghOm5qREJg5i6DIe2LOkXt5egw=;
 b=LVo9XwwPH9Sduq9SrGYTw9Uv3aHv2zlgaQoDNAx7UtemjIE+PiTnyWE1966fGJ8ESO
 eUGWyO4nFI7JcMGvgR3Zcp4ikqIInBkCgPTsfFFF98UdvjMOFrmbjJMqOacivIWbiVnw
 fkklrtDz8dyYoHQGQItCiPU70lhLq831vm8ODHJ3yBbGngvbqfllP5Q9/3NtzpR7mFac
 BcucF94aEDc15RaFUZK3Cyw6a5PxxAtY2159Zb5Me6fXGPnjp1fKQ1mgTjIUervuVDl6
 hgdJzL4DBe1CI+MXnbU6/GbZAIUqfpy2Uq7eifXAqVMDIxsHoBKNJkx4ZmEWgT/5Fe84
 yVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ntSXbINneTFif6rl4ghOm5qREJg5i6DIe2LOkXt5egw=;
 b=TraX2qq9N8J79IGeVMT7A5BMH2PEhJ8q9V4fxFJXGTuS3fzsdQXR5xDbc8Tiy33aZg
 OVAKxXuDSJWH5JOk1rb8Ly6on9TPu8M+oJBdfry3Xa5Fq0Pm3NCKBEfCce//gLuczz8v
 aeEyQ7O76QTLSD9c1dD5n7q73kPcxOL0TzcrGmuNlfNU4vAJuNBv+C4e7K5nNGSXm/Pp
 BxSwZHJxe7Q6feejerKb8L2V0yZ0905AF4wwUqEffhqX1iQh4QZk9FNCn3jYsu1DPHaY
 Z1MUci/eBXGFguNpozNO429ORRZTsxpfBLxFDjrj/+bt/D2Ru76CQcuAqKw4fiDSxut7
 uSBA==
X-Gm-Message-State: AOAM531/ECpktm0GzP4gS3uAkoPS//5M+cBCzMLfh+1O4xckYHfKHw/d
 RMzc6A4Rooba+fUhKZGchzBDeGIm0iWXEQ==
X-Google-Smtp-Source: ABdhPJwC8Fg8+8SguBHm1X6ADIU8W9Q4/+MzEX/nKHaC7IigArRtdjBg/NbciK5jwGzD0M3BrYN/4Q==
X-Received: by 2002:a17:90b:4a43:: with SMTP id
 lb3mr6048936pjb.222.1639777701976; 
 Fri, 17 Dec 2021 13:48:21 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l22sm3908677pfc.167.2021.12.17.13.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:48:21 -0800 (PST)
Subject: Re: [PATCH 07/10] configure: unify x86_64 and x32
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-8-pbonzini@redhat.com>
 <92c807dc-8608-5afe-d4c4-04876beea4d7@redhat.com>
 <7711e8ef-a890-3732-9a7c-cb9326325319@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <286a0cdd-898c-354d-82c9-3925039aea18@linaro.org>
Date: Fri, 17 Dec 2021 13:48:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7711e8ef-a890-3732-9a7c-cb9326325319@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 12/16/21 7:30 AM, Paolo Bonzini wrote:
> On 12/16/21 10:10, Philippe Mathieu-Daudé wrote:
>> On 12/16/21 09:51, Paolo Bonzini wrote:
>>> The only difference between the two, as far as either configure or
>>> Meson are concerned, is in the multilib flags passed to the compiler.
>>>
>>> For QEMU, this fixes the handling of TYPE_OLDDEVT in
>>> include/exec/user/thunk.h and enables testing of dirty ring buffer,
>>> because both are using HOST_X86_64.
>>>
>>> For tests/tcg, this means that on a hypothetical x32 host the
>>> cross compiler will not be used to build the tests.
>>
>> Why not add the cross compiler definitions to tests/tcg?
>>
>> +: ${cross_cc_x32="$cross_cc_x86_64"}
>> +: ${cross_cc_cflags_x32="-mx32"}
> 
> tests/tcg does not support building x32 tests right now, does it?

We don't have docker support for x32, if that's what you mean.  But if you have x32 
libraries installed on your host, I would think it would work.


> What I meant is that, if you're on an x32 host, tests/tcg will now build i386 and
> x86-64 tests with the native compiler.
And of course, those multilibs must be installed as well.


r~

