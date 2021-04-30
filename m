Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4936FAF1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:52:27 +0200 (CEST)
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSd8-0005zs-H8
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcRnz-0000FE-R5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcRnt-0005X1-Dt
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtO4Lqg8pBlwaXZauSt3b0MoUDazM3ad70aII+xlEdM=;
 b=ELmmmf3xZlnaRpxpwF3cJShRlY6CfpS3ZamwZ4nj45r82dlkxPQC26EcJAtOCZwbnQIQaZ
 Q5c5xkhu8b1F68r30YfMkvv/BZzuE+6XbBV8UIfLof0GGYkWfWuIWDA8+p5s1VooyGhex2
 YODgGhv9b5OJ+bHbOkGMkg08SF5Xctg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-LpXxHWswPM6WMBq4VXfDWg-1; Fri, 30 Apr 2021 07:59:24 -0400
X-MC-Unique: LpXxHWswPM6WMBq4VXfDWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50849CC621;
 Fri, 30 Apr 2021 11:59:23 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B88C06A251;
 Fri, 30 Apr 2021 11:59:21 +0000 (UTC)
Subject: Re: [PATCH v3 05/15] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-6-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <df1df43e-cfdc-ddeb-f7c1-f9399f252b35@redhat.com>
Date: Fri, 30 Apr 2021 13:59:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> Attaching a gdbserver implies that the qmp socket
> should wait indefinitely for an answer from QEMU.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   python/qemu/machine.py        |  3 +++
>   tests/qemu-iotests/iotests.py | 10 +++++++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 12752142c9..d6142271c2 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -409,6 +409,9 @@ def _launch(self) -> None:
>                                          stderr=subprocess.STDOUT,
>                                          shell=False,
>                                          close_fds=False)
> +
> +        if 'gdbserver' in self._wrapper:
> +            self._qmp_timer = None

Why doesn’t __init__() evaluate this?  This here doesn’t feel like the 
right place for it.  If we want to evaluate it here, self._qmp_timer 
shouldn’t exist, and instead the timeout should be a _post_launch() 
parameter.  (Which I would have nothing against, by the way.)

Also, mypy complains that this variable is a float, so iotest 297 (which 
runs mypy) fails.

>           self._post_launch()
>   
>       def _early_cleanup(self) -> None:
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 05d0dc0751..380527245e 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -478,7 +478,10 @@ def log(msg: Msg,
>   
>   class Timeout:
>       def __init__(self, seconds, errmsg="Timeout"):
> -        self.seconds = seconds
> +        if qemu_gdb:
> +            self.seconds = 3000
> +        else:
> +            self.seconds = seconds

We might as well completely disable the timeout then, that would be more 
honest, I think.  (I.e. to make __enter__ and __exit__ no-ops.)

>           self.errmsg = errmsg
>       def __enter__(self):
>           signal.signal(signal.SIGALRM, self.timeout)
> @@ -684,6 +687,11 @@ def qmp_to_opts(self, obj):
>               output_list += [key + '=' + obj[key]]
>           return ','.join(output_list)
>   
> +    def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
> +        if qemu_gdb:
> +            wait = 0.0

First, this is a bool.  I can see that qmp.py expects a
Union[bool, float], but machine.py expects just a bool.  (Also, mypy 
complains that this specific `wait` here is a `bool`.  You can see that 
by running iotest 297.)

Second, I don’t understand this.  If the caller wants to block waiting 
on an event, then that should have nothing to do with whether we have 
gdb running or not.  As far as I understand, setting wait to 0.0 is the 
same as wait = False, i.e. we don’t block and just return None 
immediately if there is no pending event.

Max

> +        return super().get_qmp_events(wait=wait)
> +
>       def get_qmp_events_filtered(self, wait=60.0):
>           result = []
>           for ev in self.get_qmp_events(wait=wait):
> 


