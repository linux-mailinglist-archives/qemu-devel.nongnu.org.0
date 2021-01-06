Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9FC2EBDDA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:49:41 +0100 (CET)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8Fw-0002sp-DH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kx8EN-0002QA-SS
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:48:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kx8EM-0004b8-7E
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609937281;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cvZVE6sfRuFqtnP23UhbRgg8eLJdvudcnWiiUHse1Y=;
 b=U/vabr9PwN1Y0CnJurMeRKbq9XRiKc9R5QtsyfBqOiWQHvw7y9ykLo2FPqlIEMLW2yZXMe
 vry04Z8uOEbZ9uI9bPEd/6HxAqw7ul+wOTOiH4TQvuGv+hzofCV1xDkl7PLFjP8r6pfEQg
 NB8n8MbCGLIKMSE+gOWnD0XmCjwo8YQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-pgaZRArkNze5uL58ATqWnQ-1; Wed, 06 Jan 2021 07:47:58 -0500
X-MC-Unique: pgaZRArkNze5uL58ATqWnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18AB1801817
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 12:47:58 +0000 (UTC)
Received: from redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C59F5D9CD;
 Wed,  6 Jan 2021 12:47:49 +0000 (UTC)
Date: Wed, 6 Jan 2021 12:47:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] tracetool: fix "PRI" macro decoding
Message-ID: <20210106124746.GL976881@redhat.com>
References: <20210105191721.120463-1-lvivier@redhat.com>
 <20210105191721.120463-3-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210105191721.120463-3-lvivier@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 05, 2021 at 08:17:21PM +0100, Laurent Vivier wrote:
> macro is not reset after use, so the format decoded is always the
> one of the first "PRI" in the format string.
> 
> For instance:
> 
>   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, \
>                         uint32_t flags) "dev: %p offset: %"PRIu32" \
>                         size: %"PRIu32" flags: 0x%"PRIx32
> 
> generates:
> 
>   printf("%d@%d vhost_vdpa_set_config dev: %p offset: %u size: %u \
>           flags: 0x%u\n", pid(), gettimeofday_ns(), dev, offset, \
>           size, flags)
> 
> for the "flags" parameter, we can see a "0x%u" rather than a "0x%x"
> because the first macro was "PRIu32" (for offset).
> 
> In the loop, macro becomes "PRIu32PRIu32PRIx32", and c_macro_to_format()
> returns always macro[3] ('u' in this case). This patch resets macro after
> the format has been decoded.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/tracetool/format/log_stap.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
> index b486beb67239..3e1186ae9cc2 100644
> --- a/scripts/tracetool/format/log_stap.py
> +++ b/scripts/tracetool/format/log_stap.py
> @@ -54,6 +54,7 @@ def c_fmt_to_stap(fmt):
>              else:
>                  if state == STATE_MACRO:
>                      bits.append(c_macro_to_format(macro))
> +                    macro = ""
>                  state = STATE_LITERAL
>          elif fmt[i] == ' ' or fmt[i] == '\t':
>              if state == STATE_MACRO:

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


