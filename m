Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA269F75E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:07:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqhw-0008Hz-In; Wed, 22 Feb 2023 10:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUqhu-0008Hj-RA
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:06:58 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUqhs-0003zb-BD
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:06:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 o4-20020a05600c4fc400b003e1f5f2a29cso6647322wmq.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1SGhmkUEUjYQw51ldC0My7sFCYDDuRL5UoMY9A1Arh0=;
 b=oHDxTgiNyIs2d2L0GtE02kphaUmr4V4ahx/5fQW4a2ioVf+ApCn/vmF29EF65RQDNK
 sCmaYgakW3HVaTgzUD4GCBiy7bQOVqZMwEPq8bFwd2+B3To51au3g0key2DpxLDe2uQe
 VQlIu27XfNULw+3sXNLfW/5/QMZ22WTm9kRdxlEZmA9KQmaCv8Et40oWFjUjqsuv5eFZ
 IDKjU2a5MB7l5uTzxVoQzu2H8lyCH0GfWbhxGboYI4NaP/JfSNuYDnpCnoRwdLepmzWL
 2jjd2If55BbMefbz0bgH24i5YU5dDfuF0v7NfcShEnqFZr0A0E/hX4Kzu78uoU2xMVJ3
 EE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1SGhmkUEUjYQw51ldC0My7sFCYDDuRL5UoMY9A1Arh0=;
 b=qzxtC7GFxamAZuydEUP/ZW1ZJdodxwBYhsMfDfyWGohApnp1YrV8vO/OyUU0kteF4L
 5AF2b2hBzUckpFb1+kDWEDiNOISbP1SqZ6xEQPMpHq9cH0mKBTjyqYZCbk7bnwvNUfgr
 8d06ZuHVeaAjMnevDyAJHkCuy7ohD6LnxY/GgGOV/Z6YT9BDKz5WzzaL25E9n5ZiUYM0
 R16ezHr600rCppVg4VwmsgoXbDtWOvyMvNAIf6fZwGazAae4/isBiWpwVMcqs9Un5Spe
 ouFbfD3O+GR9gDFNi94IjuPv82Z8ZCG7g0JQDD0AtXI7ibgVnldXZ1uOghA7aP7lxPzw
 2rhA==
X-Gm-Message-State: AO0yUKWw6s2OVeUwGt2cMcMaTPmbCxFycAtkwRx0XL4PbGxglnAKw3k1
 83OJyk4il784pkuDEmy5Tp4mrA==
X-Google-Smtp-Source: AK7set9Tx9JDtZYDe7zJCNDX8NYzOQv3KiRZ0B3vIDoTWD30tct8eIHGcNBcdh7x9sntaCmAtM511w==
X-Received: by 2002:a05:600c:44c5:b0:3dc:eaef:c1bb with SMTP id
 f5-20020a05600c44c500b003dceaefc1bbmr6926698wmo.35.1677078414486; 
 Wed, 22 Feb 2023 07:06:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a5d5919000000b002c551f7d452sm7194087wrd.98.2023.02.22.07.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 07:06:54 -0800 (PST)
