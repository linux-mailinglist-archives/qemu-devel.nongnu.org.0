Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB643AFD47
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:50:24 +0200 (CEST)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaEp-0002H5-Mt
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lvaCS-0008PB-KP
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:47:56 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lvaCQ-0002f5-JT
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:47:56 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B3321FD5B;
 Tue, 22 Jun 2021 06:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624344473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmqrT2jiAQu7tQDXKh+tWeuHTEl3s+NAha80Ar5yyGY=;
 b=NhfxGiG1gEra+aYExz2ecTHhjh505ij8eLi3tgEH7Yc2gtBNQ0ZDuKVbDJIfYy1XC5f8Fh
 TrSZPDY+HWoQH1ob6pRwttlO8BN5ifkcdnzvNLew5DD0AjSIWo57gT+5U+ruBt4mAPOCny
 sBtlsmxO9elkGF+YOfIqAF2yv8XqVMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624344473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmqrT2jiAQu7tQDXKh+tWeuHTEl3s+NAha80Ar5yyGY=;
 b=PiBPR58Sq9HCxqDbPTOytS7N08N4XJtKH3mMUtZxjm7zaarw/JnbPh1Vh/eesW0RkrUQIR
 aQ3hbvbYOADmwLBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C1C54118DD;
 Tue, 22 Jun 2021 06:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624344473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmqrT2jiAQu7tQDXKh+tWeuHTEl3s+NAha80Ar5yyGY=;
 b=NhfxGiG1gEra+aYExz2ecTHhjh505ij8eLi3tgEH7Yc2gtBNQ0ZDuKVbDJIfYy1XC5f8Fh
 TrSZPDY+HWoQH1ob6pRwttlO8BN5ifkcdnzvNLew5DD0AjSIWo57gT+5U+ruBt4mAPOCny
 sBtlsmxO9elkGF+YOfIqAF2yv8XqVMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624344473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmqrT2jiAQu7tQDXKh+tWeuHTEl3s+NAha80Ar5yyGY=;
 b=PiBPR58Sq9HCxqDbPTOytS7N08N4XJtKH3mMUtZxjm7zaarw/JnbPh1Vh/eesW0RkrUQIR
 aQ3hbvbYOADmwLBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id eJ9ULZiH0WD0VgAALh3uQQ
 (envelope-from <cfontana@suse.de>); Tue, 22 Jun 2021 06:47:52 +0000
Subject: Re: [PATCH v1 2/2] tests/acceptance: add OVMF firmware test to cover
 x86_64 "host" cpu bug
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210604180945.9330-1-cfontana@suse.de>
 <20210604180945.9330-3-cfontana@suse.de>
 <20210604191249.5ixcqsagn3lew6af@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <58e55512-c2a2-b986-8ca3-90fa11ca9928@suse.de>
Date: Tue, 22 Jun 2021 08:47:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210604191249.5ixcqsagn3lew6af@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 9:12 PM, Eduardo Habkost wrote:
> On Fri, Jun 04, 2021 at 08:09:45PM +0200, Claudio Fontana wrote:
>> recent refactoring of i386 broke OVMF firmware with a wrong initialization
>> order for host cpu. This test covers this issue for potential regressions.
>>
>> For the actual fixes, see:
>> commit ("i386: run accel_cpu_instance_init as post_init"),
>> commit ("i386: reorder call to cpu_exec_realizefn"),
>>
>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
> I think basic OVMF boot regression testing is still welcome, but
> would we be able to detect this specific bug more quickly and
> easily by just looking at the VCPU CPUID data?


The current proposal to get the cpuid as seen by the guest would detect the wrong order of features expansion
for sure, but I am not sure about the other issues.

Should we add this basic OVMF boot regression testing still?
I would say it is simple and useful.

Thanks,

Claudio


