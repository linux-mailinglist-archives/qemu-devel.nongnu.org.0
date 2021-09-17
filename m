Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8334240F95C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:35:43 +0200 (CEST)
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRE1m-0000uG-LL
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRE0J-0008Bu-9f
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRE0H-0002HU-RL
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631885648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMlpD9RxSqvpLYfllWx+No/xhSPeJLHu/AHH3jCxBfc=;
 b=GocpHw1WJ9F/hgDXwk67l57GHaRjThzhqFCf1NMkVcR7gT3RKye3AIfvKoUHzy/DadMIr4
 6e/MeNXddh03VfPXEOfSJ4deU1YM66SDur7JcZc6bz/QLTfQps1dnVkTq3f8JQDpwCD2Z+
 83FO3uPVDoRsKorLwCOn79fj4d9lI8s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-70p41n5tNbWooE2d7rcqUg-1; Fri, 17 Sep 2021 09:34:07 -0400
X-MC-Unique: 70p41n5tNbWooE2d7rcqUg-1
Received: by mail-wm1-f71.google.com with SMTP id
 g130-20020a1c2088000000b00308ecd761e8so1777350wmg.2
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 06:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PMlpD9RxSqvpLYfllWx+No/xhSPeJLHu/AHH3jCxBfc=;
 b=MABHrPb/py8JB/sQPtjhlCf7WVClro9uH49VJaH+cqyoMyUfyDOmtg+Osbkyg5naHB
 11rUGi6Cb5zX06k3VOE6ZtFhfBhYR9o1VoNMlgwNWaN1rOsNgc0lVYB+30GhUMpiP2Fj
 42wtjVoYS9kfOTKryHwL3jCuhv+It2djNEG66iSk3QpX9fOVb7pvjGbCN9EEyhph85qZ
 m+70RJMLOh0yYvH83vCNdMzmc1SA68S/Ze2gMnHd9HNZmyz1YP/N3VZfgtP7kHAI4n54
 NgEzsrU3HpJpiB1fer0JLi2oVp/zOqcK6cAbkwkAk2tjBATc3jw6QXcHbH6EGX8mXILj
 1B1w==
X-Gm-Message-State: AOAM533GQvMS8XOqOQLRef+jswgHtMvmOPRC8DgxlDmvUNRjpOtl17rN
 dQZRij2I06CTEKmudzyK4Q7VxGSLDnDp2kVQh91kIZGAaEoAtZhinGZy3s4judkiC0lUchsYN10
 SkcncBZrYq2i0O/k=
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr15408895wmp.165.1631885646376; 
 Fri, 17 Sep 2021 06:34:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9L05hLYRhUzDcbXf1cOdaTPqLy2XxF8cOataLYrRamAFDyWGp8IMJtGrmconGvU4AqHOnLg==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr15408866wmp.165.1631885646177; 
 Fri, 17 Sep 2021 06:34:06 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id 5sm1755519wmb.37.2021.09.17.06.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 06:34:05 -0700 (PDT)
Subject: Re: [PATCH 07/15] python/aqmp: add send_fd_scm
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-8-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <ad49775f-f6a7-c527-6844-e28e913d1c3c@redhat.com>
Date: Fri, 17 Sep 2021 15:34:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-8-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> The single space is indeed required to successfully transmit the file
> descriptor to QEMU.

Yeah, socket_scm_helper.c said “Send a blank to notify qemu”.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/qmp_client.py | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
> index d2ad7459f9..58f85990bc 100644
> --- a/python/qemu/aqmp/qmp_client.py
> +++ b/python/qemu/aqmp/qmp_client.py
> @@ -9,6 +9,8 @@
>   
>   import asyncio
>   import logging
> +import socket
> +import struct
>   from typing import (
>       Dict,
>       List,
> @@ -624,3 +626,18 @@ async def execute(self, cmd: str,
>           """
>           msg = self.make_execute_msg(cmd, arguments, oob=oob)
>           return await self.execute_msg(msg)
> +
> +    @upper_half
> +    @require(Runstate.RUNNING)
> +    def send_fd_scm(self, fd: int) -> None:
> +        """
> +        Send a file descriptor to the remote via SCM_RIGHTS.
> +        """
> +        assert self._writer is not None
> +        sock = self._writer.transport.get_extra_info('socket')
> +
> +        # Python 3.9+ adds socket.send_fds(...)
> +        sock.sendmsg(
> +            [b' '],
> +            [(socket.SOL_SOCKET, socket.SCM_RIGHTS, struct.pack('@i', fd))]
> +        )

AFAIU the socket can be either TCP or a UNIX socket 
(AsyncProtocol._do_accept’s docstring sounds this way), so should we 
check that this is a UNIX socket?  (Or is it fine to just run into the 
error that I suspect we would get with a TCP socket?)

Hanna


