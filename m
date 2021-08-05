Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C806B3E1DB0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 23:04:05 +0200 (CEST)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBkX2-0002U9-13
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 17:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBkW4-0001oD-7f
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 17:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBkW0-0004AP-HB
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 17:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628197375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AGSTfUdjU9VCvpFGiZEjSe9fJWwGUkJmaCETdzGIiTc=;
 b=fxsOx830+L6KL19RL0au1A584Arm8osbcgXdYWj9uWlo71nrtsNrQE5fv19zI3otZRl+Uj
 g4eJHc9lD8mzkcwn8I93yu8VAXLjrs3djdeo33CQ1Vpq+zarUL6/Cqq2Z717s9OUgFLVYn
 tM5PTL/MpFpb0PBGsocYLBPxFBC46Qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-kskdFf4aNjOFVHr3Lip7Ow-1; Thu, 05 Aug 2021 17:02:52 -0400
X-MC-Unique: kskdFf4aNjOFVHr3Lip7Ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E58CC87D541;
 Thu,  5 Aug 2021 21:02:51 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 851995C1B4;
 Thu,  5 Aug 2021 21:02:43 +0000 (UTC)
Date: Thu, 5 Aug 2021 16:02:41 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 06/25] python/aqmp: add runstate state machine to
 AsyncProtocol
Message-ID: <20210805210241.ey36xvb57clvl3r5@redhat.com>
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803182941.504537-7-jsnow@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 02:29:22PM -0400, John Snow wrote:
> This serves a few purposes:
> 
> 1. Protect interfaces when it's not safe to call them (via @require)
> 
> 2. Add an interface by which an async client can determine if the state
> has changed, for the purposes of connection management.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/__init__.py |   6 +-
>  python/qemu/aqmp/protocol.py | 159 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 160 insertions(+), 5 deletions(-)
> 

> +++ b/python/qemu/aqmp/protocol.py
> +
> +F = TypeVar('F', bound=Callable[..., Any])  # pylint: disable=invalid-name
> +
> +
> +# Don't Panic.
> +def require(required_state: Runstate) -> Callable[[F], F]:

Technically, the definition of F is integral to the definition of
require, so I might have put the 'Don't Panic' note a bit sooner.  And
it took me a while before I noticed...

> +    """
> +    Decorator: protect a method so it can only be run in a certain `Runstate`.
> +
> +    :param required_state: The `Runstate` required to invoke this method.
> +    :raise StateError: When the required `Runstate` is not met.
> +    """
> +    def _decorator(func: F) -> F:
> +        # _decorator is the decorator that is built by calling the
> +        # require() decorator factory; e.g.:
> +        #
> +        # @require(Runstate.IDLE) def # foo(): ...

Is that second # intentional?

> +        # will replace 'foo' with the result of '_decorator(foo)'.
> +
> +        @wraps(func)
> +        def _wrapper(proto: 'AsyncProtocol[Any]',
> +                     *args: Any, **kwargs: Any) -> Any:
> +            # _wrapper is the function that gets executed prior to the
> +            # decorated method.
> +
> +            name = type(proto).__name__
> +
> +            if proto.runstate != required_state:
> +                if proto.runstate == Runstate.CONNECTING:
> +                    emsg = f"{name} is currently connecting."
> +                elif proto.runstate == Runstate.DISCONNECTING:
> +                    emsg = (f"{name} is disconnecting."
> +                            " Call disconnect() to return to IDLE state.")
> +                elif proto.runstate == Runstate.RUNNING:
> +                    emsg = f"{name} is already connected and running."
> +                elif proto.runstate == Runstate.IDLE:
> +                    emsg = f"{name} is disconnected and idle."
> +                else:
> +                    assert False
> +                raise StateError(emsg, proto.runstate, required_state)
> +            # No StateError, so call the wrapped method.
> +            return func(proto, *args, **kwargs)
> +
> +        # Return the decorated method;
> +        # Transforming Func to Decorated[Func].
> +        return cast(F, _wrapper)
> +
> +    # Return the decorator instance from the decorator factory. Phew!
> +    return _decorator

...that it paired with this comment, explaining what looks like a
monstrosity, but in reality is a fairly typical and boilerplate
implementation of a function decorator (not that you write one every
day - the whole point of the decorator is to have a one-word
abstraction already implemented so you DON'T have to reimplement the
decoration yourself ;).

> +
> +
>  class AsyncProtocol(Generic[T]):
>      """
>      AsyncProtocol implements a generic async message-based protocol.
> @@ -118,7 +202,24 @@ def __init__(self) -> None:
>          #: exit.
>          self._dc_task: Optional[asyncio.Future[None]] = None
>  
> +        self._runstate = Runstate.IDLE
> +        self._runstate_changed: Optional[asyncio.Event] = None
> +
> +    @property  # @upper_half

Is it intentional to leave the @upper_half decorator commented out?

But that's minor enough that I trust you to handle it as you see fit.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


