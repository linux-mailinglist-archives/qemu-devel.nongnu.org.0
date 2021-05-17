Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F473383A5E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:48:07 +0200 (CEST)
Received: from localhost ([::1]:34158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligPW-0001Vo-C4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1liftF-0000Nw-Ia
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1liftE-0000C9-4m
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621268083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yKV40xqLXxUgm7BWY8mZ2zcCsS84SExEFlGgsoncb6U=;
 b=SqnaNoutC947b54yEpzJxekjuEWWJivrCSNDpgzDsFBqP+NFntOXaZpR56UdB8ZJ6ndEaB
 Iba2j0p+AY5AIvIDBkRIyztzFa0QkLOnJeX00ALKHY+teXvcrT+xQRn6QcZTs0436QBa5h
 j/iujTkRYM76tuNbCEh1IsB4w7bsNeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-3JWLAa_-Pp2LBiV-umKf_A-1; Mon, 17 May 2021 12:14:40 -0400
X-MC-Unique: 3JWLAa_-Pp2LBiV-umKf_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB71F8049D7;
 Mon, 17 May 2021 16:14:38 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-115-195.ams2.redhat.com
 [10.36.115.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA295C1A1;
 Mon, 17 May 2021 16:14:37 +0000 (UTC)
Date: Mon, 17 May 2021 18:14:34 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] pc-bios/s390-ccw: Fix inline assembly for older
 versions of Clang
Message-ID: <20210517181434.74a1c2f0.cohuck@redhat.com>
In-Reply-To: <20210512171550.476130-2-thuth@redhat.com>
References: <20210512171550.476130-1-thuth@redhat.com>
 <20210512171550.476130-2-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 19:15:48 +0200
Thomas Huth <thuth@redhat.com> wrote:

> Clang versions before v11.0 insist on having the %rX or %cX register
> names instead of just a number. Since our Travis-CI is currently
> still using Clang v6.0, we have to fix this to avoid failing jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/helper.h   | 2 +-
>  pc-bios/s390-ccw/jump2ipl.c | 4 ++--
>  pc-bios/s390-ccw/menu.c     | 8 ++++----
>  pc-bios/s390-ccw/virtio.c   | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/helper.h b/pc-bios/s390-ccw/helper.h
> index dfcfea0ff0..3d0731c4c6 100644
> --- a/pc-bios/s390-ccw/helper.h
> +++ b/pc-bios/s390-ccw/helper.h
> @@ -31,7 +31,7 @@ static inline void *u32toptr(uint32_t n)
>  
>  static inline void yield(void)
>  {
> -    asm volatile ("diag 0,0,0x44"
> +    asm volatile ("diag %%r0,%%r0,0x44"
>                    : :
>                    : "memory", "cc");
>  }

Sigh, this really looks uglier, but if it pleases the compiler...

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


