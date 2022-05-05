Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90D551B85B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:01:16 +0200 (CEST)
Received: from localhost ([::1]:54316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmVUB-00051s-8v
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmVMj-000397-GP
 for qemu-devel@nongnu.org; Thu, 05 May 2022 02:53:33 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:24703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmVMg-0004TF-Mh
 for qemu-devel@nongnu.org; Thu, 05 May 2022 02:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651733608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KdXEyln1X3Opn1nMZPnVBgDgQVhv0C7iUa3S0dyEZj4=;
 b=i9omx09Ku5pO/cAdyB3GkUhLrn9fwBzvr1UORj5IugwzqhfXWzLove1NCTpi9nHhYTsm7n
 Qnpl2a0ei+k3/M2CW9yR1c6hpufx54BgdaFQC0ffQYHEr0Ifppi8m8+t2SxCfvrlawZ8nz
 TnYkR0G5fN1Agm+V1eihxhVgJkrLZOg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-XmBur3jQN9ixLiPydvlurw-1; Thu, 05 May 2022 02:53:27 -0400
X-MC-Unique: XmBur3jQN9ixLiPydvlurw-1
Received: by mail-ej1-f69.google.com with SMTP id
 qf19-20020a1709077f1300b006f439243355so2094642ejc.3
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 23:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=KdXEyln1X3Opn1nMZPnVBgDgQVhv0C7iUa3S0dyEZj4=;
 b=sKUcq2c41K69NtHdVCIXC1ANgZf68efazpCVJBDKHwWCVw8EUFjGQjcV9OpNptD4Lx
 J0KAqt5FWk/9RKqMjcgNUJLz8Mi6N4fczixj7fE8qxuh9Vsq28oXCqJ7HwiPCaNknNhQ
 CVf9OTqK7PJzH3K+4fNo/3OrY1VvXsARiJCXVGHwAZc2LvRnD2rCANRo27TXFOo6mzZo
 VFol/FaSoymFkL/PA1Sxm25TqX8c0Bd9pDS5f5UBpADMfgzr28XAXwYHPpiRU0mvzBld
 RTDkkLnG9SLFdpYuo9SIws8YJIaGxkRpDFvwDamf2BrzP4vaXHilSvra5jOil9guIvE2
 HjuQ==
X-Gm-Message-State: AOAM533bhru5rRBV7asXpZGGSdr/Z+fkBLNPbsyQWMMEQAgqHpJkiwjQ
 XOXYIXSt1jKqQh0ef+OB5OHG6v4qG38VUsSOShBKuMk97IAFnM+FQZywruhMPZXwRw9xbmGaY7R
 Jz3UYDUuwPyPJ/Oo=
X-Received: by 2002:a05:6402:128b:b0:425:d1d7:b321 with SMTP id
 w11-20020a056402128b00b00425d1d7b321mr27468990edv.179.1651733605767; 
 Wed, 04 May 2022 23:53:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgiv1nSXkIlBz35Lhqs2QdfoLabwrtKVbI5xi8FAUfx8TeoZx7aFa6DiqoE9j22xQnrhLSbQ==
X-Received: by 2002:a05:6402:128b:b0:425:d1d7:b321 with SMTP id
 w11-20020a056402128b00b00425d1d7b321mr27468957edv.179.1651733605422; 
 Wed, 04 May 2022 23:53:25 -0700 (PDT)
Received: from [127.0.0.1] (93-55-53-207.ip262.fastwebnet.it. [93.55.53.207])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a170906781100b006f3ef214dacsm417196ejm.18.2022.05.04.23.53.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 May 2022 23:53:24 -0700 (PDT)
Date: Thu, 05 May 2022 08:53:17 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
CC: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Bandan Das <bsd@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 10/16] qapi/error: add g_autoptr(Error) support
In-Reply-To: <20220504173025.650167-11-marcandre.lureau@redhat.com>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
 <20220504173025.650167-11-marcandre.lureau@redhat.com>
Message-ID: <DB8BDCA2-868D-46CF-9AF1-28F619B98812@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was rejected before on the grounds that propagating or printing the er=
ror is usually the right thing to do, and neither needs an autoptr:

https://patchew=2Eorg/QEMU/20210912124834=2E503032-1-pbonzini@redhat=2Ecom=
/

So while I do agree with the patch, for it to be accepted some Error* func=
tions would have to be changed to accept Error** instead=2E This way they c=
an NULL the variable containing their argument, and prevent the auto-error_=
free=2E

Paolo

Il 4 maggio 2022 19:30:19 CEST, marcandre=2Elureau@redhat=2Ecom ha scritto=
:
>From: Marc-Andr=C3=A9 Lureau <marcandre=2Elureau@redhat=2Ecom>
>
>Sometime, ERRP_GUARD() isn't what you are looking for, because the
>function doesn't throw errors, yet auto-cleaning is nice to have=2E
>
>Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre=2Elureau@redhat=2Ecom>
>---
> include/qapi/error=2Eh | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/include/qapi/error=2Eh b/include/qapi/error=2Eh
>index d798faeec3e9=2E=2E9482b6a58ae6 100644
>--- a/include/qapi/error=2Eh
>+++ b/include/qapi/error=2Eh
>@@ -519,6 +519,8 @@ static inline void error_propagator_cleanup(ErrorProp=
agator *prop)
>=20
> G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(ErrorPropagator, error_propagator_clean=
up);
>=20
>+G_DEFINE_AUTOPTR_CLEANUP_FUNC(Error, error_free);
>+
> /*
>  * Special error destination to abort on error=2E
>  * See error_setg() and error_propagate() for details=2E


