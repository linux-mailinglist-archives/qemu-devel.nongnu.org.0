Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E05544AF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 10:41:36 +0200 (CEST)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3vvb-0001on-Qk
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 04:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o3vtQ-000179-Vy
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:39:21 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o3vtM-0001Fu-DP
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:39:20 -0400
Received: by mail-ed1-x533.google.com with SMTP id z11so16690780edp.9
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 01:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fRyxePKYW8wrGsIUj5EH/iCxrh44EYGi59DDEfsp1yI=;
 b=DGBwyiSh7GBNeYPuVLRcxB2FKC823Jmk25PfHsIaS09Khxr3QfVDLrxM8elmL+fsbY
 YhSuvi+KgBg7EByxpSyw8/xk3jkOIJJvcyaW3x40vzYH/Bv734flwz2BWE4WcRBIyn7q
 fO7Zherip9r4/gCDCxTRh9PS3QmpI59gO3NITzc0Zg6T9bSpj+HYPdE8ibl38OzlIOXq
 Faj5kP156fj6s8QKR2iZyHRxjLxsZ3INpjOhe162AInxv3bOT5SbCrBqEkMNqo/kllrb
 W0as0WYl7INKm43G/kvNQSUF1A1iEyhofqiGA+5aBfAptwScvXFRLrCqPY52gElbFgNz
 BqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fRyxePKYW8wrGsIUj5EH/iCxrh44EYGi59DDEfsp1yI=;
 b=uQx1C9IS/J5YtnyPXcqNZPxeXwA9jg5RUnepU6TggQYhrod4bcpwxrEWiFrTHzRhgv
 L0Zo2rRbPvyUA7uM0JRtPEQKbiVDeQu6WvP0Sx7Jfz6rLCzn4230jvO1Zue84Jb05qeX
 HwyhkzGY0BgeGVer5tFBv4YQLpLIzB1sg4wzqhPwtMP4BEHAQydG+J9tsGrF1JgXRhMc
 bWNThMZpceF6TutgY48K7Y4lJakJ3uPpG4ORI6JaTUBNvUHXhUPOHMV2qlKjjf7x+OdI
 4l9GWIw5rkI1SxcqxwslO7YGe8SATlNHF7swevvq8nMC2SAVwU1X2qYWrzF88LviAlZA
 pYow==
X-Gm-Message-State: AJIora9Eckc6yai9tRQSNaQqaqbKw2akzZYYvpBNn9jXtQgKp2uqK9fH
 cTZJPnrj/NBRPGAOo21P8WU=
X-Google-Smtp-Source: AGRyM1uaWbHC+q432/6fy4iOa7oynev79rNyD0q2uCS+JnJ71Xn1U5sYoUaBumaRNqDmOULrKVP3YA==
X-Received: by 2002:a05:6402:2708:b0:431:45d1:3aa0 with SMTP id
 y8-20020a056402270800b0043145d13aa0mr2809770edd.408.1655887154893; 
 Wed, 22 Jun 2022 01:39:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 u6-20020a05640207c600b004355cb1e77esm12249486edy.91.2022.06.22.01.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 01:39:13 -0700 (PDT)
Message-ID: <a28f5766-2460-f88f-7d5d-2232f113f1cc@redhat.com>
Date: Wed, 22 Jun 2022 10:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-21-alex.bennee@linaro.org>
 <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
 <CABgObfYEiV_TK4BDxG6+zZ1Qq06y6GtmnP1uF__eV31XDKggDA@mail.gmail.com>
 <9273ee87-28f6-b6bb-81be-72795f0a645b@eldorado.org.br>
 <b49f2611-55f5-ba8b-df9f-13ab13bbad09@redhat.com>
 <c11648fe-7bff-41df-f11f-bdb46f8a672c@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c11648fe-7bff-41df-f11f-bdb46f8a672c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/21/22 20:30, Richard Henderson wrote:
> On 6/21/22 09:58, Paolo Bonzini wrote:
>> On 6/20/22 18:41, Matheus Kowalczuk Ferst wrote:
>>> On 17/06/2022 07:12, Paolo Bonzini wrote:
>>>> Hi Matheus,
>>>>
>>>> could you please test the tests-tcg-next branch at
>>>> https://gitlab.com/bonzini/qemu?
>>> At be6090bcac10, it works if no BE toolchain is present. Otherwise, the
>>> script probes powerpc64-linux-gnu-gcc instead of the native tools for
>>> ppc64le-linux-user, and then do_compiler fails because the
>>> $target_cflags contains -mlittle-endian.
>>>
>>
>> So the problem in that case is that powerpc64-linux-gnu-gcc is _not_
>> biarch and thus does not support -mlittle-endian?  (I thought PPC
>> compilers were all 32/64-bit and bi-endian).
> 
> Nit: this is ppc64le-linux-gnu-gcc, built for gcc135, a power9 ppc64le 
> host.  It *does* support -mbig-endian, but not -m32.
> 
> At least gcc11 as release was not biarch, with no special configure 
> arguments.  I can try upgrading to the current gcc12 release to see if 
> that changed...

Ok, yesterday I had tested with RHEL and there the ppc64le compiler is 
bi-arch and bi-endian, but multilibs are disabled.  So it cannot build 
32-bit hosted binaries like those for tests/tcg, only freestanding 
binaries (vof).

On the other hand the powerpc64-linux-gnu-gcc binary from the cross-gcc 
package is theoretically multilib-friendly, but it cannot find the CRT 
files on the host because they are not in the .../le multilib subdirectory.

The simplest way out is to just test both native and cross.  There is 
already code to check for a working compiler in the tests/tcg stanza, 
and it can be moved to probe_target_compiler.

Paolo

