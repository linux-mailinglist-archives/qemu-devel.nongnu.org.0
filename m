Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877A55E549
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:20:15 +0200 (CEST)
Received: from localhost ([::1]:34878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6C4c-0007re-As
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6C2c-0006Qa-Ia
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:18:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6C2Z-0003iu-9q
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656425886;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfkoGla9yV2IApAdDInulzPRAtcK3Cgvt3Kl2iWt/Aw=;
 b=EhtOMFrASTYQwOmtmlsnfY0R3QmND9lHjSSw2A3JZQoLN4TpAiLIKFHkhno2OkzPOFB5v5
 cA+28zDCioflkRkKlgL9VvWxeXpGTP2U5Rc9ACJSTnv/Vpp1h6GD6smAFAZ37Sw0pHrNzm
 4zdsI78KFQRcudIxC/QdVaOWD9HSxTs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-B81wodacOXKo7Fh0e9sVPQ-1; Tue, 28 Jun 2022 10:18:04 -0400
X-MC-Unique: B81wodacOXKo7Fh0e9sVPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FF2A1C0750E;
 Tue, 28 Jun 2022 14:17:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0446040CFD0B;
 Tue, 28 Jun 2022 14:17:10 +0000 (UTC)
Date: Tue, 28 Jun 2022 15:17:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 2/2] python/qemu/machine: accept QMP connection
 asynchronously
Message-ID: <YrsNZAznZrxUr/zr@redhat.com>
References: <20220628134939.680174-1-marcandre.lureau@redhat.com>
 <20220628134939.680174-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628134939.680174-3-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 05:49:39PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> QMP accept is currently synchronous. If qemu dies before the connection
> is established, it will wait there. Instead turn the code to do
> concurrently accept() and wait(). Returns when the first task is
> completed to determine whether a connection was established.

If the spawned QEMU process was given -daemonize, won't this code
mistakenly think the subprocess has quit ?

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  python/qemu/machine/machine.py | 11 ++++++++++-
>  python/qemu/qmp/legacy.py      | 10 ++++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 55c45f4b1205..5e2df7dc5055 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -362,9 +362,18 @@ def _pre_launch(self) -> None:
>              self._args
>          ))
>  
> +    async def _async_accept(self) -> bool:
> +        accept = asyncio.create_task(self._qmp.async_accept())
> +        wait = asyncio.create_task(self._subproc.wait())
> +        done, pending = await asyncio.wait([accept, wait],
> +                                           return_when=asyncio.FIRST_COMPLETED)
> +        return accept in done
> +
>      def _post_launch(self) -> None:
>          if self._qmp_connection:
> -            self._qmp.accept(self._qmp_timer)
> +            accepted = self._sync(self._async_accept())
> +            if not accepted:
> +                raise QEMUMachineError('VM returned before QMP accept')
>  
>      def _close_qemu_log_file(self) -> None:
>          if self._qemu_log_file is not None:
> diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
> index 03b5574618fa..88bdbfb6e350 100644
> --- a/python/qemu/qmp/legacy.py
> +++ b/python/qemu/qmp/legacy.py
> @@ -167,6 +167,16 @@ def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
>          assert ret is not None
>          return ret
>  
> +    async def async_accept(self) -> QMPMessage:
> +        self._qmp.await_greeting = True
> +        self._qmp.negotiate = True
> +
> +        await self._qmp.accept()
> +
> +        ret = self._get_greeting()
> +        assert ret is not None
> +        return ret
> +


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


