Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480B321D81
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:55:27 +0100 (CET)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEUY-0001yu-Fg
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEES3-0000mq-E5
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:52:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEERz-0000X2-4A
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614012766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWpPg9SCZqx0Q7o6Elo9XmVpcbIAlmIXy6eNU9V5VMc=;
 b=L+cOyh/8+gMEP7PYxBB83GeHnbwVV2XSqyx6CXc/6o4/CJBZPqleEzYwO3TP4ITLh9MCFn
 AbDxsXDwcdurj/L89dzbOYF+Lf3tbUhlZFzOtPi5sCR+Ez1vY8Hf1pTEXli4OmMlLEldXa
 0fxTLhDklsckbhVwyU7/v7Ie5vCGsv4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-BwTs9OkFOIexADngU8q6PA-1; Mon, 22 Feb 2021 11:52:43 -0500
X-MC-Unique: BwTs9OkFOIexADngU8q6PA-1
Received: by mail-ej1-f72.google.com with SMTP id w22so1430594ejv.18
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 08:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BWpPg9SCZqx0Q7o6Elo9XmVpcbIAlmIXy6eNU9V5VMc=;
 b=AnkTexe0OfDN5VwBwpuGEhDkiKzRu+zd9McRC05l7yvzqPU7Jbq3HC/iCZHUYI6CDs
 4KnkuIm3voJxXuQtDx2lwzkv7llPni0kcN+FdgTkJrMBv5GRIlFhTqUltaoA8Fjze4tS
 xobhoab/wiQu1jP5ZMOm0+bl//7rKGfM//tysUtu7nLf2JVQY5MfOnQM+YVYRx3CLYP+
 t6mdKgJBbu/w3PUGZsy6N3NNyg1EyHQfHSEKZfXHRKyph+siYA9H1Vv6tir4c5HNgl2n
 OJUOcQz77AW68iNFMgzWVzsgx8AcyMtaDOC48jDjgp9jvXyLgeMpoyfghXA0KjYgUI+/
 FXpA==
X-Gm-Message-State: AOAM531m/XU0RxeSWmc/0fLL3mKJ5qMY4E5KNjtm2B1puZeKYwEKcH90
 oN3Lw+80cemKFWeHEpA02zrv4rZ5emvWNhw4Q8p09enwcgvJV0AcyL5vRrOuQ5J/jjp1lF7MShA
 zY58Lpf9+K7sGC/E=
X-Received: by 2002:a50:bc15:: with SMTP id j21mr23397690edh.187.1614012762140; 
 Mon, 22 Feb 2021 08:52:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm5UgXbl+PMeP014bRM6jUDza34TGCorrYdy9n/fz88sRsVZtVBNC12pYRkoSfYr18KpDYbw==
X-Received: by 2002:a50:bc15:: with SMTP id j21mr23397665edh.187.1614012761886; 
 Mon, 22 Feb 2021 08:52:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h4sm13058825edv.80.2021.02.22.08.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 08:52:41 -0800 (PST)
Subject: Re: Can we run QEMU Avocado tests without root access?
To: Cleber Rosa <crosa@redhat.com>
References: <04391605-1413-f944-6e17-8a4bc50608b5@redhat.com>
 <20210222162831.GA903049@amachine.somewhere>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <072526a5-e842-1eb1-e41e-6ddcc2c089ba@redhat.com>
Date: Mon, 22 Feb 2021 17:52:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222162831.GA903049@amachine.somewhere>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: avocado-devel <avocado-devel@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 5:28 PM, Cleber Rosa wrote:
> On Mon, Feb 22, 2021 at 12:23:17AM +0100, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On a system I want to run the QEMU integration tests I got:
>>
> 
> Would you care to give more information about this system?  Is it
> possible that it's a Debian-like system with "python3-minimal"
> installed instead of "python3"?

Debian GNU/Linux bullseye/sid

$ dpkg -S $(which python3)
python3-minimal: /usr/bin/python3

