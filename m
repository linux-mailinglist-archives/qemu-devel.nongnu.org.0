Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3E8203297
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 10:55:39 +0200 (CEST)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnIEs-0005Ue-Q5
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 04:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnIE1-00054q-9U
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 04:54:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58836
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnIDy-00047k-UP
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 04:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592816081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ejFc42i7o1JpfHvbkr72WAwZzspGTXXFRSp+HGZH8hc=;
 b=eNRWMVOF/YqGRqnlgal1oaDg4/hvciMXV+NzxAyKq++/Yh+YLcBdQcKvHBy90G/D+dCQCp
 Y1DvjsGjRfYHmW0xBFrEtVnPq+0GYsuSTygIYE1VsmEFQmjzI0wvuoLmOvRFP7BjkP8Oje
 XxMMYeZA2fXl6LE9CThIiikgWkW7Yjc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-NVAHNi6HNgOh1z-bmd6Ngw-1; Mon, 22 Jun 2020 04:54:39 -0400
X-MC-Unique: NVAHNi6HNgOh1z-bmd6Ngw-1
Received: by mail-wm1-f71.google.com with SMTP id t18so6931692wmj.5
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 01:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ejFc42i7o1JpfHvbkr72WAwZzspGTXXFRSp+HGZH8hc=;
 b=fvC7T4g/aTl82Y2wrtnCEDsQkuNII7B1PF58p5B/+2p4UbkzF7rW8I4KdIhMPgQ0HF
 MvfdsF/6Ip3JOvpxhbBFW3Dl6wy19ziyqpnNK6QNrH6+BOfjOQmS1oobRW6MbYHdYP2q
 Bg+JiK8hr/HLk/NMDzZocB2yBU5BkdGhrlGrekT80ZK4rTGQTeWs4LeRjnBf7Ai8IqvD
 YwuZKB+qb0CmCgqdQIfTlKAq0PbIzAvG2qyrDkkNBIwceQTOjBLV3//IUdfEi7ZNdV5m
 e/1UrjIo8XVjaXOgGwXLaBT3qrerTkPlOFqQbdzyf8a3erDOn27/Itoeaiang5oyEQ+c
 +5hw==
X-Gm-Message-State: AOAM531z6qMv/w0YG+ma+W9RgP+bnnH33eQT3F7brNYPi9RrgXI44Mb0
 p91oO0zGeLuLm5QqLrbu10YHXHu0DezeYuS+G59yYZfHM8AsBOY0TZjR+3hOP1fWqF7f+FqpYck
 K6wZ6CqeNjSlFxJ4=
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr6035338wmj.115.1592816076656; 
 Mon, 22 Jun 2020 01:54:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxrQ8nrPIXJl1yQAiJPKH4vPtH28izIajSbt63wtu2pGysVo25iwanrpy3zGN7w3hXJSkSpA==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr6035320wmj.115.1592816076363; 
 Mon, 22 Jun 2020 01:54:36 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id 125sm16691977wmc.23.2020.06.22.01.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 01:54:35 -0700 (PDT)
Subject: Re: [PATCH v3 11/11] tests/acceptance: Linux boot test for
 record/replay
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, crosa@redhat.com
References: <159073587336.20809.5404476664125786279.stgit@pasha-ThinkPad-X280>
 <159073593747.20809.8077489762546010193.stgit@pasha-ThinkPad-X280>
 <9d5ed6f6-3d45-c0c5-88bf-a4ded78bb966@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <407d2489-dfa4-b0fd-ec01-d1b7dd9a183d@redhat.com>
Date: Mon, 22 Jun 2020 10:54:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9d5ed6f6-3d45-c0c5-88bf-a4ded78bb966@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, dovgaluk@ispras.ru,
 ehabkost@redhat.com, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/20 10:03 AM, Philippe Mathieu-Daudé wrote:
