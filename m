Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEC231884C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:38:25 +0100 (CET)
Received: from localhost ([::1]:37612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9Me-0002kD-3n
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA9Fo-0004Gg-Ll
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:31:22 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA9Fl-0004sw-41
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:31:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id m1so5209541wml.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CdVukRm/LyvqkBsmIMz9ag1e1ZFqkVA0q2ZVath/wHw=;
 b=AuxarcC0n7IEX6p9hfwMxiahmTnbYbTGueikUiKkDbn4XbrihVsV/O+laANhzAaQxa
 OPFTaUt2R4IL3xx3TlWhzi17l2eOQfe6G8kiO6Q+MdXCxJ0md3tcee5LaRX2Ltc6qs0J
 oqHnUc6hq74dqGn7RkO/ioGBIRl3tMd0Z2D1wyHjPpYkTRT5gSZiqJPj06tek6u8Dh55
 rgJHyhnYkoxn0rGjNqyEzkwxWiJ8UjtluaqLPd5gPuQoMXYQ7HkGTD2cQ87MSqmcM41z
 89TjRwGzlB+as0vxcz/RT2ao0fQew1JyRBmVjx1YfotjqisAtcn2cU6EC1h3BIVEITIf
 +W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CdVukRm/LyvqkBsmIMz9ag1e1ZFqkVA0q2ZVath/wHw=;
 b=QY6ySL81L+jLH8LqB7TLvPph1y47drxjuk22p3sB77y1p1llBtnPHbAgEbuGP1MYZO
 /W+Lw4t5yuBLnohBmNcVx4gQP0grSZ20AL1lA3nqAWojhNthOKXsenKM8GYIdLfQ2shT
 Rz8Kb9kqedwYmfaO8J0fpcDr2b9SSGfmLyIronp1dpXD7nKJGxC5LWcEsTz0lvwroCXu
 eO0cK4un6wri953LlAbulMmi11zodXq5ClvlB/Q/Ed91Y3cIb21xRXTgBadfk3XisaXn
 lMMzoHtsHtUV+LgGiKMDnXoscOzlIcW55vJ5Mo+MYAuZ9Oa4J4wYNa7RO4CCwGbicIFr
 FimA==
X-Gm-Message-State: AOAM533pPFlzII3MIiny4EWL07cTKDy1XGBY/UCgK7ZmrOnpfpUmpqA1
 TDJnVkBGtrWXykrW5GUwsIsVWDdegJI=
X-Google-Smtp-Source: ABdhPJyGXC01IMHR6RcTPGozhtcO6kkIC3Bkp/vbdIQHN+uteCcJPUDbuR53OT/7NQb9KJpiW93ZEg==
X-Received: by 2002:a05:600c:3549:: with SMTP id
 i9mr4536387wmq.140.1613039474012; 
 Thu, 11 Feb 2021 02:31:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f14sm9063257wmj.30.2021.02.11.02.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:31:13 -0800 (PST)
Subject: Re: [PATCH v2 15/21] tests/acceptance: add a new set of tests to
 exercise plugins
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-16-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dab2bc6c-b467-ca6d-c531-f209b3277f4f@amsat.org>
Date: Thu, 11 Feb 2021 11:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 11:10 PM, Alex Bennée wrote:
> This is just a simple test to count the instructions executed by a
> kernel. However a later test will detect a failure condition when
> icount is enabled.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210209182749.31323-7-alex.bennee@linaro.org>
> ---
>  tests/acceptance/tcg_plugins.py | 103 ++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 tests/acceptance/tcg_plugins.py

Can you add this file to "TCG Plugins" in MAINTAINERS please?

> 
> diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
> new file mode 100644
> index 0000000000..b512979769
> --- /dev/null
> +++ b/tests/acceptance/tcg_plugins.py
> @@ -0,0 +1,103 @@
> +# TCG Plugins tests
> +#
> +# These are a little more involved than the basic tests run by check-tcg.
> +#
> +# Copyright (c) 2021 Linaro
> +#
> +# Author:
> +#  Alex Bennée <alex.bennee@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import logging
> +import time
> +import tempfile
> +import mmap
> +import re
> +
> +from boot_linux_console import LinuxKernelTest
> +
> +
> +class PluginKernelBase(LinuxKernelTest):
> +    """
> +    Boots a Linux kernel with a TCG plugin enabled.
> +    """
> +
> +    timeout = 120
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
> +
> +    def run_vm(self, kernel_path, kernel_command_line,
> +               plugin, plugin_log, console_pattern, args):
> +
> +        logger = logging.getLogger('plugin')
> +        start_time = time.time()
> +        vm = self.get_vm()
> +        vm.set_console()
> +        vm.add_args('-kernel', kernel_path,
> +                    '-append', kernel_command_line,
> +                    '-plugin', plugin,
> +                    '-d', 'plugin',
> +                    '-D', plugin_log,
> +                    '-net', 'none',
> +                    '-no-reboot')
> +        if args:
> +            vm.add_args(*args)
> +
> +        try:
> +            vm.launch()
> +        except:
> +            # fails if plugins not enabled
> +            self.cancel("TCG Plugins not enabled")

The test could fail for other reasons you want to catch...

We don't have yet the possibility to query the binary if it
has the plugin feature builtin. Can you add a TODO comment
so we fix that once we got it?

> +
> +        self.wait_for_console_pattern(console_pattern, vm)
> +        elapsed = time.time() - start_time
> +        logger.info('elapsed time %.2f sec' % elapsed)
> +        # ensure logs are flushed
> +        vm.shutdown()
> +        return elapsed
> +
> +
> +class PluginKernelNormal(PluginKernelBase):
> +
> +    def _grab_aarch64_kernel(self):
> +        kernel_url = ('http://security.debian.org/'
> +                      'debian-security/pool/updates/main/l/linux-signed-arm64/'
> +                      'linux-image-4.19.0-12-arm64_4.19.152-1_arm64.deb')
> +        kernel_sha1 = '2036c2792f80ac9c4ccaae742b2e0a28385b6010'
> +        kernel_deb = self.fetch_asset(kernel_url, asset_hash=kernel_sha1)
> +        kernel_path = self.extract_from_deb(kernel_deb,
> +                                            "/boot/vmlinuz-4.19.0-12-arm64")
> +        return kernel_path
> +
> +    def test_aarch64_virt_insn(self):
> +        """
> +        :avocado: tags=accel:tcg
> +        :avocado: tags=arch:aarch64
> +        :avocado: tags=machine:virt
> +        :avocado: tags=cpu:cortex-a57
> +        """
> +        kernel_path = self._grab_aarch64_kernel()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyAMA0')
> +        console_pattern = 'Kernel panic - not syncing: VFS:'
> +
> +        plugin_log = tempfile.NamedTemporaryFile(mode="r+t", prefix="plugin",
> +                                                 suffix=".log")
> +
> +        self.run_vm(kernel_path, kernel_command_line,
> +                    "tests/plugin/libinsn.so", plugin_log.name,
> +                    console_pattern,
> +                    args=('-cpu', 'cortex-a53'))

I had the understanding that by using 'tags=cpu' QEMU would be called
with "-cpu tags['cpu']". Cleber can you confirm please?

> +
> +        logger = logging.getLogger()
> +
> +        with plugin_log as lf, \
> +             mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
> +
> +            m = re.search(br"insns: (?P<count>\d+)", s)
> +            if "count" in m.groupdict():
> +                logger.debug("reported %d instructions",
> +                             int(m.group("count")))
> +            else:
> +                logger.debug("Failed to find instruction count")
> +                self.fail
> 

With MAINTAINERS & TODO:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks,

Phil.

