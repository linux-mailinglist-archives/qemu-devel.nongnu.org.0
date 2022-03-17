Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B794DCA96
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:57:38 +0100 (CET)
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsVN-0002eq-JB
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:57:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsUQ-0001Zr-HF
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsUN-0007gn-U5
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647532595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7y8QptRiFal65F05yWLT3TmwlZL5Csq/v0czcOLNEM=;
 b=H/58AGhaY0T2PwOec9bGPO784DhdI/tEVXsZSJvKOXWhFR5qJsRFgp4LNLKqfLK34UBdkt
 C+uBjlKDi18SR/zPNz7e5700sxGmLq8ZPSnJt388Yt4YA2gJUzD+ewPVX17OSus6PBqOLU
 zOgZRz4Kl4BiI6FPtO9OINJ4Gvr2zsQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-tCP7H_7DOc6rgfhNnfzcJw-1; Thu, 17 Mar 2022 11:56:34 -0400
X-MC-Unique: tCP7H_7DOc6rgfhNnfzcJw-1
Received: by mail-ej1-f72.google.com with SMTP id
 d7-20020a1709061f4700b006bbf73a7becso3141636ejk.17
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i7y8QptRiFal65F05yWLT3TmwlZL5Csq/v0czcOLNEM=;
 b=ZQn3LwOgBUEj2YpnM7d/fpksw38XX+23z6z9tzEQbbFHvlKECrImjIPEVGXuN1vX8U
 mWHImOFamEOpW8i6Pu18RV+bgmsvFDC38F9Mer8SfQ1jChdttzuKJuadgm433RVwBdWy
 iv4Xfy2pfvhOC57fJpRY7lk07cPEj29TaeYeiRqS0z4vSG8aEz1B5dwTcqOPls6kZWcP
 mKIxWxBXqK8RcMdlNm8aSuOBp3kKpP5u6Bfr1DNriDPDNlneUzTzCTPQSUuwv+8A2Pe3
 3iBgZllxGEV2LkaYCpdy1/LZP7vugKCq0ZUEsKUWC6RjTRXZ7S0RL0iHYhGSjKfZBcxZ
 eq4Q==
X-Gm-Message-State: AOAM531lwLHYAC4Jh5MBIVdxrz9nrnh6R2ARDrLw7RXG3zt3U8F9vLuB
 Oaod7HK1LcsYdMrIfswqD8QUuXHExuphcPbKyHJ1mKfQqccPx3OKDTI1Zh2iCPBM6E2NloXu38g
 aaN8TphTtyX5Koxw=
X-Received: by 2002:a17:907:7da6:b0:6db:2e12:b85f with SMTP id
 oz38-20020a1709077da600b006db2e12b85fmr4878162ejc.312.1647532592789; 
 Thu, 17 Mar 2022 08:56:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeVbr34Ockxca7mTykDQO9TCpTqxckXqll74T4YtewMQmv4EJ5t2qPVq1e5mCle9/o1SiNkQ==
X-Received: by 2002:a17:907:7da6:b0:6db:2e12:b85f with SMTP id
 oz38-20020a1709077da600b006db2e12b85fmr4878132ejc.312.1647532592576; 
 Thu, 17 Mar 2022 08:56:32 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006daecf0b350sm2534761ejy.75.2022.03.17.08.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 08:56:32 -0700 (PDT)
Message-ID: <6f9cb4cc-4509-2139-61a2-7ef2f6e2d501@redhat.com>
Date: Thu, 17 Mar 2022 16:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/5] python/utils: add VerboseProcessError
To: John Snow <jsnow@redhat.com>
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-3-jsnow@redhat.com>
 <1cf78366-7daa-79bb-60ad-8b7d0b03197e@redhat.com>
 <CAFn=p-bthHVLnqJvQb04=B-WvbOnmS9bW-0zWUrCi_yJEq2JWg@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-bthHVLnqJvQb04=B-WvbOnmS9bW-0zWUrCi_yJEq2JWg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.22 16:13, John Snow wrote:
