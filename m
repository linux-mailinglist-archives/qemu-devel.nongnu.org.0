Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031275680B8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:04:58 +0200 (CEST)
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o901o-0006XQ-I7
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8zzQ-0005qK-RE
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8zzL-0002Gd-9Y
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657094542;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sTojb53BQ/0LIb0n4lGZhjPuVQmzb8ZAHO52eVUWpnM=;
 b=eUv35Iqv2D40byxlB7Vet2aGmFFcYjzmyeTocozjvJ+l/kzYdP792umsVtCUbJ31607LhJ
 xTFXkyHtaoK/MvKkoyyAjiQO0KedsbQRM5PHdYpJtjgONfFnVXeo15astcniZwIepOdJFF
 wXSuGkWVR4O8j8eKbpmmLcEj+xb9SGI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-ubM0ovmsMISoIA9zzl84WQ-1; Wed, 06 Jul 2022 04:02:19 -0400
X-MC-Unique: ubM0ovmsMISoIA9zzl84WQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0AF13C02B8D;
 Wed,  6 Jul 2022 08:02:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE6511121315;
 Wed,  6 Jul 2022 08:02:17 +0000 (UTC)
Date: Wed, 6 Jul 2022 09:02:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Delevoryas <peter@pjd.dev>
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH RESEND] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <YsVBhmvAm2ANDUEt@redhat.com>
References: <20220705214659.73369-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220705214659.73369-1-peter@pjd.dev>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 05, 2022 at 02:46:59PM -0700, Peter Delevoryas wrote:
> I noticed that I can't run any avocado tests on macOS because the QMP
> unix socket path is too long:


> I think the path limit for unix sockets on macOS might be 104 [1]

All platforms have a very limited path limit, so it isn't really
a macOS specific problem, rather....

> 
> /*
>  * [XSI] Definitions for UNIX IPC domain.
>  */
> struct  sockaddr_un {
>     unsigned char   sun_len;        /* sockaddr len including null */
>     sa_family_t     sun_family;     /* [XSI] AF_UNIX */
>     char            sun_path[104];  /* [XSI] path name (gag) */
> };
> 
> The path we're using is exactly 105 characters:
> 
> $ python
> Python 2.7.10 (default, Jan 19 2016, 22:24:01)
> [GCC 4.2.1 Compatible Apple LLVM 7.0.2 (clang-700.1.81)] on darwin
> Type "help", "copyright", "credits" or "license" for more information.
> >>> len('/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock')

It is a problem related to where the test suite is creating the
paths.

/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/

is way too deep a directory location.

It seems we just create this location using 'tempfile.TemporyDirectory'
to get a standard tmp dir.

Do you know why python is choosing

  /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/

as the temp dir ? Is that a standard location on macOS or is it
from some env variable you have set ?

> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 37191f433b..93451774e3 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -157,7 +157,7 @@ def __init__(self,
>          self._wrapper = wrapper
>          self._qmp_timer = qmp_timer
>  
> -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> +        self._name = name or f"{os.getpid()}{id(self):02x}"

I don't think this is the right fix really, because IMHO the problem
is the hugely long path, rather than the final socket name.

That said, there is redundancy in the path - avocado is passing in
a dierctory created using 'tempfile.TemporyDirectory' so there is no
reason why we need to add more entropy via the POD and the 'id(self)'
hex string.

IMHO avocado should pass in the 'name' parameter explicitly, using a
plain name and thus get a shorter string.

>          self._temp_dir: Optional[str] = None
>          self._base_temp_dir = base_temp_dir
>          self._sock_dir = sock_dir
> @@ -167,7 +167,7 @@ def __init__(self,
>              self._monitor_address = monitor_address
>          else:
>              self._monitor_address = os.path.join(
> -                self.sock_dir, f"{self._name}-monitor.sock"
> +                self.sock_dir, f"{self._name}.sock"
>              )
>  
>          self._console_log_path = console_log
> -- 
> 2.37.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


