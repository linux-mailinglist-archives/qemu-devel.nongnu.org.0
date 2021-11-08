Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4717447BA6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:15:42 +0100 (CET)
Received: from localhost ([::1]:53658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzob-0007t3-R1
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:15:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzmZ-00065S-2s
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:13:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzmX-0004ic-2t
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636359212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCj/GzgBFoSers8GP+4nWJZs5q/Soocjun4t1mqTh5c=;
 b=HqQWyj+k6kEfqaa/t7BFsXJ840xl3agxJvB8ILAWIn3pNXJ0wHekMHbqjtbCkqR3P5b+Ju
 QoOLh8b0ZNrVdeJT872odWBJfmDssz5E3jylnUH6b/+TUitbNE801OhHPzAyGkm1341Of0
 WzUJeC93siYKhHfdw6q3Ls2qVxlbTLM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-UnszUaZtMeuCpAvvHKlUQA-1; Mon, 08 Nov 2021 03:13:30 -0500
X-MC-Unique: UnszUaZtMeuCpAvvHKlUQA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso3767491wrq.16
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CCj/GzgBFoSers8GP+4nWJZs5q/Soocjun4t1mqTh5c=;
 b=lElJw+XUjgVosw8ag2hOkPqz5ZaUjhsWv0cmvNRiCsW7hW0MwENQtmYLZKDMUxWtcu
 WVqX7V5Hp9B+M0MBmoyH4fz/VjNHR04aBROh6AkZaQTeNvooEXNpQ5BX/cytgSdQXUM8
 X9iboFYpaUFoCDOv5pvynLSBDKvnlICse5C9NljDAn6rRwr5Y9bRV+tV39ilseru2hjH
 b9bCkeVoxH26NXM21we98+iEDUY8L2PUxvkz+sLQcn+0cSOkIkSem2ihfwUmhN1OWEE9
 tv3cKIqthKfeKK+8u+/ya2J49TtL69AlOT8NCUe8WdNF3pQ73EzbG2TNX305ED8yRq27
 CzYA==
X-Gm-Message-State: AOAM532Yzh91tREMzx050Ki/iUt0fj42wDu4kBmDeqc2OmYMQLCkcCGX
 aAKZSuUDPaS55Dr20egTJqFcFMPi0t3DV6PHqtrCOaHLD3GlFOjVIGm7mW4POKGavoCEx4tHcig
 7J7IwO9B/Fxm+Ej4=
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr51359141wms.103.1636359209618; 
 Mon, 08 Nov 2021 00:13:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7zZ3xSzkM5i3WNCNmkS40aqaLyxjswRZ/tUx/E5C44HMNxKXMeC8pE/mpVsnS+vwB659hZw==
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr51359113wms.103.1636359209373; 
 Mon, 08 Nov 2021 00:13:29 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l26sm15417929wms.15.2021.11.08.00.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 00:13:28 -0800 (PST)
Message-ID: <929c590e-bb67-105e-2d18-78d7638b329c@redhat.com>
Date: Mon, 8 Nov 2021 09:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
To: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 qemu-devel@nongnu.org
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
 <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 08:59, Thomas Huth wrote:
> On 05/11/2021 16.53, Willian Rampazzo wrote:
>> This introduces a new `make` target, `check-avocado`, and adds a
>> deprecation message about the `check-acceptance` target. This is
>> a preparation for renaming the `tests/acceptance` folder to
>>   `tests/avocado`.
>>
>> The plan is to remove the call to the `check-avocado` target one
>> or two months after the release and leave the warning to force
>> people to move to the new `check-avocado` target.
>>
>> Later, the `check-acceptance` target can be removed. The intent
>> is to avoid a direct impact during the current soft freeze.
>>
>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 13 +++++++++++++
>>   tests/Makefile.include    | 17 ++++++++++++-----
>>   2 files changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 56f9ad15ab..7bf8da8325 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -410,3 +410,16 @@ nanoMIPS ISA
>>     The ``nanoMIPS`` ISA has never been upstreamed to any compiler
>> toolchain.
>>   As it is hard to generate binaries for it, declare it deprecated.
>> +
>> +Testing
>> +-------
>> +
>> +Renaming of the acceptance folder to avocado
>> +''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +The ``tests/acceptance`` folder was never used to store acceptance tests
>> +in terms of software engineering. This naming can confuse developers
>> +adding tests using the Avocado Framework to this folder. The folder
>> +name change to ``tests/avocado`` also changed the ``make`` target from
>> +``check-acceptance`` to ``check-avocado``. In this case, the use of the
>> +``check-acceptance`` target is deprecated.
> 
> Not sure whether we need  to document this in deprecated.rst, too, since
> we're normally only listing the things here that affect the users of the
> qemu binaries, not the people who want to recompile and run the tests...
> OTOH, I don't mind too much either if we list it here... Anybody else
> got an opinion on this?

Hmm OK my bad, I asked Willian to add that without noticing this file
is for "only things that affect the users".

Willian, if you agree with Thomas, I can remove this change from your
patch.


