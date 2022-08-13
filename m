Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E08C5918E1
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 07:35:47 +0200 (CEST)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMjoH-0003kR-WB
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 01:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oMjkk-0001NJ-NZ
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 01:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oMjkg-0003vQ-CR
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 01:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660368720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AsEoStlkfCPUw8wpjxtNjgTFzXE+U81POfW6exZ+y00=;
 b=IK3fVOh1jfMHusBHLHPAJyl5kQgxBM5WpNmgNNE+JeGOnXXlV89O9DOMHH1tW6Ea1xBpT4
 XRdcBW3sOmKSKQ72pejw1eENmQwHS/wBkAfcgrjvhcwo8J/kgde57SBP+J01ZOHhF+xBpR
 loIGNDvwKcRoFvR60duA4pyvte+9Pzw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-2XdE_XsSM_KYxlOB6hTRlQ-1; Sat, 13 Aug 2022 01:30:27 -0400
X-MC-Unique: 2XdE_XsSM_KYxlOB6hTRlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 208871C06EFA;
 Sat, 13 Aug 2022 05:30:27 +0000 (UTC)
Received: from localhost (unknown [10.40.192.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA7BD2166B26;
 Sat, 13 Aug 2022 05:30:26 +0000 (UTC)
Date: Sat, 13 Aug 2022 07:30:25 +0200
From: Victor Toso <victortoso@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/3] usbredir: avoid queuing hello packet on snapshot
 restore
Message-ID: <20220813052956.vnnvukb5xt7f4p6i@tapioca>
References: <20220813011031.3744-1-j@getutm.app>
 <20220813011031.3744-4-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220813011031.3744-4-j@getutm.app>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Fri, Aug 12, 2022 at 06:10:31PM -0700, Joelle van Dyne wrote:
> When launching QEMU with "-loadvm", usbredir_create_parser() should avoid
> setting up the hello packet (just as with "-incoming". On the latest version
> of libusbredir, usbredirparser_unserialize() will return error if the parser
> is not "pristine."

That was wrong in the usbredir side. The fix [0] was merged and
included in the latest 0.13.0 release

[0] https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/61

> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  hw/usb/redirect.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index fd7df599bc..47fac3895a 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -1280,7 +1280,8 @@ static void usbredir_create_parser(USBRedirDevice *dev)
>      }
>  #endif
>  
> -    if (runstate_check(RUN_STATE_INMIGRATE)) {
> +    if (runstate_check(RUN_STATE_INMIGRATE) ||
> +        runstate_check(RUN_STATE_RESTORE_VM)) {
>          flags |= usbredirparser_fl_no_hello;
>      }
>      usbredirparser_init(dev->parser, VERSION, caps, USB_REDIR_CAPS_SIZE,
> -- 
> 2.28.0
> 
> 

Cheers,
Victor


