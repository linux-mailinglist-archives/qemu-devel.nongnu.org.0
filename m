Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F154E044
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:53:07 +0200 (CEST)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1o3e-0003b7-9B
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1nYC-000428-84
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1nY9-0008OV-Pf
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655378431;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KVZKHuUfk6deVE+IaVKCq943aUp4wh+GMfKLlEQlCoI=;
 b=h4ys762qFQHHOrOTRemppgjjUpWtYoMvBwU6SmGSk/Q8m4Jc3ml564uQGKDYSllcVhHB04
 td6nMcmsHtoQuCrVInEXRhXtq0eyzKEKA79PMs+gu0SXpvje0w5YPs6W5HT/zpv4udpmbs
 M/Q7zPgCc0LvzE0LV5Rju63rg6LSbSc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-FoUtY2TuME29jfiaiSpLXg-1; Thu, 16 Jun 2022 07:20:28 -0400
X-MC-Unique: FoUtY2TuME29jfiaiSpLXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A44B380452C;
 Thu, 16 Jun 2022 11:20:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43BE140885A1;
 Thu, 16 Jun 2022 11:20:27 +0000 (UTC)
Date: Thu, 16 Jun 2022 12:20:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: nikita.lapshin@openvz.org
Cc: qemu-devel@nongnu.org, den@virtuozzo.com,
 andrey.drobyshev@virtuozzo.com, quintela@redhat.com, dgilbert@redhat.com
Subject: Re: [PATCH v3 11/17] migration/qemu-file: Fix qemu_ftell() for
 non-writable file
Message-ID: <YqsR+IlrxpU3CrC4@redhat.com>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
 <20220616102811.219007-12-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616102811.219007-12-nikita.lapshin@openvz.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 16, 2022 at 01:28:05PM +0300, nikita.lapshin@openvz.org wrote:
> From: Nikita Lapshin <nikita.lapshin@openvz.org>
> 
> qemu_ftell() will return wrong value for non-writable QEMUFile.
> This happens due to call qemu_fflush() inside qemu_ftell(), this
> function won't flush if file is readable.

Well the return value isn't necessarily wrong today - it really
depends what semantics each callers desires.

Can you say what particular caller needs these semantics changed
and the impact on them from current behaviour ?

> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>  migration/qemu-file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 1479cddad9..53ccef80ac 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -663,7 +663,8 @@ int64_t qemu_ftell_fast(QEMUFile *f)
>  int64_t qemu_ftell(QEMUFile *f)
>  {
>      qemu_fflush(f);
> -    return f->pos;
> +    /* Consider that qemu_fflush() won't work if file is non-writable */
> +    return f->pos + f->buf_index;
>  }

IIUC, this is more or less trying to make 'qemu_ftell' be
equivalent to 'qemu_ftell_fast' semantics in the non-writable
case. But that makes me wonder if whichever calls has problems,
shouldn't be just changed to use  qemu_ftell_fast instead ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


