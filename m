Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F8557FE66
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 13:32:08 +0200 (CEST)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFwJj-0003LM-6m
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 07:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFwHJ-0001Zk-74
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:29:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFwHE-0005em-1y
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658748571;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mw+mud1ofr2UYgRSpx1ZK7Xb2PUOXexlMdzs/+lEcVU=;
 b=GaNLAarVXxcncm4TmMUnYbWdF6vKHbg5oWsro0qXiB9NOToFhLJOoYplGsMBFDu+tE6Qk3
 llU8PEocv6GRgcGGDuI1X0EeqKbObMvKLftAroNEa+5bNd/zvxXYMyYYcXpW18gA/Mbw/w
 9hvONXQvOc5WSoXy2x5/kGl/TAZ+wkY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-oFALs9dHOIauqg83wFTW8g-1; Mon, 25 Jul 2022 07:29:28 -0400
X-MC-Unique: oFALs9dHOIauqg83wFTW8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEE738037AA;
 Mon, 25 Jul 2022 11:29:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 890FC2166B26;
 Mon, 25 Jul 2022 11:29:24 +0000 (UTC)
Date: Mon, 25 Jul 2022 12:29:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v2 3/3] python/qemu/machine: use socketpair() for QMP by
 default
Message-ID: <Yt5+jycxnO6Jh1qa@redhat.com>
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
 <20220630123419.1019367-4-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630123419.1019367-4-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On Thu, Jun 30, 2022 at 04:34:19PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> When no monitor address is given, establish the QMP communication through
> a socketpair() (API is also supported on Windows since Python 3.5)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 37191f433b2d..aa1d9447352d 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -158,17 +158,13 @@ def __init__(self,
>          self._qmp_timer = qmp_timer
>  
>          self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> +        self._sock_pair: Optional[Tuple[socket.socket, socket.socket]] = None
>          self._temp_dir: Optional[str] = None
>          self._base_temp_dir = base_temp_dir
>          self._sock_dir = sock_dir
>          self._log_dir = log_dir
>  
> -        if monitor_address is not None:
> -            self._monitor_address = monitor_address
> -        else:
> -            self._monitor_address = os.path.join(
> -                self.sock_dir, f"{self._name}-monitor.sock"
> -            )
> +        self._monitor_address = monitor_address

Almost nothing in QEMU passes 'monitor_address' right now, so thue effect
of this will be that essentially all usage switches to the socketpair
behaviour. Should be ok, as nothing is expecting to have the ability to
leave QEMU running, and re-connect to its monitor in another process
later.

>  
>          self._console_log_path = console_log
>          if self._console_log_path:
> @@ -303,7 +299,11 @@ def _base_args(self) -> List[str]:
>          args = ['-display', 'none', '-vga', 'none']
>  
>          if self._qmp_set:
> -            if isinstance(self._monitor_address, tuple):
> +            if self._sock_pair:
> +                fd = self._sock_pair[0].fileno()
> +                os.set_inheritable(fd, True)
> +                moncdev = f"socket,id=mon,fd={fd}"
> +            elif isinstance(self._monitor_address, tuple):
>                  moncdev = "socket,id=mon,host={},port={}".format(
>                      *self._monitor_address
>                  )
> @@ -337,10 +337,17 @@ def _pre_launch(self) -> None:
>              self._remove_files.append(self._console_address)
>  
>          if self._qmp_set:
> +            monitor_address = None
> +            sock = None
> +            if self._monitor_address is None:
> +                self._sock_pair = socket.socketpair()
> +                sock = self._sock_pair[1]
>              if isinstance(self._monitor_address, str):
>                  self._remove_files.append(self._monitor_address)
> +                monitor_address = self._monitor_address
>              self._qmp_connection = QEMUMonitorProtocol(
> -                self._monitor_address,
> +                address=monitor_address,
> +                sock=sock,
>                  server=True,
>                  nickname=self._name
>              )
> @@ -360,6 +367,7 @@ def _pre_launch(self) -> None:
>          ))
>  
>      def _post_launch(self) -> None:
> +        self._sock_pair[0].close()
>          if self._qmp_connection:
>              self._qmp.accept(self._qmp_timer)
>  
> -- 
> 2.37.0.rc0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


