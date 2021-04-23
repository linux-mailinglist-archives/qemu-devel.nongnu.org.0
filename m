Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD88369207
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 14:24:06 +0200 (CEST)
Received: from localhost ([::1]:48654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZuqq-0001Gc-L7
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 08:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZupK-0000KX-A0
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:22:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZupH-000215-3j
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619180545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cu134PAcOtH9YmNhKO35Wo3Bc0Xum3kJcsCqohwulgc=;
 b=CCbLzge3RluP6pbQy0xMxHUeXiBtS92NG1WPdQdMwhZuf5Zcfw+FuHLey6i1A+1fOkm154
 BOGyw7eOZLtWkv43Npq64aOitADiqTQWehzzcXTXTwuH4b5WIyMMk0ATSc6X1hY0+TnsKH
 NrCiWxkZYhJ1dDW5x+a0yBOrvMYWe90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-scy-pk7sMlSzIhQMGnCYIA-1; Fri, 23 Apr 2021 08:22:23 -0400
X-MC-Unique: scy-pk7sMlSzIhQMGnCYIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20037107ACC7;
 Fri, 23 Apr 2021 12:22:22 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-167.ams2.redhat.com
 [10.36.113.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 307195D745;
 Fri, 23 Apr 2021 12:22:12 +0000 (UTC)
Date: Fri, 23 Apr 2021 14:22:09 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] target/s390x: fix s390_probe_access to check
 PAGE_WRITE_ORG for writeability
Message-ID: <20210423142209.03032dc5.cohuck@redhat.com>
In-Reply-To: <20210422154427.13038-1-alex.bennee@linaro.org>
References: <20210422154427.13038-1-alex.bennee@linaro.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Apr 2021 16:44:27 +0100
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> We can remove PAGE_WRITE when (internally) marking a page read-only
> because it contains translated code. This can get confused when we are
> executing signal return code on signal stacks.
>=20
> Fixes: e56552cf07 ("target/s390x: Implement the MVPG condition-code-optio=
n bit")
> Found-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>  target/s390x/mem_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index 12e84a4285..f6a7d29273 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c
> @@ -145,7 +145,7 @@ static int s390_probe_access(CPUArchState *env, targe=
t_ulong addr, int size,
> =20
>  #if defined(CONFIG_USER_ONLY)
>      flags =3D page_get_flags(addr);
> -    if (!(flags & (access_type =3D=3D MMU_DATA_LOAD ?  PAGE_READ : PAGE_=
WRITE))) {
> +    if (!(flags & (access_type =3D=3D MMU_DATA_LOAD ?  PAGE_READ : PAGE_=
WRITE_ORG))) {
>          env->__excp_addr =3D addr;
>          flags =3D (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING=
;
>          if (nonfault) {

What's the verdict on this one? I plan to queue this to s390-next; but
if we end up doing an -rc5, it might qualify as a regression fix.

If this is going to be in 6.1, I'll add cc:stable when queuing.