> On Thu, Mar 17, 2022 at 5:23 AM Hanna Reitz <hreitz@redhat.com> wrote:
>> On 08.03.22 02:57, John Snow wrote:
>>> This adds an Exception that extends the Python stdlib
>>> subprocess.CalledProcessError.
>>>
>>> The difference is that the str() method of this exception also adds the
>>> stdout/stderr logs. In effect, if this exception goes unhandled, Python
>>> will print the output in a visually distinct wrapper to the terminal so
>>> that it's easy to spot in a sea of traceback information.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>> ---
>>>    python/qemu/utils/__init__.py | 36 +++++++++++++++++++++++++++++++++++
>>>    1 file changed, 36 insertions(+)
>>>
>>> diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
>>> index 5babf40df2..355ac550bc 100644
>>> --- a/python/qemu/utils/__init__.py
>>> +++ b/python/qemu/utils/__init__.py
>>> @@ -18,6 +18,7 @@
>>>    import os
>>>    import re
>>>    import shutil
>>> +from subprocess import CalledProcessError
>>>    import textwrap
>>>    from typing import Optional
>>>
>>> @@ -26,6 +27,7 @@
>>>
>>>
>>>    __all__ = (
>>> +    'VerboseProcessError',
>>>        'add_visual_margin',
>>>        'get_info_usernet_hostfwd_port',
>>>        'kvm_available',
>>> @@ -121,3 +123,37 @@ def _wrap(line: str) -> str:
>>>            os.linesep.join(_wrap(line) for line in content.splitlines()),
>>>            _bar(None, top=False),
>>>        ))
>>> +
>>> +
>>> +class VerboseProcessError(CalledProcessError):
>>> +    """
>>> +    The same as CalledProcessError, but more verbose.
>>> +
>>> +    This is useful for debugging failed calls during test executions.
>>> +    The return code, signal (if any), and terminal output will be displayed
>>> +    on unhandled exceptions.
>>> +    """
>>> +    def summary(self) -> str:
>>> +        """Return the normal CalledProcessError str() output."""
>>> +        return super().__str__()
>>> +
>>> +    def __str__(self) -> str:
>>> +        lmargin = '  '
>>> +        width = -len(lmargin)
>>> +        sections = []
>>> +
>>> +        name = 'output' if self.stderr is None else 'stdout'
>>> +        if self.stdout:
>>> +            sections.append(add_visual_margin(self.stdout, width, name))
>>> +        else:
>>> +            sections.append(f"{name}: N/A")
>>> +
>>> +        if self.stderr:
>>> +            sections.append(add_visual_margin(self.stderr, width, 'stderr'))
>>> +        elif self.stderr is not None:
>> What exactly is this condition for?  I would’ve understood if it was
>> `self.stdout` (because the stdout section then is called just “output”,
>> so it would make sense to omit the stderr block), but this way it looks
>> like we’ll only go here if `self.stderr` is an empty string (which
>> doesn’t make much sense to me, and I don’t understand why we wouldn’t
>> have the same in the `self.stdout` part above).
>>
>> (tl;dr: should this be `self.stdout`?)
>>
>> Hanna
>>
> if self.stderr is None, it means that the IO streams were combined. If
> it is merely empty, it means there wasn't any stderr output.

Might warrant a comment? :)

> so:
>
> if self.stderr: There's content here, so put it in a lil' box
> else: could be either None or the empty string. If it's None, we
> didn't *have* a stderr, so don't print anything at all, let the
> "output" section above handle it. If we did have stderr and it just
> happened to be empty, write N/A.
>
> I wanted that "N/A" to provide active feedback to show the human
> operator that we're not just failing to show them what the stderr
> output was: there genuinely wasn't any.

Thanks, that makes sense.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


