Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7E51BDC0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:10:32 +0200 (CEST)
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZNP-0007zE-Jh
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZ5l-0001xW-Bi
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:52:18 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:44485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZ5i-0004CW-3b
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651747929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qmSJWtT70qyTnMP9hm/Dm1dNHClZRXHw1O5CeVQXRg=;
 b=KP4ODeNSVQQK62nYxmMqkEOaevf6Ecz5Z70WbzybzkTy1guCcx7uhCRfbEzwA3YufVUn/v
 7EfTgQHBHGzkofVlzh2cSw28KBYPuYyhDHR4Z8MsXY+IBd3iSPLs0aO2/f/0NZsauPI+ei
 5DKdfgVPplNHHvywL8lz7uX8fON+1tM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-TjDHe7qnMzOwGQ_ejlkMYw-1; Thu, 05 May 2022 06:52:05 -0400
X-MC-Unique: TjDHe7qnMzOwGQ_ejlkMYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F22285A5BC;
 Thu,  5 May 2022 10:52:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1452403156;
 Thu,  5 May 2022 10:52:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C0D9C21E6880; Thu,  5 May 2022 12:52:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Alexander Bulekov <alxndr@bu.edu>,  Bandan Das
 <bsd@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Kevin Wolf <kwolf@redhat.com>,  Darren Kenny
 <darren.kenny@oracle.com>,  Laurent Vivier <lvivier@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Qiuhao
 Li <Qiuhao.Li@outlook.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 03/15] tests: make libqmp buildable for win32
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-4-marcandre.lureau@redhat.com>
Date: Thu, 05 May 2022 12:52:03 +0200
In-Reply-To: <20220505081431.934739-4-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 5 May 2022 12:14:19 +0400")
Message-ID: <875ymkxne4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/libqmp.h |  2 ++
>  tests/qtest/libqmp.c | 35 +++++++++++++++++++++++++++++------
>  2 files changed, 31 insertions(+), 6 deletions(-)
>
> diff --git a/tests/qtest/libqmp.h b/tests/qtest/libqmp.h
> index 94aa97328a17..772f18b73ba3 100644
> --- a/tests/qtest/libqmp.h
> +++ b/tests/qtest/libqmp.h
> @@ -20,8 +20,10 @@
>  #include "qapi/qmp/qdict.h"
>=20=20
>  QDict *qmp_fd_receive(int fd);
> +#ifndef G_OS_WIN32

What's the difference between G_OS_WIN32 and _WIN32?

We have 10 of the former, but >250 of the latter.  If they are
effectively the same, we should pick one and stick to it.

[...]


