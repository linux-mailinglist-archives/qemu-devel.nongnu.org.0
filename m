Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8793233D172
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:10:45 +0100 (CET)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM6ey-0004TE-2i
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM6dt-00041o-EI
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM6dq-0002YK-NY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615889372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DI8uzTKROJQUEgb+u4gSe/Wx8sjzHC1oswHPJrBeFPo=;
 b=JjxsuHtQU04+Ll2YJvgcXC2Q1FIZywG5fGebnIDZCxD0kL8OhaSAFptAHAuaWQdZT1BeBk
 lN4ReEBAQqlb5pUYNwUfBfcjlLIHKLIFvY7mEaGz3kxr2L+1Rnv8r8h7CqScWiowKRg6/4
 tip7DvIBFHQqihyBTODk+E+2HQtFD1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-TaihP2LiPimPIphRXA7qpg-1; Tue, 16 Mar 2021 06:09:30 -0400
X-MC-Unique: TaihP2LiPimPIphRXA7qpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F3AA802B7A
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:09:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8078546;
 Tue, 16 Mar 2021 10:09:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DDDA01132C12; Tue, 16 Mar 2021 11:09:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: libqemuutil
References: <87zgz38o0v.fsf@dusky.pond.sub.org>
 <d0c5aa88-029e-4328-7a53-482a3010c5f8@redhat.com>
Date: Tue, 16 Mar 2021 11:09:20 +0100
In-Reply-To: <d0c5aa88-029e-4328-7a53-482a3010c5f8@redhat.com> (Paolo
 Bonzini's message of "Tue, 16 Mar 2021 10:28:43 +0100")
Message-ID: <87zgz34dgv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 16/03/21 10:07, Markus Armbruster wrote:
>> I suspect the linker happens to pick the one that makes things work,
>> until something in my patch makes it pick the other one.
>
> Ouch.  Fortunately the stub is unnecessary and can be removed.
>
> ----------- 8< ------------
> From fe45350cc11434efe3461c540bb0f258bbe010f7 Mon Sep 17 00:00:00 2001
> From: Paolo Bonzini <pbonzini@redhat.com>
> Date: Tue, 16 Mar 2021 05:25:48 -0400
> Subject: [PATCH] qemuutil: remove qemu_set_fd_handler duplicate symbol
>
> libqemuutil has two definitions of qemu_set_fd_handler.  This
> is not needed since the only users of the function are
> qemu-io.c and the emulators, both of which already include
> util/main-loop.c.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> diff --git a/stubs/meson.build b/stubs/meson.build
> index a054d5877f..8a3e804cf0 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -34,7 +34,6 @@ stub_ss.add(files('ram-block.c'))
>  stub_ss.add(files('ramfb.c'))
>  stub_ss.add(files('replay.c'))
>  stub_ss.add(files('runstate-check.c'))
> -stub_ss.add(files('set-fd-handler.c'))
>  stub_ss.add(files('sysbus.c'))
>  stub_ss.add(files('target-get-monitor-def.c'))
>  stub_ss.add(files('target-monitor-defs.c'))
> diff --git a/stubs/set-fd-handler.c b/stubs/set-fd-handler.c
> deleted file mode 100644
> index bff7e0a45a..0000000000
> --- a/stubs/set-fd-handler.c
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -#include "qemu/osdep.h"
> -#include "qemu/main-loop.h"
> -
> -void qemu_set_fd_handler(int fd,
> -                         IOHandler *fd_read,
> -                         IOHandler *fd_write,
> -                         void *opaque)
> -{
> -    abort();
> -}

Tested-by: Markus Armbruster <armbru@redhat.com>

I'll include this in my pull request, if you don't mind.

>> Is qemu_set_fd_handler() the only one?  Nope:
>>      $ nm --defined-only bld-x86/libqemuutil.a | awk '/ T / { print
>> $NF }' | sort | uniq -c | grep -v '^ *1 '
>>            2 qemu_set_fd_handler
>>            2 yank_generic_iochannel
>>            2 yank_register_function
>>            2 yank_register_instance
>>            2 yank_unregister_function
>>            2 yank_unregister_instance
>> I didn't run into this issue when I posted my series last Friday.
>> The
>> issue now blocks its merge, and today is the soft freeze.  Help!
>
> For yank_*, I suggest moving the non-stub version to monitor/ and
> adding it to the qmp_ss sourceset.

I can give it a try after the soft freeze.


