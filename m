Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6198295847
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 08:19:50 +0200 (CEST)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVTwz-0000Nf-8u
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 02:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kVTvP-0008HZ-3i
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 02:18:11 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37132)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kVTvM-0001a5-2X
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 02:18:10 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 9274440D4004;
 Thu, 22 Oct 2020 06:18:02 +0000 (UTC)
Subject: Re: [PATCH v1 6/6] tests/acceptance: pick a random gdb port for
 reverse debugging
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201021163136.27324-1-alex.bennee@linaro.org>
 <20201021163136.27324-7-alex.bennee@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <a8c85a34-632c-d9de-23c7-3a79af2e3c3a@ispras.ru>
Date: Thu, 22 Oct 2020 09:18:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021163136.27324-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 02:18:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.2020 19:31, Alex Bennée wrote:
> Currently the test randomly fails if you are using a shared machine
> due to contention on the well known port 1234. We can ameliorate this
> a bit by picking a random non-ephemeral port although it doesn't
> totally avoid the problem. While we could use a totally unique socket
> address for debugging it's impossible to probe for gdb support of the
> feature which makes this a sub-optimal but less fiddly option.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

> ---
>   tests/acceptance/reverse_debugging.py | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/acceptance/reverse_debugging.py b/tests/acceptance/reverse_debugging.py
> index b72fdf6cdc..f2e8245471 100644
> --- a/tests/acceptance/reverse_debugging.py
> +++ b/tests/acceptance/reverse_debugging.py
> @@ -16,6 +16,7 @@ from avocado.utils import gdb
>   from avocado.utils import process
>   from avocado.utils.path import find_command
>   from boot_linux_console import LinuxKernelTest
> +from random import randrange
>   
>   class ReverseDebugging(LinuxKernelTest):
>       """
> @@ -43,7 +44,8 @@ class ReverseDebugging(LinuxKernelTest):
>           else:
>               logger.info('replaying the execution...')
>               mode = 'replay'
> -            vm.add_args('-s', '-S')
> +            self.port = randrange(2048, 49152)
> +            vm.add_args('-gdb', 'tcp::%d' % (self.port), '-S')
>           vm.add_args('-icount', 'shift=%s,rr=%s,rrfile=%s,rrsnapshot=init' %
>                       (shift, mode, replay_path),
>                       '-net', 'none')
> @@ -122,7 +124,7 @@ class ReverseDebugging(LinuxKernelTest):
>           # replay and run debug commands
>           vm = self.run_vm(False, shift, args, replay_path, image_path)
>           logger.info('connecting to gdbstub')
> -        g = gdb.GDBRemote('127.0.0.1', 1234, False, False)
> +        g = gdb.GDBRemote('127.0.0.1', self.port, False, False)
>           g.connect()
>           r = g.cmd(b'qSupported')
>           if b'qXfer:features:read+' in r:
> 


