Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E973E525EC0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 11:47:26 +0200 (CEST)
Received: from localhost ([::1]:54520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npRtN-0005H1-EG
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 05:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npRrF-0004Cx-L5; Fri, 13 May 2022 05:45:14 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npRrD-0004WE-PI; Fri, 13 May 2022 05:45:13 -0400
Received: by mail-ed1-x531.google.com with SMTP id s11so5505731edy.6;
 Fri, 13 May 2022 02:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CerjVS1mjjxZy+aX/WSCrPSD6MOOfpxfaVss3Vpnhsg=;
 b=eLAx4jL5upobp94JxJ/D8Q5ByWRtqoNme5/O5B3BoBEWUIyf2oDaWOlkuXxphPf2kw
 wSfLxyKxEz3+JnuXPTk7gapoSozYwP0nOlX+AJS0A/SVydEjW/lUlYfZ4vyLVfAZaDVE
 pXN09k/B02s6Z74NThKXM3fjOp7mWkhNJOOmRX1xRbmcnRkdQ3m/3I1iN0gQDP8jjRve
 V2OFC740jReIpfBuYLqRgN1gDN3h01rl03m+kgbg6raQyqXx3QhTA4confoSgwJhDkaC
 ny/Yl7+7hjS4hw4+XgcCdK5d+VeUAJpNMrlFGwBdW3+yOHGv2GlwiSIVCRKM4L2E3MD+
 4PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CerjVS1mjjxZy+aX/WSCrPSD6MOOfpxfaVss3Vpnhsg=;
 b=UU1um6rMO7/V6wZ5KPgrRairXuYsC0hX2xCj5qui8UB+kgfhCFWLXJcypHoATlx9gG
 J+2FAlWjW35XMby4vZe+R8qpfEPiKFzvHT9CGawsJanHT3Lidn5tJGPCPpTft1GWNjNb
 nowuSHVpNFD6G5ohuqm4618IBuKoVQgVYudBHwNJMoqlwfMr3RvMRTFfjdwykTWRrWIH
 F6nNABq/vXIBX6qYJcgAjitfrWDD+ADhwi1wHobSEXyglx+2xlx2DnKHLxwPAmrjmXvJ
 v4Y8sctq2IxLcv2pPLrx+LqtkmYi5vPBwES1IVvOUCtGfyJY/5r78/tnssoZQbUuamP3
 8clg==
X-Gm-Message-State: AOAM531k0Y95YERYHfgByXE1fMEq1dnFwRt46NuY085ukILQUapEFoIj
 gjXp+I2NKtFvfZgdRUSM7Gk=
X-Google-Smtp-Source: ABdhPJx16l6NgLWKDRycdY7T1Muuy3lmrHpX4yLJCw5/zBXLKgcGbIN4lZD16bWS+AK1iO0jRFM9nw==
X-Received: by 2002:a05:6402:368c:b0:428:715f:5cf7 with SMTP id
 ej12-20020a056402368c00b00428715f5cf7mr35564368edb.158.1652435108385; 
 Fri, 13 May 2022 02:45:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 ig25-20020a1709072e1900b006f3ef214d9fsm604872ejc.5.2022.05.13.02.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 02:45:07 -0700 (PDT)
Message-ID: <49979c50-011c-c168-205e-10baa7c760d3@redhat.com>
Date: Fri, 13 May 2022 11:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <Yn4YS1FpgtCZMMx6@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yn4YS1FpgtCZMMx6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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

On 5/13/22 10:35, Daniel P. Berrangé wrote:
> The tests is an area where we still have too much taking place in
> Makefiles, as opposed to meson. Can we put a rule in
> tests/meson.build to trigger the ven creation ? Gets us closer to
> being able to run ninja without using make as a wrapper.

I don't think this is or even should be a goal, because we have multiple 
projects under the QEMU tree:

- the QEMU binaries proper (emulators, tools, etc.)

- the firmware (pc-bios/{vof,s390-ccw,optionrom} with sources, the rest 
as submodules)

- tests/tcg


Each of these has its own build system and it's not possible to unify 
them under a single meson-based build:

- tests/tcg supports cross compilation for a different target, and 
pc-bios/ firmware will soon follow suit (which is why these directories 
haven't been converted to Meson, even though patches exist)

- firmware outside pc-bios/ consists of many external projects each with 
its own build system; right now it is not even buildable except by magic 
invocations that no one really knows

On top of this, there's support for building Docker images for 
cross-compilation which obviously doesn't fit the Meson usecases either.

In other words, Meson is the build system for QEMU *executables* (and 
that's why tests for the QEMU executables are being moved from configure 
to meson), but not for QEMU as a whole.


So I don't expect configure and Make to disappear.  Meson is great at 
building a C program as big as QEMU; but QEMU is not just a C program, 
and isolating the C parts into Meson lets Make handle the rest of the 
complexity better than before, for example with cross compiled firmware 
support.

Likewise, we're now using "meson test" for "make check" and a custom 
runner for "make check-block"; but perhaps one day Avocado could replace 
both runners via custom Avocado resolvers (basically JSON emitters 
similar to Meson introspection data).  That of course depends on whether 
Avocado has feature parity with "meson test".

Paolo

