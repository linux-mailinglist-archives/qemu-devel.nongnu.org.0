Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F631C27E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:34:53 +0100 (CET)
Received: from localhost ([::1]:38732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBje0-0006N0-5M
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBjaQ-0004Ig-VF
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:31:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBjaM-0007aW-Cq
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613417465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VX7wxVZZcnbceIGH+cVybvd4/AlMf6Hn+Ch7xAtTX6c=;
 b=PNtmZ0n60LxmJ+3zcwJNZkDGn/PzgwcDlJVGAJWT37YPtwFsGypp8awP6w34H8LPqMWvCg
 g+AfBltMEjPNYZqr8bYLOS1gzpNXUnlGFqyJ3yIp7aFePfD+bGnCN659puUG+ztfVTV8ra
 k0eVvYbEBMQwZ5pR88FHYM1J7hhlTng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-gYkpNdGgMpu7v47vAHwp2A-1; Mon, 15 Feb 2021 14:31:03 -0500
X-MC-Unique: gYkpNdGgMpu7v47vAHwp2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E0D7107ACE4;
 Mon, 15 Feb 2021 19:31:02 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F0C75D9D3;
 Mon, 15 Feb 2021 19:30:51 +0000 (UTC)
Subject: Re: [PATCH 5/6] Acceptance Tests: distinguish between temp and logs
 dir
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-6-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <06d1e7a1-70ca-225f-e8ec-30f295cee5df@redhat.com>
Date: Mon, 15 Feb 2021 16:30:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211220146.2525771-6-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/11/21 7:01 PM, Cleber Rosa wrote:
> Logs can be very important to debug issues, and currently QEMUMachine
> instances will remove logs that are created under the temporary
> directories.
>
> With this change, the stdout and stderr generated by the QEMU process
> started by QEMUMachine will always be kept along the test results
> directory.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   python/qemu/machine.py                    | 16 ++++++++++++++--
>   tests/acceptance/avocado_qemu/__init__.py |  3 ++-
>   2 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index b379fcbe72..1f4119e2b4 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -89,7 +89,8 @@ class QEMUMachine:
>                    socket_scm_helper: Optional[str] = None,
>                    sock_dir: Optional[str] = None,
>                    drain_console: bool = False,
> -                 console_log: Optional[str] = None):
> +                 console_log: Optional[str] = None,
> +                 log_dir: Optional[str] = None):
>           '''
>           Initialize a QEMUMachine
>   
> @@ -103,6 +104,7 @@ class QEMUMachine:
>           @param sock_dir: where to create socket (defaults to base_temp_dir)
>           @param drain_console: (optional) True to drain console socket to buffer
>           @param console_log: (optional) path to console log file
> +        @param log_dir: where to create and keep log files

"(optional) where to create and keep (...)".

You could also say it defaults to the temp dir, thus logs aren't kept 
guaranteed.

Otherwise,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>           @note: Qemu process is not started until launch() is used.
>           '''
>           # Direct user configuration
> @@ -114,6 +116,7 @@ class QEMUMachine:
>           self._name = name or "qemu-%d" % os.getpid()
>           self._base_temp_dir = base_temp_dir
>           self._sock_dir = sock_dir or self._base_temp_dir
> +        self._log_dir = log_dir
>           self._socket_scm_helper = socket_scm_helper
>   
>           if monitor_address is not None:
> @@ -303,7 +306,7 @@ class QEMUMachine:
>           return args
>   
>       def _pre_launch(self) -> None:
> -        self._qemu_log_path = os.path.join(self.temp_dir, self._name + ".log")
> +        self._qemu_log_path = os.path.join(self.log_dir, self._name + ".log")
>           self._qemu_log_file = open(self._qemu_log_path, 'wb')
>   
>           if self._console_set:
> @@ -752,3 +755,12 @@ class QEMUMachine:
>               self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
>                                                 dir=self._base_temp_dir)
>           return self._temp_dir
> +
> +    @property
> +    def log_dir(self) -> str:
> +        """
> +        Returns a directory to be used for writing logs
> +        """
> +        if self._log_dir is None:
> +            return self.temp_dir
> +        return self._log_dir
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 94b78fd7c8..ac9be1eb66 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -173,9 +173,10 @@ class Test(avocado.Test):
>       def _new_vm(self, name, *args):
>           self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
>           vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
> -                         sock_dir=self._sd.name)
> +                         sock_dir=self._sd.name, log_dir=self.logdir)
>           self.log.debug('QEMUMachine "%s" created', name)
>           self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
> +        self.log.debug('QEMUMachine "%s" log_dir: %s', name, vm.log_dir)
>           if args:
>               vm.add_args(*args)
>           return vm