> 
> We could use the proposed query-kvm-cpuid command for that:
> https://lore.kernel.org/qemu-devel/20210603090753.11688-1-valeriy.vdovin@virtuozzo.com
> 
> 
>> ---
>>  tests/acceptance/boot_ovmf_fc33.py | 75 ++++++++++++++++++++++++++++++
>>  1 file changed, 75 insertions(+)
>>  create mode 100644 tests/acceptance/boot_ovmf_fc33.py
>>
>> diff --git a/tests/acceptance/boot_ovmf_fc33.py b/tests/acceptance/boot_ovmf_fc33.py
>> new file mode 100644
>> index 0000000000..c0c4e0e394
>> --- /dev/null
>> +++ b/tests/acceptance/boot_ovmf_fc33.py
>> @@ -0,0 +1,75 @@
>> +# Functional test that boots OVMF firmware with cpu host.
>> +#
>> +# This test was added to capture x86 "host" cpu initialization and realization
>> +# ordering problems.
>> +#
>> +# Copyright (c) 2021 SUSE LLC
>> +#
>> +# Author:
>> +#  Claudio Fontana <cfontana@suse.de>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +import os
>> +import time
>> +
>> +from avocado_qemu import Test
>> +from avocado_qemu import extract_from_rpm
>> +from avocado_qemu import wait_for_console_pattern
>> +from avocado.utils import process
>> +from avocado.utils.path import find_command, CmdNotFoundError
>> +
>> +class FirmwareTest(Test):
>> +    def wait_for_firmware_message(self, success_message):
>> +        wait_for_console_pattern(self, success_message, failure_message=None)
>> +
>> +class BootOVMF(FirmwareTest):
>> +    """
>> +    Boots OVMF secureboot and checks for a specific message.
>> +    If we do not see the message, it's an ERROR that we express via a timeout.
>> +    """
>> +    timeout = 10
>> +
>> +    def test_cpu_host_x86(self):
>> +        """
>> +        :avocado: tags=arch:x86_64
>> +        :avocado: tags=machine:q35
>> +        :avocado: tags=cpu:host
>> +        :avocado: tags=accel:kvm
>> +        """
>> +        self.require_accelerator("kvm")
>> +
>> +        rpm_url = ('https://download-ib01.fedoraproject.org/'
>> +                   'pub/fedora/linux/updates/33/Everything/x86_64/Packages/e/'
>> +                   'edk2-ovmf-20200801stable-3.fc33.noarch.rpm')
>> +        rpm_hash = '45e1001313dc2deed9b41a532ef090682a11ccd1'
>> +        rpm_path = self.fetch_asset(rpm_url, asset_hash=rpm_hash)
>> +
>> +        # Note the use of "./" at the beginning of the paths in the rpm,
>> +        # it is not an accident, see extract_from_rpm in avocado_qemu/
>> +
>> +        ovmf_code_sec = extract_from_rpm(self, rpm_path,
>> +                                  './usr/share/edk2/ovmf/OVMF_CODE.secboot.fd')
>> +        ovmf_vars_sec = extract_from_rpm(self, rpm_path,
>> +                                  './usr/share/edk2/ovmf/OVMF_VARS.secboot.fd')
>> +
>> +        # at this point the ovmf code should be reachable in the tmp dir; we
>> +        # can use this sleep to debug issues with the extraction above.
>> +        #time.sleep(3600)
>> +
>> +        self.vm.set_console()
>> +        self.vm.add_args(
>> +            '-accel', 'kvm',
>> +            '-cpu', 'host',
>> +            '-machine', 'q35,smm=on',
>> +            '-m', '4G',
>> +            '-drive',
>> +               'if=pflash,format=raw,readonly=on,unit=0,file=' + ovmf_code_sec,
>> +            '-drive',
>> +               'if=pflash,format=raw,unit=1,file=' + ovmf_vars_sec,
>> +            '-display', 'none',
>> +            '-serial', 'stdio')
>> +        self.vm.launch()
>> +        console_pattern = 'BdsDxe: failed to load Boot0001'
>> +        self.wait_for_firmware_message(success_message=console_pattern);
>> -- 
>> 2.26.2
>>
> 


