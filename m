Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB9C6BF1C9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 20:38:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdFsj-0000ac-5Q; Fri, 17 Mar 2023 15:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pdFsg-0000aU-73
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 15:36:50 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pdFsd-00027R-TR
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 15:36:49 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:5398:0:640:443b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id D8B755F010;
 Fri, 17 Mar 2023 22:36:38 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b71c::1:38] (unknown
 [2a02:6b8:b081:b71c::1:38])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id bar3NP0h2qM0-nQxCr9yP; Fri, 17 Mar 2023 22:36:38 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1679081798; bh=ukNjw6t7ISwvdzm8TjplhCb+t32irVPl5byJyCp1vJc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=uphR0vsrwpBeEmD1eb6tsdJQdz6QRqS7+3DxSd4gau5O0h2u47rT418EW6DRTlgBs
 EprSdLv41WTB80vN2+oS27INi+le6np2iwJ6oP38v61TMTkw4ozYDz8wPb1RYy/lXF
 njc69tyB7fs822uFcVy2vuYYsjzam2l73gHyHIrc=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <70b83c92-c11d-0715-97e1-b2dd6f6dfffd@yandex-team.ru>
Date: Fri, 17 Mar 2023 22:36:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/3] python/qemu/machine: use socketpair() for QMP by
 default
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Maksim Davydov <davydov-max@yandex-team.ru>
References: <20230111080101.969151-1-marcandre.lureau@redhat.com>
 <20230111080101.969151-4-marcandre.lureau@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230111080101.969151-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi!

By my investigation, this commit (bd4c0ef409140bd1be393407c04005ac077d4574) breaks long qmp output again.

Simple test:

$ cd python
$ cat test.py
#!/usr/bin/env python3

import sys
from qemu.machine import QEMUMachine

monitor_address = sys.argv[2] if len(sys.argv) > 2 else None
vm = QEMUMachine('../build/qemu-system-x86_64',
                  monitor_address=monitor_address)
vm.launch()

for x in range(int(sys.argv[1])):
     vm.qmp('blockdev-add', {'driver': 'null-co', 'node-name': f'x{x}'})

vm.qmp('query-named-block-nodes')
vm.shutdown()


./test.py 1000 /tmp/sock

   - works, but if use default behavior (socketpair) we get:

$ ./test.py 1000
Traceback (most recent call last):
   File "/home/vsementsov/work/src/qemu/master/python/./test.py", line 14, in <module>
     vm.qmp('query-named-block-nodes')
   File "/home/vsementsov/work/src/qemu/master/python/qemu/machine/machine.py", line 686, in qmp
     ret = self._qmp.cmd(cmd, args=qmp_args)
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/legacy.py", line 216, in cmd
     return self.cmd_obj(qmp_cmd)
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/legacy.py", line 190, in cmd_obj
     self._sync(
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/legacy.py", line 105, in _sync
     return self._aloop.run_until_complete(
   File "/usr/lib/python3.10/asyncio/base_events.py", line 646, in run_until_complete
     return future.result()
   File "/usr/lib/python3.10/asyncio/tasks.py", line 408, in wait_for
     return await fut
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/qmp_client.py", line 547, in _raw
     return await self._execute(msg, assign_id=assign_id)
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/qmp_client.py", line 496, in _execute
     return await self._reply(exec_id)
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/qmp_client.py", line 463, in _reply
     raise result
qemu.qmp.qmp_client.ExecInterruptedError: Disconnected
Exception ignored in: <function QEMUMonitorProtocol.__del__ at 0x7f8708283eb0>
Traceback (most recent call last):
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/legacy.py", line 318, in __del__
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/legacy.py", line 289, in close
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/legacy.py", line 105, in _sync
   File "/usr/lib/python3.10/asyncio/base_events.py", line 646, in run_until_complete
   File "/usr/lib/python3.10/asyncio/tasks.py", line 408, in wait_for
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/protocol.py", line 413, in disconnect
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/protocol.py", line 725, in _wait_disconnect
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/protocol.py", line 876, in _bh_loop_forever
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/protocol.py", line 914, in _bh_recv_message
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/protocol.py", line 1015, in _recv
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/qmp_client.py", line 402, in _do_recv
   File "/home/vsementsov/work/src/qemu/master/python/qemu/qmp/protocol.py", line 979, in _readline
   File "/usr/lib/python3.10/asyncio/streams.py", line 534, in readline
ValueError: Separator is not found, and chunk exceed the limit



./test.py 100
   - works well.


On 11.01.23 11:01, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> When no monitor address is given, establish the QMP communication through
> a socketpair() (API is also supported on Windows since Python 3.5)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   python/qemu/machine/machine.py | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 748a0d807c..5b2e499e68 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -158,17 +158,13 @@ def __init__(self,
>           self._qmp_timer = qmp_timer
>   
>           self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> +        self._sock_pair: Optional[Tuple[socket.socket, socket.socket]] = None
>           self._temp_dir: Optional[str] = None
>           self._base_temp_dir = base_temp_dir
>           self._sock_dir = sock_dir
>           self._log_dir = log_dir
>   
> -        if monitor_address is not None:
> -            self._monitor_address = monitor_address
> -        else:
> -            self._monitor_address = os.path.join(
> -                self.sock_dir, f"{self._name}-monitor.sock"
> -            )
> +        self._monitor_address = monitor_address
>   
>           self._console_log_path = console_log
>           if self._console_log_path:
> @@ -303,7 +299,11 @@ def _base_args(self) -> List[str]:
>           args = ['-display', 'none', '-vga', 'none']
>   
>           if self._qmp_set:
> -            if isinstance(self._monitor_address, tuple):
> +            if self._sock_pair:
> +                fd = self._sock_pair[0].fileno()
> +                os.set_inheritable(fd, True)
> +                moncdev = f"socket,id=mon,fd={fd}"
> +            elif isinstance(self._monitor_address, tuple):
>                   moncdev = "socket,id=mon,host={},port={}".format(
>                       *self._monitor_address
>                   )
> @@ -337,10 +337,17 @@ def _pre_launch(self) -> None:
>               self._remove_files.append(self._console_address)
>   
>           if self._qmp_set:
> +            monitor_address = None
> +            sock = None
> +            if self._monitor_address is None:
> +                self._sock_pair = socket.socketpair()
> +                sock = self._sock_pair[1]
>               if isinstance(self._monitor_address, str):
>                   self._remove_files.append(self._monitor_address)
> +                monitor_address = self._monitor_address
>               self._qmp_connection = QEMUMonitorProtocol(
> -                self._monitor_address,
> +                address=monitor_address,
> +                sock=sock,
>                   server=True,
>                   nickname=self._name
>               )
> @@ -360,6 +367,7 @@ def _pre_launch(self) -> None:
>           ))
>   
>       def _post_launch(self) -> None:
> +        self._sock_pair[0].close()
>           if self._qmp_connection:
>               self._qmp.accept(self._qmp_timer)
>   

-- 
Best regards,
Vladimir


