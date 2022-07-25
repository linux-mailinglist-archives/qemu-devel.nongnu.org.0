Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BAB57FE28
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 13:15:27 +0200 (CEST)
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFw3Z-00050z-IU
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 07:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFw1m-0003PP-Cm
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFw1i-0002r0-6G
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658747608;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UdqucLx+7i9LXxGjGcpFy1fnVRGt8feuyxatqC2B7xA=;
 b=eLGJSBip2rBjkZWk8oZnLjLQrdmbI1H1ACEpaDT0gOcY7HV7zuHF+4Zqr05+la8Qv/Lb2C
 qpUpuhfuALMhfpPbYxOFMb4yKuFlyZguCwjimN0v45ybOKhW6wWn6WLBqLGOABv01E3fzA
 X5dM58MFYrHsc6P/Wf5Con91GGbXe3Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-Uh0gUGVNNSaESPaDobbJAg-1; Mon, 25 Jul 2022 07:13:27 -0400
X-MC-Unique: Uh0gUGVNNSaESPaDobbJAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DBCA185A794;
 Mon, 25 Jul 2022 11:13:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C34D2166B26;
 Mon, 25 Jul 2022 11:13:26 +0000 (UTC)
Date: Mon, 25 Jul 2022 12:13:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Jon Alduan <jon.alduan@gmail.com>
Subject: Re: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t
 value
Message-ID: <Yt561CDN+UjmaDK3@redhat.com>
References: <20220725110035.1273441-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220725110035.1273441-1-peter.maydell@linaro.org>
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

On Mon, Jul 25, 2022 at 12:00:35PM +0100, Peter Maydell wrote:
> For handling guest POSIX timers, we currently use an array
> g_posix_timers[], whose entries are a host timer_t value, or 0 for
> "this slot is unused".  When the guest calls the timer_create syscall
> we look through the array for a slot containing 0, and use that for
> the new timer.
> 
> This scheme assumes that host timer_t values can never be zero.  This
> is unfortunately not a valid assumption -- for some host libc
> versions, timer_t values are simply indexes starting at 0.  When
> using this kind of host libc, the effect is that the first and second
> timers end up sharing a slot, and so when the guest tries to operate
> on the first timer it changes the second timer instead.

For sake of historical record, could you mention here which specific
libc impl / version highlights the problem.

> 
> Rework the timer allocation code, so that:
>  * the 'slot in use' indication uses a separate array from the
>    host timer_t array
>  * we grab the free slot atomically, to avoid races when multiple
>    threads call timer_create simultaneously
>  * releasing an allocated slot is abstracted out into a new
>    free_host_timer_slot() function called in the correct places
> 
> This fixes:
>  * problems on hosts where timer_t 0 is valid
>  * the FIXME in next_free_host_timer() about locking
>  * bugs in the error paths in timer_create where we forgot to release
>    the slot we grabbed, or forgot to free the host timer
> 
> Reported-by: Jon Alduan <jon.alduan@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/syscall.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


