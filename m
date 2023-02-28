Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D06A5A01
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX02u-0003zA-2o; Tue, 28 Feb 2023 08:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX02l-0003wu-9d
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:29:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX02i-0006Ff-Gb
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:29:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso5856091wmp.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y/hTQ7wRjVwyL9mjDzAcMVZjoOrcDwc8c0a8ezZTmwM=;
 b=yfouDk3DMwNHrUnCCOSNXgBoxe/y2CNcQ0egp2ip+22nav5gwG7w9C0ntTq9WCA5qk
 TyPTRfl0YNTp142xlhG3kDT9eLG+Ej8QDiwpjM7SJyY1qcfmUMdhboxPsGLGkJyP7svs
 NWv8ZNHXb1rLS0p5eeIW9lAK6G0Dd4JeJDXLv5jx8V9tgp+Qd8aHGK81Y8+AKUjKjOqX
 H6T2m+pqw514KRh8KFWEM6M68C9HjfUH3da4cjts74noBXzVEWIARiXMicE0MRnVPzSk
 aB7tKtEf7A3S6cuDNyR1vGrjB4UtHi4YtgjCqnrqt6D5YIBf11JKRnoJIYrHUAwPhgCk
 LdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/hTQ7wRjVwyL9mjDzAcMVZjoOrcDwc8c0a8ezZTmwM=;
 b=kbZ3raBPdwOpOgAa1oQjyBxBFFdOW5KOgr0yCwlhiMuOyDTtfVnW9tkKc25X+156y2
 vbuiPPIFmE0jW342UCz66GcPDSsNgqrFeY9lyyYwvgngnbcLVUALHdu/XB6vbk4MSJPU
 lvCnc5k7rQ5G0HsPVGlvizIBhQbfpEEef0D4I1A8YJaiTwAtmSpdfVo6zep2x3MV9GGW
 bpv6kcel19qVO1BIfJEqZdvCyykDvu+4ET5+sl1ocxucpqP8fMN6NVTr0/fneLQlxNWN
 HUGgJ8FKesUqqNPfMfItU8qzI9aljIonh+Xu6+oKYGn/aNZevpKGzwDSBrma7Br6nmnz
 s7uw==
X-Gm-Message-State: AO0yUKX0oT6LlcfC6qVGpNBepPkcS+AODrXqpwKxXUJX5s7DlC5ce09w
 h40YcoF/4EvuYc5FMvHoNvNvmw==
X-Google-Smtp-Source: AK7set9Cqm+gKTVi426+ObMuTYkf6kql2cPngXlfi2BoyWilV9pOlSZR2m/azE8wTCWxdBUpL5gbxQ==
X-Received: by 2002:a05:600c:4f01:b0:3eb:39e7:3604 with SMTP id
 l1-20020a05600c4f0100b003eb39e73604mr2532284wmq.5.1677590957280; 
 Tue, 28 Feb 2023 05:29:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t23-20020a05600c2f9700b003e2232d0960sm12424526wmn.23.2023.02.28.05.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:29:16 -0800 (PST)
Message-ID: <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
Date: Tue, 28 Feb 2023 14:29:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
 <Y/36fmORLIjpldXn@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y/36fmORLIjpldXn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/2/23 13:58, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 12:58:54PM +0100, Philippe Mathieu-Daudé wrote:
>> On 24/2/23 19:08, Alex Bennée wrote:
>>> This series attempts to remove our dependence on the docker.py script
>>> and build things directly with the appropriate tool. I've been
>>> noodling around with how we build images on gitlab to see if they can
>>> cache better because the normal case should be we don't need to
>>> rebuild everything if the upstream distro hasn't updated its package
>>> list.
>>>
>>> Anyway what do people think?
>>
>> Removing dind limitation is interesting.
>>
>> Unrelated, can we tag registry.gitlab.com/qemu-project's
>> docker images along with releases?
> 
> Can you elaborate on this ?
> 
> We're only using the images for CI purposes and they must always reflect
> the current state of git master. We're using a fixed docker tag 'latest',
> as that avoids the container registry growing arbitrarily large.
> 
> Our CI rules should prevent the pipelines running on stable branches,
> so we shouldn't need container tags for stable.

I'm not suggesting keeping jobs to build, but doing a snapshot of the
released containers.

I.e. when we release 8.0, we should tag qemu/fedora:v8.0 and never touch
it again. This is useful when bisecting pre-v8, but also to build pre-v8
and do performance comparison. One shouldn't have to upgrade such
container (in particular when package mirror disappear), since it
already contains all we need.

Personally I'd like to keep generic and problematic ones:
- qemu/fedora
- qemu/fedora-win64-cross
- qemu/debian-xtensa-cross


