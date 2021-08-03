Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AB3DF085
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:39:52 +0200 (CEST)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvaB-0002IG-KU
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAvYh-0000fS-44
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAvYf-0001vU-D2
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628001495;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98UCxjYGm9v2GqtuAQZZGeeeDyTA7Pndqiim205t42E=;
 b=EIs7OKMSU+t/hWassOJ/89HiT3hsVPBJok2epTW9PdmuYvsjxYTSml8Hjy7reSe5cUUYh7
 3X/Kqsc8MC2fAZB8LufZpU/rCaEj0CJXH6lejYRFE/qj9yKTMLp6ToxMJ4A5a1I5SYxFQR
 SlMb45A79QrSt/Llwo0lNusUENSNzDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-TtsikdT5Ov-4za7BjN6n8w-1; Tue, 03 Aug 2021 10:38:14 -0400
X-MC-Unique: TtsikdT5Ov-4za7BjN6n8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31311801B3C;
 Tue,  3 Aug 2021 14:38:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3F6E781E6;
 Tue,  3 Aug 2021 14:38:03 +0000 (UTC)
Date: Tue, 3 Aug 2021 15:38:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] chardev: give some context on chardev-add error
Message-ID: <YQlUyQivvYUfjXf/@redhat.com>
References: <20210803120229.3453699-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803120229.3453699-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 04:02:29PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Related to:
> https://bugzilla.redhat.com/show_bug.cgi?id=1984721

It is preferrable to describe the problem & approach in the comit
message, rather than leaving people to read through countless bug
comments to understand it.

The original code reported:

 "attempt to add duplicate property 'char2' to object (type 'container')"


Since adding yank support, the current code reports

 "duplicate yank instance"

With this patch applied it now reports:

 "Failed to add chardev 'char2': duplicate yank instance"

This is marginally better, but still not great, not that the original
error was great either.

It would be nice if we could report

  "chardev with id 'char2' already exists"

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  chardev/char.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/chardev/char.c b/chardev/char.c
> index d959eec522..f59a61774b 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -1031,27 +1031,26 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
>  ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
>                                 Error **errp)
>  {
> +    ERRP_GUARD();
>      const ChardevClass *cc;
>      ChardevReturn *ret;
> -    Chardev *chr;
> +    g_autoptr(Chardev) chr = NULL;
>  
>      cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
>      if (!cc) {
> -        return NULL;
> +        goto err;
>      }
>  
>      chr = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
>                        backend, NULL, false, errp);
>      if (!chr) {
> -        return NULL;
> +        goto err;
>      }
>  
>      if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr),
>                                         errp)) {
> -        object_unref(OBJECT(chr));
> -        return NULL;
> +        goto err;
>      }
> -    object_unref(OBJECT(chr));
>  
>      ret = g_new0(ChardevReturn, 1);
>      if (CHARDEV_IS_PTY(chr)) {
> @@ -1060,6 +1059,10 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
>      }
>  
>      return ret;
> +
> +err:
> +    error_prepend(errp, "Failed to add chardev '%s': ", id);

Lowercase 'f' perhaps ?

> +    return NULL;
>  }

A weak

 Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

because it is not quite so bad as current code


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


