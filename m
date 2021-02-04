Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E230F000
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:54:54 +0100 (CET)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bLi-0000FR-2W
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7bIr-0006M9-59
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:51:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7bIl-0005HA-5a
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612432309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iR9FfhUG7AmQuTSPIo+YHDWdA0AOpIYKdlbYdDwhs6c=;
 b=Lk+/vmvZztMdItfaHwZNeTcZiiRD7RRuWFIo0q2mErSv9hUhTGBCjQUO1zgnQTPikZ/NYm
 AW1cVS3RAbeQXXQg/nlpMdOxuIlTwN3j7ihLybMsi6PlRBBnTA357iYSprULtnSKWQKMTR
 I8CrrR+jFwu35Y31UtUYQyfPp+BbjNk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-dd4TGo-WOO6-XplXp2bLuQ-1; Thu, 04 Feb 2021 04:51:46 -0500
X-MC-Unique: dd4TGo-WOO6-XplXp2bLuQ-1
Received: by mail-ed1-f72.google.com with SMTP id y6so2478613edc.17
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 01:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iR9FfhUG7AmQuTSPIo+YHDWdA0AOpIYKdlbYdDwhs6c=;
 b=BVfMAm+sWS/vyXvANLxDjTt3sl6OZ5Mm/K3LGSxu3R9kCfoOZI90s8YWNY1OUOfRRE
 bPfH7q+DbIwWSuJSi7z8DLIE9AZxGsDh1qrx4NmlklCyU77Rh0b73ZIdR1FFRBItRvbZ
 VQY8kXkZ3hrzmI5yZJzginRRvq/5FMGi2zIgMojOmGXWaa6tA0v9dtA4pUFg+aNH//CS
 P558GpvO25KFp7/MCGFl0Hp7mLE5glVjDRvbw4RyOwWQsgXlV7bHFJzXFTuuQ7oYSwvI
 DHJPxJJplEpnBzIM7UYiK+XIjsJS67huNj10dAKwqOfznDp01OlA8uW7nYUC9YvoLYeY
 qCVA==
X-Gm-Message-State: AOAM5306Nt5t6RN+YJtBcQXiSREYobc6QExhNLNsK3Rv5ksw/TTRVaXX
 bPqnJF90PJ64DnQkgTCzQiY0CEyeQmWXOrXQ8lw/4auLYVpEHCQcYFtLyz/9cmKy5ka4XsoljF7
 b8BJTnAktkXKiIeQ=
X-Received: by 2002:a05:6402:402:: with SMTP id
 q2mr7217630edv.116.1612432305071; 
 Thu, 04 Feb 2021 01:51:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwg/pWtCa7+UJslPf9gmvf2q6yM2+D1DXSi7YBoUvlRyGO3Jnna1AG3lJ8E4G7sEjFhju6/lg==
X-Received: by 2002:a05:6402:402:: with SMTP id
 q2mr7217616edv.116.1612432304902; 
 Thu, 04 Feb 2021 01:51:44 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id m10sm2160289edi.54.2021.02.04.01.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 01:51:44 -0800 (PST)
Subject: Re: [PATCH] trace: add meson custom_target() depend_files for
 tracetool
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210125110958.214017-1-stefanha@redhat.com>
 <06b6fb5e-cf9b-aa0a-265e-3d523faed814@redhat.com>
 <CAP+75-U6+qCKtJTEYwf=Tu5Z_Hawzj7ia6WsEMyy2hNEO9ZG-Q@mail.gmail.com>
Message-ID: <aff3963f-5608-1f02-5c15-07739d462c12@redhat.com>
Date: Thu, 4 Feb 2021 10:51:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAP+75-U6+qCKtJTEYwf=Tu5Z_Hawzj7ia6WsEMyy2hNEO9ZG-Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 9:56 PM, Philippe Mathieu-Daudé wrote:
> Hi Stefan,
> 
> On Mon, Jan 25, 2021 at 5:40 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:>
>> On 1/25/21 12:09 PM, Stefan Hajnoczi wrote:
>>> Re-generate tracetool output when the tracetool source code changes. Use
>>> the same approach as qapi_gen_depends and introduce a tracetool_depends
>>> files list so meson is aware of the dependencies.
>>>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>  meson.build       | 28 +++++++++++++++++++++++++++-
>>>  trace/meson.build | 21 ++++++++++++++-------
>>>  2 files changed, 41 insertions(+), 8 deletions(-)
> 
> Please do not merge "trace: make the 'log' backend timestamp configurable"
> without this patch -- even better, queue this one directly after it -- as this
> gave me troubles with the multiple directories I'm using to build:
> 
> In file included from trace/trace-io.c:5:
> trace/trace-io.h: In function ‘_nocheck__trace_qio_channel_command_wait’:
> trace/trace-io.h:1756:13: error: ‘message_with_timestamp’ undeclared
> (first use in this function); did you mean ‘error_with_timestamp’?
> 1756 |         if (message_with_timestamp) {
>      |             ^~~~~~~~~~~~~~~~~~~~~~
>      |             error_with_timestamp
> ninja: build stopped: subcommand failed.

I just realized bisecting, this problem is present when jumping from
*after* 0572d6cd29d to *before* it. Range [7fd51e68c34 -> 0572d6cd29d].

I doubt there is much we can do :(


