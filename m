Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2744E6610AF
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 19:03:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEDWr-0002ly-E3; Sat, 07 Jan 2023 13:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pEDWo-0002lH-Ri
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 13:02:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pEDWl-0002w1-Or
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 13:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673114562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpiU32yy2XtXklGJ0Cvp/b0lrKijQHOfyEzjaIwmx/M=;
 b=QLKiz6GhpFuJkfDbmWn/PDmk7wiNX6HAq3kXrPJE/ny1rNcgfEdcvm/PTeymi59s6ecTB+
 3Au89I/0mjlntN+ZbAOS6CZHpJzKZIXxnhdTIx1awyIzMNWyVedFRnQ3Nb0xf4yNjEv30g
 n4JMMayMNSF5ZVqybBqWaE1O8sJQ7Fw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-XnlPF-MPPbif4XJq_44wAg-1; Sat, 07 Jan 2023 13:02:40 -0500
X-MC-Unique: XnlPF-MPPbif4XJq_44wAg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso2631355wms.9
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 10:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NpiU32yy2XtXklGJ0Cvp/b0lrKijQHOfyEzjaIwmx/M=;
 b=HkK/egrerKKSL8aDt7kUPEeFcF2iJJjsAjVW31YP1ni9jUdMHjMVm/87K6IYB9Xl9Y
 vHhppHIEffv1PB66PY7mFdlP+sakeY3vPj+0pPr1GTApTQ2hAEVz0ST6jasK6vdrKQ3T
 04u1VbhwK9cz77dQ9n2GqMfEGhil0wzrIkjL6Bq8F1HXK/Gf4IBVL6DdvaRvOgQv2f5P
 Ym/CDWcD/9QQ4dmxK3XMempX8v8iXbl325pT84WDCDWtcb9oXNVng6y36qpq5iAeiA+8
 IRzDcTZYwMH6AHB3ugInMRKOS2sPwNjSGmPCDjWOwdU5fmr4g30UCbCP8GWfYbhyoKi/
 TQgQ==
X-Gm-Message-State: AFqh2krtqdZTXF9dlHrni4ZADHSk3B2AeZDn0YmC1HVFRZ0DioA/ZYfy
 DIQKbJ9xKGHHxgtyAXFTFno7+scNtV7+5JnCj7DbLdnM1I1h5+0NmPluRkeBQJUsxaiBIPK4wlR
 iqPLnHpt6Ub8IoQA=
X-Received: by 2002:a05:600c:1d2a:b0:3d3:50b9:b1a1 with SMTP id
 l42-20020a05600c1d2a00b003d350b9b1a1mr45897916wms.1.1673114559846; 
 Sat, 07 Jan 2023 10:02:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsYAZCj4jMyN5MbnnnXUpONRRmZOznep10W0JjSpzKX0RZ7Im6eRJqxp8FDj3CYU+9KFaBSQg==
X-Received: by 2002:a05:600c:1d2a:b0:3d3:50b9:b1a1 with SMTP id
 l42-20020a05600c1d2a00b003d350b9b1a1mr45897909wms.1.1673114559603; 
 Sat, 07 Jan 2023 10:02:39 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 m17-20020a05600c3b1100b003cfbbd54178sm18851678wms.2.2023.01.07.10.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 10:02:39 -0800 (PST)
Message-ID: <8cf1e1ee-1e2a-d53f-3f8c-e870fe51f75d@redhat.com>
Date: Sat, 7 Jan 2023 19:02:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Anton Johansson <anjo@rev.ng>, philmd@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com
References: <20230102104113.3438895-1-ale@rev.ng>
 <CAJSP0QVbvgr6wHY9e6f7UgZ-vum5vGUNH+h0Lf93BpdEcFJf0A@mail.gmail.com>
 <20230103162603.74f631aa@orange>
 <CAJSP0QUd9Q25pT3OXst4V-1FKLo65jJnn-6-7d_O5hkPeJfPyw@mail.gmail.com>
 <20230103171149.3bcf0526@orange>
 <CAFEAcA8XY0Ks1mxMasZ9U4m-CNPsuLFU+9ercmb10kscP3iYSw@mail.gmail.com>
 <CAJSP0QUWxTbpyfuQhKQ33BKHKOWTTMrCo5QASSqjag9wz9a=gA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJSP0QUWxTbpyfuQhKQ33BKHKOWTTMrCo5QASSqjag9wz9a=gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.114, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/3/23 20:31, Stefan Hajnoczi wrote:
>> The other problem with this file is that it appears to
>> be generated differently depending on the host distro
>> (specifically the default value for the --libdir option).
>> That also would seem to nudge towards "don't commit a
>> generated file".

I wasn't aware of the libdir default that Peter mentioned, but the same 
issue would happen for release tarballs so "do not commit it" would have 
to be extended to "do not ship it", that is do everything in Python.

This in turn goes back to the reason for the buildoptions.sh approach: 
the path to the Python binary is not known when "configure --help" 
prints the help message.  If the user does not have a python3 or meson 
binary in the path, requiring "configure --meson=... --help" or 
"configure --python=... --help" is not hideous I guess, but not pretty 
either.

> Paolo: Is the meson-buildoptions.sh approach a temporary solution or
> something long-term? Maybe everything can be migrated to meson
> eventually so that ./configure and meson-buildoptions.sh are no longer
> necessary?

It is long-term.  Meson is only used to build the emulators and that 
part will move entirely out of configure soon, but other parts of the 
build (especially tests/tcg and firmware, which need to build docker 
containers for cross-compilation) are separate and there's no plan to 
use anything but configure/Makefile for the overall orchestration.

While I have noticed stale meson-buildoptions.sh it's never happened to 
me.  I ascribed it to someone not noticing the dirty file rather than a 
bug; it should be possible to add a test to CI that catches it.

Paolo


