Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF123E4A9E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 19:14:11 +0200 (CEST)
Received: from localhost ([::1]:54630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD8qo-0004Iq-JL
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 13:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mD8pk-0003FG-0o
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mD8ph-00047S-8w
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628529179;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uR2wemFKulin5nr8lGsjkcXtyaMbQ7+XszPbVWgKJxQ=;
 b=gWIB1LO29tKSSl1FiI2LMt/929egNf7D+wTQePUvyzAJJkgU575QIzazMuuWIlOqa6YAeM
 +lB+roOIxE+jI1iqTN06lKFvdQTYuZjgLJnJ8Vnju5goZ82xVnSP8oRIIL0bGfrdMAfnvT
 fNumACA8mVR5pb1M8LEW+VFYIMdIr0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-zBxXjWf3Ma6KxcfWB8bUhA-1; Mon, 09 Aug 2021 13:12:55 -0400
X-MC-Unique: zBxXjWf3Ma6KxcfWB8bUhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDE67802935
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 17:12:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 042A860BF1;
 Mon,  9 Aug 2021 17:12:46 +0000 (UTC)
Date: Mon, 9 Aug 2021 18:12:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] audio: Never send migration section
Message-ID: <YRFiDMlKFQ/Kxrhx@redhat.com>
References: <20210809170956.78536-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210809170956.78536-1-dgilbert@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 09, 2021 at 06:09:56PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The audio migration vmstate is empty, and always has been; we can't
> just remove it though because an old qemu might send it us.
> Changes with -audiodev now mean it's sometimes created when it didn't
> used to be, and can confuse migration to old qemu.
> 
> Change it so that vmstate_audio is never sent; if it's received it
> should still be accepted, and old qemu's shouldn't be too upset if it's
> missing.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  audio/audio.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>


For testing I have a VM with -audiodev, but *WITHOUT* any sound
frontend devices. Live migrating to a QEMU using QEMU_AUDIO_DRV
would previously fail. With this applied it now works, showing
that we dont uncessarily send this.

I also tested migration to a QEMU with -audiodev, but without
this patch, and that still works as before, showing that QEMU
is happy if this section is not sent.

> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 59453ef856..54a153c0ef 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1622,10 +1622,20 @@ void audio_cleanup(void)
>      }
>  }
>  
> +static bool vmstate_audio_needed(void *opaque)
> +{
> +    /*
> +     * Never needed, this vmstate only exists in case
> +     * an old qemu sends it to us.
> +     */
> +    return false;
> +}
> +
>  static const VMStateDescription vmstate_audio = {
>      .name = "audio",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .needed = vmstate_audio_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_END_OF_LIST()
>      }
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


