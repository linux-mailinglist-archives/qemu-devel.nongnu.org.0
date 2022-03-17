Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C44DCB88
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:36:18 +0100 (CET)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUt6n-0001LU-Kv
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:36:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUt4v-00080B-44
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUt4s-0005PK-Cb
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647534857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zx3hE0YE59m/yfPxgs8ruu+jIsYGSSbYVlwCVm0an2E=;
 b=ARCw+YutgPQQ3gg5+K5f486Ebamizc0OlDwjZww6pv3SxNE76cqOg8zda9MuznqqnpvxPy
 rPFO0rHOnsTwE83qSzlhuTPIm7L9pu/cMQFL0IY53X9792EZSbu2i2Nx89xAZrYP4U5ea6
 NmNHhuyRYllR1zTFsPaXzN6vUH2ciWo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-tWbtt2i5OvynIYvF3DrWvg-1; Thu, 17 Mar 2022 12:34:16 -0400
X-MC-Unique: tWbtt2i5OvynIYvF3DrWvg-1
Received: by mail-ej1-f69.google.com with SMTP id
 le4-20020a170907170400b006dab546bc40so3196550ejc.15
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zx3hE0YE59m/yfPxgs8ruu+jIsYGSSbYVlwCVm0an2E=;
 b=OMAeR+2v/raK9j+t56kRlMMAvi+4tNKMA2j+P1z/D93G5LZK6HfpvI7ixvwaBvm/Md
 Yx+G7R6HpOPa30nredJqzXtqOyS+SCWrdkJ/rr6aDfCMKVnylOyNme/VKaxibvHbFvvY
 JyS990xUg7pk+R4UtqmKgmN2ynOifsWNEtVq37mHwE1hfZFsZYZVLrRbSfgaCcNwwZz3
 /Xoftk1vXCxIAts6pn1IpN62mhsD6TK0/7yb2EJYnHAVW+LjkFyyyh9VoFyjHAXUssWB
 EwjwXpiK/Hdy5DFKmtE7dSq2ua7eCkb5Su0TTNjCtwlBZMYhhGvqVNQK1wPcD+1TadVV
 Q/aA==
X-Gm-Message-State: AOAM530Y7/fX88BzeyBRyEyY19dG3JN2DBjGf7CLSEkT04VjkiCtTWlN
 Q4DIxDXWVo5T/jtwuhJldNqgr7/CONr3EgNdH3x1BldjHA07lR/tSMgcpWp46HWniC8yU+glD37
 qufYbsSu38MvlD28=
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id
 y2-20020a17090668c200b006b49f26c099mr5477919ejr.41.1647534855327; 
 Thu, 17 Mar 2022 09:34:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR1/HaU/n81/GHiwJ1fk/ncqP984z+uVyTkGsK27XuGdWTRzGYpaYfPOYQ6AwQje6wKWekjA==
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id
 y2-20020a17090668c200b006b49f26c099mr5477893ejr.41.1647534855082; 
 Thu, 17 Mar 2022 09:34:15 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 q10-20020aa7cc0a000000b0040f826f09fdsm2812396edt.81.2022.03.17.09.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 09:34:14 -0700 (PDT)
Message-ID: <1a1dc3e8-bad2-1854-da0d-6677cbbaae01@redhat.com>
Date: Thu, 17 Mar 2022 17:34:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/5] python/utils: add VerboseProcessError
To: John Snow <jsnow@redhat.com>
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-3-jsnow@redhat.com>
 <1cf78366-7daa-79bb-60ad-8b7d0b03197e@redhat.com>
 <CAFn=p-bthHVLnqJvQb04=B-WvbOnmS9bW-0zWUrCi_yJEq2JWg@mail.gmail.com>
 <6f9cb4cc-4509-2139-61a2-7ef2f6e2d501@redhat.com>
 <CAFn=p-Ye0ubr=PagQ777_Law2vRFS2iwSD04=k5zxjaRVYmFSA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-Ye0ubr=PagQ777_Law2vRFS2iwSD04=k5zxjaRVYmFSA@mail.gmail.com>
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

