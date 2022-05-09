Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724D51F877
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 11:58:23 +0200 (CEST)
Received: from localhost ([::1]:36396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no09m-0002je-5i
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 05:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1no04Y-0000Ms-4Q
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1no04W-00053m-EK
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652089975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MW2DU3usnMBR24B13vVC7IR7uf1JDWG+AnJI4I24E4U=;
 b=YyxMZ4yqNm0PSdD531fdAJNYO1NuY0BrSj/6w2fNLe1fmIaU53WBli9CprRufMAHVtF3Vp
 hswDj/bN1ddKA4m41k9sWcYwYCUjshDlh2Pa4mPA/QpLu1Q00y8o0OfZQbN6C/ifuxUwSO
 vdPZJdYa50ZxzxbAQTg7ogbSgYh+1Z8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-SL6_nlyIPZ2QnrymD4Bg-Q-1; Mon, 09 May 2022 05:52:52 -0400
X-MC-Unique: SL6_nlyIPZ2QnrymD4Bg-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFEF61C00AC7;
 Mon,  9 May 2022 09:52:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6110428F0E;
 Mon,  9 May 2022 09:52:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A648521E6880; Mon,  9 May 2022 11:52:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 qemu-trivial@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: [PATCH] qom/object: Remove circular include dependency
References: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
Date: Mon, 09 May 2022 11:52:50 +0200
In-Reply-To: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
 ("Philippe =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 9 May 2022
 10:46:59 +0200")
Message-ID: <87r153av7x.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> "qom/object.h" doesn't need to include itself.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/qom/object.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 5f3d5b5bf5..ef7258a5e1 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -16,7 +16,6 @@
>=20=20
>  #include "qapi/qapi-builtin-types.h"
>  #include "qemu/module.h"
> -#include "qom/object.h"
>=20=20
>  struct TypeImpl;
>  typedef struct TypeImpl *Type;

I figure this is scripts/codeconverter/converter.py's doing, in commit
db1015e92e "Move QOM typedefs and add missing includes".  Probably not
worth fixing there.  Possibly worth mentioning in the commit message.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


