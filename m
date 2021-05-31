Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A963956B2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 10:11:58 +0200 (CEST)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnd1g-0003sR-Hb
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 04:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lnd06-0002kl-MC
 for qemu-devel@nongnu.org; Mon, 31 May 2021 04:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lnd03-0002kX-4q
 for qemu-devel@nongnu.org; Mon, 31 May 2021 04:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622448612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYILIadJj9Wd6qwY2/Hl6uKB6WntHQZ0d27E/tFnR90=;
 b=c77lo/R9I07Xikmu2DCajXjyTMblgVWFP68w497VVOq/ziRKn1A1ECKN6PZ/UNVqubB0PS
 3NcM8R4XUVchpNXjB3v1qnK7LD0HqptHDVomIVtkyrhfEjJaKEUBInKqmhQcLZDd41xXIm
 wf5jJtuUpn9qOED1WxUySo2CknWYNqk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-zl7g5OvZOROuYbLsZ9q-FQ-1; Mon, 31 May 2021 04:10:10 -0400
X-MC-Unique: zl7g5OvZOROuYbLsZ9q-FQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so3684872wre.6
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 01:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UYILIadJj9Wd6qwY2/Hl6uKB6WntHQZ0d27E/tFnR90=;
 b=Wmv/MXf2/Vf0JwGlEP4Spz//qRrPvEqf5TMw7D4jiecSVGa9t9Bte0UxSkmUFCNQoZ
 3QZAzx4c3ZZmY6Zbhz8SIAMgmdPYPlcjJ63GhOtXUo7aLpOPRlZo9PQAF9B0W/8ix7mI
 C16yLAscMf1BQB/+oRQOY+75XBegJk11lSpB0IeCZgZuAA9hvE0wNk8qO4l1MbHHkn2k
 YWTgSca4oil6BOAkVPwRAuQrCyggkYq6Fh53VDminLGFAhqjSc8gdhsiPi0X8cxah7qJ
 Ly0k51/0wUsc3JPi7MyazNv5GIreMFjg9JrUWXmg+AdbEfu8kJJBmO2fHv4FGoN4dwL/
 FU2Q==
X-Gm-Message-State: AOAM530BfxUoOQ3YUy+bWguBvlnIYRGc2LaQbGLsxQzsP6qMchViHY/m
 mLmUEJnC+0Nq+DwgfLrDjmcCme37zLz6hQtI1k0On4WxsbNLLjirVpo4RqmXDiUBhdVknnTR83v
 3HzVXZCno6W/MBp0=
X-Received: by 2002:adf:9c93:: with SMTP id d19mr20617209wre.17.1622448609417; 
 Mon, 31 May 2021 01:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeQoHlqB5Hn/Mzc7lzXu/hy+j6aBh5YPA44xSXGwokAqqftAL70gARfDwlfBnkubOGw5K7NA==
X-Received: by 2002:adf:9c93:: with SMTP id d19mr20617172wre.17.1622448609110; 
 Mon, 31 May 2021 01:10:09 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id q1sm22172284wmq.48.2021.05.31.01.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 01:10:08 -0700 (PDT)
Subject: Re: [PULL 00/44] Python patches
To: John Snow <jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
 <CAFEAcA_Kws=q73Yhe-AeuGhtx3V0uQOwaEG9+oRvcaROed8uNg@mail.gmail.com>
 <15baf57f-3372-a617-61f3-66c3bb42a302@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cfbd0fe9-5f2a-df92-da7b-9587691f8d5f@redhat.com>
Date: Mon, 31 May 2021 10:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <15baf57f-3372-a617-61f3-66c3bb42a302@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.618, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/21 9:22 PM, John Snow wrote:
> On 5/30/21 3:09 PM, Peter Maydell wrote:
>> Fails to build on my machine that runs the BSD VMs, apparently
>> before it gets to the point of launching the VM:
>>
>> make: Entering directory '/home/peter.maydell/qemu-freebsd/build'
>> /usr/bin/python3 -B /home/peter.maydell/qemu-freebsd/meson/meson.py
>> introspect --targets --tests --benchmarks | /usr/bin/python3 -B
>> scripts/mtest2make.py > Makefile.mtest
>> { \
>>    echo 'ninja-targets = \'; \
>>    /usr/bin/ninja -t targets all | sed 's/:.*//; $!s/$/ \\/'; \
>>    echo 'build-files = \'; \
>>    /usr/bin/ninja -t query build.ninja | sed -n '1,/^  input:/d; /^
>> outputs:/q; s/$/ \\/p'; \
>> } > Makefile.ninja.tmp && mv Makefile.ninja.tmp Makefile.ninja
>> (GIT="git" "/home/peter.maydell/qemu-freebsd/scripts/git-submodule.sh"
>> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
>> tests/fp/berkeley-softfloat-3 dtc capstone slirp)
>> (GIT="git" "/home/peter.maydell/qemu-freebsd/scripts/git-submodule.sh"
>> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
>> tests/fp/berkeley-softfloat-3 dtc capstone slirp)
>> /usr/bin/python3 -B /home/peter.maydell/qemu-freebsd/tests/vm/freebsd
>> --debug --genisoimage /usr/bin/genisoimage    --image
>> "/home/peter.maydell/.cache/qemu-vm/images/freebsd.img" --force
>> --build-image /home/peter.maydell/.cache/qemu-vm/images/freebsd.img
>> Traceback (most recent call last):
>>    File "/home/peter.maydell/qemu-freebsd/tests/vm/freebsd", line 21,
>> in <module>
>>      import basevm
>>    File "/home/peter.maydell/qemu-freebsd/tests/vm/basevm.py", line 22,
>> in <module>
>>      from qemu.machine import QEMUMachine
>> ImportError: bad magic number in 'qemu': b'\x03\xf3\r\n'
>> /home/peter.maydell/qemu-freebsd/tests/vm/Makefile.include:79: recipe
>> for target '/home/peter.maydell/.cache/qemu-vm/images/freebsd.img'
>> failed
>> make: *** [/home/peter.maydell/.cache/qemu-vm/images/freebsd.img] Error 1
>> make: Leaving directory '/home/peter.maydell/qemu-freebsd/build'

> In case that doesn't fix it, can you tell me what version of Python your
> BSD setup uses? (And what version of FreeBSD you use?) -- I'll try to
> set up a VM and see if I can reproduce the problem.

IIUC correctly this is on the host (likely Linux); no BSD VM could be
launched yet.


