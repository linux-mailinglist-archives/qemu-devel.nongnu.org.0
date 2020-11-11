Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011C72AEC45
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 09:46:50 +0100 (CET)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kclmD-0003nN-3I
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 03:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcllE-0003Ml-Nz
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:45:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcllD-0001xu-5S
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605084346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJIZydOp/l8aibYHmFYkMfXRyUurA7kNRjkjd4LGpLc=;
 b=OHTdExKoqFmslininSFU+8iM5kwM98r3yWvXA29o+B0VAXK1S1+KxqW8XepWayy+ZpKYuc
 NYShsSJwfgltiz34FClukoJHO/n/a+w8S60Es+gVwCEpREqfqvN9kSdR/W7TS1cK81iXlx
 NZs2kFC0jBebqnf4KU1HNm6Y1Ud02SQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-muYCcTWeMYGbPZBNd0Kvvw-1; Wed, 11 Nov 2020 03:45:44 -0500
X-MC-Unique: muYCcTWeMYGbPZBNd0Kvvw-1
Received: by mail-wm1-f70.google.com with SMTP id 3so604109wms.9
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 00:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JJIZydOp/l8aibYHmFYkMfXRyUurA7kNRjkjd4LGpLc=;
 b=mfe8ZtZqhQqX48PkjMWtPzSJeF+uoS/36pSSaXiZJFMqlLOGvuQ96TZnV734dAyCEo
 BvYnV+D895FGBV/J3rRv+dIbxxbBF7OxyZzR9c8K45E24nKDP8oUoC3fi5fLHltkFLHk
 4L1ktxIKA0ZXkjqaBQCgcZG4f2KV3PGSDYfBGLFUx/ByK13ZYMmv4Zm0ciqsTFvduq8+
 R2QciyRoalk9FxrMyX0vmjFfV8c6yr2JFdKf0i9dS4g8AdWPNy0m/bTmBtie0GprdjGN
 QMV+iyBS4Mgx+bOzrzrsOva/6hkviESKH7qziSHangV3e9FhBFAY8OH/nNC1/YiAK0cO
 AjcQ==
X-Gm-Message-State: AOAM530tLu+v+DKM1c/1lgZk4YPUKxMGk5LCgxvdg0rlzVchmHsShfho
 DIasAhxHnO6TEKZmGF1wIMgIgyR0yApdkWxlof96Bd0NQQ14YzcfhbTadrW39eIoLrOWVOyXPu+
 SgqrdiBpRM13JeJw=
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr2794361wmf.30.1605084343554;
 Wed, 11 Nov 2020 00:45:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxncOdtrjdops3CrTx/pqssXCxabyAYfKaSNx5iVjfOsn5W32GMIs3GoDuR7A+SwCXyUPwz/Q==
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr2794343wmf.30.1605084343406;
 Wed, 11 Nov 2020 00:45:43 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o10sm1665491wma.47.2020.11.11.00.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 00:45:42 -0800 (PST)
Subject: Re: [PATCH-for-6.0 v4 14/17] gitlab-ci: Move trace backend tests
 across to gitlab
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-15-philmd@redhat.com>
 <25d070b2-204a-51d5-a961-d6c56b39b758@redhat.com>
 <892040ab-4100-3ed1-37d9-e4ae21257635@redhat.com>
Message-ID: <6d130868-ba13-81bd-9d81-0ef0e9f306e8@redhat.com>
Date: Wed, 11 Nov 2020 09:45:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <892040ab-4100-3ed1-37d9-e4ae21257635@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 9:42 AM, Philippe Mathieu-Daudé wrote:
> On 11/10/20 7:12 PM, Wainer dos Santos Moschetta wrote:
>>
>> On 11/8/20 6:45 PM, Philippe Mathieu-Daudé wrote:
>>> Similarly to commit 8cdb2cef3f1, move the trace backend
>>> tests to GitLab.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>   .gitlab-ci.yml | 18 ++++++++++++++++++
>>>   .travis.yml    | 19 -------------------
>>>   2 files changed, 18 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 6552a832939..2f0da7b3dc1 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -557,6 +557,24 @@ check-crypto-only-gnutls:
>>>       IMAGE: centos7
>>>       MAKE_CHECK_ARGS: check
>>>   +# We don't need to exercise every backend with every front-end
>>> +build-trace-multi-user:
>>> +  <<: *native_build_job_definition
>>> +  variables:
>>> +    IMAGE: ubuntu2004
>>
>> Doesn't it need the lttng-ust-dev package in Ubuntu's image likewise you
>> did for Fedora (patch 13)?
> 
> No, because ...
> 
>>> +    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog
>>> --disable-system
> 
> ... we don't build the User-Space Tracer there.

And User-Space Tracer is covered on Ubuntu by the s390x
jobs on Travis. I'll add a comment so this is clear.

Thanks.


