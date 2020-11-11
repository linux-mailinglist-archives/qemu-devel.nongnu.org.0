Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C07D2AEC55
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 09:51:34 +0100 (CET)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kclqn-00055C-Jg
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 03:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kclpW-0004Wh-Hm
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:50:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kclpU-0003JC-KZ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605084611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uxp3ORX8N3kIbceQHqAjW+ZOmi6MGrIPDgVl/vmtYHw=;
 b=dhD7ChB137AYx9ULrn6aqmTkZGJ23SiDPmZ1d6BI2+DXiZLRI4HTZOeYyp2LbPm2/vwP3t
 TnZYFFE9W+edi7DxM9GYkxhvhT4Efc4JpCEWzT7IC0UFXBiurlaaEK8iPW5Wkhb64B8X6H
 cLVZYVrtfjJQc7EuFPyDTwYnGZW8P88=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-23-R1G6SOE2LN1W4JEV16Q-1; Wed, 11 Nov 2020 03:50:09 -0500
X-MC-Unique: 23-R1G6SOE2LN1W4JEV16Q-1
Received: by mail-wr1-f69.google.com with SMTP id v5so369063wrr.0
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 00:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uxp3ORX8N3kIbceQHqAjW+ZOmi6MGrIPDgVl/vmtYHw=;
 b=ilvNwY9jYT0MRSMNvXm0WbSGAVEUs6oHHEeFOKBbT/f9Ls5+Xg//CIdmd8O5UvlL0k
 ou6Cc8Kfk33juAMlXXlFJY7HecJo7jR8NJlvy0142zErdnLuCowxkkcb/RVjFZI0/gbs
 +m8s+r/mla43qS+9kULr3wQKFZuBhyfrB1Ol65bCIzS2qKEatRvw/urWg0UbgSMHFwvO
 Ejv259ukC7Oo6VTSP6KAdQerRYnIi2gl7OSF2pxc3JjNILNfgq+S2DmVQOAB3ylilGBd
 EB0NgHNZuaeLJXacnYkWnM4br3rv+b/27Imq5FbX7KfDXkFp5BI8eTj4fy5Gdq+zHgrC
 D7xQ==
X-Gm-Message-State: AOAM533WdYcq1oz6oiG+slUGXuCmOFAXJnix/UidWAF9ZilYjV1JkyCE
 cTr7a7NLMrQrwHCbnt0eS+rwLRbqUJSwZb4DSkl74K56tqKMfarLgb/yrisl9c8/22V2gvJF2km
 GFcx/S96v+HC/JpA=
X-Received: by 2002:adf:f083:: with SMTP id n3mr28645143wro.391.1605084608094; 
 Wed, 11 Nov 2020 00:50:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw97tj8yrd1QDjINux8Z0Pd+OWYonz62oXpw8vIwBSAD1ocfpWMw9iKeLFzLdh2UraGH0K8wQ==
X-Received: by 2002:adf:f083:: with SMTP id n3mr28645111wro.391.1605084607896; 
 Wed, 11 Nov 2020 00:50:07 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id s9sm1770846wrf.90.2020.11.11.00.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 00:50:07 -0800 (PST)
Subject: Re: [PATCH-for-6.0 v4 14/17] gitlab-ci: Move trace backend tests
 across to gitlab
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-15-philmd@redhat.com>
 <25d070b2-204a-51d5-a961-d6c56b39b758@redhat.com>
 <892040ab-4100-3ed1-37d9-e4ae21257635@redhat.com>
Message-ID: <c930fef5-7b90-8ceb-1a43-5ce2ab7f5b2d@redhat.com>
Date: Wed, 11 Nov 2020 09:50:05 +0100
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
> 
>>> +
>>> +build-trace-ftrace-system:
>>> +  <<: *native_build_job_definition
>>> +  variables:
>>> +    IMAGE: ubuntu2004
>>> +    CONFIGURE_ARGS: --enable-trace-backends=ftrace
>>> --target-list=aarch64-softmmu
>> On Travis it builds the x86_64 softmmu target. Changed to aarch64 to
>> increase coverage?
> 
> Maybe because the next job already test this target? I'll change.
> 
>>> +
>>> +build-trace-ust-system:
>>> +  <<: *native_build_job_definition
>>> +  variables:
>>> +    IMAGE: fedora
>>
>> Similar question here, increasing coverage by using Fedora?
> 
> No, because User-Space Tracer is a feature Red Hat cares
> about, and plan to maintain, so it makes sense to test it
> on Fedora. I'll comment this change in the description.

Bah, this is a different change in itself, out of the scope of
this series. I'll keep Ubuntu image. Whoever is interested to
test this on Fedora can add a proper job. Thanks.