Message-ID: <de8d7fbe-a578-12e1-5aee-8bdec93f2d1c@linaro.org>
Date: Wed, 22 Feb 2023 16:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 09/12] tests: add tuxrun baseline test to avocado
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/2/23 20:25, Alex Bennée wrote:
> The TuxRun project (www.tuxrun.org) uses QEMU to run tests on a wide
> variety of kernel configurations on wide range of our emulated
> platforms. They publish a known good set of images at:
> 
>    https://storage.tuxboot.com/
> 
> to help with bisecting regressions in either the kernel, firmware or
> QEMU itself. The tests are pretty lightweight as they contain just a
> kernel with a minimal rootfs which boots a lot faster than most of the
> distros. In time they might be persuaded to version there known good
> baselines and we can then enable proper checksums.
> 
> For a couple of tests we currently skip:
> 
>    - mips64, a regression against previous stable release
>    - sh4, very unstable with intermittent oops
> 
> Total run time: 340s (default) -> 890s (debug)
> 
> Overall coverage rate (tested targets + disabled tests):
>    lines......: 16.1% (126894 of 789848 lines)
>    functions..: 20.6% (15954 of 77489 functions)
>    branches...: 9.3% (40727 of 439365 branches)
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> 
> ---
> v2
>    - renamed to tuxrun_baselines, update commit message
>    - add remaining targets
>    - add more metadata tags for the differences
>    - refactor tag code
>    - skip mips64 and sh4 tests in CI
>    - slightly increase delay for login
>    - include in MAINTAINERS
> ---
>   MAINTAINERS                       |   1 +
>   tests/avocado/tuxrun_baselines.py | 423 ++++++++++++++++++++++++++++++
>   2 files changed, 424 insertions(+)
>   create mode 100644 tests/avocado/tuxrun_baselines.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd54c1f140..be100272b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3760,6 +3760,7 @@ F: scripts/ci/
>   F: tests/docker/
>   F: tests/vm/
>   F: tests/lcitool/
> +F: tests/avocado/tuxrun_baselines.py
>   F: scripts/archive-source.sh
>   F: docs/devel/testing.rst
>   W: https://gitlab.com/qemu-project/qemu/pipelines
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> new file mode 100644
> index 0000000000..30aaefc1d3
> --- /dev/null
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -0,0 +1,423 @@
> +# Functional test that boots known good tuxboot images the same way
> +# that tuxrun (www.tuxrun.org) does. This tool is used by things like
> +# the LKFT project to run regression tests on kernels.
> +#
> +# Copyright (c) 2023 Linaro Ltd.
> +#
> +# Author:
> +#  Alex Bennée <alex.bennee@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import time
> +
> +from avocado import skip, skipIf
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
> +from avocado_qemu import wait_for_console_pattern
> +from avocado.utils import process
> +from avocado.utils.path import find_command
> +
> +class TuxRunBaselineTest(QemuSystemTest):

Better inherit from LinuxKernelTest, adding a zstd method there.

> +    """
> +    :avocado: tags=accel:tcg
> +    """
> +
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0'
> +    # Tests are ~10-40s, allow for --debug/--enable-gcov overhead
> +    timeout = 100
> +
> +    def get_tag(self, tagname, default=None):
> +        """
> +        Get the metadata tag or return the default.
> +        """
> +        utag = self._get_unique_tag_val(tagname)
> +        print(f"{tagname}/{default} -> {utag}")
> +        if utag:
> +            return utag
> +
> +        return default
> +
> +    def setUp(self):
> +        super().setUp()
> +
> +        # We need zstd for all the tuxrun tests
> +        # See https://github.com/avocado-framework/avocado/issues/5609
> +        zstd = find_command('zstd', False)
> +        if zstd is False:
> +            self.cancel('Could not find "zstd", which is required to '
> +                        'decompress rootfs')
> +        self.zstd = zstd
> +
> +        # Process the TuxRun specific tags, most machines work with
> +        # reasonable defaults but we sometimes need to tweak the
> +        # config. To avoid open coding everything we store all these
> +        # details in the metadata for each test.
> +
> +        # The tuxboot tag matches the root directory
> +        self.tuxboot = self.get_tag('tuxboot')
> +
> +        # Most Linux's use ttyS0 for their serial port
> +        self.console = self.get_tag('console', "ttyS0")
> +
> +        # Does the machine shutdown QEMU nicely on "halt"
> +        self.shutdown = self.get_tag('shutdown')
> +
> +        # The name of the kernel Image file
> +        self.image = self.get_tag('image', "Image")
> +
> +        # The block device drive type
> +        self.drive = self.get_tag('drive', "virtio-blk-device")
> +
> +        self.root = self.get_tag('root', "vda")
> +
> +        # Occasionally we need extra devices to hook things up
> +        self.extradev = self.get_tag('extradev')
> +
> +    def wait_for_console_pattern(self, success_message, vm=None):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message='Kernel panic - not syncing',
> +                                 vm=vm)

(we'd then inherit this method from LinuxKernelTest)

Whichever outcome you rather:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

