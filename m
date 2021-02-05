Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7829310611
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:52:02 +0100 (CET)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vuL-0001iT-It
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7vso-0001By-4y
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 02:50:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7vsl-0008Th-Ir
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 02:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612511421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LpGCbVmk0ljMYjk+XRQJEo9AJD3aipdUecunsRdxw8=;
 b=ac1L3MGfLMKHz9YWSsFcetGEU7ZoiCV4BonAwMdicm+wyQZyPXB3zbnsU7714G0b/PV4/i
 CxDAyeDBQ/kcuvdmT5FIZjSEbiNfFXu/c9qAT1I8/4WdfmzQgkPSdEZWCRYP22e1zi2f8n
 GnXFf1VSjXAL2mVIk/IqmYJ1ZDSfo+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-MHvCz2SuP4KV8MRssRErXw-1; Fri, 05 Feb 2021 02:50:18 -0500
X-MC-Unique: MHvCz2SuP4KV8MRssRErXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E01E280196C;
 Fri,  5 Feb 2021 07:50:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED2711971C;
 Fri,  5 Feb 2021 07:50:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33C60113865F; Fri,  5 Feb 2021 08:50:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 03/33] migration: push Error **errp into
 qemu_loadvm_state_setup()
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-4-berrange@redhat.com>
Date: Fri, 05 Feb 2021 08:50:12 +0100
In-Reply-To: <20210204171907.901471-4-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 4 Feb 2021 17:18:37
 +0000")
Message-ID: <878s836jij.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org,
 "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This is an incremental step in converting vmstate loading code to report
> via Error objects instead of printing directly to the console/monitor.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  migration/savevm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 870199b629..f4ed14a230 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2490,7 +2490,7 @@ static int qemu_loadvm_state_header(QEMUFile *f, Er=
ror **errp)
>      return 0;
>  }
> =20
> -static int qemu_loadvm_state_setup(QEMUFile *f)
> +static int qemu_loadvm_state_setup(QEMUFile *f, Error **errp)
>  {
>      SaveStateEntry *se;
>      int ret;
> @@ -2509,7 +2509,7 @@ static int qemu_loadvm_state_setup(QEMUFile *f)
>          ret =3D se->ops->load_setup(f, se->opaque);
>          if (ret < 0) {
>              qemu_file_set_error(f, ret);
> -            error_report("Load state of device %s failed", se->idstr);
> +            error_setg(errp, "Load state of device %s failed", se->idstr=
);
>              return ret;
>          }
>      }
> @@ -2656,8 +2656,7 @@ int qemu_loadvm_state(QEMUFile *f, Error **errp)
>          return -1;
>      }
> =20
> -    if (qemu_loadvm_state_setup(f) !=3D 0) {
> -        error_setg(errp, "Error %d while loading VM state", -EINVAL);
> +    if (qemu_loadvm_state_setup(f, errp) < 0) {
>          return -1;
>      }

Drive-by remark, *not* a demand: I don't like "0 on success, -1 on
failure".  When we return just one value on success and one on failure,
I prefer true and false.  Negative value on failure is of course fine
for returning error codes, and were we want to return arbitrary
non-negative values on success.


