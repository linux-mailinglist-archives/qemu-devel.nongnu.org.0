Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34D5F6DC5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:55:44 +0200 (CEST)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogW23-0001Wu-6K
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogVcN-0008RO-KJ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:29:11 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogVcL-0002VP-Mc
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:29:11 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h10so2480970plb.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1SWXbgeUuWpV0TlfB84vbq95+569Ht5O5wI8MwLg8MM=;
 b=ns4kIjc63WTwOpwleCOg/qXXs74JULE03Ha5DYXqdns53xibck4HbPe/L0F7w5nrra
 0D3xj0w6KOZZ43q59nuzTdmt+mgoeV3rFXYo5Fj5iqv4yIq1NxDl8KZGUG+TcQxs6nGX
 G1nuIwDGQZeUtdSa8Ua+rA628H0+/vUG4LUCxNPKjFjzDAEr8tQdnyI/gr+Rsf6dPdGU
 nM/FclqgH0yB82rjNF68ti01ykoQLN4ihT/QLodGcBaJ2BDIiiMnBjlUyGU47CUI1jLN
 HXf2LsGUjNLoLeq90TTULPEhZTz3rYXKHpcK2S/UqdpKv4JIizKmg323XHJHDOC/U4u6
 ERgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1SWXbgeUuWpV0TlfB84vbq95+569Ht5O5wI8MwLg8MM=;
 b=ssa5rkj2AM/Td5Y4h6RpQReMDSVFZ9D9v/yTPhvOJ2NNizFGPDFmdXIV2X3AtkDje5
 6hx81zO+qDH7vPrMD0qqPzDbj57rbG2bdMk1cOXemljAMBBfWD/z0mtJRpCbQ/EE8awv
 w16Y9JT2zqV2t6IGNoNzPJII76Ouc1w20EB2KL9zJHhiyBzJqvmG9Kk9aiYRm2fP2yRm
 W9dq1KJTg6HRNBfdvzbRy9Dd12NRPxal7TJpQurTk5vVRQNo76LsEhSQmhoHKFdFGUu/
 wCDiLyPV0tZL+5PF4S+sUFCp0m95rFhcIpO+HWcSN552dVRT1GAIJoMQD1yk8M1EYrCC
 /nRw==
X-Gm-Message-State: ACrzQf3TZNsx4aUEM6zdK//chGE8loOvKIoBAZkC0/WYeP0DTPaOfP4n
 4/oJMbRZJQYgW6Y4u+4/t0BIgw==
X-Google-Smtp-Source: AMsMyM50F+Zu66jMZx/FkqJCHbfpbT2E+iDYOAdiRvUvjbZ4gxuoTyJVR6w1KStrkzVf8m7OuQ7oHA==
X-Received: by 2002:a17:902:a9c6:b0:178:b2d4:f8b2 with SMTP id
 b6-20020a170902a9c600b00178b2d4f8b2mr1106230plr.79.1665080948199; 
 Thu, 06 Oct 2022 11:29:08 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 188-20020a6204c5000000b005289a50e4c2sm13155235pfe.23.2022.10.06.11.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 11:29:07 -0700 (PDT)
Message-ID: <0d3f27ab-de02-c5b5-488f-08fb7e329bd8@linaro.org>
Date: Thu, 6 Oct 2022 11:29:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user,bsd-user: re-exec with G_SLICE=always-malloc
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 ncopa@alpinelinux.org, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20221004120047.857591-1-berrange@redhat.com>
 <5c5849a3-6830-8577-c427-02cb3244ba8c@linaro.org>
 <Yz8aqBq7m0wn0jvS@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Yz8aqBq7m0wn0jvS@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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

On 10/6/22 11:12, Daniel P. Berrangé wrote:
> On Tue, Oct 04, 2022 at 07:59:18AM -0700, Richard Henderson wrote:
>> On 10/4/22 05:00, Daniel P. Berrangé wrote:
>>> g_slice uses a one-time initializer to check the G_SLICE env variable
>>> making it hard for QEMU to set the env before any GLib API call has
>>> triggered the initializer. Even attribute((constructor)) is not
>>> sufficient as QEMU has many constructors and there is no ordering
>>> guarantee between them.
>>
>> There are orderings for constructors, see __attribute__((constructor(priority))).
> 
> Oh, thanks for pointing that out. I tried it, but glib threw
> a bag of rocks at me ;-P
> 
> The priority works for ordering within the scope of the binary
> containing the constructor.

Yes.

> 
> libglib.so itself has a constructor function registered, and that
> calls APIs that trigger GSlice initialization:

Ah.  I had been hoping that gslice would be initialized on first use, so as long as we 
could get the setenv done before any other qemu code ran, we'd be fine.

> This all takes place when libglib.so is loaded, which happens prior
> to any code in QEMU being loaded / executed. So no constructor in
> QEMU code can ever pre-empt this in dynamic builds.

Shared libraries have a defined initialization order too, but we'd have to play real 
irritating games to make this happen, installing a shared library of our own (linked later 
in the sequence to qemu, and itself *not* linked to libglib.so).  Not worth it.

> The only possible silver linining is that in static linked builds,
> it appears that a QEMU constructor with priority 101, will pre-empt
> the constructor from any library. This is kind of crazy, as it means
> if any library or app code uses priorities, it'll get totally different
> execution ordering depending on whether it is dynamic or statically
> built.

Plausible...

> I guess we could rely on this hack if we declare that everyone using
> binfmt is probably relying on static linked QEMU, and in non-binfmt
> cases people can set the env var themselves.  It still feels pretty
> dirty.

... but as you say, dirty.

Alternately, report it as a bug to glib, because we can't be the only project impacted by 
this.


r~

