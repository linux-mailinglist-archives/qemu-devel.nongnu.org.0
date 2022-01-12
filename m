Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F948C619
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:33:50 +0100 (CET)
Received: from localhost ([::1]:56184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ehB-00030U-H9
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7djn-0001Bb-Gy
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7djk-000694-Ii
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641994344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jPvuccqDFp0ong9ZQBdXowhetF2XOtdmFcwl2AYlpMU=;
 b=alYC1jQ9jpPjAGdARU1pK3nqKzIrOaSy6K05+Lh5PiOZowFsSWdRObi9/yoYXImqPkZvJf
 bzmCE6j0QdrkJNniUi4NcGJpk8h5nz39T2DpERFyNscrDMy/s7FZZdVgCYT4kWn1cEBaVa
 GuBHJe7ab5q3obH6ZNAImxpNdmpqxNM=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-dxkxpHHSMMKfnbqxSEZUsw-1; Wed, 12 Jan 2022 08:32:23 -0500
X-MC-Unique: dxkxpHHSMMKfnbqxSEZUsw-1
Received: by mail-vk1-f199.google.com with SMTP id
 s130-20020a1ff488000000b00318f62f016aso407797vkh.22
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jPvuccqDFp0ong9ZQBdXowhetF2XOtdmFcwl2AYlpMU=;
 b=v6HDQSC+YDmqWehMP2YrriGdcs65MmghWDeEICCg233HBAfMhf7a6aau2/nr+hN6gI
 PHGsyiOUGURqa9bV/gy6iHGpK8aWZsNybLdQ4tqwokjXKiGBifqc70GR5W8up2hZ+0AM
 5L/ZEY8OMLnl7SKFAytG7NtUMSNF71QL+GXNPaUi5r/SwbNdAei2Aadzm850+HwZsvA3
 aKH++IqME24gBTxZhUy79512j3mzpha00gggzOk8cSTf4iHmaRyX8s8OB+yHVIvrbSng
 1TF4d+3IWWnknytZFE9Vghx1Di8/liWQTHLNcM30zM9EST9qW5EhfZzICfHPhsiLvyzM
 sZUg==
X-Gm-Message-State: AOAM531E2NvqFCD1NT0UyITEtnMqjpBO4BqXDDTzVg2bmjIHiDAbukxE
 a1OG92OIhNuoWDMkC/HCIIyfzdJx7HTa7Ne5096lWd0jwFj7naeC9ITKSA+Kp0MaZUx9ccp6hGH
 0s7EZ5UIh4rdEo40=
X-Received: by 2002:a05:6102:149:: with SMTP id
 a9mr4106593vsr.48.1641994342426; 
 Wed, 12 Jan 2022 05:32:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoAGeJOCnEqokJPeP0r0+1Ux+pbY8Sl6QhqPgLdv4Tz1ITQww42dWR7jFu2y3YE50fmEM/MA==
X-Received: by 2002:a05:6102:149:: with SMTP id
 a9mr4106579vsr.48.1641994342154; 
 Wed, 12 Jan 2022 05:32:22 -0800 (PST)
Received: from localhost ([2804:18:8ca:405a:c209:ac99:1eeb:4fa6])
 by smtp.gmail.com with ESMTPSA id k6sm7407787uak.9.2022.01.12.05.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 05:32:21 -0800 (PST)
Date: Wed, 12 Jan 2022 10:32:19 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 08/31] python/aqmp: copy type definitions from qmp
Message-ID: <20220112133219.ekwowrd6ao3pkjiw@laptop.redhat>
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-9-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110232910.1923864-9-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wainer Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 06:28:47PM -0500, John Snow wrote:
> Copy the remaining type definitions from QMP into the qemu.aqmp.legacy
> module. Now, users that require the legacy interface don't need to
> import anything else but qemu.aqmp.legacy wrapper.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  python/qemu/aqmp/legacy.py   | 22 ++++++++++++++++++++--
>  python/qemu/aqmp/protocol.py | 16 ++++++++++------
>  2 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 2ccb136b02..9431fe9330 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py
> @@ -6,7 +6,9 @@
>  
>  import asyncio
>  from typing import (
> +    Any,
>      Awaitable,
> +    Dict,
>      List,
>      Optional,
>      TypeVar,
> @@ -14,13 +16,29 @@
>  )
>  
>  import qemu.qmp
> -from qemu.qmp import QMPMessage, QMPReturnValue, SocketAddrT
>  
>  from .error import AQMPError
> -from .protocol import Runstate
> +from .protocol import Runstate, SocketAddrT
>  from .qmp_client import QMPClient
>  
>  
> +#: QMPMessage is an entire QMP message of any kind.
> +QMPMessage = Dict[str, Any]
> +
> +#: QMPReturnValue is the 'return' value of a command.
> +QMPReturnValue = object
> +
> +#: QMPObject is any object in a QMP message.
> +QMPObject = Dict[str, object]
> +
> +# QMPMessage can be outgoing commands or incoming events/returns.
> +# QMPReturnValue is usually a dict/json object, but due to QAPI's
> +# 'returns-whitelist', it can actually be anything.
> +#
> +# {'return': {}} is a QMPMessage,
> +# {} is the QMPReturnValue.
> +
> +
>  # pylint: disable=missing-docstring
>  
>  
> diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
> index c4fbe35a0e..5b4f2f0d0a 100644
> --- a/python/qemu/aqmp/protocol.py
> +++ b/python/qemu/aqmp/protocol.py
> @@ -46,6 +46,10 @@
>  _U = TypeVar('_U')
>  _TaskFN = Callable[[], Awaitable[None]]  # aka ``async def func() -> None``
>  
> +InternetAddrT = Tuple[str, int]
> +UnixAddrT = str
> +SocketAddrT = Union[UnixAddrT, InternetAddrT]
> +
>  
>  class Runstate(Enum):
>      """Protocol session runstate."""
> @@ -257,7 +261,7 @@ async def runstate_changed(self) -> Runstate:
>  
>      @upper_half
>      @require(Runstate.IDLE)
> -    async def accept(self, address: Union[str, Tuple[str, int]],
> +    async def accept(self, address: SocketAddrT,
>                       ssl: Optional[SSLContext] = None) -> None:
>          """
>          Accept a connection and begin processing message queues.
> @@ -275,7 +279,7 @@ async def accept(self, address: Union[str, Tuple[str, int]],
>  
>      @upper_half
>      @require(Runstate.IDLE)
> -    async def connect(self, address: Union[str, Tuple[str, int]],
> +    async def connect(self, address: SocketAddrT,
>                        ssl: Optional[SSLContext] = None) -> None:
>          """
>          Connect to the server and begin processing message queues.
> @@ -337,7 +341,7 @@ def _set_state(self, state: Runstate) -> None:
>  
>      @upper_half
>      async def _new_session(self,
> -                           address: Union[str, Tuple[str, int]],
> +                           address: SocketAddrT,
>                             ssl: Optional[SSLContext] = None,
>                             accept: bool = False) -> None:
>          """
> @@ -397,7 +401,7 @@ async def _new_session(self,
>      @upper_half
>      async def _establish_connection(
>              self,
> -            address: Union[str, Tuple[str, int]],
> +            address: SocketAddrT,
>              ssl: Optional[SSLContext] = None,
>              accept: bool = False
>      ) -> None:
> @@ -424,7 +428,7 @@ async def _establish_connection(
>              await self._do_connect(address, ssl)
>  
>      @upper_half
> -    async def _do_accept(self, address: Union[str, Tuple[str, int]],
> +    async def _do_accept(self, address: SocketAddrT,
>                           ssl: Optional[SSLContext] = None) -> None:
>          """
>          Acting as the transport server, accept a single connection.
> @@ -482,7 +486,7 @@ async def _client_connected_cb(reader: asyncio.StreamReader,
>          self.logger.debug("Connection accepted.")
>  
>      @upper_half
> -    async def _do_connect(self, address: Union[str, Tuple[str, int]],
> +    async def _do_connect(self, address: SocketAddrT,
>                            ssl: Optional[SSLContext] = None) -> None:
>          """
>          Acting as the transport client, initiate a connection to a server.

This makes sense to me.

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


