Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304E9447D15
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:51:27 +0100 (CET)
Received: from localhost ([::1]:60754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk1JG-0001q0-64
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk1Hu-0000t3-7Z
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:50:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk1Hq-0003NQ-5g
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636364997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5H4heBn42+wJmaEq4ggakEYhlmxRR9i0VEeqLLwjak=;
 b=GqoHzOE3rBKeyIqVJArh1tnTQkmJUIIHl9D/WIvibjbODPr00KFPRIY1P3YXBtbOqD9ooQ
 D808GdKnaqpREzKrx0mFWUtuO/JMf0rtxp20sJWTIENms5VtvBtDZtrQeN9W3Kv//3zPFH
 wqoZ1TocCMLjL04RKSkhRMrbshH9vA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-SWkoGJHaMsGfMNhxwIcJxg-1; Mon, 08 Nov 2021 04:49:54 -0500
X-MC-Unique: SWkoGJHaMsGfMNhxwIcJxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso5577793wms.1
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 01:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r5H4heBn42+wJmaEq4ggakEYhlmxRR9i0VEeqLLwjak=;
 b=q87QqRkURWHtUeoYggAsCExN3jLbdPH+0/5OZ5n4y702xuOLnoQCGDSPr0JS9WOyX5
 Db0D/yNLDrwdk0glMRYR9VMjfcTyDf6bMhtauWljKm+zULrnqV1zZVarSM0pwEkRb64n
 a29qb3Uo9+0G3Vo81ZXDVC4k3b8jxdufLXVI5miG+7GY4J/r6HBVG7kdDU+EInTil8g2
 3JPwI8KFcV5aQqZ2lSOb80T+jl1GxMoLcA8LJO66ZZ0RXLvC+9EwhJgUzehEudQx10Y0
 WyarOUD5RZzVMBGonVR/lUSKSXwgYjDPq5Zwp35x1XDkGDA0ygOOhTbGLGC6OvkJWIK6
 xLcg==
X-Gm-Message-State: AOAM533tnrG+HeBUfDXVe8GRgagGtWq663LuFYkrICYqtcpVuMwJycy8
 VsAgib9f4ywvZ/iseS8EX1i/+ZDWX9RqauIF80f/UeHNLwtH0yT8yr8UEaJdr0Pk24OXtc6YpBK
 4br1Mr2rUEhFELl8=
X-Received: by 2002:a05:600c:430c:: with SMTP id
 p12mr52934283wme.127.1636364993416; 
 Mon, 08 Nov 2021 01:49:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwotDkeaRiSZS6MyccH5N6ZR3IcTPuMBAtpnb6V7ywTFIfbakbf1DNL+ZKVvAr7nFYQUU6D/A==
X-Received: by 2002:a05:600c:430c:: with SMTP id
 p12mr52934251wme.127.1636364993220; 
 Mon, 08 Nov 2021 01:49:53 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f8sm14641994wmf.2.2021.11.08.01.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 01:49:52 -0800 (PST)
Message-ID: <3aae05e7-823e-2761-0442-7fd92f3931c5@redhat.com>
Date: Mon, 8 Nov 2021 10:49:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
 <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
 <YYjsvY3W27a1jUCD@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YYjsvY3W27a1jUCD@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-ppc@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 libvir-list@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 10:24, Daniel P. Berrangé wrote:
> On Mon, Nov 08, 2021 at 08:59:51AM +0100, Thomas Huth wrote:
>> On 05/11/2021 16.53, Willian Rampazzo wrote:
>>> This introduces a new `make` target, `check-avocado`, and adds a
>>> deprecation message about the `check-acceptance` target. This is
>>> a preparation for renaming the `tests/acceptance` folder to
>>>   `tests/avocado`.
>>>
>>> The plan is to remove the call to the `check-avocado` target one
>>> or two months after the release and leave the warning to force
>>> people to move to the new `check-avocado` target.
>>>
>>> Later, the `check-acceptance` target can be removed. The intent
>>> is to avoid a direct impact during the current soft freeze.
>>>
>>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>>> ---
>>>   docs/about/deprecated.rst | 13 +++++++++++++
>>>   tests/Makefile.include    | 17 ++++++++++++-----
>>>   2 files changed, 25 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>> index 56f9ad15ab..7bf8da8325 100644
>>> --- a/docs/about/deprecated.rst
>>> +++ b/docs/about/deprecated.rst
>>> @@ -410,3 +410,16 @@ nanoMIPS ISA
>>>   The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>>>   As it is hard to generate binaries for it, declare it deprecated.
>>> +
>>> +Testing
>>> +-------
>>> +
>>> +Renaming of the acceptance folder to avocado
>>> +''''''''''''''''''''''''''''''''''''''''''''
>>> +
>>> +The ``tests/acceptance`` folder was never used to store acceptance tests
>>> +in terms of software engineering. This naming can confuse developers
>>> +adding tests using the Avocado Framework to this folder. The folder
>>> +name change to ``tests/avocado`` also changed the ``make`` target from
>>> +``check-acceptance`` to ``check-avocado``. In this case, the use of the
>>> +``check-acceptance`` target is deprecated.
>>
>> Not sure whether we need  to document this in deprecated.rst, too, since
>> we're normally only listing the things here that affect the users of the
>> qemu binaries, not the people who want to recompile and run the tests...
>> OTOH, I don't mind too much either if we list it here... Anybody else got an
>> opinion on this?
> 
> Deprecations are only things for user facing changes in the apps.

OK.

> For build system changes we don't bother with any deprecation cycle.
> Just make the change immediately and document it in the release notes.

Understood.

Willian, do you mind updating the release notes?
https://wiki.qemu.org/ChangeLog/6.2#Testing_and_CI


