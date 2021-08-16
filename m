Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4B3EDC1B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 19:11:20 +0200 (CEST)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFg8t-0007IW-Ac
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 13:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFg82-0006Z1-77
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFg7z-0000zc-FL
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629133822;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfwmZOVdWhB+OzZtIwxSFb0i87/kamLwMaxtukp5Zfs=;
 b=LGSE9WVLgdqMjEa6P5g+KPiZsxkOvMEHakGKSSpyQzHYWWgJpzSn0VW05m8qhiobEPlugw
 0dfXKAUiD3vRkU/S434uH5K6d/j13PtqIScQBymfS35n/nyNpA/KZxVy6yHfXv8+j3WSwW
 OMqW/uLQlAACoAGwOwuCZB3zIikZva4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-k9DfmbTuPVKR93yT4Crhbw-1; Mon, 16 Aug 2021 13:09:12 -0400
X-MC-Unique: k9DfmbTuPVKR93yT4Crhbw-1
Received: by mail-pj1-f70.google.com with SMTP id
 y3-20020a17090a8b03b02901787416b139so473734pjn.4
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 10:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=IfwmZOVdWhB+OzZtIwxSFb0i87/kamLwMaxtukp5Zfs=;
 b=ii3Ebq+Mkcg0POg55Kp7mBJZINzmH4IQPupX7jhyXVJRFyG/xR2whf/ay3TDnen2JO
 fFI+MEFDFeaUDcGS4i2HXFEY60RjIu5NW13BUmEhswfvI9Tuhwfto0Z/8BtuvWZ9mfEJ
 WbAkkbOvPYaCM/DZa+mcslBd2o7kNDiKH75clB+STljDlk+YzALwLxMnUkMIzxDFfCfr
 OYzsNQ0xmmcsYGqukEKicP+57DJyCT5mtrIafQrsOcCllgzntphpzZOcNmVu72VUcA6l
 lEIaO3N5nIHocMAa6AGpz4tZ+43U9Czwsg2uIxeOnjM1eqGD6j4JiZ+0UvxhcmOFAi9z
 JYcA==
X-Gm-Message-State: AOAM532kysBzMRK9EK+L6lUNeeT74DBO4NFkAK5xD3JhXHhwqWfhVT/i
 S+TxWnWcrc9YpjYXsFvIr2fVxp8IzQw+BCPrdhTXK7rBuICXRQhmtwAXPPMDDf684+BdU4BywTg
 FMz6ImlO4h1mRihQ=
X-Received: by 2002:a17:902:c402:b0:12d:b2fe:f0f1 with SMTP id
 k2-20020a170902c40200b0012db2fef0f1mr8141367plk.9.1629133750697; 
 Mon, 16 Aug 2021 10:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8D5aiUKXCl3G8uYYZPhu2NqmFY8TQsTkhonFqG6H7Xg31IXN0SMhN6Dt6ANWIGQll7tAnaQ==
X-Received: by 2002:a17:902:c402:b0:12d:b2fe:f0f1 with SMTP id
 k2-20020a170902c40200b0012db2fef0f1mr8141342plk.9.1629133750411; 
 Mon, 16 Aug 2021 10:09:10 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.154.241.196])
 by smtp.gmail.com with ESMTPSA id 11sm14052481pgh.52.2021.08.16.10.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:09:09 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Test powernv machines
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Joel Stanley <joel@jms.id.au>
References: <20210810083346.730652-1-clg@kaod.org>
 <CACPK8Xc5J3tgtv3Z4ZxpR_r3BDaXJvt3mcxSqjyAtTYa+nQA-w@mail.gmail.com>
 <cca773c4-cf08-2fbb-9d9a-26f2fcfa6a34@kaod.org>
 <e14f8f87-8110-4084-94a6-ce09713f3fd2@redhat.com>
 <eb30ede4-2779-b2d6-80af-a278fe80697a@kaod.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <bfe089eb-59c2-2f33-f304-e234273c86f7@redhat.com>
Date: Mon, 16 Aug 2021 14:09:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eb30ede4-2779-b2d6-80af-a278fe80697a@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: wainersm@redhat.com
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cédric,

On 8/11/21 11:54 AM, Cédric Le Goater wrote:
> On 8/11/21 11:07 AM, Thomas Huth wrote:
>> On 10/08/2021 11.09, Cédric Le Goater wrote:
>>> On 8/10/21 10:36 AM, Joel Stanley wrote:
>>>> On Tue, 10 Aug 2021 at 08:34, Cédric Le Goater <clg@kaod.org> wrote:
>>>>> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
>>>>> with a simple PCI layout.
>>>>>
>>>>> Cc: Cleber Rosa <crosa@redhat.com>
>>>>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>> ---
>>>>>    tests/acceptance/boot_linux_console.py | 42 ++++++++++++++++++++++++++
>>>>>    1 file changed, 42 insertions(+)
>>>>>
>>>>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>>>>> index 5248c8097df9..da93a475ca87 100644
>>>>> --- a/tests/acceptance/boot_linux_console.py
>>>>> +++ b/tests/acceptance/boot_linux_console.py
>>>>> @@ -1176,6 +1176,48 @@ def test_ppc64_e500(self):
>>>>>            tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>>>>>            self.do_test_advcal_2018('19', tar_hash, 'uImage')
>>>>>
>>>>> +    def do_test_ppc64_powernv(self, proc):
>>>>> +
>>>>> +        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
>>>>> +
>>>>> +        skiboot_url = images_url + 'skiboot.lid'
>>>>> +        skiboot_hash = 'a9ffcddbf238f86cda4b2cae2882d6bd13cff8489109758a4980efaf154f4a29'
>>>>> +        skiboot_path = self.fetch_asset(skiboot_url, asset_hash=skiboot_hash,
>>>>> +                                       algorithm='sha256')
>>>> What's the thought that led you to using this instead of the one that
>>>> gets packaged with qemu?
>>> Good question.
>>>
>>> I considered that the skiboot.lid shipped with QEMU was somewhat a default
>>> to make things work. The official released versions are the ones used by
>>> the outside world on real systems and were a better target for tests.
>>>
>>> That said, using the default version might be enough. Maintainers, please
>>> advise !
>> IMHO:
>>
>> - We want to test the things that *we* ship
>>
>> - We want to download as few things as possible, since downloads
>>    often slow down the tests and break CI runs if the network to
>>    the download site is not available
>>
>>   ==> I'd prefer to use the internal skiboot.lid unless there is
>>       really a compelling reason to use the external one.
> OK. I changed the test to use the internal skiboot.lid.

The code of patch v1 looks good to me but I will wait the v2 to put my 
reviewed-by stamp.

Thanks!

- Wainer

>
> Thanks,
>
> C.
>
>
>
>
>


