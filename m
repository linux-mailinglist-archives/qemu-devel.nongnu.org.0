Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8251431C022
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:09:46 +0100 (CET)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBhNZ-0007oQ-Ja
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBhHo-0002rf-0j
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBhHi-0005xE-T6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613408619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Av+OP0zeujo5pvzxBw/MgMSq+IOjUmJERrInDUIeCaE=;
 b=SuFed1DApVmxNSafZWFW/c+wtfc29jPjx9WJiAoU29jdak5tVZRd51PGMdnMtOqPNp9ods
 urcIMxKua0Af677bHxj+CoT4VjgYIFSH39ykI/pWcdNqTTIy+G6PKOn018H6LRpn+vORhL
 wNhhR3HIhGQsc/a7Xv29Zno9rQbKtlQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-Rek8h98qMhaeowOoAA-JMg-1; Mon, 15 Feb 2021 12:03:37 -0500
X-MC-Unique: Rek8h98qMhaeowOoAA-JMg-1
Received: by mail-wm1-f71.google.com with SMTP id c125so7335819wmf.9
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 09:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Av+OP0zeujo5pvzxBw/MgMSq+IOjUmJERrInDUIeCaE=;
 b=FTMbE1Z64iMJv5RMJLFp6GGttzzP45D30VMuUIUm83erZa6868XHpiJkDNWsmS+3UQ
 VnWv1FWqtNjYAz65d3b4sqTpBqd7sglosLlhSoyUl7DKsix6rIV9W0HrfwuTK7whdI8N
 JrDqZWnvx1pJbvUeWpku5IB1hGme0AIxB39NYpQw9bnbCE7yyPw1bN+1Z7JNH2kgFJ+5
 UAh943qK8TOp1P64CszUdo0HggQyO0yyL3iV0tc0hGa8Otn1lhBceMLMeNstjksJ8sZ4
 uPS6cspPGdTtCT6TKT88dJBsIiZerXtJasCHBMNBdFFN5S1XGBXZLg2yDZ9DVKGDh0tm
 oq3Q==
X-Gm-Message-State: AOAM5306gf/jqkGnuyMOAzcabSWNm9FiSfT4pCcU5KfqJm1UiTIildJI
 0lWLuW0vRYgQ9TPBWQZCxI1YJPqLuwXoLF6psW4rmqzyaiFbjV7mmOByrsKk7qJFWTY517AzmAP
 gbUpSC2Oy5q9AiO4=
X-Received: by 2002:a1c:e905:: with SMTP id q5mr15122968wmc.84.1613408616366; 
 Mon, 15 Feb 2021 09:03:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZQWFkdmiyHgFZegxTYm0+OwhAgXvCxhkIqs51Oc8KlslSbxGKfrFOn67MiCAC/A7qDsFHyA==
X-Received: by 2002:a1c:e905:: with SMTP id q5mr15122943wmc.84.1613408616097; 
 Mon, 15 Feb 2021 09:03:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u14sm24995107wro.10.2021.02.15.09.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 09:03:35 -0800 (PST)
Subject: Re: [PATCH 00/22] Acceptance Test: introduce base class for Linux
 based tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <02bcee13-64fa-e14a-98ad-e8426a26d7d2@redhat.com>
 <dd2fda88-723c-7954-6f7e-bfb2d4bdae81@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a57b6bbb-d170-6746-5234-193038b41c41@redhat.com>
Date: Mon, 15 Feb 2021 18:03:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <dd2fda88-723c-7954-6f7e-bfb2d4bdae81@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 4:49 PM, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 2/8/21 8:35 AM, Philippe Mathieu-Daudé wrote:
>> On 2/3/21 6:23 PM, Cleber Rosa wrote:
>>> This introduces a base class for tests that need to interact with a
>>> Linux guest.  It generalizes the "boot_linux.py" code, already been
>>> used by the "virtiofs_submounts.py" and also SSH related code being
>>> used by that and "linux_ssh_mips_malta.py".
>>>
>>> While at it, a number of fixes on hopeful improvements to those tests
>>> were added.
>>>
>>> Cleber Rosa (22):
>>>    tests/acceptance/boot_linux.py: fix typo on cloudinit error message
>>>    tests/acceptance/boot_linux.py: rename misleading cloudinit method
>>>    Acceptance Tests: remove unnecessary tag from documentation example
>>>    tests/acceptance/virtiofs_submounts.py: use workdir property
>>>    tests/acceptance/virtiofs_submounts.py: do not ask for ssh key
>>>      password
>>>    tests/acceptance/virtiofs_submounts.py: use a virtio-net device
>>>      instead
>>>    tests/acceptance/virtiofs_submounts.py: evaluate string not length
>>>    tests/acceptance/virtiofs_submounts.py: standardize port as integer
>>>    tests/acceptance/virtiofs_submounts.py: required space between IP and
>>>      port
>>>    Python: add utility function for retrieving port redirection
>>>    tests/acceptance/linux_ssh_mips_malta.py: standardize port as integer
>>>    Acceptance tests: clarify ssh connection failure reason
>>>    tests/acceptance/virtiofs_submounts.py: add missing accel tag
>>>    Acceptance Tests: introduce LinuxTest base class
>>>    Acceptance Tests: move useful ssh methods to base class
>>>    Acceptance Tests: introduce method for requiring an accelerator
>>>    Acceptance Tests: fix population of public key in cloudinit image
>>>    Acceptance Tests: set up existing ssh keys by default
>>>    Acceptance Tests: add port redirection for ssh by default
>>>    Acceptance Tests: add basic documentation on LinuxTest base class
>>>    Acceptance Tests: introduce CPU hotplug test
>>>    [NOTFORMERGE] Bump Avocado version to latest master
>>>
>>>   docs/devel/testing.rst                    |  29 +++-
>>>   python/qemu/utils.py                      |  35 +++++
>>>   tests/acceptance/avocado_qemu/__init__.py | 176 ++++++++++++++++++++++
>>>   tests/acceptance/boot_linux.py            | 128 ++--------------
>>>   tests/acceptance/hotplug_cpu.py           |  38 +++++
>>>   tests/acceptance/info_usernet.py          |  29 ++++
>>>   tests/acceptance/linux_ssh_mips_malta.py  |  44 +-----
>>>   tests/acceptance/virtiofs_submounts.py    |  73 +--------
>>>   tests/requirements.txt                    |   2 +-
>>>   tests/vm/basevm.py                        |   7 +-
>>>   10 files changed, 334 insertions(+), 227 deletions(-)
>>>   create mode 100644 python/qemu/utils.py
>>>   create mode 100644 tests/acceptance/hotplug_cpu.py
>>>   create mode 100644 tests/acceptance/info_usernet.py
>> Patches 1-6, 8-9 & 12 queued.
> 
> 
> Those are merged. Most of the remaining patches got at least one review,
> so could you (Cleber or Philippe) open a pull request for them as well?
> Telling it because there are many series in flight for the acceptance
> tests, and to avoid conflicts with future series...

I asked a question to Cleber in patch 13 and am waiting what he meant
before queuing the series (fixing the typo Marc-André noticed).

Regards,

Phil.


