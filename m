Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D4431BD9C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:51:31 +0100 (CET)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBg9q-00057P-59
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBg8h-0004cC-TK
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:50:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBg8e-0006We-S6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613404215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LIhBKCnHZeX6WDmQ1koGeYwhElBz9mwS+TJUGdXP/GY=;
 b=GAtJleMZyg1Bba4QnLtsJpN/lvbd+6pOjidAmYAxVEBAbjzv6coHfPjn/ANB4r9H0QJksv
 tRwY4TSxFLkKl6NsXv29j4x5wD1MKi9K62KFnci7KjhVMjmyl20tBC3FExl3A9OA2fwID2
 MVp/dE6ZDHflns14P6LookiNqXtOlMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-2GmIrQAcMRilkcigQK6EXw-1; Mon, 15 Feb 2021 10:50:12 -0500
X-MC-Unique: 2GmIrQAcMRilkcigQK6EXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C6E6801962;
 Mon, 15 Feb 2021 15:50:11 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2127F5C233;
 Mon, 15 Feb 2021 15:49:56 +0000 (UTC)
Subject: Re: [PATCH 00/22] Acceptance Test: introduce base class for Linux
 based tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <02bcee13-64fa-e14a-98ad-e8426a26d7d2@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <dd2fda88-723c-7954-6f7e-bfb2d4bdae81@redhat.com>
Date: Mon, 15 Feb 2021 12:49:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <02bcee13-64fa-e14a-98ad-e8426a26d7d2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/8/21 8:35 AM, Philippe Mathieu-Daudé wrote:
> On 2/3/21 6:23 PM, Cleber Rosa wrote:
>> This introduces a base class for tests that need to interact with a
>> Linux guest.  It generalizes the "boot_linux.py" code, already been
>> used by the "virtiofs_submounts.py" and also SSH related code being
>> used by that and "linux_ssh_mips_malta.py".
>>
>> While at it, a number of fixes on hopeful improvements to those tests
>> were added.
>>
>> Cleber Rosa (22):
>>    tests/acceptance/boot_linux.py: fix typo on cloudinit error message
>>    tests/acceptance/boot_linux.py: rename misleading cloudinit method
>>    Acceptance Tests: remove unnecessary tag from documentation example
>>    tests/acceptance/virtiofs_submounts.py: use workdir property
>>    tests/acceptance/virtiofs_submounts.py: do not ask for ssh key
>>      password
>>    tests/acceptance/virtiofs_submounts.py: use a virtio-net device
>>      instead
>>    tests/acceptance/virtiofs_submounts.py: evaluate string not length
>>    tests/acceptance/virtiofs_submounts.py: standardize port as integer
>>    tests/acceptance/virtiofs_submounts.py: required space between IP and
>>      port
>>    Python: add utility function for retrieving port redirection
>>    tests/acceptance/linux_ssh_mips_malta.py: standardize port as integer
>>    Acceptance tests: clarify ssh connection failure reason
>>    tests/acceptance/virtiofs_submounts.py: add missing accel tag
>>    Acceptance Tests: introduce LinuxTest base class
>>    Acceptance Tests: move useful ssh methods to base class
>>    Acceptance Tests: introduce method for requiring an accelerator
>>    Acceptance Tests: fix population of public key in cloudinit image
>>    Acceptance Tests: set up existing ssh keys by default
>>    Acceptance Tests: add port redirection for ssh by default
>>    Acceptance Tests: add basic documentation on LinuxTest base class
>>    Acceptance Tests: introduce CPU hotplug test
>>    [NOTFORMERGE] Bump Avocado version to latest master
>>
>>   docs/devel/testing.rst                    |  29 +++-
>>   python/qemu/utils.py                      |  35 +++++
>>   tests/acceptance/avocado_qemu/__init__.py | 176 ++++++++++++++++++++++
>>   tests/acceptance/boot_linux.py            | 128 ++--------------
>>   tests/acceptance/hotplug_cpu.py           |  38 +++++
>>   tests/acceptance/info_usernet.py          |  29 ++++
>>   tests/acceptance/linux_ssh_mips_malta.py  |  44 +-----
>>   tests/acceptance/virtiofs_submounts.py    |  73 +--------
>>   tests/requirements.txt                    |   2 +-
>>   tests/vm/basevm.py                        |   7 +-
>>   10 files changed, 334 insertions(+), 227 deletions(-)
>>   create mode 100644 python/qemu/utils.py
>>   create mode 100644 tests/acceptance/hotplug_cpu.py
>>   create mode 100644 tests/acceptance/info_usernet.py
> Patches 1-6, 8-9 & 12 queued.


Those are merged. Most of the remaining patches got at least one review, 
so could you (Cleber or Philippe) open a pull request for them as well? 
Telling it because there are many series in flight for the acceptance 
tests, and to avoid conflicts with future series...

Thanks!

- Wainer


>
>


