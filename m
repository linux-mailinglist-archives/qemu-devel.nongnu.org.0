Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791CA60C70B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:57:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFbs-0001EZ-IW; Tue, 25 Oct 2022 04:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onFEv-0004uN-0G
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onFEs-0002rt-I1
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666686284;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qq4YFIr86yxaTwN/UDJAX9uwhe8IDOu+8gi5WwKSmiM=;
 b=f4fc2a7c9R7BCcTPOwhdfWE4Z/rDTZ81ICMvpTfWhgEGltO/bwzZiw0m8795v0SrkGEGLb
 NoGN2V/YN1qhb48+IEOwHxoiBXOCB+21f1yDhbpInbOxgX4WapOSqQmmKxGzkm0/ogPth1
 4Ecr6X2HKIwZItvlH17VtC7g98r3X/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-Wux8yVosO-KsARZeAO09cg-1; Tue, 25 Oct 2022 04:24:42 -0400
X-MC-Unique: Wux8yVosO-KsARZeAO09cg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 385B4185A78F
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:24:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 426D8477F5C;
 Tue, 25 Oct 2022 08:24:41 +0000 (UTC)
Date: Tue, 25 Oct 2022 09:24:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 1/2] python/machine: Add debug logging to key state changes
Message-ID: <Y1edRZ5nDcXu074W@redhat.com>
References: <20221024195355.860504-1-jsnow@redhat.com>
 <20221024195355.860504-2-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221024195355.860504-2-jsnow@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24, 2022 at 03:53:54PM -0400, John Snow wrote:
> When key decisions are made about the lifetime of the VM process being
> managed, there's no log entry. Juxtaposed with the very verbose runstate
> change logging of the QMP module, machine seems a bit too introverted
> now.
> 
> Season the machine.py module with logging statements to taste to help
> make a tastier soup.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 37191f433b2..c467f951d5d 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -373,6 +373,7 @@ def _post_shutdown(self) -> None:
>          Called to cleanup the VM instance after the process has exited.
>          May also be called after a failed launch.
>          """
> +        LOG.debug("Cleaning up after VM process")
>          try:
>              self._close_qmp_connection()
>          except Exception as err:  # pylint: disable=broad-except
> @@ -497,6 +498,7 @@ def _early_cleanup(self) -> None:
>          # for QEMU to exit, while QEMU is waiting for the socket to
>          # become writable.
>          if self._console_socket is not None:
> +            LOG.debug("Closing console socket")
>              self._console_socket.close()
>              self._console_socket = None
>  
> @@ -507,6 +509,7 @@ def _hard_shutdown(self) -> None:
>          :raise subprocess.Timeout: When timeout is exceeds 60 seconds
>              waiting for the QEMU process to terminate.
>          """
> +        LOG.debug("Performing hard shutdown")
>          self._early_cleanup()
>          self._subp.kill()
>          self._subp.wait(timeout=60)
> @@ -523,6 +526,13 @@ def _soft_shutdown(self, timeout: Optional[int]) -> None:
>          :raise subprocess.TimeoutExpired: When timeout is exceeded waiting for
>              the QEMU process to terminate.
>          """
> +        LOG.debug("Attempting graceful termination")
> +        if self._quit_issued:
> +            LOG.debug(
> +                "Anticipating QEMU termination due to prior 'quit' command, "
> +                "or explicit call to wait()"
> +            )
> +
>          self._early_cleanup()
>  
>          if self._qmp_connection:
> @@ -553,6 +563,10 @@ def _do_shutdown(self, timeout: Optional[int]) -> None:
>          try:
>              self._soft_shutdown(timeout)
>          except Exception as exc:
> +            if isinstance(exc, subprocess.TimeoutExpired):
> +                LOG.debug("Timed out waiting for QEMU process to exit")
> +            LOG.debug("Graceful shutdown failed, "
> +                      "falling back to hard shutdown")

If you add 'exc_info=True' when logging from inside an 'except'
clause, it captures the stack trace which is often critical for
debugging unexpected exceptions, especially when you're catchintg
the top level 'Exception' class instead of a very specialized
class.

>              self._hard_shutdown()
>              raise AbnormalShutdown("Could not perform graceful shutdown") \
>                  from exc
> @@ -575,6 +589,10 @@ def shutdown(self,
>          if not self._launched:
>              return
>  
> +        LOG.debug("Shutting down VM appliance; timeout=%s", timeout)
> +        if hard:
> +            LOG.debug("Caller requests immediate termination of QEMU process.")
> +
>          try:
>              if hard:
>                  self._user_killed = True
> -- 
> 2.37.3
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


