Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF73B07D7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:48:16 +0200 (CEST)
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhhH-0000mT-90
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lvhg5-0008OQ-2W
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lvhg2-0000aB-L8
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624373217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8IfsfzzmbTzuRg8dePpLHnBHLyC/lG4FHwlZh0wLnY=;
 b=G45nBgEx9ZlrmWIkWxAZF/sQNfhWweJrqwHwSe1TfAulJH7c5EvSNZXWQ/1ktWbnxUemGA
 uc6xe1F5vHsvksaCUD7/U++pg8Xzi5OOG7i6rMxJsPatGOM5+eQYbwvkmu9G5FIQzDi/kc
 LyHVlziw1Fv7lxV5uDGFb+j2Gynp/2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-lP4Ew_-1MwCUS-Ekk3Z2ug-1; Tue, 22 Jun 2021 10:46:54 -0400
X-MC-Unique: lP4Ew_-1MwCUS-Ekk3Z2ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DBF0101F000;
 Tue, 22 Jun 2021 14:46:53 +0000 (UTC)
Received: from [10.10.118.71] (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71FD51346F;
 Tue, 22 Jun 2021 14:46:49 +0000 (UTC)
Subject: Re: [PATCH v6 01/16] python: qemu: add timer parameter for qmp.accept
 socket
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210621103337.36637-1-eesposit@redhat.com>
 <20210621103337.36637-2-eesposit@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <81e14aa0-6ee5-d470-7314-e252264d50ee@redhat.com>
Date: Tue, 22 Jun 2021 10:46:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621103337.36637-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 6:33 AM, Emanuele Giuseppe Esposito wrote:
> Also add a new _qmp_timer field to the QEMUMachine class.
> 
> Let's change the default socket timeout to None, so that if
> a subclass needs to add a timer, it can be done by modifying
> this private field.
> 
> At the same time, restore the timer to be 15 seconds in iotests.py, to
> give an upper bound to the QMP monitor test command execution.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

LGTM, thank you for your patience while I re-settled the Python 
subcomponent.

Reviewed-by: John Snow <jsnow@redhat.com>

and, for patches 1-3; I am happy with these being staged by a block 
subsystem maintainer:

Acked-by: John Snow <jsnow@redhat.com>

--js

> ---
>   python/qemu/machine/machine.py | 7 +++++--
>   python/qemu/machine/qtest.py   | 5 +++--
>   tests/qemu-iotests/iotests.py  | 3 ++-
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index b62435528e..fdf2fc0e9c 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -95,7 +95,8 @@ def __init__(self,
>                    socket_scm_helper: Optional[str] = None,
>                    sock_dir: Optional[str] = None,
>                    drain_console: bool = False,
> -                 console_log: Optional[str] = None):
> +                 console_log: Optional[str] = None,
> +                 qmp_timer: Optional[float] = None):
>           '''
>           Initialize a QEMUMachine
>   
> @@ -109,6 +110,7 @@ def __init__(self,
>           @param sock_dir: where to create socket (defaults to base_temp_dir)
>           @param drain_console: (optional) True to drain console socket to buffer
>           @param console_log: (optional) path to console log file
> +        @param qmp_timer: (optional) default QMP socket timeout
>           @note: Qemu process is not started until launch() is used.
>           '''
>           # Direct user configuration
> @@ -116,6 +118,7 @@ def __init__(self,
>           self._binary = binary
>           self._args = list(args)
>           self._wrapper = wrapper
> +        self._qmp_timer = qmp_timer
>   
>           self._name = name or "qemu-%d" % os.getpid()
>           self._base_temp_dir = base_temp_dir
> @@ -333,7 +336,7 @@ def _pre_launch(self) -> None:
>   
>       def _post_launch(self) -> None:
>           if self._qmp_connection:
> -            self._qmp.accept()
> +            self._qmp.accept(self._qmp_timer)
>   
>       def _post_shutdown(self) -> None:
>           """
> diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
> index 93700684d1..33a86a9d69 100644
> --- a/python/qemu/machine/qtest.py
> +++ b/python/qemu/machine/qtest.py
> @@ -115,14 +115,15 @@ def __init__(self,
>                    name: Optional[str] = None,
>                    base_temp_dir: str = "/var/tmp",
>                    socket_scm_helper: Optional[str] = None,
> -                 sock_dir: Optional[str] = None):
> +                 sock_dir: Optional[str] = None,
> +                 qmp_timer: Optional[float] = None):
>           if name is None:
>               name = "qemu-%d" % os.getpid()
>           if sock_dir is None:
>               sock_dir = base_temp_dir
>           super().__init__(binary, args, name=name, base_temp_dir=base_temp_dir,
>                            socket_scm_helper=socket_scm_helper,
> -                         sock_dir=sock_dir)
> +                         sock_dir=sock_dir, qmp_timer=qmp_timer)
>           self._qtest: Optional[QEMUQtestProtocol] = None
>           self._qtest_path = os.path.join(sock_dir, name + "-qtest.sock")
>   
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 89663dac06..6b0db4ce54 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -570,10 +570,11 @@ class VM(qtest.QEMUQtestMachine):
>   
>       def __init__(self, path_suffix=''):
>           name = "qemu%s-%d" % (path_suffix, os.getpid())
> +        timer = 15.0
>           super().__init__(qemu_prog, qemu_opts, name=name,
>                            base_temp_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
> -                         sock_dir=sock_dir)
> +                         sock_dir=sock_dir, qmp_timer=timer)
>           self._num_drives = 0
>   
>       def add_object(self, opts):
> 


