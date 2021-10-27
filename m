Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9787743C873
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 13:21:59 +0200 (CEST)
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfh0H-0002OV-B2
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 07:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfgy5-0001ES-Lo
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfgy1-0003lg-P3
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635333575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a+qhmB4QeKuc8VXyVqptY7RqZjvf3L01arrUvwBFmkA=;
 b=Y6kDpqGEI2USIPKjKvcfo3+DJUJU6KbTvzZoxE7JBFmU41msxn5/0LxV3BA2FaiNRqoTB1
 cd/S9AA0Imbqk6GgyXieDqvM5yj9pe8lq8eLNihG4mqFjsZooOBVe4K91/b82xMJVrGLLt
 93+butRJBRAxPMPvFHq8CfIBo3zqbnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-64H--qpTMC2HVzpZ0FD7jg-1; Wed, 27 Oct 2021 07:19:34 -0400
X-MC-Unique: 64H--qpTMC2HVzpZ0FD7jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C95BF100D681;
 Wed, 27 Oct 2021 11:19:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DFF819D9D;
 Wed, 27 Oct 2021 11:19:30 +0000 (UTC)
Date: Wed, 27 Oct 2021 13:19:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 2/8] python/machine: Handle QMP errors on close more
 meticulously
Message-ID: <YXk1wbRWNLlvXxMU@redhat.com>
References: <20211026175612.4127598-1-jsnow@redhat.com>
 <20211026175612.4127598-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026175612.4127598-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2021 um 19:56 hat John Snow geschrieben:
> To use the AQMP backend, Machine just needs to be a little more diligent
> about what happens when closing a QMP connection. The operation is no
> longer a freebie in the async world; it may return errors encountered in
> the async bottom half on incoming message receipt, etc.
> 
> (AQMP's disconnect, ultimately, serves as the quiescence point where all
> async contexts are gathered together, and any final errors reported at
> that point.)
> 
> Because async QMP continues to check for messages asynchronously, it's
> almost certainly likely that the loop will have exited due to EOF after
> issuing the last 'quit' command. That error will ultimately be bubbled
> up when attempting to close the QMP connection. The manager class here
> then is free to discard it -- if it was expected.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  python/qemu/machine/machine.py | 48 +++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 0bd40bc2f76..a0cf69786b4 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -342,9 +342,15 @@ def _post_shutdown(self) -> None:
>          # Comprehensive reset for the failed launch case:
>          self._early_cleanup()
>  
> -        if self._qmp_connection:
> -            self._qmp.close()
> -            self._qmp_connection = None
> +        try:
> +            self._close_qmp_connection()
> +        except Exception as err:  # pylint: disable=broad-except
> +            LOG.warning(
> +                "Exception closing QMP connection: %s",
> +                str(err) if str(err) else type(err).__name__
> +            )
> +        finally:
> +            assert self._qmp_connection is None
>  
>          self._close_qemu_log_file()
>  
> @@ -420,6 +426,31 @@ def _launch(self) -> None:
>                                         close_fds=False)
>          self._post_launch()
>  
> +    def _close_qmp_connection(self) -> None:
> +        """
> +        Close the underlying QMP connection, if any.
> +
> +        Dutifully report errors that occurred while closing, but assume
> +        that any error encountered indicates an abnormal termination
> +        process and not a failure to close.
> +        """
> +        if self._qmp_connection is None:
> +            return
> +
> +        try:
> +            self._qmp.close()
> +        except EOFError:
> +            # EOF can occur as an Exception here when using the Async
> +            # QMP backend. It indicates that the server closed the
> +            # stream. If we successfully issued 'quit' at any point,
> +            # then this was expected. If the remote went away without
> +            # our permission, it's worth reporting that as an abnormal
> +            # shutdown case.
> +            if not (self._user_killed or self._quit_issued):
> +                raise

Isn't this racy for those tests that expect QEMU to quit by itself and
then later call wait()? self._quit_issued is only set to True in wait(),
but whatever will cause QEMU to quit happens earlier and it might
actually quit before wait() is called.

It would make sense to me that such tests need to declare that they
expect QEMU to quit before actually performing the action. And then
wait() becomes less weird in patch 1, too, because it can just assert
self._quit_issued instead of unconditionally setting it.


The other point I'm unsure is whether you can actually kill QEMU without
getting either self._user_killed or self._quit_issued set. The
potentially problematic case I see is shutdown(hard = False) where soft
shutdown fails. Then a hard shutdown will be performed without setting
self._user_killed (is this a bug?).

Of course, sending the 'quit' command in _soft_shutdown() will set
self._quit_issued at least, but are we absolutely sure that it can never
raise an exception before getting to qmp()? I guess in theory, closing
the console socket in _early_cleanup() could raise one? (But either way,
not relying on such subtleties would make the code easier to
understand.)

Kevin


