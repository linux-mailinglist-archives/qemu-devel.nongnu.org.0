Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2BE64BBA2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 19:10:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p59iU-00020T-D6; Tue, 13 Dec 2022 13:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p59iS-000202-DA
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 13:09:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p59iP-0003mT-HI
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 13:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670954955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELUaTtuqfuiCr6dr5Xi151jE9neO5JWBC/KI/yQdpkU=;
 b=LUg0ykPGayzddb6nSYPuaD/NS8LtCqqzGvOc1ZKwNkunBBM2bSJImLPWlXmOf1ZQ6GittI
 rRPqKIj1cm/j6flz+20ZgR8jVXtTTGriANKCKvvaxmoQvjBNanbWW1r+euWRJSJbZafugV
 XPLfVENtLrQwxu/lCjVvcX+nROW/x0Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-IdVTLuzwMAygmP0Or4i-Gg-1; Tue, 13 Dec 2022 13:09:14 -0500
X-MC-Unique: IdVTLuzwMAygmP0Or4i-Gg-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a05640234cf00b0046d32d7b153so7680263edc.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 10:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ELUaTtuqfuiCr6dr5Xi151jE9neO5JWBC/KI/yQdpkU=;
 b=jaVIuM3Rc/qLFn5v3qt+543jY7uG+b7cHyH/u5ne2ucotbCzBrpAPd8tt8O4/TtxDq
 oH5IGVEkd+1jxksmsygZEDvk3A/RBkWt37hOndPK5H8ouGZxba6HQc6Zh7Ifwo6gInvW
 jHg4ce/gJqArvg0AOcirwZcUiaZPKo0JWS4t9S7Rkt61+IzZpFoG1IR05FOlNlXd8NjB
 E8EyNbbW2LPgl8e9bnNDlWY5B0yiMAVYxRX7qysPSh5lDOFExpOi/iCBftnEQtWkPA2N
 U/msJ/6F4umZqdW5CnPFd7+6dzbmXg5OYY4OGSnvn9CCEi0VOoE1X4NgFeQdDJUT9u6K
 cmEg==
X-Gm-Message-State: ANoB5plLFH3X5b35K5Usbt2NOFafqK6X+GQmb05yNiAY1PMeeiUgeFup
 EdGM0SEzERDfQ+Tp7MJ8PgC3E2fczIcgfyw8uyRLP/a0UefJh1ZzitHEvelwCbsl01Q382TMXYg
 1beYSEgS9aoS4jQM=
X-Received: by 2002:a17:906:714e:b0:7c1:23f2:c052 with SMTP id
 z14-20020a170906714e00b007c123f2c052mr16608474ejj.45.1670954953261; 
 Tue, 13 Dec 2022 10:09:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5FIIhQ+nfmGInpaw74lQ/B77rB56QgkpsE5RAd67oDODJDr5gOZlQZxCQCMeOm48BzJ7V+nA==
X-Received: by 2002:a17:906:714e:b0:7c1:23f2:c052 with SMTP id
 z14-20020a170906714e00b007c123f2c052mr16608458ejj.45.1670954953051; 
 Tue, 13 Dec 2022 10:09:13 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170906055100b007806c1474e1sm4725822eja.127.2022.12.13.10.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 10:09:12 -0800 (PST)
Message-ID: <49a41e54-54df-5716-083b-e6a48922649b@redhat.com>
Date: Tue, 13 Dec 2022 19:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/5] Support format or cache specific out file
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20221128141514.388724-1-nsoffer@redhat.com>
 <20221128141514.388724-3-nsoffer@redhat.com>
 <a5923263-befe-30a4-afa2-a80ecb6b1ad2@redhat.com>
 <CAMRbyyvG4s2c96xy=SNmFv26zG2nwMDH+Da71L_QQ1HjJ6zs5Q@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAMRbyyvG4s2c96xy=SNmFv26zG2nwMDH+Da71L_QQ1HjJ6zs5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13.12.22 16:56, Nir Soffer wrote:
> On Mon, Dec 12, 2022 at 12:38 PM Hanna Reitz <hreitz@redhat.com> wrote:
>> On 28.11.22 15:15, Nir Soffer wrote:
>>> Extend the test finder to find tests with format (*.out.qcow2) or cache
>>> specific (*.out.nocache) out file. This worked before only for the
>>> numbered tests.
>>> ---
>>>    tests/qemu-iotests/findtests.py | 10 ++++++++--
>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>> This patch lacks an S-o-b, too.
>>
>>> diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
>>> index dd77b453b8..f4344ce78c 100644
>>> --- a/tests/qemu-iotests/findtests.py
>>> +++ b/tests/qemu-iotests/findtests.py
>>> @@ -38,31 +38,37 @@ def chdir(path: Optional[str] = None) -> Iterator[None]:
>>>            os.chdir(saved_dir)
>>>
>>>
>>>    class TestFinder:
>>>        def __init__(self, test_dir: Optional[str] = None) -> None:
>>>            self.groups = defaultdict(set)
>>>
>>>            with chdir(test_dir):
>>>                self.all_tests = glob.glob('[0-9][0-9][0-9]')
>>>                self.all_tests += [f for f in glob.iglob('tests/*')
>>> -                               if not f.endswith('.out') and
>>> -                               os.path.isfile(f + '.out')]
>>> +                               if self.is_test(f)]
>> So previously a file was only considered a test file if there was a
>> corresponding reference output file (`f + '.out'`), so files without
>> such a reference output aren’t considered test files...
>>
>>>                for t in self.all_tests:
>>>                    with open(t, encoding="utf-8") as f:
>>>                        for line in f:
>>>                            if line.startswith('# group: '):
>>>                                for g in line.split()[2:]:
>>>                                    self.groups[g].add(t)
>>>                                break
>>>
>>> +    def is_test(self, fname: str) -> bool:
>>> +        """
>>> +        The tests directory contains tests (no extension) and out files
>>> +        (*.out, *.out.{format}, *.out.{option}).
>>> +        """
>>> +        return re.search(r'.+\.out(\.\w+)?$', fname) is None
>> ...but this new function doesn’t check that.  I think we should check it
>> (just whether there’s any variant of `/{fname}\.out(\.\w+)?/` to go with
>> `fname`) so that behavior isn’t changed.
> This means that you cannot add a test without a *.out* file, which may
>   be useful when you don't use the out file for validation, but we can
> add this later if needed.

I don’t think tests work without a reference output, do they?  At least 
a couple of years ago, the ./check script would refuse to run tests 
without a corresponding .out file.

Hanna