> Hi Pavel,
> 
> On 5/29/20 9:05 AM, Pavel Dovgalyuk wrote:
>> This patch adds a test for record/replay, which boots Linux
>> image from the disk and interacts with the network.
>> The idea and code of this test is borrowed from boot_linux.py
>> However, currently record/replay works only for x86_64,
>> therefore other tests were excluded.
>>
>> Each test consists of the following phases:
>>  - downloading the disk image
>>  - recording the execution
>>  - replaying the execution
>>
>> Replay does not validates the output, but waits until QEMU
>> finishes the execution. This is reasonable, because
>> QEMU usually hangs when replay goes wrong.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
>> ---
>>  0 files changed
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e9a9ce4f66..97f066a9b2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2498,6 +2498,7 @@ F: include/sysemu/replay.h
>>  F: docs/replay.txt
>>  F: stubs/replay.c
>>  F: tests/acceptance/replay_kernel.py
>> +F: tests/acceptance/replay_linux.py
>>  
>>  IOVA Tree
>>  M: Peter Xu <peterx@redhat.com>
>> diff --git a/tests/acceptance/replay_linux.py b/tests/acceptance/replay_linux.py
>> new file mode 100644
>> index 0000000000..328b03bb33
>> --- /dev/null
>> +++ b/tests/acceptance/replay_linux.py
>> @@ -0,0 +1,114 @@
>> +# Record/replay test that boots a complete Linux system via a cloud image
>> +#
>> +# Copyright (c) 2020 ISP RAS
>> +#
>> +# Author:
>> +#  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +import os
>> +import logging
>> +import time
>> +
>> +from avocado.utils import cloudinit
>> +from avocado.utils import network
>> +from avocado.utils import vmimage
>> +from avocado.utils import datadrainer
>> +from avocado.utils.path import find_command
>> +from boot_linux import BootLinuxBase
>> +
>> +class ReplayLinux(BootLinuxBase):
>> +    """
>> +    Boots a Linux system, checking for a successful initialization
>> +    """
>> +
>> +    timeout = 1800
> 
> This test works, but is taking way too long for the default
> test suite.
> 
> I said in the cover I'd use ...:
> 
> @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-CI')
> 
> ... to skip on Travis, but I'll change by declaring this test
> 'slow'. We could use 'tags=slowness:high' but then we need to
> modify the 'check-acceptance' default rule to skip tests
> matching the tag.
> 
> Willian, Cleber, any clever idea?

Meanwhile I'm taking this patch out of the queue, so it
won't delay the integration of the other tests.

> 
>> +    chksum = None
>> +    hdd = 'ide-hd'
>> +    cd = 'ide-cd'
>> +    bus = 'ide'
>> +
>> +    def setUp(self):
>> +        super(ReplayLinux, self).setUp()
>> +        self.boot_path = self.download_boot()
>> +        self.cloudinit_path = self.download_cloudinit()
>> +
>> +    def vm_add_disk(self, vm, path, id, device):
>> +        bus_string = ''
>> +        if self.bus:
>> +            bus_string = ',bus=%s.%d' % (self.bus, id,)
>> +        vm.add_args('-drive', 'file=%s,snapshot,id=disk%s,if=none' % (path, id))
>> +        vm.add_args('-drive',
>> +            'driver=blkreplay,id=disk%s-rr,if=none,image=disk%s' % (id, id))
>> +        vm.add_args('-device',
>> +            '%s,drive=disk%s-rr%s' % (device, id, bus_string))
>> +
>> +    def launch_and_wait(self, record, args, shift):
>> +        vm = self.get_vm()
>> +        vm.add_args('-smp', '1')
>> +        vm.add_args('-m', '1024')
>> +        vm.add_args('-object', 'filter-replay,id=replay,netdev=hub0port0')
>> +        if args:
>> +            vm.add_args(*args)
>> +        self.vm_add_disk(vm, self.boot_path, 0, self.hdd)
>> +        self.vm_add_disk(vm, self.cloudinit_path, 1, self.cd)
>> +        logger = logging.getLogger('replay')
>> +        if record:
>> +            logger.info('recording the execution...')
>> +            mode = 'record'
>> +        else:
>> +            logger.info('replaying the execution...')
>> +            mode = 'replay'
>> +        replay_path = os.path.join(self.workdir, 'replay.bin')
>> +        vm.add_args('-icount', 'shift=%s,rr=%s,rrfile=%s' %
>> +                    (shift, mode, replay_path))
>> +
>> +        start_time = time.time()
>> +
>> +        vm.set_console()
>> +        vm.launch()
>> +        console_drainer = datadrainer.LineLogger(vm.console_socket.fileno(),
>> +                                    logger=self.log.getChild('console'),
>> +                                    stop_check=(lambda : not vm.is_running()))
>> +        console_drainer.start()
>> +        if record:
>> +            cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port),
>> +                                          self.name)
>> +            vm.shutdown()
>> +            logger.info('finished the recording with log size %s bytes'
>> +                % os.path.getsize(replay_path))
>> +        else:
>> +            vm.wait()
>> +            logger.info('successfully fihished the replay')
>> +        elapsed = time.time() - start_time
>> +        logger.info('elapsed time %.2f sec' % elapsed)
>> +        return elapsed
>> +
>> +    def run_rr(self, args=None, shift=7):
>> +        t1 = self.launch_and_wait(True, args, shift)
>> +        t2 = self.launch_and_wait(False, args, shift)
>> +        logger = logging.getLogger('replay')
>> +        logger.info('replay overhead {:.2%}'.format(t2 / t1 - 1))
>> +
>> +class ReplayLinuxX8664(ReplayLinux):
>> +    """
>> +    :avocado: tags=arch:x86_64
>> +    """
>> +
>> +    chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
>> +
>> +    def test_pc_i440fx(self):
>> +        """
>> +        :avocado: tags=machine:pc
>> +        :avocado: tags=accel:tcg
>> +        """
>> +        self.run_rr(shift=1)
>> +
>> +    def test_pc_q35(self):
>> +        """
>> +        :avocado: tags=machine:q35
>> +        :avocado: tags=accel:tcg
>> +        """
>> +        self.run_rr(shift=3)
>>
> 


