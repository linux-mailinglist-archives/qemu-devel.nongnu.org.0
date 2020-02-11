Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A3C158CFC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 11:55:44 +0100 (CET)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1TCh-0006rl-FN
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 05:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j1TBv-0006IE-L5
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 05:54:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j1TBu-0003A9-Fv
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 05:54:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33010
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j1TBu-00039x-C6
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 05:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581418493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHY7ub2o3vjcoBWtVFe7KNkC1+w19KUXJy+zKfKAo+U=;
 b=Dg1u/QlgVdILnCNXdFBNVUUzTeLLsa7b4cpnaODgjwJfuBJ35Og3mevZLNYOT3PGT/aiv/
 Y7Cpd6GNTfltK4Fxcub6RJq72hYl9wYfOWkRd1vDsRzizZV/52tVwQH5xepGojFMEdLfFx
 8uKmnu0AdwSo+DCgn4O7IcNMV+CVdZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-iF-96TDFPtOJH7YpwpxbPQ-1; Tue, 11 Feb 2020 05:54:51 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E4848017DF
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 10:54:50 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94EBD165D3;
 Tue, 11 Feb 2020 10:54:48 +0000 (UTC)
Date: Tue, 11 Feb 2020 10:54:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 2/8] migration: Add support for modules
Message-ID: <20200211105446.GE2751@work-vm>
References: <20200129115655.10414-1-quintela@redhat.com>
 <20200129115655.10414-3-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200129115655.10414-3-quintela@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: iF-96TDFPtOJH7YpwpxbPQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> So we don't have to compile everything in, or have ifdefs
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>

As far as I can tell this matches the way all the rest of the module
stuff works, so:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

(Although I wish it was documented somewhere).

Dave

> ---
>  include/qemu/module.h | 2 ++
>  vl.c                  | 1 +
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index 65ba596e46..907cb5c0a5 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -40,6 +40,7 @@ static void __attribute__((constructor)) do_qemu_init_ =
## function(void)    \
>  #endif
> =20
>  typedef enum {
> +    MODULE_INIT_MIGRATION,
>      MODULE_INIT_BLOCK,
>      MODULE_INIT_OPTS,
>      MODULE_INIT_QOM,
> @@ -56,6 +57,7 @@ typedef enum {
>  #define xen_backend_init(function) module_init(function, \
>                                                 MODULE_INIT_XEN_BACKEND)
>  #define libqos_init(function) module_init(function, MODULE_INIT_LIBQOS)
> +#define migration_init(function) module_init(function, MODULE_INIT_MIGRA=
TION)
> =20
>  #define block_module_load_one(lib) module_load_one("block-", lib)
>  #define ui_module_load_one(lib) module_load_one("ui-", lib)
> diff --git a/vl.c b/vl.c
> index b0f52c4d6e..9f8577955a 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2890,6 +2890,7 @@ int main(int argc, char **argv, char **envp)
>      qemu_init_exec_dir(argv[0]);
> =20
>      module_call_init(MODULE_INIT_QOM);
> +    module_call_init(MODULE_INIT_MIGRATION);
> =20
>      qemu_add_opts(&qemu_drive_opts);
>      qemu_add_drive_opts(&qemu_legacy_drive_opts);
> --=20
> 2.24.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


