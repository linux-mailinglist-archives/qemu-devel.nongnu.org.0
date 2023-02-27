Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E50B6A4E16
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 23:32:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWm2e-0007ZD-Us; Mon, 27 Feb 2023 17:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWm2c-0007YU-HD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:32:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWm2a-0002EC-OP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:32:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso4835350wmb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ofek98SXwJV2M6Yf6K+LdTUVNT4BwXDI3q6LCsUjAbM=;
 b=mvOH5L0O5VrDuqOkJOneTHF0kZjSFhkuqYqGYY1b3iDRgoS25+AjZMG/Sbr5+PT3cH
 eNVT811nI0dgMwuHj2PnFqPQdJQf+ZmaRS9u7MpvRQUD6goztJc7aYuRh2AbH2JjJueE
 YEHRp5Ng1EZrCF67kMuU7nZ1JRLnL8vZFP6rBDITyO2KP9iAuQL5zr3+VLXmlXT4ubra
 weEsjWLbVI4YP5Jhmbdi6U8LLRgCrqoMGjf12zrPfHW98Ncuslo0F4Nd1oa8iss3ReSS
 t184TWHoXYgOHbSQ3Mv2nTRA1ZLys135PxQwHvrQytH8vuhsRspz5Ik8LZQAAzjn1wdi
 l1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ofek98SXwJV2M6Yf6K+LdTUVNT4BwXDI3q6LCsUjAbM=;
 b=ekRiLnCsPf5zR1uTsLoo6KZ4d30nt0OBkBiQzbXx0MqPw7b3uP950GYWeD1yzW2wkx
 tjnMi8Qk5iY0f3FRWhIS4Im7Yhbi2ZF93GnuuHboMhbJRnCLMENqjcudmIIUqSflerBG
 wYukbu8YxYsIHntnJ6/M2hZtN2f1YIm8u15aQgYIzAqTj/mBP4lam7HiW3/cV395KdHJ
 cW0rhjioN5IpTnJKUQBMheI1CHQWFVRnjNNIPutgUzwKRNmKiAHIr+aJmM7741Fa/xvS
 DytwNEAqqMG7S6FA999vG2SSDUCMOkonOeYXp1mctHYoJ4KDVdyJhYGMW7zkNKYlFDME
 jLrQ==
X-Gm-Message-State: AO0yUKWHpWzJm7k+qDGZKlPMzbpxUHvIdaVPYGpLjFvVsJ3ni1IQwpMb
 KrujVtOMSC/Dwh8Ph/nNOlIn+A==
X-Google-Smtp-Source: AK7set9s3SslHAqqicd2niVRMhwWH/QJ3T9n5pd3LtY4pHcbw8/iWqLGlwcnuR5R+JDLd9iTy2Ht0w==
X-Received: by 2002:a05:600c:4f45:b0:3e2:24a0:ba26 with SMTP id
 m5-20020a05600c4f4500b003e224a0ba26mr482035wmq.16.1677537134886; 
 Mon, 27 Feb 2023 14:32:14 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c028700b003dc47d458cdsm10091307wmk.15.2023.02.27.14.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 14:32:14 -0800 (PST)
Message-ID: <77b8545c-4f2a-b389-2811-47d2d48940d9@linaro.org>
Date: Mon, 27 Feb 2023 23:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227150858-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/2/23 21:12, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact. eg removing qemu-system-i386 affects all
>> host architectures, not merely 32-bit x86 host, so I think we
>> can explain the impact more clearly if we separate them.
> 
> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> a superset.

Doesn't qemu-system-i386 start the CPU in a different mode that
qemu-system-x86_64? Last time we discussed it, we mention adding
-32 and -64 CLI flags to maintain compat, and IIRC this flag would
add boot code to switch the CPU in 32-b. But then maybe I misunderstood.
Thomas said, "CPUs must start in the same mode they start in HW".

> Removing support for building on 32 bit systems seems like a pity - it's
> one of a small number of ways to run 64 bit binaries on 32 bit systems,
> and the maintainance overhead is quite small.
> 
> In fact, keeping this support around forces correct use of
> posix APIs such as e.g. PRIx64 which makes the code base
> more future-proof.
> 


