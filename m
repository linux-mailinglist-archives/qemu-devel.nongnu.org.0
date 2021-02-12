Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF259319D31
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 12:19:31 +0100 (CET)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAWTy-0002DI-P2
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 06:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lAWRr-0001GV-47
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:17:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lAWRn-00055k-QG
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613128634;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9NVgV+ZqXaCgyhr7W3FDL8ImWErSR/UookJstLgkd4=;
 b=bRwbZtjvqhcn+QLH6xADlt3TK4qO+vIA6GBetZj1iCDWTncge/ODxbtD3PC06mOEl6RO7G
 i4GJpvD7jRN43XeXkmoedQ1PmfI5d3HfWj48EgcrCVR6ie95GNaK+ZlvWe7NQRQTN8Am7o
 xrAyXKKKK77AAwfLz1Ko70oTn1XO69o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107--cFRPyz_MbeywJMPTm4sfg-1; Fri, 12 Feb 2021 06:17:04 -0500
X-MC-Unique: -cFRPyz_MbeywJMPTm4sfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20C35EC1A5;
 Fri, 12 Feb 2021 11:17:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB61560CE6;
 Fri, 12 Feb 2021 11:17:01 +0000 (UTC)
Date: Fri, 12 Feb 2021 11:16:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH] io: error_prepend() in qio_channel_readv_full_all()
 causes segfault
Message-ID: <20210212111658.GF1340027@redhat.com>
References: <cover.1613128220.git.jag.raman@oracle.com>
 <be476bcdb99e820fec0fa09fe8f04c9dd3e62473.1613128220.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <be476bcdb99e820fec0fa09fe8f04c9dd3e62473.1613128220.git.jag.raman@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: elena.ufimtseva@oracle.com, stefanha@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 12, 2021 at 06:16:07AM -0500, Jagannathan Raman wrote:
> Using error_prepend() in qio_channel_readv_full_all() causes a segfault
> as errp is not set when ret is 0. This results in the failure of iotest
> 83. Replacing with error_setg() fixes the problem.
> 
> Additionally, removes a full stop at the end of error message
> 
> Reported-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  io/channel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/io/channel.c b/io/channel.c
> index 4555021..e8b019d 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -202,8 +202,7 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
>      int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
>  
>      if (ret == 0) {
> -        error_prepend(errp,
> -                      "Unexpected end-of-file before all data were read.");
> +        error_setg(errp, "Unexpected end-of-file before all data were read");
>          return -1;
>      }
>      if (ret == 1) {

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


