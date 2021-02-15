Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D280131C30C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:34:12 +0100 (CET)
Received: from localhost ([::1]:44012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkZP-0007qz-V8
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBkXT-0006Wh-AN
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:32:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBkXM-0000zm-Vx
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613421124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vmkmr8vSY+OjwAMRMPT5+0qz8c1bNn3LdIfDt3jESs=;
 b=M7tODbiOrnjQSlx9rqH2DE1/6VpSsgfaug2dcMDFrVtwYy0Bn7IwqzWxOqAx7VfmocEJU0
 ds5fsx/nRrpePFa8r5UxfHizRGFsiWjVZDFspSeya9hZi+MGlXpAH5x/+FepRP3NiPqbPc
 RG+/aid3gRr3nJLEeCin0Uot5ge6s7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-BKYVQZxcPGeMX4emUys8sg-1; Mon, 15 Feb 2021 15:32:02 -0500
X-MC-Unique: BKYVQZxcPGeMX4emUys8sg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62040195D560;
 Mon, 15 Feb 2021 20:32:01 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB3A510023B4;
 Mon, 15 Feb 2021 20:31:48 +0000 (UTC)
Subject: Re: [PATCH 10/22] Python: add utility function for retrieving port
 redirection
To: Cleber Rosa <crosa@redhat.com>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-11-crosa@redhat.com>
 <4d848476-c5b4-2fd0-cbcc-01f87e4dfb71@redhat.com>
 <20210215182714.GC72984@localhost.localdomain>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <96c1f98d-4b88-ddbd-7d27-c04d65866a9b@redhat.com>
Date: Mon, 15 Feb 2021 17:31:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215182714.GC72984@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/15/21 3:27 PM, Cleber Rosa wrote:
> On Tue, Feb 09, 2021 at 11:50:51AM -0300, Wainer dos Santos Moschetta wrote:
>> Hi,
>>
>> On 2/3/21 2:23 PM, Cleber Rosa wrote:
>>> Slightly different versions for the same utility code are currently
>>> present on different locations.  This unifies them all, giving
>>> preference to the version from virtiofs_submounts.py, because of the
>>> last tweaks added to it.
>>>
>>> While at it, this adds a "qemu.util" module to host the utility
>>> function and a test.
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>    python/qemu/utils.py                     | 35 ++++++++++++++++++++++++
>>>    tests/acceptance/info_usernet.py         | 29 ++++++++++++++++++++
>>>    tests/acceptance/linux_ssh_mips_malta.py | 16 +++++------
>>>    tests/acceptance/virtiofs_submounts.py   | 20 +++-----------
>>>    tests/vm/basevm.py                       |  7 ++---
>>>    5 files changed, 77 insertions(+), 30 deletions(-)
>>>    create mode 100644 python/qemu/utils.py
>>>    create mode 100644 tests/acceptance/info_usernet.py
>> I've a few suggestions:
>>
>> - IMHO "utils" is too broad, people may start throwing random stuffs there.
>> Maybe call it "net". I am sure there will be more net-related code to be
>> clustered on that module in the future.
>>
> It's hard to find the right balance here.  If you take a look at what John
> is proposing wrt the packaging the "qemu" Python libs, I believe one module
> is a good compromise at this point.  I really to expect that it will grow
> and that more modules will be created.
>
>> - Rename the method to "get_hostfwd_port()" because the parameter's name
>> already implies it is expected an "info usernet" output.
>>
> I thought about the method name, and decided to keep the more verbose name
> because this method is *not* about retrieving the "hostfwd port" from a
> running QEMU, but rather from the output that should be produced by a "info
> usernet" command.  It may become the foundation of a method on the QEMUMachine
> class that is called "get_hostfwd_port()" as you suggested, that includes
> getting the data (that is, issuing a "info usernet" command).
>
> Anyway, I tend to favor "explicit is better than implicit" approach, but
> I recognize that I can be too verbose at times.  Let's see if other people
> chip in with naming suggestions.
>
>> - Drop the InfoUsernet Test. It is too simple, and the same functionality is
>> tested indirectly by other tests.
>>
> I find "too simple" is a typical case of "famous last words" :D.
> Now, as a functional test to cover the utility function, it's indeed
> a bit of overkill.  It'd probably be less necessary if there were unittests
> for those (and there will hopefully be some soon).
>
> Now, testing *directly* was indeed the intention here. I see a few
> reasons for that, including saving a good amount of debugging time:
> such a test failing would provide *direct* indication of where the
> regression is.  These simpler tests can also be run with targets other
> than the ones really connecting into guests at this moment (while it's
> debatable wether such a regression would appear only on such targets).

I confess I was thinking on the impact of many small/simple tests on CI 
if that become a trend. Time to run a job should be manageable. In this 
case, having unittests for the utilities is all we need and would save 
some minutes on CI.

On the absence of unittests, I'm not opposed to merge this test.

>
>>> diff --git a/python/qemu/utils.py b/python/qemu/utils.py
>>> new file mode 100644
>>> index 0000000000..89a246ab30
>>> --- /dev/null
>>> +++ b/python/qemu/utils.py
>>> @@ -0,0 +1,35 @@
>>> +"""
>>> +QEMU utility library
>>> +
>>> +This offers miscellaneous utility functions, which may not be easily
>>> +distinguishable or numerous to be in their own module.
>>> +"""
>>> +
>>> +# Copyright (C) 2021 Red Hat Inc.
>>> +#
>>> +# Authors:
>>> +#  Cleber Rosa <crosa@redhat.com>
>>> +#
>>> +# This work is licensed under the terms of the GNU GPL, version 2.  See
>>> +# the COPYING file in the top-level directory.
>>> +#
>>> +
>>> +import re
>>> +from typing import Optional
>>> +
>>> +
>>> +def get_info_usernet_hostfwd_port(info_usernet_output: str) -> Optional[int]:
>>> +    """
>>> +    Returns the port given to the hostfwd parameter via info usernet
>>> +
>>> +    :param info_usernet_output: output generated by hmp command "info usernet"
>>> +    :param info_usernet_output: str
>>> +    :return: the port number allocated by the hostfwd option
>>> +    :rtype: int
>>> +    """
>>> +    for line in info_usernet_output.split('\r\n'):
>>> +        regex = r'TCP.HOST_FORWARD.*127\.0\.0\.1\s+(\d+)\s+10\.'
>>> +        match = re.search(regex, line)
>>> +        if match is not None:
>>> +            return int(match[1])
>>> +    return None
>>> diff --git a/tests/acceptance/info_usernet.py b/tests/acceptance/info_usernet.py
>>> new file mode 100644
>>> index 0000000000..9c1fd903a0
>>> --- /dev/null
>>> +++ b/tests/acceptance/info_usernet.py
>>> @@ -0,0 +1,29 @@
>>> +# Test for the hmp command "info usernet"
>>> +#
>>> +# Copyright (c) 2021 Red Hat, Inc.
>>> +#
>>> +# Author:
>>> +#  Cleber Rosa <crosa@redhat.com>
>>> +#
>>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>>> +# later.  See the COPYING file in the top-level directory.
>>> +
>>> +from avocado_qemu import Test
>>> +
>>> +from qemu.utils import get_info_usernet_hostfwd_port
>>> +
>>> +
>>> +class InfoUsernet(Test):
>>> +
>>> +    def test_hostfwd(self):
>>> +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22')
>>> +        self.vm.launch()
>>> +        res = self.vm.command('human-monitor-command',
>>> +                              command_line='info usernet')
>>> +        port = get_info_usernet_hostfwd_port(res)
>>> +        self.assertIsNotNone(port,
>>> +                             ('"info usernet" output content does not seem to '
>>> +                              'contain the redirected port'))
>>> +        self.assertGreater(port, 0,
>>> +                           ('Found a redirected port that is not greater than'
>>> +                            ' zero'))
>>> diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
>>> index 25c5c5f741..275659c785 100644
>>> --- a/tests/acceptance/linux_ssh_mips_malta.py
>>> +++ b/tests/acceptance/linux_ssh_mips_malta.py
>>> @@ -18,6 +18,8 @@ from avocado.utils import process
>>>    from avocado.utils import archive
>>>    from avocado.utils import ssh
>>> +from qemu.utils import get_info_usernet_hostfwd_port
>>> +
>>>    class LinuxSSH(Test):
>>> @@ -70,18 +72,14 @@ class LinuxSSH(Test):
>>>        def setUp(self):
>>>            super(LinuxSSH, self).setUp()
>>> -    def get_portfwd(self):
>>> +    def ssh_connect(self, username, password):
>>> +        self.ssh_logger = logging.getLogger('ssh')
>>>            res = self.vm.command('human-monitor-command',
>>>                                  command_line='info usernet')
>>> -        line = res.split('\r\n')[2]
>>> -        port = re.split(r'.*TCP.HOST_FORWARD.*127\.0\.0\.1 (\d+)\s+10\..*',
>>> -                        line)[1]
>>> +        port = get_info_usernet_hostfwd_port(res)
>>> +        if not port:
>>> +            self.cancel("Failed to retrieve SSH port")
>> Here I think it should assert not none, otherwise there is a bug somewhere.
>>
>> - Wainer
> I'm trying to be careful and conservative with adding assertions,
> because IMO those belong to test writers.  IMO the expectation of a
> user writing a test using "ssh_connect()" as a framework utility,
> would be more aligned with the framework bailing out, than blatantly
> setting a test failure.
>
> It's similar to what happens if a "vmimage" snapshot can not be
> created... there's an issue somewhere, but it'd be a bit unfair, and
> confusing, to set a assertion error (and thus test failure).  But, I
> think this is the kind of design decision that will evolve with (more)
> time here.
I see. I agree with that design, I will keep it in mind when reviewing 
patches and submitting changes.
>
> Let me know if my explanations make sense and change your mind
> any bit :).

Sure, thanks for the explanations. As I mentioned in my first reply, 
they were just suggestions. So,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> Thanks for the review!
> - Cleber.


