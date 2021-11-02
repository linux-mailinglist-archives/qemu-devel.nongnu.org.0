Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFD14431BC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:30:47 +0100 (CET)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvkN-0001AN-3u
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvig-0007Py-Nb
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvie-0000wy-Ts
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635866940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1kNkGoy6O0U77CuWFweB/WwefDBwVB6K6xvCiSD2Qc=;
 b=ixA/VdqIynGPaYABFkPk4xNtAzSF05otLCyxZZh2RPI4Do1+xVl6VdGFVmdFvNpQp/Hunr
 cJOwY8bSiwyNgw8CqzFPBA13x9rAbmv+4Ht6PqKHyyhAc6qVseH+TOy9TIUQhb6akK2qIS
 eqPLpts287RsLcMklm8EuutaBFuLJ6U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-0AUG90BEOaO3wjsSwodsFA-1; Tue, 02 Nov 2021 11:28:56 -0400
X-MC-Unique: 0AUG90BEOaO3wjsSwodsFA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso990659wms.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y1kNkGoy6O0U77CuWFweB/WwefDBwVB6K6xvCiSD2Qc=;
 b=DtrdYfr76ul2oMRO8ulFhu4dDXLe/FPE7RquhAADajGJC01EqmmHhlPpd5zHA7l6jf
 YQ57LXHaxkbuPluHWqFPwF7uPUa3q1116u7PkkoeAPfnzThjFb4bQy897MEYq6SsTEJO
 CpZjQKURFd4R8wNmQPyNnqRlKqmCc4Em+fhB52/doPdgQEwbZCn0hnudLnHXBGpu3y/G
 ddl0TV5VU1iRvt7XW68GHHg4LO7OirCrpvQ8oeKdjROhkY52lnFehDQIhTMW/xhRt5iQ
 Itt3vwfX2a9Mhrf0tl+UZ8SkUfdTl/wVubhNGxmXaApzgZJiItkpzf4BLZ4vFuKdH/hP
 3mhw==
X-Gm-Message-State: AOAM530n7gq0CGOuufT8P/wDs31NY7CGga5jomVUuz1pOsxNXpTNrhQN
 1lTCCIRlKMVuopR3UBks7/4xBw8DAJT/EIlwwNOw4HCHQmkTvTmffgioYm8tqINOJeJA7TbQ4MI
 zgmbBa7aIZvqJFkg=
X-Received: by 2002:a5d:5144:: with SMTP id u4mr41574222wrt.91.1635866935121; 
 Tue, 02 Nov 2021 08:28:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjs2N7DnN2y9s2CBAs9rfOeihhfpHx3Hq9Fa11vQn4SJkF8GqtF/x4bVrX/sEiZoGwQXgVkA==
X-Received: by 2002:a5d:5144:: with SMTP id u4mr41574207wrt.91.1635866934982; 
 Tue, 02 Nov 2021 08:28:54 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u16sm2731974wmc.21.2021.11.02.08.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 08:28:54 -0700 (PDT)
Message-ID: <b8a77903-0120-526f-c58a-b6ab939d033f@redhat.com>
Date: Tue, 2 Nov 2021 16:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: does drive_get_next(IF_NONE) make sense?
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 16:14, Peter Maydell wrote:
> Does it make sense for a device/board to do drive_get_next(IF_NONE) ?
> 
> At the moment we have exactly one user of this, which is
> hw/misc/sifive_u_otp.c. This is a model of a one-time-programmable
> fuse, and the drive is providing the backing store for the fuse
> contents. Borrowing an IF_NONE for this seems a bit odd, but
> it's not clear any of the other IF_ types is better.
> 
> We also just (this release cycle) added models of the Xilinx
> efuse OTP fuses. Those have been implemented to use IF_PFLASH.
> (This is a somewhat unfortunate inconsistency I guess.)
> 
> We also have a patchseries currently in the code review stage
> which uses IF_NONE:
> https://patchew.org/QEMU/20211101232346.1070813-1-wuhaotsh@google.com/20211101232346.1070813-6-wuhaotsh@google.com/
> Here we are trying to provide a drive as backing store for some
> EEPROMs that hang off the i2c buses on some npcm7xx boards.
> 
> Are these uses of IF_NONE OK, or should we be doing something
> else (using IF_PFLASH, defining a new IF_*, ???)

IIUC '-drive if=xxx' is deprecated, replaced by '-blockdev'.

Personally I expect a BlockInterfaceType to be a bus interface
and see IF_NONE as a buggy case.

See also:
https://lore.kernel.org/qemu-devel/YDY7KKI1Xme29UlQ@stefanha-x1.localdomain/

I am not sure about the amount of work required to fully leverage
-blockdev and remove -drive. Can it be sugar-expanded from the CLI?

What else is missing to finish the blockdev conversion?


