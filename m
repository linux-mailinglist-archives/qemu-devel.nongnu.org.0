Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BE7477416
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:12:42 +0100 (CET)
Received: from localhost ([::1]:42908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrUv-0005Xp-9R
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:12:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrLv-0002GN-LV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:03:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrLs-0003uh-8p
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639663398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1jmoTazJd4fyVbKTJDreoYwWJT8cxa6PZ69kOgHJM/Y=;
 b=GBXYsVPvnDYb0I3Ohl7sICXQfdA2jWQ8BLd4CgqzMn6rW5ULk0rjW3CeQ6LrOpl3cjIoSc
 Eam7E+N4Xx2oSt9+UiXNyFX+LP7oGlABdGhpDd21WOcZ5DUl7OsbNDpqoSlnXwLCaqasWF
 /pi0a3cbH4UaOb12eSRmNLyVeCjb5UQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-Moy-vVGuPliPlY8YSKAH3Q-1; Thu, 16 Dec 2021 09:03:17 -0500
X-MC-Unique: Moy-vVGuPliPlY8YSKAH3Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 bk35-20020a05620a1a2300b0046d2a9b93dfso20677853qkb.16
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 06:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1jmoTazJd4fyVbKTJDreoYwWJT8cxa6PZ69kOgHJM/Y=;
 b=73dXtz1fmMDNZQwyFygx8Qx2UwYr0aa0gYNliNtnDQVd8fdyLzjP1+zMKedlyJRYk8
 H9yv13c2qTS68mZ+J/iVsBx/qkoi45jqJz0VHpYks30R1Z1fcQP8OlEUd96gEmgSPs6v
 dtxy20TfgvJ9tuV0+5/KYBDuPRsifFG4aY5hccp5hv5KbKk4DZvC3KlbeG/2bfP5WB6N
 HqATw8J7JyeToba0kjHG5csL343tjcthJiwho4x/USPr+UfmU+dJqgnXE6DYhoklnQNx
 /boiDzf+2kxKIk3ZiprFltvoUrEE/gHnGTgF7gtYxNmli9k+BFhcF81dig4ZekfNSg1O
 bqKg==
X-Gm-Message-State: AOAM530IrtNmhODJnUHB2QV7JvQMGycXENsFy7hQKURQwRTIMWRs8JzJ
 paJOScNC7Dp0m3ZWvl1O5/n7Szw2ZVjE7Dhmf2e44xFEBToMz/M73mLU+DWILGKFjmhE2akwXu/
 9Mpq0FXi5BPHeBwM=
X-Received: by 2002:ac8:570b:: with SMTP id 11mr17436050qtw.128.1639663396570; 
 Thu, 16 Dec 2021 06:03:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPoXFYu7jt6iHNcN77d94bDFX9GDuLfv7HknL+WTkwGg2u0W9va8tOtgJhfkIzNPdGLSp2Qg==
X-Received: by 2002:ac8:570b:: with SMTP id 11mr17436019qtw.128.1639663396326; 
 Thu, 16 Dec 2021 06:03:16 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id p1sm2801200qke.109.2021.12.16.06.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 06:03:15 -0800 (PST)
Date: Thu, 16 Dec 2021 11:03:13 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 20/25] python/aqmp: take QMPBadPortError and
 parse_address from qemu.qmp
Message-ID: <20211216140313.ldyy6vffwzuj446s@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-21-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-21-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Dec 15, 2021 at 02:39:34PM -0500, John Snow wrote:
> Shift these definitions over from the qmp package to the async qmp
> package.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/aqmp_tui.py |  2 +-
>  python/qemu/aqmp/legacy.py   | 30 ++++++++++++++++++++++++++----
>  python/qemu/qmp/__init__.py  | 26 --------------------------
>  3 files changed, 27 insertions(+), 31 deletions(-)
> 
> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
> index a2929f771c..184a3e4690 100644
> --- a/python/qemu/aqmp/aqmp_tui.py
> +++ b/python/qemu/aqmp/aqmp_tui.py
> @@ -35,8 +35,8 @@
>  import urwid
>  import urwid_readline
>  
> -from ..qmp import QEMUMonitorProtocol, QMPBadPortError
>  from .error import ProtocolError
> +from .legacy import QEMUMonitorProtocol, QMPBadPortError
>  from .message import DeserializationError, Message, UnexpectedTypeError
>  from .protocol import ConnectError, Runstate
>  from .qmp_client import ExecInterruptedError, QMPClient
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 0890f95b16..76b09671cc 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py
> @@ -22,9 +22,6 @@
>  from .qmp_client import QMPClient
>  
>  
> -# (Temporarily) Re-export QMPBadPortError
> -QMPBadPortError = qemu.qmp.QMPBadPortError
> -
>  #: QMPMessage is an entire QMP message of any kind.
>  QMPMessage = Dict[str, Any]
>  
> @@ -45,6 +42,12 @@
>  # pylint: disable=missing-docstring
>  
>  
> +class QMPBadPortError(QMPError):
> +    """
> +    Unable to parse socket address: Port was non-numerical.
> +    """
> +
> +
>  class QEMUMonitorProtocol(qemu.qmp.QEMUMonitorProtocol):
>      def __init__(self, address: SocketAddrT,
>                   server: bool = False,
> @@ -72,7 +75,26 @@ def _get_greeting(self) -> Optional[QMPMessage]:
>          return None
>  
>      # __enter__ and __exit__ need no changes
> -    # parse_address needs no changes
> +
> +    @classmethod
> +    def parse_address(cls, address: str) -> SocketAddrT:
> +        """
> +        Parse a string into a QMP address.
> +
> +        Figure out if the argument is in the port:host form.
> +        If it's not, it's probably a file path.
> +        """
> +        components = address.split(':')
> +        if len(components) == 2:
> +            try:
> +                port = int(components[1])
> +            except ValueError:
> +                msg = f"Bad port: '{components[1]}' in '{address}'."
> +                raise QMPBadPortError(msg) from None
> +            return (components[0], port)
> +
> +        # Treat as filepath.
> +        return address
>  
>      def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
>          self._aqmp.await_greeting = negotiate
> diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
> index 358c0971d0..4e08641154 100644
> --- a/python/qemu/qmp/__init__.py
> +++ b/python/qemu/qmp/__init__.py
> @@ -102,12 +102,6 @@ def __init__(self, reply: QMPMessage):
>          self.reply = reply
>  
>  
> -class QMPBadPortError(QMPError):
> -    """
> -    Unable to parse socket address: Port was non-numerical.
> -    """
> -
> -
>  class QEMUMonitorProtocol:
>      """
>      Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP) and then
> @@ -237,26 +231,6 @@ def __exit__(self,
>          # Implement context manager exit function.
>          self.close()
>  
> -    @classmethod
> -    def parse_address(cls, address: str) -> SocketAddrT:
> -        """
> -        Parse a string into a QMP address.
> -
> -        Figure out if the argument is in the port:host form.
> -        If it's not, it's probably a file path.
> -        """
> -        components = address.split(':')
> -        if len(components) == 2:
> -            try:
> -                port = int(components[1])
> -            except ValueError:
> -                msg = f"Bad port: '{components[1]}' in '{address}'."
> -                raise QMPBadPortError(msg) from None
> -            return (components[0], port)
> -
> -        # Treat as filepath.
> -        return address
> -
>      def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
>          """
>          Connect to the QMP Monitor and perform capabilities negotiation.

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


