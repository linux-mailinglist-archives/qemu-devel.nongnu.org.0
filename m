Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D85A60F5C9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:55:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0VN-0008HA-IQ; Thu, 27 Oct 2022 06:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo0VK-0007v0-Kh
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo0V3-0003pC-7g
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666867955;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUhhYy63RNNp85bOHEX4Eg7UuagOhwfgnJD00ygKVMQ=;
 b=Ahvxq5RhfQKD7ZRePXmdtGp1ZwFZo6NpXNOfiKi7qmKlBXiPjhB7L/AUBteH87r5Kki8UY
 oEk8Si2wuvWtKKSIdDyV3utJU3x3bA7FZ0eP8fn6U8u8BtTkCThuw/imskT7S7vl16614x
 EqNmN0VTtwl2CVmq30cW7v0cAmqOzSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-YwdV7GCXNDuiI_jcAjiVOQ-1; Thu, 27 Oct 2022 06:52:34 -0400
X-MC-Unique: YwdV7GCXNDuiI_jcAjiVOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D2B487B2A0;
 Thu, 27 Oct 2022 10:52:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDE5640C6EC3;
 Thu, 27 Oct 2022 10:52:32 +0000 (UTC)
Date: Thu, 27 Oct 2022 11:52:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] net: improve error message for missing netdev backend
Message-ID: <Y1pi7iAuehFGZc6w@redhat.com>
References: <20221003100612.596845-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221003100612.596845-1-berrange@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ping: Jason, are you willing to queue this since it has two
positive reviews.

On Mon, Oct 03, 2022 at 11:06:12AM +0100, Daniel P. Berrangé wrote:
> The current message when using '-net user...' with SLIRP disabled at
> compile time is:
> 
>   qemu-system-x86_64: -net user: Parameter 'type' expects a net backend type (maybe it is not compiled into this binary)
> 
> An observation is that we're using the 'netdev->type' field here which
> is an enum value, produced after QAPI has converted from its string
> form.
> 
> IOW, at this point in the code, we know that the user's specified
> type name was a valid network backend. The only possible scenario that
> can make the backend init function be NULL, is if support for that
> backend was disabled at build time. Given this, we don't need to caveat
> our error message with a 'maybe' hint, we can be totally explicit.
> 
> The use of QERR_INVALID_PARAMETER_VALUE doesn't really lend itself to
> user friendly error message text. Since this is not used to set a
> specific QAPI error class, we can simply stop using this pre-formatted
> error text and provide something better.
> 
> Thus the new message is:
> 
>   qemu-system-x86_64: -net user: network backend 'user' is not compiled into this binary
> 
> The case of passing 'hubport' for -net is also given a message reminding
> people they should have used -netdev/-nic instead, as this backend type
> is only valid for the modern syntax.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> NB, this does not make any difference to people who were relying on the
> QEMU built-in default hub that was created if you don't list any -net /
> -netdev / -nic argument, only those using explicit args.
> 
>  net/net.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/net/net.c b/net/net.c
> index 2db160e063..8ddafacf13 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1036,19 +1036,23 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
>      if (is_netdev) {
>          if (netdev->type == NET_CLIENT_DRIVER_NIC ||
>              !net_client_init_fun[netdev->type]) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> -                       "a netdev backend type");
> +            error_setg(errp, "network backend '%s' is not compiled into this binary",
> +                       NetClientDriver_str(netdev->type));
>              return -1;
>          }
>      } else {
>          if (netdev->type == NET_CLIENT_DRIVER_NONE) {
>              return 0; /* nothing to do */
>          }
> -        if (netdev->type == NET_CLIENT_DRIVER_HUBPORT ||
> -            !net_client_init_fun[netdev->type]) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> -                       "a net backend type (maybe it is not compiled "
> -                       "into this binary)");
> +        if (netdev->type == NET_CLIENT_DRIVER_HUBPORT) {
> +            error_setg(errp, "network backend '%s' is only supported with -netdev/-nic",
> +                       NetClientDriver_str(netdev->type));
> +            return -1;
> +        }
> +
> +        if (!net_client_init_fun[netdev->type]) {
> +            error_setg(errp, "network backend '%s' is not compiled into this binary",
> +                       NetClientDriver_str(netdev->type));
>              return -1;
>          }
>  
> -- 
> 2.37.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


