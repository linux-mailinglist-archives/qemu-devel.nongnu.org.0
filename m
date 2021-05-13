Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2337FD6D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 20:48:14 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhGNY-0006It-T8
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 14:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhGMn-0005az-Dp
 for qemu-devel@nongnu.org; Thu, 13 May 2021 14:47:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhGMk-0007rX-Lq
 for qemu-devel@nongnu.org; Thu, 13 May 2021 14:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620931641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KzujMhB6YO698ncjg9IlzgKcqh+9tFKRjK3QRdyP6cA=;
 b=b7XORlpwXWeQp3vtfCrsHhWGzEW7xQ7Tv5o9aG/dPKsV9L4ue598hcWo8G275OiI8iDv3/
 zHA9oftuZLHrLZbICX+a6EE3HBVz6PYgn8cS9okLHljv8HwwCWRZZ6GBTNJTJo9Sf4J5i+
 5sEL+LyDCsW7YXn+hiM/oVH+kAMROWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-8FVaEcKdOWqBWqoYi4nEow-1; Thu, 13 May 2021 14:47:19 -0400
X-MC-Unique: 8FVaEcKdOWqBWqoYi4nEow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B01B61009613;
 Thu, 13 May 2021 18:47:18 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CB915C8AA;
 Thu, 13 May 2021 18:47:17 +0000 (UTC)
Subject: Re: [PATCH v3 10/15] qemu_iotests: extent QMP socket timeout when
 using valgrind
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-11-eesposit@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a7353583-27d2-762f-34b3-a4bda861057b@redhat.com>
Date: Thu, 13 May 2021 14:47:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-11-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 1:03 PM, Emanuele Giuseppe Esposito wrote:
> As with gdbserver, valgrind delays the test execution, so
> the default QMP socket timeout timeout too soon.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   python/qemu/machine.py        | 2 +-
>   tests/qemu-iotests/iotests.py | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index d6142271c2..dce96e1858 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -410,7 +410,7 @@ def _launch(self) -> None:
>                                          shell=False,
>                                          close_fds=False)
>   
> -        if 'gdbserver' in self._wrapper:
> +        if 'gdbserver' in self._wrapper or 'valgrind' in self._wrapper:

This approaches me suggesting that we just change __init__ to accept a 
parameter that lets the caller decide what kind of timeout(s) they find 
acceptable. They know more about what they're trying to run than we do.

Certainly after launch occurs, the user is free to just grab the qmp 
object and tinker around with the timeouts, but that does not allow us 
to change the timeout(s) for accept itself.

D'oh.

(Spilled milk: It was probably a mistake to make the default launch 
behavior here have a timeout of 15 seconds. That logic likely belongs to 
the iotests implementation. The default here probably ought to indeed be 
"wait forever".)

In the here and now ... would it be acceptable to change the launch() 
method to add a timeout parameter? It's still a little awkward, because 
conceptually it's a timeout for just QMP and not for the actual duration 
of the entire launch process.

But, I guess, it's *closer* to the truth.

If you wanted to route it that way, I take back what I said about not 
wanting to pass around variables to event loop hooks.

If we defined the timeout as something that applies exclusively to the 
launching process, then it'd be appropriate to route that to the 
launch-related functions ... and subclasses would have to be adjusted to 
be made aware that they're expected to operate within those parameters, 
which is good.

Sorry for my waffling back and forth on this. Let me know what the 
actual requirements are if you figure out which timeouts you need / 
don't need and I'll give you some review priority.

If you attack this series again, can you please split out the python/* 
patches into its own little series and CC me?

--js

>               self._qmp_timer = None
>           self._post_launch()
>   
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index a2e8604674..94597433fa 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -489,7 +489,7 @@ def log(msg: Msg,
>   
>   class Timeout:
>       def __init__(self, seconds, errmsg="Timeout"):
> -        if qemu_gdb:
> +        if qemu_gdb or qemu_valgrind:
>               self.seconds = 3000
>           else:
>               self.seconds = seconds
> @@ -700,7 +700,7 @@ def qmp_to_opts(self, obj):
>           return ','.join(output_list)
>   
>       def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
> -        if qemu_gdb:
> +        if qemu_gdb or qemu_valgrind:
>               wait = 0.0
>           return super().get_qmp_events(wait=wait)
>   
> 


