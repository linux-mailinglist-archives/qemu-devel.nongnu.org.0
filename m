Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036F340697B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:09:36 +0200 (CEST)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdTS-0002Oj-K1
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOdSc-0001jD-Qw
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOdSZ-0001VI-NM
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631268518;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BrGaZYeENbyUGOXKoLv8GR09uemRVqHpR3PPzf9eRk=;
 b=BLGH2ScF+JQZC7EWCprjajWBLRVwha4ZpebxeWw9F4HNntx3vUahkb9pX4giiD1wOF+m0v
 yaD6HSavrvf8CgNzI5TPX0ONhuCBJlbNttJmUIeXzSYTE+cwWHGnDOCnZqHs/PmkHoxBoF
 DIDDpmpkbx5YFUcnVYnUojtVz/GaZrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-I7SrxdtFPammpR5vMX7h7A-1; Fri, 10 Sep 2021 06:08:37 -0400
X-MC-Unique: I7SrxdtFPammpR5vMX7h7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 588F684A5E1
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 10:08:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3E419C79;
 Fri, 10 Sep 2021 10:08:32 +0000 (UTC)
Date: Fri, 10 Sep 2021 11:08:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] qxl: fix pre-save logic
Message-ID: <YTsung+jLgQhA5hC@redhat.com>
References: <20210910094203.3582378-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210910094203.3582378-1-kraxel@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 11:42:03AM +0200, Gerd Hoffmann wrote:
> Oops.  Logic is backwards.
> 
> Fixes: 39b8a183e2f3 ("qxl: remove assert in qxl_pre_save.")

Urgh, I looked at that commit yesterday several times and
was blind to the bug too !

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/610
> Resolves: https://bugzilla.redhat.com//show_bug.cgi?id=2002907
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/qxl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 43482d4364ba..29c80b4289b7 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -2252,7 +2252,7 @@ static int qxl_pre_save(void *opaque)
>      } else {
>          d->last_release_offset = (uint8_t *)d->last_release - ram_start;
>      }
> -    if (d->last_release_offset < d->vga.vram_size) {
> +    if (d->last_release_offset >= d->vga.vram_size) {
>          return 1;
>      }
>  
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


