Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CFE47745C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:22:09 +0100 (CET)
Received: from localhost ([::1]:33944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxre4-00029D-M2
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrUB-0005m0-C2
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:11:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrU8-0005dO-Kj
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639663911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ywhXcDS+bQA3DY171hvQQ5gQ3zblVWbDA8I09oSgD3o=;
 b=R0n0SPeCnOVvHtiO7ANYsooXxUFbinBa6i+BF6qxjfrUNDmV4WvY/7wBf4ilqDuLpLck/r
 IPrG0rtSBw2eD31z2EWcblL5IgJQw1PmdNvAyyiB/cQNPJRvtbTPxz8Md1mEgdPG82gJbD
 hE2pS83y5bizmVP8WAAUa+FrsmDxVNg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-Si20er5FMYuvQkMhkhNQaw-1; Thu, 16 Dec 2021 09:11:47 -0500
X-MC-Unique: Si20er5FMYuvQkMhkhNQaw-1
Received: by mail-qk1-f200.google.com with SMTP id
 bj32-20020a05620a192000b0046dcca212b6so20757081qkb.6
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 06:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ywhXcDS+bQA3DY171hvQQ5gQ3zblVWbDA8I09oSgD3o=;
 b=g0HRNHdYHf7/jsUr2PwchSz8yOFXXrWn/+2UAfJoy1AdUSczXTzh/hI+Ej9z1CL233
 onbmiTP3h4fmq3z+cf7BHNlq2wrZJqYyG6fTEPnTlFKHwsocW+rW2J+w3CQBoecfkn36
 qN+WFNmFiMDjgLyu5MsIgPxAEvJVLztS0EIpbMRT82VnIShTL9UiOqn2HXY3oC5ATN6w
 0RsLzY4EIMFe7yYtGU6R9I4nqEfYqQVWoPWdnleSRzgFFScUTFwdgAQC92VvW+Dkg3ZC
 hnxUFaOaZQ8+sduqy0ao80PvKzYnvIhRc6rvJ0LLyCWgEpPhr2jg+ZjT9MbcIwjuJKUG
 HDxQ==
X-Gm-Message-State: AOAM532UMAy4nSCCpwNFib3HJnVABjhn0gd5n9WUNKctZj2ZcjEVBasJ
 f2U+g2MaeuI25dL2cSjXTkH/XleGmlWAuDozk4f4gwuColuzc4QJJfWG5GHnnUPRmsmZTNHiDPe
 mF36YkW7++jviNms=
X-Received: by 2002:a05:620a:f10:: with SMTP id
 v16mr12059054qkl.626.1639663907464; 
 Thu, 16 Dec 2021 06:11:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtkjEW6o2tfsmnzG/IbPDOQOYered0CAttrjZVwL4KyTcXpbtkpuJKWU1o6vHNGR2LY/cEJw==
X-Received: by 2002:a05:620a:f10:: with SMTP id
 v16mr12059028qkl.626.1639663907264; 
 Thu, 16 Dec 2021 06:11:47 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id b11sm4086644qtx.85.2021.12.16.06.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 06:11:46 -0800 (PST)
Date: Thu, 16 Dec 2021 11:11:44 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 21/25] python/aqmp: fully separate from
 qmp.QEMUMonitorProtocol
Message-ID: <20211216141144.qgczfqn7cd6qq2qn@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-22-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-22-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:39:35PM -0500, John Snow wrote:
> After this patch, qemu.aqmp.legacy.QEMUMonitorProtocol no longer
> inherits from qemu.qmp.QEMUMonitorProtocol. To do this, several
> inherited methods need to be explicitly re-defined.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/legacy.py | 38 ++++++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 76b09671cc..8f38e7d912 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py
> @@ -5,18 +5,18 @@
>  """
>  
>  import asyncio
> +from types import TracebackType
>  from typing import (
>      Any,
>      Awaitable,
>      Dict,
>      List,
>      Optional,
> +    Type,
>      TypeVar,
>      Union,
>  )
>  
> -import qemu.qmp
> -
>  from .error import QMPError
>  from .protocol import Runstate, SocketAddrT
>  from .qmp_client import QMPClient
> @@ -48,9 +48,9 @@ class QMPBadPortError(QMPError):
>      """
>  
>  
> -class QEMUMonitorProtocol(qemu.qmp.QEMUMonitorProtocol):
> +class QEMUMonitorProtocol:
>      def __init__(self, address: SocketAddrT,
> -                 server: bool = False,
> +                 server: bool = False,  # pylint: disable=unused-argument
>                   nickname: Optional[str] = None):
>  
>          # pylint: disable=super-init-not-called
> @@ -74,7 +74,18 @@ def _get_greeting(self) -> Optional[QMPMessage]:
>              return self._aqmp.greeting._asdict()
>          return None
>  
> -    # __enter__ and __exit__ need no changes
> +    def __enter__(self: _T) -> _T:
> +        # Implement context manager enter function.
> +        return self
> +
> +    def __exit__(self,
> +                 # pylint: disable=duplicate-code
> +                 # see https://github.com/PyCQA/pylint/issues/3619
> +                 exc_type: Optional[Type[BaseException]],
> +                 exc_val: Optional[BaseException],
> +                 exc_tb: Optional[TracebackType]) -> None:
> +        # Implement context manager exit function.
> +        self.close()
>  
>      @classmethod
>      def parse_address(cls, address: str) -> SocketAddrT:
> @@ -131,7 +142,22 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
>              )
>          )
>  
> -    # Default impl of cmd() delegates to cmd_obj
> +    def cmd(self, name: str,
> +            args: Optional[Dict[str, object]] = None,
> +            cmd_id: Optional[object] = None) -> QMPMessage:
> +        """
> +        Build a QMP command and send it to the QMP Monitor.
> +
> +        @param name: command name (string)
> +        @param args: command arguments (dict)
> +        @param cmd_id: command id (dict, list, string or int)
> +        """
> +        qmp_cmd: QMPMessage = {'execute': name}
> +        if args:
> +            qmp_cmd['arguments'] = args
> +        if cmd_id:
> +            qmp_cmd['id'] = cmd_id
> +        return self.cmd_obj(qmp_cmd)
>  
>      def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
>          return self._sync(

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


