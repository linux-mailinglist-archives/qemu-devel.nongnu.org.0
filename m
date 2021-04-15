Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7B0360522
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:01:35 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWxsS-00076F-8M
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWxqh-0006Ud-1s
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:59:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWxqc-00080V-J1
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618477176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PV+D1WH/Db8cw1OB6rvOwZcEnD/HykF2axUOl25fZXI=;
 b=YNFAvMUulYhiKY48W0y3TJwYZCx8RuAGpXK1zjWx/HMs8O30M6i0COc9+5xb3wAMXwQway
 +Y06PFcqm4ZjpRV2GmFtAWBJUEU9PyoGSsiKrpkwP7yMH5JVT5Oi2m1Eei5I+S0VP+SoZh
 3zWsWdRuvsdnQHSWze+QFFtlVueN76s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-2aWAuMViPZSKD-TwMWpRDg-1; Thu, 15 Apr 2021 04:59:35 -0400
X-MC-Unique: 2aWAuMViPZSKD-TwMWpRDg-1
Received: by mail-wr1-f69.google.com with SMTP id
 t14-20020adff04e0000b0290103307c23e1so2422960wro.8
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 01:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PV+D1WH/Db8cw1OB6rvOwZcEnD/HykF2axUOl25fZXI=;
 b=YPFYHOCGrs4jYqn9o7Zl17+o8mX0MQN1siKgQi7A434PPOEZ2uC6LbgODLxvw4qrvk
 ql4yxFg4FwmPJURjZgWgh1QyBOrGpcL3aYyurOxAMb3Xw7wScyPo4BDJHupSaeDGMAqC
 2kpGSzKGLFnNeMBftfnl/qK5NAzp7xN8Pr6NrzEROpzHVwM+nmaSu3xU4U61ptyuawgJ
 OQ4WQRxxLu5yFk9cEbkxBRMDjjMhMS1U1nioGfX+zepBDunOV0GAajMAfPvtYA6s/YiN
 Xh6UwgdRfgNPDQu+Jh5OVtatndTWCU6fD9AnQ8ahdLn9x+6JvMHZoAFWdlf/eaS2q5Gx
 Ty9g==
X-Gm-Message-State: AOAM532nKcjkbfwWGwSYagAL5Pr/HZ1vnXw5kQTbqhfsLdZNjW03gDlv
 M0+pTePuRzj5GCrGTMlb50eYbRosK+eGiZCnpHzxZIESZdWCksE5Vj6s3xgloFGl0OXC4DhAawj
 dSvowEEEs+TmwJCs=
X-Received: by 2002:adf:dd49:: with SMTP id u9mr2256104wrm.337.1618477173930; 
 Thu, 15 Apr 2021 01:59:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7kPrzeBzdrffJO7B5QQO2D6dX0GxZye5aI8gu6n+zAseb9J92CvtkAbdTB+zSMiC/nI3sKg==
X-Received: by 2002:adf:dd49:: with SMTP id u9mr2256087wrm.337.1618477173744; 
 Thu, 15 Apr 2021 01:59:33 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d2sm1982067wrs.10.2021.04.15.01.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 01:59:33 -0700 (PDT)
Subject: Re: tidying up osdep.h
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA95ZobYrOaDA4O4ESWNAKkMi-y8QUGoVQRkC2ujbtNeSA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f580695-b88a-7f4e-6e84-cfd3eed0914e@redhat.com>
Date: Thu, 15 Apr 2021 10:59:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA95ZobYrOaDA4O4ESWNAKkMi-y8QUGoVQRkC2ujbtNeSA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 9:17 PM, Peter Maydell wrote:
> (cc'ing people related to the recent 'extern "C"' patches and also
> randomly Markus as somebody who's had opinions on header cleanups
> in the past...)
> 
> osdep.h as it stands today is a mix of two things:
>  (1) it has the "must be included by everybody" items:
>    (a) config-host.h, poison.h, compiler.h
>    (b) things which must be done before any system header is included
>        (like defining __STDC_CONSTANT_MACROS or WIN32_LEAN_AND_MEAN)
>    (c) includes of system headers which we need to then fix up for
>        portability issues (eg redefining assert on mingw, defining
>        fallback versions of missing macros)
>  (2) it has declarations for a library of QEMU functions, some of which
>      typically wrap and abstract away OS specifics (like qemu_create(),
>      qemu_unlink()), and some of which seem to have just been dumped
>      in here for convenience (like qemu_hw_version())
> 
> Every file needs (1), which is why we mandate osdep.h as the first
> include; most files don't need a lot of the things in (2) (for instance
> qemu_hw_version() is used in just half a dozen .c files). Is it worth
> trying to split some of the type (2) items out into their own header files?
> 
> I suspect that the advantages would be primarily just making osdep.h
> a bit clearer to read and less of an "attractive nuisance" for new
> additions; I imagine the bulk of the extra compilation time represented
> by osdep.h is going to be because it pulls in dozens of system
> headers, most of which are going to be required under heading (1).

What about:

- extract qemu_hw_version() to "qemu/legacy_api.h"?

- extract (1) from osdep.h as osinc.h (because described as
  "OS includes and handling of OS dependencies")?
  Or KISS as "qemu-first-include.h"...

- osdep.h now contains the declarations for osdep.c

Regards,

Phil.


