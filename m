Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931851FEB9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:47:55 +0200 (CEST)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3ju-0007pE-Df
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1no3TB-0007qz-SU
 for qemu-devel@nongnu.org; Mon, 09 May 2022 09:30:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1no3T9-00013N-2S
 for qemu-devel@nongnu.org; Mon, 09 May 2022 09:30:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 i20-20020a05600c355400b0039456976dcaso6072220wmq.1
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4iKQFizM3c750gIkYu/DCwIx1/ueb1udjDCYCtWKjjs=;
 b=NJsQ1IIoh0ygEALP11yxDtFLNllWdCAwANMpBybidXAe5+8JQ1LXTdOTscdaSMpEaQ
 n/HErk2wtVCBQeTQ62l8RN79Yrvc2HB80VqV2fUX/bfZ1FakZCiEqtqQPff4XbfLA1on
 34LUIYOU/9tQO/EucJvGYN4ApStxw3OsC3k3oKJ4sbChQZ85m09UZUZQrgEnU8qw8mZt
 yjec+KNl9FF8ARVBAVHHrcR8+obfZHE5bhrUmJ3XpH7lEAPTxeIs2KX1icoJjANCzokO
 IpzrXtT5C0jwk8W8sqSvVvUsRUVwdn7RNJsT8b3GPrSGCbLFDje6WCy0AjDlUi7eLbRF
 K8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4iKQFizM3c750gIkYu/DCwIx1/ueb1udjDCYCtWKjjs=;
 b=bDPYx207QT+4XPLrfeWiCZmkE1dV+Z4rwVSVTci31KmGykBijWjCiacE8/75f71XRe
 aRQ5Vi0imGbCXqgwSjuZc+M1hA1o7kaDpLpCpIcqXzSzLohb+e5T52FJ1bvjib8Gws5r
 JGnJTGbM0T+XUxAquW5OMFyd4XFimfGMxal0ng0rIlNR1UFdL5KFc5besh3zlY0RXdF7
 TSjhQEDbJwpNvQLSAbXobx9hArVX9JLnf9owIsz+aZOFGl7F3KPuLTH5/wfcM+gF+t+P
 o6rqCbZCrsAmv7WHMfYIf+fhOerEGWhEW2Q0f3oia9A+ro/i09E9Z9JsVnbkeBT80Y48
 bD9w==
X-Gm-Message-State: AOAM531HkcdcVrqRwhuhFTPXOvDX8Q4HgG8AxKrO2+T5odeUaJGDUjSY
 02bMq3DaMV3rvRZmQEPqNMQ=
X-Google-Smtp-Source: ABdhPJxcGzQefYIrAyTLIh1G/RKr9rN+y4sE8i02aBet0NZPOy7KIOUNT43tGGmEgAl+mx++mKhqGg==
X-Received: by 2002:a05:600c:1e13:b0:394:5cdd:e8e6 with SMTP id
 ay19-20020a05600c1e1300b003945cdde8e6mr22547374wmb.108.1652103032448; 
 Mon, 09 May 2022 06:30:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 z18-20020adff1d2000000b0020c77f36b13sm11086914wro.100.2022.05.09.06.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 06:30:32 -0700 (PDT)
Message-ID: <65ed1c57-82d5-21aa-c7cf-63695c9d2b99@redhat.com>
Date: Mon, 9 May 2022 15:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 00/26] block: fix coroutine_fn annotations
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <YnkAsxsrvan0yCWY@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YnkAsxsrvan0yCWY@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
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

On 5/9/22 13:53, Daniel P. Berrangé wrote:
>> Apart from this, I also identified the following functions that
>> can be called both in coroutine context and outside:
> snip
> 
>> - qio_channel_readv_full_all_eof
>> - qio_channel_writev_full_all
>
> I'm trying to understand what criteria makes those two functions
> liable for the annotation, but not others in the I/O code ?

These two are _not_ annotated as coroutine_fn: this is a list of 
functions that can be called both in coroutine context and outside, 
while 'coroutine_fn' functions can be called only within coroutines.

The only 'coroutine_fn' function in the I/O code is qio_channel_yield.

> What is the actual rule for when to apply 'coroutine_fn' annotation
> to a function, and does it apply transitively to up and/or down the
> call stack ?

The only rule is that callers of coroutine_fn must be coroutine_fn 
themselves, or the call must be within "if (qemu_in_coroutine())".  For 
example:

- qio_channel_readv_full_all_eof() calls qio_channel_yield() within such 
an "if", therefore it need not be coroutine_fn.

- qio_channel_yield() unconditionally calls qemu_coroutine_yield() which 
is coroutine_fn, and therefore must be coroutine_fn as well.

After this series, the only exception to the rule is that 
qemu_coroutine_self() is occasionally called from tracepoints.

Paolo

