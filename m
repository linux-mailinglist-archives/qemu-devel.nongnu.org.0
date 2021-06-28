Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18983B588B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 07:15:35 +0200 (CEST)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxjcM-0003Yc-C8
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 01:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lxjbL-0002KP-T9
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:14:31 -0400
Received: from mail.ispras.ru ([83.149.199.84]:51776)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lxjbJ-0004h4-Es
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:14:31 -0400
Received: from [10.12.39.188] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id 049E440A2BB1;
 Mon, 28 Jun 2021 05:14:19 +0000 (UTC)
Subject: Re: tests: ReverseDebugging_AArch64.test_aarch64_virt ->
 InvalidPacketError
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <6f85be92-627c-c3ac-2d49-fd18a00dd1f9@amsat.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <66d56c24-eacf-0d23-2def-0259b2c1b922@ispras.ru>
Date: Mon, 28 Jun 2021 08:14:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6f85be92-627c-c3ac-2d49-fd18a00dd1f9@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.765,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.06.2021 20:01, Philippe Mathieu-Daudé wrote:
> Hi Pavel,
> 
> FYI as of commit 050cee12315 ("Merge remote-tracking branch
> 'remotes/stsquad/tags/pull-testing-updates-250621-1' into staging")

Doesn't it mean, that the real culprit is hidden and we should bisect?

> the ReverseDebugging_AArch64 test is failing:

Shouldn't the merge be postponed in such cases?

> 
>   (28/37)
> tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt:
>   ERROR (0.96 s)
> 
> INFO | recorded log with 1690570+ steps
> INFO | replaying the execution...
> INFO | connecting to gdbstub
> INFO | stepping forward
> INFO | saving position 40000000
> ERROR|
> ERROR| Reproduced traceback from:
> lib/python3.8/site-packages/avocado/core/test.py:770
> ERROR| Traceback (most recent call last):
> ERROR|   File "acceptance/reverse_debugging.py", line 206, in
> test_aarch64_virt
> ERROR|     self.reverse_debugging(
> ERROR|   File "acceptance/reverse_debugging.py", line 140, in
> reverse_debugging
> ERROR|     pc = self.get_pc(g)
> ERROR|   File "acceptance/reverse_debugging.py", line 77, in get_pc
> ERROR|     return self.get_reg(g, self.REG_PC)
> ERROR|   File "acceptance/reverse_debugging.py", line 72, in get_reg
> ERROR|     return self.get_reg_le(g, reg)
> ERROR|   File "acceptance/reverse_debugging.py", line 58, in get_reg_le
> ERROR|     res = g.cmd(b'p%x' % reg)
> ERROR|   File "lib/python3.8/site-packages/avocado/utils/gdb.py", line
> 783, in cmd
> ERROR|     response_payload = self.decode(result)
> ERROR|   File "lib/python3.8/site-packages/avocado/utils/gdb.py", line
> 738, in decode
> ERROR|     raise InvalidPacketError
> ERROR| avocado.utils.gdb.InvalidPacketError
> ERROR|
> DEBUG| Local variables:
> DEBUG|  -> self <class 'reverse_debugging.ReverseDebugging_AArch64'>:
> 28-tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
> DEBUG|  -> kernel_url <class 'str'>:
> https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/Everything/aarch64/os/images/pxeboot/vmlinuz
> DEBUG|  -> kernel_hash <class 'str'>:
> 8c73e469fc6ea06a58dc83a628fc695b693b8493
> DEBUG|  -> kernel_path <class 'str'>:
> avocado-cache/by_location/a00ac4ae676ef0322126abd2f7d38f50cc9cbc95/vmlinuz
> DEBUG| >>> {'execute': 'quit'}
> ERROR|
> ERROR| Reproduced traceback from:
> lib/python3.8/site-packages/avocado/core/test.py:796
> ERROR| Traceback (most recent call last):
> ERROR|   File "python/qemu/machine/machine.py", line 489, in _do_shutdown
> ERROR|     self._soft_shutdown(timeout, has_quit)
> ERROR|   File "python/qemu/machine/machine.py", line 469, in _soft_shutdown
> ERROR|     self._qmp.cmd('quit')
> ERROR|   File "python/qemu/qmp/__init__.py", line 325, in cmd
> ERROR|     return self.cmd_obj(qmp_cmd)
> ERROR|   File "python/qemu/qmp/__init__.py", line 303, in cmd_obj
> ERROR|     self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
> ERROR| BrokenPipeError: [Errno 32] Broken pipe
> ERROR|
> ERROR| The above exception was the direct cause of the following exception:
> ERROR|
> ERROR| Traceback (most recent call last):
> ERROR|   File "acceptance/avocado_qemu/__init__.py", line 244, in tearDown
> ERROR|     vm.shutdown()
> ERROR|   File "python/qemu/machine/machine.py", line 519, in shutdown
> ERROR|     self._do_shutdown(timeout, has_quit)
> ERROR|   File "python/qemu/machine/machine.py", line 492, in _do_shutdown
> ERROR|     raise AbnormalShutdown("Could not perform graceful shutdown") \
> ERROR| qemu.machine.machine.AbnormalShutdown: Could not perform graceful
> shutdown
> ERROR| Traceback (most recent call last):
> ERROR| ERROR
> 28-tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
> -> InvalidPacketError:
> 


