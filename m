Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158F5358DFB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:01:10 +0200 (CEST)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUapx-0005vS-4p
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUaoR-0004zl-2m
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUaoP-00018m-GY
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617911972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKAMMHdvoOMd832xnZFH1vT9j3ChN/qWwap7PMtUJRw=;
 b=UKo2MWIk4K/vcfW2bc0S9lvnqiK4UZ6+pdI+ujx4r5rZOP+ZCF8WdAeVyQwc0szSsKvnXg
 DnF5pwFDfEXBqCGZWw1diKa0HapRn7ul1CzvATEmBC5Wy4mgXz0k6mqZGRaD3Wjyitgg9i
 KU65+ZsjFjjhwKd6XWzkervJzyLlvxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-0FFoviNuMLaFkD2GNMQOwg-1; Thu, 08 Apr 2021 15:59:30 -0400
X-MC-Unique: 0FFoviNuMLaFkD2GNMQOwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ACBE14DCAB2;
 Thu,  8 Apr 2021 19:59:30 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BB6D19C78;
 Thu,  8 Apr 2021 19:59:29 +0000 (UTC)
Subject: Re: [RFC PATCH v2 02/11] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-3-eesposit@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <4d920857-c398-3527-d71e-1f0f79be9034@redhat.com>
Date: Thu, 8 Apr 2021 15:59:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407135021.48330-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 4/7/21 9:50 AM, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   python/qemu/machine.py | 2 +-
>   python/qemu/qtest.py   | 4 +++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index c721e07d63..18d32ebe45 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -109,7 +109,7 @@ def __init__(self,
>   
>           self._binary = binary
>           self._args = list(args)
> -        self._wrapper = wrapper
> +        self._wrapper = list(wrapper)
>  

Unrelated change?

(I'm assuming you want to copy the user's input to explicitly avoid 
sharing state. Commit message blurb for this would be good.)

>           self._name = name or "qemu-%d" % os.getpid()
>           self._test_dir = test_dir
> diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
> index 0d01715086..4c90daf430 100644
> --- a/python/qemu/qtest.py
> +++ b/python/qemu/qtest.py
> @@ -111,6 +111,7 @@ class QEMUQtestMachine(QEMUMachine):
>       def __init__(self,
>                    binary: str,
>                    args: Sequence[str] = (),
> +                 wrapper: Sequence[str] = (),
>                    name: Optional[str] = None,
>                    test_dir: str = "/var/tmp",
>                    socket_scm_helper: Optional[str] = None,
> @@ -119,7 +120,8 @@ def __init__(self,
>               name = "qemu-%d" % os.getpid()
>           if sock_dir is None:
>               sock_dir = test_dir
> -        super().__init__(binary, args, name=name, test_dir=test_dir,
> +        super().__init__(binary, args, wrapper=wrapper, name=name,
> +                         test_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
>                            sock_dir=sock_dir)
>           self._qtest: Optional[QEMUQtestProtocol] = None
> 

ACK