>> $ make check-venv
>>   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
>> tests/fp/berkeley-softfloat-3 dtc capstone slirp
>>   VENV    build/tests/venv
>> The virtual environment was not created successfully because ensurepip
>> is not
>> available.  On Debian/Ubuntu systems, you need to install the python3-venv
>> package using the following command.
>>
>>     apt-get install python3-venv
>>
>> You may need to use sudo with that command.  After installing the
>> python3-venv
>> package, recreate your virtual environment.
>>
>> Failing command: ['build/tests/venv/bin/python3', '-Im', 'ensurepip',
>> '--upgrade', '--default-pip']
>>
> 
> make check-{venv,acceptance} won't attempt to install pip, so I'm
> guessing this message is coming from the Python distribution on
> your system.  And notice that the bare venv *has* been created.
> 
>> make: *** [/home/philmd/qemu/tests/Makefile.include:98:
>> build/tests/venv] Error 1
>>
>> However I could do:
>>
>> $ python3 -m pip install --user virtualenv
>> Collecting virtualenv
>>   Downloading virtualenv-20.4.2-py2.py3-none-any.whl (7.2 MB)
>>      |████████████████████████████████| 7.2 MB 6.4 MB/s
>> Collecting distlib<1,>=0.3.1
>>   Downloading distlib-0.3.1-py2.py3-none-any.whl (335 kB)
>>      |████████████████████████████████| 335 kB 6.4 MB/s
>> Collecting appdirs<2,>=1.4.3
>>   Downloading appdirs-1.4.4-py2.py3-none-any.whl (9.6 kB)
>> Requirement already satisfied: six<2,>=1.9.0 in
>> /usr/lib/python3/dist-packages (from virtualenv) (1.15.0)
>> Collecting filelock<4,>=3.0.0
>>   Downloading filelock-3.0.12-py3-none-any.whl (7.6 kB)
>> Installing collected packages: distlib, appdirs, filelock, virtualenv
>> Successfully installed appdirs-1.4.4 distlib-0.3.1 filelock-3.0.12
>> virtualenv-20.4.2
>>
>> $ virtualenv --version
>> virtualenv 20.4.2 from
>> /home/philmd/.local/lib/python3.9/site-packages/virtualenv/__init__.py
>>
>> Note, there is still the old tests/venv/ dir created bug:
>>
> 
> OK, noted.  We not have a formal bug report to work on:
> 
>    https://bugs.launchpad.net/qemu/+bug/1916506

Thanks!

>> $ make check-venv
>>   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
>> tests/fp/berkeley-softfloat-3 dtc capstone slirp
>> make: Nothing to be done for 'check-venv'.
>>
>> Although it might be true... If I don't have root access, there is
>> nothing to be done ¯\_(ツ)_/¯
>>
> 
> With regards to your question on the subject line, one could attempt
> to have a secondary Python installation with the *required packages*
> (as per the documentation) installed as a non-root user.  And then,
> you could give that Python path to configure.  The current
> documentation states:
> 
>    Note: the build environment must be using a Python 3 stack, and have
>    the ``venv`` and ``pip`` packages installed.  If necessary, make sure
>    ``configure`` is called with ``--python=`` and that those modules are
>    available.  On Debian and Ubuntu based systems, depending on the
>    specific version, they may be on packages named ``python3-venv`` and
>    ``python3-pip``.
> 
> IIUC, the improvement you suggest is to not require "python-venv" as a
> package, but install it via "python3 -m pip".  One possible way to
> rely *only* on Python 3 and setuptools (dropping venv and pip
> requirements) would be to do something like:
> 
>    $ python3 -m ensurepip

$ python3 -m ensurepip
/usr/bin/python3: No module named ensurepip

>    $ python3 -m pip install venv

$ python3 -m pip install venv
ERROR: Could not find a version that satisfies the requirement venv
(from versions: none)
ERROR: No matching distribution found for venv

>    $ make check-venv
> 
> It's a valid approach, in theory.  In practice, depending on your
> distro, you may not have "ensurepip" at all, even if it is a *standard
> Python library*:
> 
>    https://docs.python.org/3/library/ensurepip.html
> 
> You can read about how those packaging decisions can become hell
> in bug reports such as:
> 
>    https://bugs.launchpad.net/ubuntu/+source/python3.4/+bug/1290847
> 
> In my experience, venv and pip have caveats and using the distro's
> (complete) packages will give you an overall better experience.
> 
> While *one* could setup the dependencies as non-root, but I don't
> think it should be used in the current check-venv rule.

OK. Well if it isn't fixable, then we can simply add an error message
such: "Missing .... Ask the super administrator to install ...", right?

Thanks for looking at this,

Phil.


