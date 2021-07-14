Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1C3C7F78
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 09:40:48 +0200 (CEST)
Received: from localhost ([::1]:57988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ZVg-0004cL-0n
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 03:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m3ZUZ-0003v3-2e
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:39:39 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m3ZUX-0000Nv-2c
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:39:38 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1D82520272;
 Wed, 14 Jul 2021 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626248374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNM5NpN4t3gsn09RyFv8VSVt+QGwSj28geT1bRRQE3Y=;
 b=BrXGKMZZDM4j+nbm0lnlGLqRE+IJIr7w2lV6xVH/EhNKFsdV96ZPrQ7iNYf/quwlbyqlwb
 Y+atp+BH5QRaQoPckoaxr3gT+AESKakLJxtNLGxKpayPHgq25pSkbq+EBABsztaFyBXEl6
 gms1gR84NDOHsuw7IGb2n1Rb19uT6eo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626248374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNM5NpN4t3gsn09RyFv8VSVt+QGwSj28geT1bRRQE3Y=;
 b=q0PdVaeSDkZRI3+34JdZ/8Es7R6Y0wgkjcUwkxMK2tDf6UpLjza62pXWmD5bLIsdA31ull
 bxT0VzoSzFkC14DA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DEAA1133FA;
 Wed, 14 Jul 2021 07:39:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id b5iDNLWU7mC9agAAGKfGzw
 (envelope-from <cfontana@suse.de>); Wed, 14 Jul 2021 07:39:33 +0000
Subject: Re: [PATCH v1 1/2] tests/acceptance: move pkg extraction to
 avocado_qemu/
To: Cleber Rosa <crosa@redhat.com>
References: <20210604180945.9330-1-cfontana@suse.de>
 <20210604180945.9330-2-cfontana@suse.de>
 <87sg0iytq0.fsf@p50.localhost.localdomain>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <eaf7951d-50eb-ed14-b91a-7c23222b5002@suse.de>
Date: Wed, 14 Jul 2021 09:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87sg0iytq0.fsf@p50.localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.368,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 8:05 PM, Cleber Rosa wrote:
> 
> Claudio Fontana writes:
> 
>> currently these utility functions are present only in boot_linux_console.py,
>> but they are useful in general, not just for linux.
>>
>> In order to reuse them for a firmware test with OVMF, make these functions
>> general utility functions inside avocado_qemu/ , from where we will
>> punctually import them.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  tests/acceptance/avocado_qemu/__init__.py |  38 ++++++++
>>  tests/acceptance/boot_linux_console.py    | 104 +++++++---------------
>>  tests/acceptance/boot_xen.py              |   7 +-
>>  tests/acceptance/replay_kernel.py         |  23 ++---
>>  tests/acceptance/tcg_plugins.py           |   5 +-
>>  5 files changed, 91 insertions(+), 86 deletions(-)
>>
>> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
>> index 83b1741ec8..f625eb1ab7 100644
>> --- a/tests/acceptance/avocado_qemu/__init__.py
>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>> @@ -21,6 +21,7 @@
>>  from avocado.utils import datadrainer
>>  from avocado.utils import network
>>  from avocado.utils import vmimage
>> +from avocado.utils import process
> 
> It's also missing:
> 
>    from avocado.utils import archive
> 
> Because it's used...
> 
>>  from avocado.utils.path import find_command
>>  
>>  
>> @@ -140,6 +141,43 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
>>      """
>>      _console_interaction(test, success_message, failure_message, None, vm=vm)
>>  
>> +def extract_from_deb(test, deb, path):
>> +    """
>> +    Extracts a file from a deb package into the test workdir
>> +
>> +    :param deb: path to the deb archive
>> +    :param path: path within the deb archive of the file to be extracted
>> +    :returns: path of the extracted file
>> +    """
>> +    cwd = os.getcwd()
>> +    os.chdir(test.workdir)
>> +    file_path = process.run("ar t %s" % deb).stdout_text.split()[2]
>> +    process.run("ar x %s %s" % (deb, file_path))
>> +    archive.extract(file_path, test.workdir)
> 
> ... here.
> 
> Also there are some missing changes for other tests using
> extract_from_(deb|rpm), such as:
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 55ce7a5870..1caea29d27 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -92,7 +92,7 @@ def test_mips_malta(self):
>                     'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
>          deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> -        kernel_path = extract_from_deb(deb_path,
> +        kernel_path = extract_from_deb(self, deb_path,
>                                         '/boot/vmlinux-2.6.32-5-4kc-malta')
>  
>          self.vm.set_console()
> 
> I've seen the same or similar problems for other tests:
> 
>    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips_malta: ERROR: extract_from_deb() missing 1 required positional argument: 'path' (0.03 s)
>    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_malta: ERROR: extract_from_deb() missing 1 required positional argument: 'path' (0.03 s)
>    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e: ERROR: extract_from_deb() missing 1 required positional argument: 'path' (0.03 s)
>    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips_malta_cpio: ERROR: extract_from_deb() missing 1 required positional argument: 'path' (0.03 s)
>    tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd:
>    ERROR: 'BootLinuxConsole' object has no attribute 'extract_from_deb'
>    (0.03 s)
> 
> 
> Having said that, since Avocado 89.0[1] there is a new API[2] that
> should be able to handle both deb and rpm extractions.
> 
> I'll try to post a suggestion based on that API here... unless you beat
> me to it. :)

Go ahead, I am very unlikely to be able to beat you to it :-)

Ciao,

Claudio

> 
> Thanks,
> - Cleber.
> 
> [1] - https://avocado-framework.readthedocs.io/en/89.0/releases/89_0.html#utility-apis
> [2] - https://avocado-framework.readthedocs.io/en/89.0/api/utils/avocado.utils.software_manager.html#avocado.utils.software_manager.SoftwareManager.extract_from_package
> 


