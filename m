Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A6358DFE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:03:27 +0200 (CEST)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUasA-0007z0-FD
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUap5-0005ma-On
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:00:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUaow-0001Ui-6e
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617912005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZavZANYD3YwHFfnabwTm/M72yjZQfyyoycEK+/RHCc=;
 b=izOVgiFzy+dXScJmC/PUVLxy1TgCgsQ7fhLgs638wxZfXJBzUPmogDFcvo+n903OTKTFdq
 aF/jSdAkZAcEu2oN1OnpHCGvge4RvXLQ2lSjN6ZNnPCb6Znxo8UIXZB5G1UuBcWTg/XJQ5
 jTpQ6iQlxsdG+iRIVtDSwfuZ2Kbn2n0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-hXi2tTp8P4Cism0tv2AV9w-1; Thu, 08 Apr 2021 16:00:03 -0400
X-MC-Unique: hXi2tTp8P4Cism0tv2AV9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FB7F19F6801;
 Thu,  8 Apr 2021 19:51:42 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 324285D747;
 Thu,  8 Apr 2021 19:51:37 +0000 (UTC)
Subject: Re: [RFC PATCH v2 01/11] python: qemu: add timer parameter for
 qmp.accept socket
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-2-eesposit@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <008d696c-a4d4-c5e6-707d-792759b3ce5b@redhat.com>
Date: Thu, 8 Apr 2021 15:51:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407135021.48330-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 9:50 AM, Emanuele Giuseppe Esposito wrote:
> Extend the _post_launch function to include the timer as
> parameter instead of defaulting to 15 sec.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   python/qemu/machine.py | 4 ++--
>   python/qemu/qtest.py   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 6e44bda337..c721e07d63 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -321,9 +321,9 @@ def _pre_launch(self) -> None:
>                   nickname=self._name
>               )
>   
> -    def _post_launch(self) -> None:
> +    def _post_launch(self, timer) -> None:
>           if self._qmp_connection:
> -            self._qmp.accept()
> +            self._qmp.accept(timer)
>   
>       def _post_shutdown(self) -> None:
>           """
> diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
> index 39a0cf62fe..0d01715086 100644
> --- a/python/qemu/qtest.py
> +++ b/python/qemu/qtest.py
> @@ -138,9 +138,9 @@ def _pre_launch(self) -> None:
>           super()._pre_launch()
>           self._qtest = QEMUQtestProtocol(self._qtest_path, server=True)
>   
> -    def _post_launch(self) -> None:
> +    def _post_launch(self, timer) -> None:
>           assert self._qtest is not None
> -        super()._post_launch()
> +        super()._post_launch(timer)
>           self._qtest.accept()
>   
>       def _post_shutdown(self) -> None:
> 

Are you forgetting to change _launch() to provide some default value for 
what timer needs to be?

I think for the "event" callbacks here, I'd prefer configuring the 
behavior as a property instead of passing it around as a parameter.

(Also, we have an awful lot of timeouts now... is it time to think about 
rewriting this using asyncio so that we can allow the callers to specify 
their own timeouts in with context blocks? Just a thought for later; we 
have an awful lot of timeouts scattered throughout machine.py, qmp.py, etc.)

--js


