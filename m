Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF93694D0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 16:34:34 +0200 (CEST)
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZwt7-00047l-PU
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 10:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZwru-0003MR-Hm
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:33:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZwrq-0005RV-Sf
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619188393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=leC3OjvEZfcCPbh74Lvqu9saVT5Lt0iECjsegCCRKkc=;
 b=goorkiBYpGfvrcpgQlycQDa3xYnOEiCvCInI1zHE8J7/1PHg21hgW6jpx9aS0a+aoql1vi
 HC72ISzGrCnUQFUklNm+/7CXx2QOLaCG1frETA+w8ZXh1NWfmFRN2JhRzhiKvIC2r2PdRT
 VoSi91ktpfv2aZDsThAI7Xx5WkkZYwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-KiJSGiTfMVO3OHqDkXdYSg-1; Fri, 23 Apr 2021 10:33:12 -0400
X-MC-Unique: KiJSGiTfMVO3OHqDkXdYSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18588839A42;
 Fri, 23 Apr 2021 14:33:11 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-167.ams2.redhat.com
 [10.36.113.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B96D60C4A;
 Fri, 23 Apr 2021 14:33:09 +0000 (UTC)
Date: Fri, 23 Apr 2021 16:33:06 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] pc-bios/s390-ccw: Use reset_psw pointer instead of
 hard-coded null pointer
Message-ID: <20210423163306.727230ed.cohuck@redhat.com>
In-Reply-To: <20210423142440.582188-1-thuth@redhat.com>
References: <20210423142440.582188-1-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 16:24:40 +0200
Thomas Huth <thuth@redhat.com> wrote:

> When compiling the s390-ccw bios with clang, it emits a warning like this=
:
>=20
>  pc-bios/s390-ccw/jump2ipl.c:86:9: warning: indirection of non-volatile n=
ull
>   pointer will be deleted, not trap [-Wnull-dereference]
>      if (*((uint64_t *)0) & RESET_PSW_MASK) {
>          ^~~~~~~~~~~~~~~~
>  pc-bios/s390-ccw/jump2ipl.c:86:9: note: consider using __builtin_trap() =
or
>   qualifying pointer with 'volatile'
>=20
> We could add a "volatile" here to shut it up, but on the other hand,
> we also have a pointer variable called "reset_psw" in this file already
> that points to the PSW at address 0, so we can simply use that pointer
> variable instead.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Extend comment as suggested by Cornelia

Thanks for helping my poor brain :)

>=20
>  pc-bios/s390-ccw/jump2ipl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
> index b9c70d64a5..73e4367e09 100644
> --- a/pc-bios/s390-ccw/jump2ipl.c
> +++ b/pc-bios/s390-ccw/jump2ipl.c
> @@ -82,8 +82,8 @@ void jump_to_low_kernel(void)
>          jump_to_IPL_code(KERN_IMAGE_START);
>      }
> =20
> -    /* Trying to get PSW at zero address */
> -    if (*((uint64_t *)0) & RESET_PSW_MASK) {
> +    /* Trying to get PSW at zero address (pointed to by reset_psw) */
> +    if (*reset_psw & RESET_PSW_MASK) {
>          /*
>           * Surely nobody will try running directly from lowcore, so
>           * let's use 0 as an indication that we want to load the reset

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


