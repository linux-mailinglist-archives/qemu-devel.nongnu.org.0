Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94D519E20
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:35:44 +0200 (CEST)
Received: from localhost ([::1]:48404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDIF-0003k8-Lg
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmCZ4-0005tw-Jw
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmCZ3-00077g-2C
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651661340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DX1t+htQkqBdSB9jcvg6d1i85UaWy7E+mqnn21Rolmg=;
 b=JvcAiGX8tq4O67xtKlMYS1BOpBhdMzJ0jYNBitFyvwpiK74k6UbSA8N+FwHgnpyYmwnl9U
 rfx6hixb9I+LMkHYGHohq/PU/wk483kBcjyY/Is9gILAKvxH2ZWLgbO/6++HP2lZFPJ+yZ
 yAC3koeVxtG5wVCkdLObwW/9OfEa//I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-pHDOQ0ZcNbm_BZlfWmOhXA-1; Wed, 04 May 2022 06:48:55 -0400
X-MC-Unique: pHDOQ0ZcNbm_BZlfWmOhXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A8A2904864;
 Wed,  4 May 2022 10:48:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 038E440E80E3;
 Wed,  4 May 2022 10:48:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9960A21E68BC; Wed,  4 May 2022 12:48:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Paolo
 Bonzini
 <pbonzini@redhat.com>,  Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,  John G Johnson
 <john.g.johnson@oracle.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: [PATCH v9 3/7] migration: Add zero-copy-send parameter for
 QMP/HMP for Linux
References: <20220425215055.611825-1-leobras@redhat.com>
 <20220425215055.611825-4-leobras@redhat.com>
Date: Wed, 04 May 2022 12:48:53 +0200
In-Reply-To: <20220425215055.611825-4-leobras@redhat.com> (Leonardo Bras's
 message of "Mon, 25 Apr 2022 18:50:52 -0300")
Message-ID: <87mtfx7eui.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

Leonardo Bras <leobras@redhat.com> writes:

> Add property that allows zero-copy migration of memory pages
> on the sending side, and also includes a helper function
> migrate_use_zero_copy_send() to check if it's enabled.
>
> No code is introduced to actually do the migration, but it allow
> future implementations to enable/disable this feature.
>
> On non-Linux builds this parameter is compiled-out.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>  qapi/migration.json   | 24 ++++++++++++++++++++++++
>  migration/migration.h |  5 +++++
>  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
>  migration/socket.c    | 11 +++++++++--
>  monitor/hmp-cmds.c    |  6 ++++++
>  5 files changed, 76 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 409eb086a2..04246481ce 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -741,6 +741,13 @@
>  #                      will consume more CPU.
>  #                      Defaults to 1. (Since 5.0)
>  #
> +# @zero-copy-send: Controls behavior on sending memory pages on migratio=
n.
> +#                  When true, enables a zero-copy mechanism for sending =
memory
> +#                  pages, if host supports it.
> +#                  Requires that QEMU be permitted to use locked memory =
for guest
> +#                  RAM pages.

Please wrap lines around column 75.  More of the same below.

> +#                  Defaults to false. (Since 7.1)
> +#
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migrati=
on.  Such
>  #                        aliases may for example be the corresponding na=
mes on the

With that, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

[...]


