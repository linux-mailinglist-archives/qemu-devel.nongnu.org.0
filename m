Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38029477444
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:17:53 +0100 (CET)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrZw-0005I6-5K
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrYD-00035y-Ac
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrY9-0006rz-VU
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639664158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A/154nDtcl0abUR1X17O26OOPGbND8Z9iqs2dt/zlU4=;
 b=Zcq7Sg9Yc8K4JtLt3DQYvyx+tMVuPNEpsx6aqxby4TrQxAF2IFLez/0aS7Y6JcYVWhmjDw
 ZXj5yLAsV6k6y7RWLt8bgp8GUtIvhWd/hyyY3Fp2mcMGM2pXriVfP2T6+kE3eANEliRnBx
 pLTG/Ct4P+1akxHoXhAAEZg7Uq/2OuQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-B8jtj1FhMQ2boZ3Gz3W8Dw-1; Thu, 16 Dec 2021 09:15:57 -0500
X-MC-Unique: B8jtj1FhMQ2boZ3Gz3W8Dw-1
Received: by mail-qv1-f71.google.com with SMTP id
 kd7-20020a056214400700b003b54713452cso33775904qvb.13
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 06:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A/154nDtcl0abUR1X17O26OOPGbND8Z9iqs2dt/zlU4=;
 b=B+fk8wanTjRI2VLuCiYJgOtpYeAzphVI8aNJmnxNMdet+7uK17x0iUV2zJrhLmgajW
 IFSj7QvIiiSzpAyENV6kVuRF9n5MsPnbFEXTFM593ZxPikPKvM7N77CR515MxtbnDdZT
 0Q5/AUJfudSQ8oNdHH+Zdir0Sk+NHbMKzju+j8no5ftwQpQ708sB8A5rVxVeHo32jNxx
 VoIwvKMJT1Tvgwx/GJqKyBmieLn8Y5YPKIrOMM4v+aHPQHp2N0UpoF6/lGwJYXZ8hcmv
 1FjlKZfw8NZWsfM903MFSZJWa3Gc3HhgEUZnp5tAXxaALCwWZFDcYeh73mkU+OpORrIy
 WRXw==
X-Gm-Message-State: AOAM531NUCU22zgPmdcfJupGWbpGmmJxLDNA4IAjM2JvMNgQyTjduzxy
 8vaFtxAjrbq8gk9FowG67DJNNFDKyfOjrwfjHD+bCyZD/mu/tYPRkNTCrEaaF2Sn8KoEF+ngmSX
 GYwD8S3EYw5tYMBc=
X-Received: by 2002:a05:620a:bd6:: with SMTP id
 s22mr12146807qki.348.1639664157075; 
 Thu, 16 Dec 2021 06:15:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZq+GWvLnGEojaOXKvplrYcZMMBMoONo+1k5Qfuxe2orS+59SRzkDM1Eg7pLTnlLZ6MjgqAg==
X-Received: by 2002:a05:620a:bd6:: with SMTP id
 s22mr12146792qki.348.1639664156772; 
 Thu, 16 Dec 2021 06:15:56 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id s20sm4335238qtc.75.2021.12.16.06.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 06:15:53 -0800 (PST)
Date: Thu, 16 Dec 2021 11:15:52 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 22/25] python/aqmp: copy qmp docstrings to
 qemu.aqmp.legacy
Message-ID: <20211216141552.r44ltilhzxayxjax@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-23-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-23-jsnow@redhat.com>
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

