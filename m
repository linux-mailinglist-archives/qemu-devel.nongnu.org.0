Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3B2D1AF3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 21:47:56 +0100 (CET)
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmNQI-0004Ai-Oi
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 15:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmNOe-0003gC-8m
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 15:46:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmNOa-0007m4-ES
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 15:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607373966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tmPzV4TXnZzEKpBFAKF2+ZMdAOTBmdxOsAZJx08V74=;
 b=fej0RARcBAgS2zy8g2IRZ3bM2iQcNGJeJBqZ22fXE/Gga89iuZGZFBTk3lAbWaUrfAYrrQ
 QzP2qTsJeoGb1sFnfMCvC5B3jlLuM0Xo2hsIr2mmahlk2ghkOUce3MrY5glpRh3FOSJRWe
 sutoy7J/hydSQuyyQf8xCNbEzPv+jTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-YiQeskj2OG2RACt1SL0CJw-1; Mon, 07 Dec 2020 15:46:02 -0500
X-MC-Unique: YiQeskj2OG2RACt1SL0CJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96BC6858184;
 Mon,  7 Dec 2020 20:46:01 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6514290A9;
 Mon,  7 Dec 2020 20:45:57 +0000 (UTC)
Subject: Re: runaway avocado
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
 <caccebbf-e12d-ab91-d631-ae126d8cddf7@redhat.com>
 <20201027002822.GA2265721@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <9d355b5d-4604-669f-5336-2e136f996734@redhat.com>
Date: Mon, 7 Dec 2020 15:45:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201027002822.GA2265721@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 avocado-devel <avocado-devel@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/20 8:28 PM, Cleber Rosa wrote:
> On Mon, Oct 26, 2020 at 11:43:36PM +0100, Philippe Mathieu-Daudé wrote:
>> Cc'ing avocado-devel@
>>
>> On 10/26/20 11:35 PM, Peter Maydell wrote:
>>> So, I somehow ended up with this process still running on my
>>> local machine after a (probably failed) 'make check-acceptance':
>>>
>>> petmay01 13710 99.7  3.7 2313448 1235780 pts/16 Sl  16:10 378:00
>>> ./qemu-system-aarch64 -display none -vga none -chardev
>>> socket,id=mon,path=/var/tmp/tmp5szft2yi/qemu-13290-monitor.sock -mon
>>> chardev=mon,mode=control -machine virt -chardev
>>> socket,id=console,path=/var/tmp/tmp5szft2yi/qemu-13290-console.sock,server,nowait
>>> -serial chardev:console -icount
>>> shift=7,rr=record,rrfile=/var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/replay.bin,rrsnapshot=init
>>> -net none -drive
>>> file=/var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/disk.qcow2,if=none
>>> -kernel /home/petmay01/avocado/data/cache/by_location/a00ac4ae676ef0322126abd2f7d38f50cc9cbc95/vmlinuz
>>> -cpu cortex-a53
>>>
>>> and it was continuing to log to a deleted file
>>> /var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/replay.bin
>>>
>>> which was steadily eating my disk space and got up to nearly 100GB
>>> in used disk (invisible to du, of course, since it was an unlinked
>>> file) before I finally figured out what was going on and killed it
>>> about six hours later...
>>>
> 
> Ouch!
> 
>>> Any suggestions for how we might improve the robustness of the
>>> relevant test ?
>>>
> 
> While this test may be less robust/reliable than others, the core
> issue is that the automatic shutdown of the QEMU "vms" can be
> improved.  My best guess is that this specific test ended in ERROR,
> and (or because?) the tearDown() method failed to end these processes.
> 
> All tests can be improved at once by adding a second, even more
> forceful round of shutdown.  Currently the process gets, in the worst
> case scenario, a SIGKILL.
> 
> But, in addition to that, an upper layer above the test could be given
> the responsibility to look for and clean up resouces initiated by a
> test.  The Avocado job has hooks for running callbacks right before
> its own process exits, but, with the new Avocado architecture (AKA "N(ext)
> Runner") this should probably be implemented as async cleanup actions
> that begin right after a test ends.
> 
> I'll give the "second more forceful round of shutdown" approach some
> and testing, and in addition to that, open an issue to track the upper
> layer resource cleanup on Avocado.
> 

machine.py should have a timeout that it adheres to, unless it was 
disabled explicitly -- then I guess it can't help you.

--js


