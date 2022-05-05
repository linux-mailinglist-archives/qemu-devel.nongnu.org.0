Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4247651B7B1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 08:03:02 +0200 (CEST)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmUZp-0007W8-4K
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 02:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmUSm-0005JZ-RN
 for qemu-devel@nongnu.org; Thu, 05 May 2022 01:55:47 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:60238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmUSl-0005IZ-1a
 for qemu-devel@nongnu.org; Thu, 05 May 2022 01:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651730142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=duiTPIBM7H6mROeL50umaObWJmCAVulLPlcK584gJSI=;
 b=ad7SEi5QqFFcWsMfWKl0n6EnSnol/0J4mEo0n+dxPQXot2QxVMiK+ByibOX1whZzxO/Xl4
 R3Bdwp0LfegYe3aGqaQvmsEcRiWHL+Oe7S4823YaDSumAvNE7W6wU1Cwwz/vmm1GTEDZyw
 lagJ6eJ5GDMOcN1t8r4uZl2dkrR9AWw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-Ba9QssOcOOqla6pzYZqqeQ-1; Thu, 05 May 2022 01:55:41 -0400
X-MC-Unique: Ba9QssOcOOqla6pzYZqqeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B1B785A5A8;
 Thu,  5 May 2022 05:55:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 315C3C28102;
 Thu,  5 May 2022 05:55:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E9FEE21E6880; Thu,  5 May 2022 07:55:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Paolo
 Bonzini
 <pbonzini@redhat.com>,  Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,  John G Johnson
 <john.g.johnson@oracle.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Fam Zheng <fam@euphon.net>,  Peter Xu
 <peterx@redhat.com>,  qemu-devel@nongnu.org,  qemu-block@nongnu.org
Subject: Re: [PATCH v11 3/7] migration: Add zero-copy-send parameter for
 QMP/HMP for Linux
References: <20220504191835.791580-1-leobras@redhat.com>
 <20220504191835.791580-4-leobras@redhat.com>
Date: Thu, 05 May 2022 07:55:38 +0200
In-Reply-To: <20220504191835.791580-4-leobras@redhat.com> (Leonardo Bras's
 message of "Wed, 4 May 2022 16:18:32 -0300")
Message-ID: <87r158zfol.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Acked-by: Markus Armbruster <armbru@redhat.com>
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

Please wrap lines around column 75.  More of the same below.

> +#                  RAM pages.
> +#                  Defaults to false. (Since 7.1)
> +#
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migrati=
on.  Such
>  #                        aliases may for example be the corresponding na=
mes on the
> @@ -780,6 +787,7 @@
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
>             'multifd-zlib-level' ,'multifd-zstd-level',
> +           { 'name': 'zero-copy-send', 'if' : 'CONFIG_LINUX'},
>             'block-bitmap-mapping' ] }
>=20=20
>  ##
> @@ -906,6 +914,13 @@
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
> +#                  Defaults to false. (Since 7.1)
> +#
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migrati=
on.  Such
>  #                        aliases may for example be the corresponding na=
mes on the
> @@ -960,6 +975,7 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> +            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>=20=20
>  ##
> @@ -1106,6 +1122,13 @@
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
> +#                  Defaults to false. (Since 7.1)
> +#
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migrati=
on.  Such
>  #                        aliases may for example be the corresponding na=
mes on the
> @@ -1158,6 +1181,7 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> +            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>=20=20
>  ##

[...]