On Wed, Dec 15, 2021 at 02:39:36PM -0500, John Snow wrote:
> Copy the docstrings out of qemu.qmp, adjusting them as necessary to
> more accurately reflect the current state of this class.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/legacy.py | 110 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 102 insertions(+), 8 deletions(-)
> 
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 8f38e7d912..6c250cd46a 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py
> @@ -1,9 +1,23 @@
>  """
> -Sync QMP Wrapper
> +(Legacy) Sync QMP Wrapper
>  
> -This class pretends to be qemu.qmp.QEMUMonitorProtocol.
> +This module provides the `QEMUMonitorProtocol` class, which is a
> +synchronous wrapper around `QMPClient`.
> +
> +Its design closely resembles that of the original QEMUMonitorProtocol
> +class, originally written by Luiz Capitulino.
>  """
>  
> +# Copyright (C) 2009, 2010, 2021 Red Hat Inc.
> +#
> +# Authors:
> +#  Luiz Capitulino <lcapitulino@redhat.com>
> +#  John Snow <jsnow@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.
> +# See the COPYING file in the top-level directory.
> +
> +
>  import asyncio
>  from types import TracebackType
>  from typing import (
> @@ -39,9 +53,6 @@
>  # {} is the QMPReturnValue.
>  
>  
> -# pylint: disable=missing-docstring
> -
> -
>  class QMPBadPortError(QMPError):
>      """
>      Unable to parse socket address: Port was non-numerical.
> @@ -49,6 +60,21 @@ class QMPBadPortError(QMPError):
>  
>  
>  class QEMUMonitorProtocol:
> +    """
> +    Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP)
> +    and then allow to handle commands and events.
> +
> +    :param address:  QEMU address, can be either a unix socket path (string)
> +                     or a tuple in the form ( address, port ) for a TCP
> +                     connection
> +    :param server:   Deprecated, ignored. (See 'accept')
> +    :param nickname: Optional nickname used for logging.
> +
> +    ..note::
> +        No connection is established during `__init__`, this is done by
> +        the `connect()` or `accept()` methods.
> +    """
> +
>      def __init__(self, address: SocketAddrT,
>                   server: bool = False,  # pylint: disable=unused-argument
>                   nickname: Optional[str] = None):
> @@ -108,6 +134,12 @@ def parse_address(cls, address: str) -> SocketAddrT:
>          return address
>  
>      def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
> +        """
> +        Connect to the QMP Monitor and perform capabilities negotiation.
> +
> +        :return: QMP greeting dict, or None if negotiate is false
> +        :raise ConnectError: on connection errors
> +        """
>          self._aqmp.await_greeting = negotiate
>          self._aqmp.negotiate = negotiate
>  
> @@ -117,6 +149,16 @@ def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
>          return self._get_greeting()
>  
>      def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
> +        """
> +        Await connection from QMP Monitor and perform capabilities negotiation.
> +
> +        :param timeout:
> +            timeout in seconds (nonnegative float number, or None).
> +            If None, there is no timeout, and this may block forever.
> +
> +        :return: QMP greeting dict
> +        :raise ConnectError: on connection errors
> +        """
>          self._aqmp.await_greeting = True
>          self._aqmp.negotiate = True
>  
> @@ -130,6 +172,12 @@ def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
>          return ret
>  
>      def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
> +        """
> +        Send a QMP command to the QMP Monitor.
> +
> +        :param qmp_cmd: QMP command to be sent as a Python dict
> +        :return: QMP response as a Python dict
> +        """
>          return dict(
>              self._sync(
>                  # pylint: disable=protected-access
> @@ -148,9 +196,9 @@ def cmd(self, name: str,
>          """
>          Build a QMP command and send it to the QMP Monitor.
>  
> -        @param name: command name (string)
> -        @param args: command arguments (dict)
> -        @param cmd_id: command id (dict, list, string or int)
> +        :param name: command name (string)
> +        :param args: command arguments (dict)
> +        :param cmd_id: command id (dict, list, string or int)
>          """
>          qmp_cmd: QMPMessage = {'execute': name}
>          if args:
> @@ -160,6 +208,9 @@ def cmd(self, name: str,
>          return self.cmd_obj(qmp_cmd)
>  
>      def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
> +        """
> +        Build and send a QMP command to the monitor, report errors if any
> +        """
>          return self._sync(
>              self._aqmp.execute(cmd, kwds),
>              self._timeout
> @@ -167,6 +218,19 @@ def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
>  
>      def pull_event(self,
>                     wait: Union[bool, float] = False) -> Optional[QMPMessage]:
> +        """
> +        Pulls a single event.
> +
> +        :param wait:
> +            If False or 0, do not wait. Return None if no events ready.
> +            If True, wait forever until the next event.
> +            Otherwise, wait for the specified number of seconds.
> +
> +        :raise asyncio.TimeoutError:
> +            When a timeout is requested and the timeout period elapses.
> +
> +        :return: The first available QMP event, or None.
> +        """
>          if not wait:
>              # wait is False/0: "do not wait, do not except."
>              if self._aqmp.events.empty():
> @@ -187,6 +251,20 @@ def pull_event(self,
>          )
>  
>      def get_events(self, wait: Union[bool, float] = False) -> List[QMPMessage]:
> +        """
> +        Get a list of QMP events and clear all pending events.
> +
> +        :param wait:
> +            If False or 0, do not wait. Return None if no events ready.
> +            If True, wait until we have at least one event.
> +            Otherwise, wait for up to the specified number of seconds for at
> +            least one event.
> +
> +        :raise asyncio.TimeoutError:
> +            When a timeout is requested and the timeout period elapses.
> +
> +        :return: A list of QMP events.
> +        """
>          events = [dict(x) for x in self._aqmp.events.clear()]
>          if events:
>              return events
> @@ -195,17 +273,33 @@ def get_events(self, wait: Union[bool, float] = False) -> List[QMPMessage]:
>          return [event] if event is not None else []
>  
>      def clear_events(self) -> None:
> +        """Clear current list of pending events."""
>          self._aqmp.events.clear()
>  
>      def close(self) -> None:
> +        """Close the connection."""
>          self._sync(
>              self._aqmp.disconnect()
>          )
>  
>      def settimeout(self, timeout: Optional[float]) -> None:
> +        """
> +        Set the timeout for QMP RPC execution.
> +
> +        This timeout affects the `cmd`, `cmd_obj`, and `command` methods.
> +        The `accept`, `pull_event` and `get_event` methods have their
> +        own configurable timeouts.
> +
> +        :param timeout:
> +            timeout in seconds, or None.
> +            None will wait indefinitely.
> +        """
>          self._timeout = timeout
>  
>      def send_fd_scm(self, fd: int) -> None:
> +        """
> +        Send a file descriptor to the remote via SCM_RIGHTS.
> +        """
>          self._aqmp.send_fd_scm(fd)
>  
>      def __del__(self) -> None:

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


