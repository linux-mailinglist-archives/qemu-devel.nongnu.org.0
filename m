Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB013139F9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:47:31 +0100 (CET)
Received: from localhost ([::1]:37618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99hC-0007Tg-FY
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l93OB-00031Z-Cb
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l93Np-0004te-KO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612778584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHMpEwnFfbT84hgVah/krjQO+YL0FGbvFHfqo/GMOq8=;
 b=MRW9U85wSst8U9VWRF+J50C16Y5MPEa0romKn22z/UrTCiIve9CkmWv1/EYxusLUqxYBoH
 aobleZw3vCUFJRSj/BL1nTtIqhuZOAnYaMkBie2Epqcu1r/AGhQPAz9f4RriEBEwGUCpOQ
 8fHNVZBi65PaxbgCdEnlv5Hh+VZP8PY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-OcrwjxyJNn6pIWbAXzgRMw-1; Mon, 08 Feb 2021 05:03:02 -0500
X-MC-Unique: OcrwjxyJNn6pIWbAXzgRMw-1
Received: by mail-wm1-f71.google.com with SMTP id t128so5172802wmg.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 02:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AHMpEwnFfbT84hgVah/krjQO+YL0FGbvFHfqo/GMOq8=;
 b=UflRw9dmX83DzWfFOuvG4wG4nbdOB5HUGcunuDjAuwwvINdf1XGakGqfsxPlLGkrSo
 aDezw1yme2qwH2qML3mLaPYZ8WdwQzhN2LYouJ6mn4ZcQq54X6aM1zIDGcK+8ZzLj+F4
 D+86VKtqtz6QB0vRF4dDzVG4Oe/9j/B1iMWkkleI99IqjRcGrdij9/ZqGzKnyboBpPMX
 JQqozN84j1045ydZ/ns2kaMuhsykhhtzJKYOIInUU8XVY60gRu07fWSoAJOFRfccx5ev
 EMtmyEhkmynlF5+ZvCAfIzWlgBZTYOzNz957k0qDCDMHZQWGxMV/68oFQfhjq7pDVNIF
 5WeA==
X-Gm-Message-State: AOAM533e9j7ToTcYTE8qCpPV3C+T7eAgtWzE4P7EhFEcVifMDxCbagTY
 UplmVqEDHNJsmo6rTIdrO1tMHSF2IxPUcu9EN25CmzTNXInk4bHXEWbyGRXyZH2UkMtwBRJ1Twx
 AwvamxA1yGWVxd1A=
X-Received: by 2002:adf:f54c:: with SMTP id j12mr4102958wrp.175.1612778580883; 
 Mon, 08 Feb 2021 02:03:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzQIThW0uOSH9vRvoaTtVBZfFlk8zsttDigXQlJHxmMIs6lBFhIKZHnYHV5jnMtP+zUOj4Cg==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr4102923wrp.175.1612778580681; 
 Mon, 08 Feb 2021 02:03:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r25sm29054764wrr.64.2021.02.08.02.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 02:02:59 -0800 (PST)
Subject: Re: [PULL v3 00/27] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>
References: <20210205164459.432714-1-stefanha@redhat.com>
 <CAFEAcA-dQtOaXB-eHEbiF0Z7jF-wSHt0LwW8Bk+BU2B66+=Cyw@mail.gmail.com>
 <CAFEAcA8sOgF9Czy+GUBti7W-C9ZtW9PB+1YxG7mqAXKr5mV18g@mail.gmail.com>
 <20210208092723.GA18298@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f14383aa-8213-83af-1411-de965180ea8b@redhat.com>
Date: Mon, 8 Feb 2021 11:02:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208092723.GA18298@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 10:27 AM, Stefan Hajnoczi wrote:
> On Sat, Feb 06, 2021 at 05:03:20PM +0000, Peter Maydell wrote:
>> On Fri, 5 Feb 2021 at 22:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Fri, 5 Feb 2021 at 16:45, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>>
>>>> The following changes since commit e2c5093c993ef646e4e28f7aa78429853bcc06ac:
>>>>
>>>>   iotests: 30: drop from auto group (and effectively from make check) (2021-02-05 15:16:13 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>>>>
>>>> for you to fetch changes up to b07011f375bda3319cf72eee7cb18d310078387b:
>>>>
>>>>   docs: fix Parallels Image "dirty bitmap" section (2021-02-05 16:36:36 +0000)
>>>>
>>>> ----------------------------------------------------------------
>>>> Pull request
>>>>
>>>> v3:
>>>>  * Replace {0} array initialization with {} to make clang happy [Peter]
>>>>
>>>> ----------------------------------------------------------------
>>>
>>>
>>> Fails 'make check' on s390x host:
>>
>> I gave this a rerun to check it was reproducible (it is) and realised
>> I missed what looks like an important line in the log. As usual,
>> trying to disentangle which lines of a parallel make check correspond
>> to the failure is pretty tricky, but the lines
>>  Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
>>
>> are probably the proximate causes of the assertion failures.
>>
>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> QTEST_QEMU_IMG=./qemu-img
>> G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
>> QTEST_QEMU_BINARY=./qemu-system-rx tests/qtest/qos-test --tap -k
>> PASS 45 qtest-rx/qmp-cmd-test /rx/qmp/query-memory-size-summary
>> SKIP
>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> QTEST_QEMU_IMG=./qemu-img
>> G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
>> QTEST_QEMU_BINARY=./qemu-system-s390x tests/qtest/pxe-test --tap -k
>> PASS 46 qtest-rx/qmp-cmd-test /rx/qmp/query-memory-devices
>> Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
>> PASS 47 qtest-rx/qmp-cmd-test /rx/qmp/query-replay
>> PASS 48 qtest-rx/qmp-cmd-test /rx/qmp/query-yank
>> PASS 49 qtest-rx/qmp-cmd-test /rx/qmp/query-name
>> PASS 50 qtest-rx/qmp-cmd-test /rx/qmp/query-iothreads
>> PASS 51 qtest-rx/qmp-cmd-test /rx/qmp/query-fdsets
>> PASS 52 qtest-rx/qmp-cmd-test /rx/qmp/query-command-line-options
>> PASS 53 qtest-rx/qmp-cmd-test /rx/qmp/query-acpi-ospm-status
>> PASS 54 qtest-rx/qmp-cmd-test /rx/qmp/object-add-failure-modes
>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> QTEST_QEMU_IMG=./qemu-img
>> G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
>> QTEST_QEMU_BINARY=./qemu-system-s390x tests/qtest/test-netfilter --tap
>> -k
>> Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
>> socket_accept failed: Resource temporarily unavailable
>> socket_accept failed: Resource temporarily unavailable
>> **
>> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>> **
>> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
>> signal 6 (Aborted) (core dumped)
>> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
>> signal 6 (Aborted) (core dumped)
>> ERROR qtest-s390x/pxe-test - Bail out!
>> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>> ERROR qtest-s390x/test-netfilter - Bail out!
>> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>> Makefile.mtest:3113: recipe for target 'run-test-387' failed
>> make: *** [run-test-387] Error 1
>> make: *** Waiting for unfinished jobs....
>> Makefile.mtest:3121: recipe for target 'run-test-388' failed
> 
> Hi Elena and Jag,
> Please take a look at this QOM failure. I guess remote-pcihost is being
> built but pcie-host-bridge is missing from the s390x-softmmu target.

Fix suggested here:
https://www.mail-archive.com/qemu-block@nongnu.org/msg80536.html

But beside the fix what would be better is to restrict this feature
where it makes sense (we are having hard time building/testing all
features, better enable new ones where they are used).

Would it be enough to enable this feature on X86 hosts/targets for
mainstream CI?

Thanks,

Phil.


