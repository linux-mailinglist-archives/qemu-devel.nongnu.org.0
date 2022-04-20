Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E0508D27
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:23:23 +0200 (CEST)
Received: from localhost ([::1]:56182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD6w-00033O-Cx
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCWb-0005k7-Al
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:45:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCWZ-0002xO-Kv
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650469547;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUhCcUkUQcWHQ2hC1eHgtvvbGNdGmS2LAfKRh+miPgs=;
 b=Suyto8TDJu5fU+f6Ok9s+5jBpabgOLhw/TXGsiUhavFgoxlcPvHwUy9Pits+Pbt2mthMiI
 XpCo2ogEU4TU4N2Flc7IfeHHVsm40MQ5reEjQEsvasFRXITbbOFiP2BOCN+b9ZBnikkx/1
 tQ9J/6nw+K3nwpTwLX+dU51ylOKH5ok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-a0vcfJ9FOmOqnOpJAvSVTg-1; Wed, 20 Apr 2022 11:45:45 -0400
X-MC-Unique: a0vcfJ9FOmOqnOpJAvSVTg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 996471014A64
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 15:45:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73E0754F3F3;
 Wed, 20 Apr 2022 15:45:43 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:45:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 32/41] qtest: simplify socket_send()
Message-ID: <YmAqpOStkQ1DY/rm@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-33-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-33-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 05:26:15PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Reuse qemu_write_full().
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/qtest/libqtest.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 7b5890dcc487..2b9bdb947d6f 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -414,21 +414,9 @@ void qtest_quit(QTestState *s)
>  
>  static void socket_send(int fd, const char *buf, size_t size)
>  {
> -    size_t offset;
> -
> -    offset = 0;
> -    while (offset < size) {
> -        ssize_t len;
> +    size_t res = qemu_write_full(fd, buf, size);
>  
> -        len = write(fd, buf + offset, size - offset);
> -        if (len == -1 && errno == EINTR) {
> -            continue;
> -        }
> -
> -        g_assert_cmpint(len, >, 0);
> -
> -        offset += len;
> -    }
> +    assert(res == size);
>  }

IMHO socket_send should jsut be deleted, with the few callers
directly using qemu_write_full

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


