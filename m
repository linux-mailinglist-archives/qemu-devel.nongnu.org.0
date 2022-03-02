Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C922D4CAA48
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:33:03 +0100 (CET)
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRuQ-0008TP-IG
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:33:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPRsW-0006gs-F9
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:31:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPRsT-0000ce-SM
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646238660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhO/DDVKU/9ZtGGbN/rCWh8B3OTjsReyM2yB4kf7BU8=;
 b=TlEqfdnsBbOMr2k2utpUPFcdFMUythFqvxtAr2SONMKP8/oC7q3w/MWvefj0QLMYqFzdn/
 NKHIk4NEdCTj82OSXjx4Go/y4ByCrwJdsqQflHeC0ur6ea0OCyV+wzvLG76i6QKVZ+RNal
 X5M4gXKdWNMYXBvsZBwS2SBIfGlWuLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-Mh2ES4U8Op2iCZiByr4j2Q-1; Wed, 02 Mar 2022 11:30:52 -0500
X-MC-Unique: Mh2ES4U8Op2iCZiByr4j2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC348066F3;
 Wed,  2 Mar 2022 16:30:51 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DF4E7F0D3;
 Wed,  2 Mar 2022 16:30:50 +0000 (UTC)
Date: Wed, 2 Mar 2022 10:30:48 -0600
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/9] hw/usb/redirect.c: Stop using qemu_oom_check()
Message-ID: <20220302163048.pahjr7gkdj5jxqm5@redhat.com>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-2-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220226180723.1706285-2-peter.maydell@linaro.org>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 26, 2022 at 06:07:15PM +0000, Peter Maydell wrote:
> qemu_oom_check() is a function which essentially says "if you pass me
> a NULL pointer then print a message then abort()".  On POSIX systems
> the message includes strerror(errno); on Windows it includes the
> GetLastError() error value printed as an integer.
> 
> Other than in the implementation of qemu_memalign(), we use this
> function only in hw/usb/redirect.c, for three checks:
> 
>  * on a call to usbredirparser_create()
>  * on a call to usberedirparser_serialize()
>  * on a call to malloc()
> 
> The usbredir library API functions make no guarantees that they will
> set errno on errors, let alone that they might set the
> Windows-specific GetLastError string.  malloc() is documented as
> setting errno, not GetLastError -- and in any case the only thing it
> might set errno to is ENOMEM.  So qemu_oom_check() isn't the right
> thing for any of these.  Replace them with straightforward
> error-checking code.  This will allow us to get rid of
> qemu_oom_check().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have left all of these errors as fatal, since that's what they
> were previously. Possibly somebody with a better understanding
> of the usbredir code might be able to make them theoretically
> non-fatal, but we make malloc failures generally fatal anyway.
> ---
>  hw/usb/redirect.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 5f0ef9cb3b0..8692ea25610 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -1239,7 +1239,11 @@ static void usbredir_create_parser(USBRedirDevice *dev)
>  
>      DPRINTF("creating usbredirparser\n");
>  
> -    dev->parser = qemu_oom_check(usbredirparser_create());
> +    dev->parser = usbredirparser_create();
> +    if (!dev->parser) {
> +        error_report("usbredirparser_create() failed");
> +        exit(1);

Is exit(EXIT_FAILURE) worth using in this file?  We have an
inconsistent history of a magic number vs. a named constant, so either
way,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


