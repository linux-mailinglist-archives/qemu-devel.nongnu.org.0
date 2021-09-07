Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0B4026A3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:58:48 +0200 (CEST)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXsM-0000bh-VN
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNXqx-0007zS-GN
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNXqv-0006pE-Py
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631008633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yj5f6tZG8ZLDscrOhunX134eO3kiSVdbP5mwyEg910M=;
 b=VnUjN1L2AIH07PGCxUVz/2cTgiTAujMdSZq0bEHyQLTTYlDvAL5MWeq+Q9mD2guNlChz6g
 ZpXH1YQ+bf+ZxfnTNKAu80uHFgg1rrFGBJKAct1b/nlGjI3zSi9/RtB6r2kKXbfIU6doaF
 6yaHAOyr+neyeRIxhAm5BwFZjowFCPE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-Vtle1qOyM7irWbZUdU0tEw-1; Tue, 07 Sep 2021 05:57:11 -0400
X-MC-Unique: Vtle1qOyM7irWbZUdU0tEw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso1930489wrn.19
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 02:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Yj5f6tZG8ZLDscrOhunX134eO3kiSVdbP5mwyEg910M=;
 b=Zlb/uS5hUKcbYa2uQzYnXfzyH3HtVIHdVavC+OzvuhGaFOmdC+Tl9BzG14AGjeB23f
 zE83i88oYTYgv2UqXJZVBbzrjvP5HUsJVhX1LyU72ClOUDmkOylXMUOzF1wKzKbFrVyn
 kej2sJV+ywGRnCBvtFCU85fTu0rS2hZRCRxWcYkLCeQFXkmLf8VMZVwQh1HVDL4zXDZt
 ej6dIlSpeWQFa89AMJbM8BW/Yn93ux/KazcVePXd/u4BArok2NqV5wnvr5Mv65Jh37ev
 ZEC6c6BxJRHfbjHQHPhlJAWMnjfQP+yP7dU51BYk1kHdp9XcoXQajp4qje1aBBZwq6Ja
 QGMg==
X-Gm-Message-State: AOAM531IeftQ8lPzzoK1uFGnM44IoPyUWV5Nh1AKSRi7C1eOZ2GkR68w
 ymY/yA3xTXyd4lok4V++/j/p7t/AecE+e3anJVvfD8PNFzfxlXQyE6oxlYCZbQs2fdUE5Ujs44M
 0yDhTzSndBaBFm5E=
X-Received: by 2002:a05:600c:acd:: with SMTP id
 c13mr2978606wmr.28.1631008629780; 
 Tue, 07 Sep 2021 02:57:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyaQv1Ku1vEsnzltMX8KvWLEXNv67dniqPXhVh2YadiSZ/t/QtxDvygcX/4R1V3TuvQqRXIw==
X-Received: by 2002:a05:600c:acd:: with SMTP id
 c13mr2978588wmr.28.1631008629533; 
 Tue, 07 Sep 2021 02:57:09 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id m6sm5849998wrw.0.2021.09.07.02.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 02:57:09 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] mirror-top-perms: Fix AbnormalShutdown path
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20210902094017.32902-1-hreitz@redhat.com>
 <20210902094017.32902-5-hreitz@redhat.com>
 <ab23a119-1315-09b7-aeec-8d9039fdbd92@virtuozzo.com>
 <12a9bfd7-d302-f157-f88a-ff441470278e@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <8c608d35-55e9-070e-7a69-ed661ea71d45@redhat.com>
Date: Tue, 7 Sep 2021 11:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <12a9bfd7-d302-f157-f88a-ff441470278e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.09.21 12:15, Philippe Mathieu-Daudé wrote:
> On 9/2/21 11:58 AM, Vladimir Sementsov-Ogievskiy wrote:
>> 02.09.2021 12:40, Hanna Reitz wrote:
>>> The AbnormalShutdown exception class is not in qemu.machine, but in
>>> qemu.machine.machine.  (qemu.machine.AbnormalShutdown was enough for
>>> Python to find it in order to run this test, but pylint complains about
>>> it.)
>>>
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>>    tests/qemu-iotests/tests/mirror-top-perms | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/qemu-iotests/tests/mirror-top-perms
>>> b/tests/qemu-iotests/tests/mirror-top-perms
>>> index 451a0666f8..2fc8dd66e0 100755
>>> --- a/tests/qemu-iotests/tests/mirror-top-perms
>>> +++ b/tests/qemu-iotests/tests/mirror-top-perms
>>> @@ -47,7 +47,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
>>>        def tearDown(self):
>>>            try:
>>>                self.vm.shutdown()
>>> -        except qemu.machine.AbnormalShutdown:
>>> +        except qemu.machine.machine.AbnormalShutdown:
>>>                pass
>>>              if self.vm_b is not None:
>>>
>> Hmm, interesting.. May be that bad that module has same name as subpackage?
> Confusing indeed. Could this be improved?

I think if we want to improve something, it would be that we make the 
exception public in the qemu.machine namespace, like so:

diff --git a/python/qemu/machine/__init__.py 
b/python/qemu/machine/__init__.py
index 9ccd58ef14..48bbb0530b 100644
--- a/python/qemu/machine/__init__.py
+++ b/python/qemu/machine/__init__.py
@@ -25,7 +25,7 @@
  # pylint: disable=import-error
  # see: https://github.com/PyCQA/pylint/issues/3624
  # see: https://github.com/PyCQA/pylint/issues/3651
-from .machine import QEMUMachine
+from .machine import AbnormalShutdown, QEMUMachine
  from .qtest import QEMUQtestMachine, QEMUQtestProtocol

But, well.  I don’t mind a qemu.machine.machine too much, personally.

Hanna


