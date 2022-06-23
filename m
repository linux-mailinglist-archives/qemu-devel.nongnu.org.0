Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC6557D3C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 15:44:53 +0200 (CEST)
Received: from localhost ([::1]:46068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4N8e-0004MN-3d
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 09:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4N7K-0003Ty-HM
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:43:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4N7H-00083Z-QO
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655991806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Be9Gz/+F/NYjiKyhTsbK11ZiEWP/Dvs0YF1Qu3gipHQ=;
 b=cvj1hNTrNfNNK3pEwSIHTPsVt1KrE5IIRKQkZsiG0m9qkZ/OEK5TkJoklj3bVrHwIvqM4m
 6MLNEXcx/n0SPwSCfhDXcPVaJtjjcfYYYePGDNPEdbh1rxm2qdfpsN2wy9eSpN4GV7PiZh
 9C7oprW7XLikvu8cIj33ENBD3a6f8AQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-XtmsgNp4NKieA4uRR1DQpA-1; Thu, 23 Jun 2022 09:43:23 -0400
X-MC-Unique: XtmsgNp4NKieA4uRR1DQpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7051811E75;
 Thu, 23 Jun 2022 13:43:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FE432026D64;
 Thu, 23 Jun 2022 13:43:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CFEF321E690D; Thu, 23 Jun 2022 15:43:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Warner Losh
 <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Fam Zheng <fam@euphon.net>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  qemu-block@nongnu.org
Subject: Re: [PATCH 9/9] scripts/qapi: add required system includes to visitor
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-10-marcandre.lureau@redhat.com>
Date: Thu, 23 Jun 2022 15:43:20 +0200
In-Reply-To: <20220616124034.3381391-10-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Thu, 16 Jun 2022 16:40:34 +0400")
Message-ID: <87h74bfqbr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The generated visitor code includes abort() & assert(), we shouldn't
> rely on the global "-i" headers to include the necessary system headers.

Suggest ", even though the default qemu/osdep.h always does.

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qapi/visit.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 1ff464c0360f..d686df17f4b6 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -326,6 +326,8 @@ def __init__(self, prefix: str, include: List[str]):
>      def _begin_builtin_module(self) -> None:
>          self._genc.preamble_add(mcgen('''
>  %(include)s
> +#include <assert.h>
> +#include <stdlib.h>
>=20=20
>  #include "qapi/error.h"
>  #include "qapi/qapi-builtin-visit.h"
> @@ -342,6 +344,8 @@ def _begin_user_module(self, name: str) -> None:
>          visit =3D self._module_basename('qapi-visit', name)
>          self._genc.preamble_add(mcgen('''
>  %(include)s
> +#include <assert.h>
> +#include <stdlib.h>
>=20=20
>  #include "qapi/error.h"
>  #include "qapi/qmp/qerror.h"

Mildly irritating, because we normally kill such includes as redundant
on sight.

The builtin module (qapi-builtin-visit.c) doesn't actually need these
headers.  I guess you include them just in case that changes.