On 17.03.22 17:31, John Snow wrote:
> On Thu, Mar 17, 2022 at 11:56 AM Hanna Reitz <hreitz@redhat.com> wrote:
>> On 17.03.22 16:13, John Snow wrote:
>>> On Thu, Mar 17, 2022 at 5:23 AM Hanna Reitz <hreitz@redhat.com> wrote:
>>>> On 08.03.22 02:57, John Snow wrote:
>>>>> This adds an Exception that extends the Python stdlib
>>>>> subprocess.CalledProcessError.
>>>>>
>>>>> The difference is that the str() method of this exception also adds the
>>>>> stdout/stderr logs. In effect, if this exception goes unhandled, Python
>>>>> will print the output in a visually distinct wrapper to the terminal so
>>>>> that it's easy to spot in a sea of traceback information.
>>>>>
>>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>>> ---
>>>>>     python/qemu/utils/__init__.py | 36 +++++++++++++++++++++++++++++++++++
>>>>>     1 file changed, 36 insertions(+)
>>>>>
>>>>> diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
>>>>> index 5babf40df2..355ac550bc 100644
>>>>> --- a/python/qemu/utils/__init__.py
>>>>> +++ b/python/qemu/utils/__init__.py
>>>>> @@ -18,6 +18,7 @@
>>>>>     import os
>>>>>     import re
>>>>>     import shutil
>>>>> +from subprocess import CalledProcessError
>>>>>     import textwrap
>>>>>     from typing import Optional
>>>>>
>>>>> @@ -26,6 +27,7 @@
>>>>>
>>>>>
>>>>>     __all__ = (
>>>>> +    'VerboseProcessError',
>>>>>         'add_visual_margin',
>>>>>         'get_info_usernet_hostfwd_port',
>>>>>         'kvm_available',
>>>>> @@ -121,3 +123,37 @@ def _wrap(line: str) -> str:
>>>>>             os.linesep.join(_wrap(line) for line in content.splitlines()),
>>>>>             _bar(None, top=False),
>>>>>         ))
>>>>> +
>>>>> +
>>>>> +class VerboseProcessError(CalledProcessError):
>>>>> +    """
>>>>> +    The same as CalledProcessError, but more verbose.
>>>>> +
>>>>> +    This is useful for debugging failed calls during test executions.
>>>>> +    The return code, signal (if any), and terminal output will be displayed
>>>>> +    on unhandled exceptions.
>>>>> +    """
>>>>> +    def summary(self) -> str:
>>>>> +        """Return the normal CalledProcessError str() output."""
>>>>> +        return super().__str__()
>>>>> +
>>>>> +    def __str__(self) -> str:
>>>>> +        lmargin = '  '
>>>>> +        width = -len(lmargin)
>>>>> +        sections = []
>>>>> +
>>>>> +        name = 'output' if self.stderr is None else 'stdout'
>>>>> +        if self.stdout:
>>>>> +            sections.append(add_visual_margin(self.stdout, width, name))
>>>>> +        else:
>>>>> +            sections.append(f"{name}: N/A")
>>>>> +
>>>>> +        if self.stderr:
>>>>> +            sections.append(add_visual_margin(self.stderr, width, 'stderr'))
>>>>> +        elif self.stderr is not None:
>>>> What exactly is this condition for?  I would’ve understood if it was
>>>> `self.stdout` (because the stdout section then is called just “output”,
>>>> so it would make sense to omit the stderr block), but this way it looks
>>>> like we’ll only go here if `self.stderr` is an empty string (which
>>>> doesn’t make much sense to me, and I don’t understand why we wouldn’t
>>>> have the same in the `self.stdout` part above).
>>>>
>>>> (tl;dr: should this be `self.stdout`?)
>>>>
>>>> Hanna
>>>>
>>> if self.stderr is None, it means that the IO streams were combined. If
>>> it is merely empty, it means there wasn't any stderr output.
>> Might warrant a comment? :)
> How 'bout:
>
> has_combined_output = self.stderr is None

That would be better, although I’m not quite sure I’d immediately know 
what this means.  Something like “Does self.stdout contain both stdout 
and stderr?” above it would clear my potential and/or assumed confusion, 
I believe.

Hanna


