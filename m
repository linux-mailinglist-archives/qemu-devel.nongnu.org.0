Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AE7483ED8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:06:45 +0100 (CET)
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fmH-0000AW-0r
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:06:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4fj6-0006H2-El
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:03:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4fiz-00029C-Fr
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641287000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlO1H2kd7LlcCtye6cUzTipAzY2ie3kVy6q3Eb2RLhs=;
 b=D3cGVUAHLJlP9tzCkESqKkdDxeXvhd0PGS3sHLDXdZ2y6kNv8Xk1YnNPN2G33wesGQNA9P
 r2a066mB0WXDeCrMWRWSSS2IZZrpZY/y0ZD8E+4sYxE/awqq95W0NqeHsFiDV+R7bnodsM
 OFslkcAWI6OUBqbVof7SoAeQc6skPMk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-gFZvTAvTOLes9w2_E4YctA-1; Tue, 04 Jan 2022 04:03:15 -0500
X-MC-Unique: gFZvTAvTOLes9w2_E4YctA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v1-20020adfc5c1000000b001a37fd2fa2dso2422730wrg.22
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 01:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=wlO1H2kd7LlcCtye6cUzTipAzY2ie3kVy6q3Eb2RLhs=;
 b=OnGP89K4X5bsGqV8Yn3DjTbgPiwNM4msEm7iW3wgygCQt6yPAopnbxZcl4yXrtsqkx
 Ql3phrXez5ZnsxpRxcTTTd7oO1DqOAsKTyL5BR4UZ+oeFJi3Wi0Pi96wJfynkVHH0o5M
 HuoGMa5Y89GSS82hvjxktr3ARCF4rwno7thh793od5YrLGuqrZ9yMzWtIhc40+tf/p7N
 5PSIh6A1Lqmcj2WKUHxhMCGQT2I2aKQ9j0PJMP2l1ge5e3jSMuV0Is1DQ+AimhBL6163
 X8HzOD+S55pnCpq4AcDd7qiBAI2gHBFQGKdcXH12NlMcFByiy/HjXqw8GPjwE5MjWks5
 h/Rw==
X-Gm-Message-State: AOAM532qXe7gzY5pLbXKshn8BdFIuQf/xZxPNK5ep7+N+Bz4TC626CoG
 oLWNKaStu4ndnhKeQ1wLvMPdj9CjkmeovEDnclf3Obh45z4eeiZFV1SMHZyXeogePLSydjgLfoU
 b0bxbih7cZqMbTIw=
X-Received: by 2002:a5d:6483:: with SMTP id o3mr43909681wri.101.1641286994220; 
 Tue, 04 Jan 2022 01:03:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwaJ4/YUV7yQvPdPkRAEl9p9hua5x2zfZPCLMZXN2302Vc7gq4SuG74tEmd+ztXXA8SrFlZA==
X-Received: by 2002:a5d:6483:: with SMTP id o3mr43909664wri.101.1641286994041; 
 Tue, 04 Jan 2022 01:03:14 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id c7sm41694753wri.21.2022.01.04.01.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 01:03:13 -0800 (PST)
Message-ID: <e34c782a-d22e-cc95-58d6-d6e2e495dfa2@redhat.com>
Date: Tue, 4 Jan 2022 10:03:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
 <9ace664b-2396-a338-c59f-35cdbdbde3e3@redhat.com>
 <CAMxuvayE-jJ5sdfv_a1oR5X+pK3iGAy3w7Ti8LQ5YB7ZSTEvyg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] docs/sphinx: fix compatibility with sphinx < 1.8
In-Reply-To: <CAMxuvayE-jJ5sdfv_a1oR5X+pK3iGAy3w7Ti8LQ5YB7ZSTEvyg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/01/2022 09.15, Marc-André Lureau wrote:
> Hi Thomas
> 
> On Tue, Jan 4, 2022 at 12:11 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 04/01/2022 08.46, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> SphinxDirective was added with sphinx 1.8 (2018-09-13).
>>>
>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    docs/sphinx/fakedbusdoc.py | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/docs/sphinx/fakedbusdoc.py b/docs/sphinx/fakedbusdoc.py
>>> index a680b257547f..d2c507904654 100644
>>> --- a/docs/sphinx/fakedbusdoc.py
>>> +++ b/docs/sphinx/fakedbusdoc.py
>>> @@ -7,12 +7,12 @@
>>>    # Author: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>    """dbus-doc is a Sphinx extension that provides documentation from D-Bus XML."""
>>>
>>> +from docutils.parsers.rst import Directive
>>>    from sphinx.application import Sphinx
>>> -from sphinx.util.docutils import SphinxDirective
>>>    from typing import Any, Dict
>>>
>>>
>>> -class FakeDBusDocDirective(SphinxDirective):
>>> +class FakeDBusDocDirective(Directive):
>>>        has_content = True
>>>        required_arguments = 1
>>
>> Thanks, that fixes my issue, indeed!
>>
>> Tested-by: Thomas Huth <thuth@redhat.com>
>>
>> I wonder whether we could turn such sphinx warnings during the configure
>> phase into a hard failure so that such bugs would fail in the CI instead of
>> getting merge without notice...?
>>
> 
> I don't think there is a way to set the max sphinx version (an
> argument such as --max-version=1.7.9)

Yes, I didn't expect that... I was rather wondering whether warnings could 
be turned into errors - and there seems to be "-W" option indeed ... and 
looking at docs/meson.build, we even use it if configuration has been done 
with --enable-werror !

> The only way I can think of is to cover building with that version in
> the CI, as long as it is supported.

I thought that it would have slipped through the CI since the warning was 
ignored - but it rather seems like it slipped through since the CentOS job 
is not building the docs at all! See:

  https://gitlab.com/qemu-project/qemu/-/jobs/1937664125#L260

I'll send a patch to use --enable-docs there, too:

  https://gitlab.com/thuth/qemu/-/jobs/1938762318#L4071

  Thomas


