Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD8E52677C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:52:07 +0200 (CEST)
Received: from localhost ([::1]:43752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYWM-0002km-1J
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npYUJ-0000yJ-2W; Fri, 13 May 2022 12:49:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npYUH-0002l7-BF; Fri, 13 May 2022 12:49:58 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bv19so17360625ejb.6;
 Fri, 13 May 2022 09:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2gP3t0b3TD2glZhRzeUKaeKQsngLcvt+iKEz+JZR8rg=;
 b=Vkq3Qx+NXCAMw8chP2pxTWikljnwr5HhLTtyA2STPwpqf0et2zxIYgCGNAFcskM8AE
 UkGwqcJvKOr5/dFv79Z/IkzoYmqRMcAdfdbUrp/mfyw6zh3jL9tpYnM7xYO42G2cst0B
 INWPC7L2RqiSL6whqxUjyP0kc+B4TTekF0g01UdXtM8VYjJodspZ6q0srT3r8cnUcy+D
 TKECvq3qJDaJ8nvqOPKbEmOWBIpqKoNLqTWL/Akh9Odfq4puLt2jTrZinXoXqJRj/31w
 CC6XXUddqObrhoQjiMYa2EcJLkKivI8S9hMnODiFD5Sxixs3ByNxVLCD+e6C9SdS6LX8
 nweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2gP3t0b3TD2glZhRzeUKaeKQsngLcvt+iKEz+JZR8rg=;
 b=rjKA07bnLQ7p3Uw1RAK1ICrEnua8IEExh1GYeLK3cKcwNAjRlEeYPRqrl9sf6tx1Af
 Ioz8QbuDUsXwfiFyk2wGYe9HNYhVOOgFeLxNiTaqbCCA4EVALKYzabE9OhVfc+DNicdj
 M5hPWaRoTc3JIoalYcYX6DAVGTW2EW5kin4EQdNqauIyBNPzA6cH8awd4WEd8jadQfJv
 rxNBH5hvFDBl0Q0/YPnlEBx+SVr+rRNxjt2dmlc6uhsAflgRcz6FBwSpqdDVtZyqDvvU
 r2RM0GPvwSj1+bsjA6dTdc8BY12B/yG3RIhvJoKDh5E7YVKSNngLknZiGYp8yaGAhjoq
 8Xmw==
X-Gm-Message-State: AOAM530MXK0TGyZX/02gWJekT7+Wzv2PsJcOnL1XzjlZY/DMIqP5Z8fm
 E1rrnpD7NQLeZKaJ9Qn7nOk=
X-Google-Smtp-Source: ABdhPJwGbm3W+KpGXefnh3vCgwivDrKHvFviu7r+QwF5Fg/Ao6/omnEr0UK8fD8QErQXok6fuX2VoA==
X-Received: by 2002:a17:907:3e21:b0:6f4:6c7c:c781 with SMTP id
 hp33-20020a1709073e2100b006f46c7cc781mr4880227ejc.735.1652460595169; 
 Fri, 13 May 2022 09:49:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 f9-20020a056402328900b0042890ee5034sm1167469eda.55.2022.05.13.09.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 09:49:54 -0700 (PDT)
Message-ID: <d26567e9-f4b4-ff0c-6312-ad9162adaf90@redhat.com>
Date: Fri, 13 May 2022 18:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <Yn4YS1FpgtCZMMx6@redhat.com> <Yn4y9BorEDzOLhFH@redhat.com>
 <CAFn=p-Y77=F=qjdwWRycFafxiS7Rjxag4gLmPK0ERqEiyT19ig@mail.gmail.com>
 <Yn6CPm3VosPfcK7j@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yn6CPm3VosPfcK7j@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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

On 5/13/22 18:07, Daniel P. Berrangé wrote:
>> e.g. what if I want to require mypy >= 0.900 for testing, but you have a
>> system package that requires mypy < 0.700?
> I would expect us to not require packages that are not present in
> the distros implied by
> 
>    https://www.qemu.org/docs/master/about/build-platforms.html
> 
> if that was absolutely a must have, then gracefully skip tests
> if the system version wasn't new enough. The user could always
> pass --python-env=pip if they want to force new enough
> 

Consider that e.g. RHEL RPMs do not do mypy or pylint in %check, because 
the version of the linters in RHEL is usually older than what the 
upstream packages expect.

I don't think it's a good idea for QEMU to support what Red Hat 
packagers decided was a bad idea to support.

Paolo

