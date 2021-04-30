Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25C36FB52
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:16:09 +0200 (CEST)
Received: from localhost ([::1]:55682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcT04-0007Ab-QU
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcSqM-0006Ge-0P
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcSqI-0008Np-V4
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619787961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjvAFnFtrMJCaY8KI8gBFYs4BrpdP76EC4n5ATnvDOo=;
 b=CpB6Udn21bFxFdf6yAYKHx04cVOPO1K8Jmgfxj0D8jrArV1K3G5qmDonb4xlIoaVm5J9Iz
 zed9J6o6mPqI/URkDIhBwBvudpPACWXpjlWCVp2LAX5RpHhVEaVKo17EFhqrRwL7jfxaiq
 BEcZ6y6bwAzbYaJ1vyZlCgXJVfwgQQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-LpfJ1hszOFGQ1nG3zkentw-1; Fri, 30 Apr 2021 09:05:59 -0400
X-MC-Unique: LpfJ1hszOFGQ1nG3zkentw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AA4C100AA48;
 Fri, 30 Apr 2021 13:02:46 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B01FA10027C4;
 Fri, 30 Apr 2021 13:02:44 +0000 (UTC)
Subject: Re: [PATCH v3 10/15] qemu_iotests: extent QMP socket timeout when
 using valgrind
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-11-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a370f621-ed39-9bbf-1546-da057026ca3b@redhat.com>
Date: Fri, 30 Apr 2021 15:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-11-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> As with gdbserver, valgrind delays the test execution, so
> the default QMP socket timeout timeout too soon.

I’m curious: The default timeouts should be long enough for slow 
systems, too, though (e.g. heavily-loaded CI systems).  I would expect 
that valgrind is used on developer systems where there is more leeway, 
so the timeouts should still work.

But in practice, thinking about that doesn’t matter.  If valgrind leads 
to a timeout being hit, that wouldn’t be nice.  OTOH, if you run 
valgrind to debug a test/qemu, you don’t particularly care about the 
timeouts anyway.

So in principle, this patch sounds good to me, it’s just that it’s based 
on patch 5, which I don’t fully agree with.

Max

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


