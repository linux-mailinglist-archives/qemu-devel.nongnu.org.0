Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEA149BAAD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:54:56 +0100 (CET)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCQ1v-0002s1-Sc
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:54:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCPv0-00055d-N0
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:47:47 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:40760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCPuw-0002DQ-W9
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:47:45 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-Gt4v7fZTO9igu0cEZKaPxA-1; Tue, 25 Jan 2022 12:47:38 -0500
X-MC-Unique: Gt4v7fZTO9igu0cEZKaPxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BED062F25;
 Tue, 25 Jan 2022 17:47:34 +0000 (UTC)
Received: from bahia (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05895838CA;
 Tue, 25 Jan 2022 17:47:08 +0000 (UTC)
Date: Tue, 25 Jan 2022 18:47:07 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] gitlab: fall back to commit hash in qemu-setup filename
Message-ID: <20220125184707.0589fd64@bahia>
In-Reply-To: <20220125173454.10381-1-stefanha@redhat.com>
References: <20220125173454.10381-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jan 2022 17:34:54 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Personal repos may not have release tags (v6.0.0, v6.1.0, etc) and this
> causes cross_system_build_job to fail when pretty-printing a unique
> qemu-setup-*.exe name:
>=20
>   version=3D"$(git describe --match v[0-9]*)";
>              ^^^^^^^^^^ fails ^^^^^^^^^^^
>   mv -v qemu-setup*.exe qemu-setup-${version}.exe;
>=20
> Fall back to the short commit hash if necessary. This fixes CI failures
> that Greg Kurz and I experienced in our personal repos.
>=20
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

Thanks for the green CI !

Reviewed-by: Greg Kurz <groug@kaod.org>

>  .gitlab-ci.d/crossbuild-template.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbui=
ld-template.yml
> index 10d22dcf6c..29c3c2b826 100644
> --- a/.gitlab-ci.d/crossbuild-template.yml
> +++ b/.gitlab-ci.d/crossbuild-template.yml
> @@ -14,7 +14,7 @@
>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>      - if grep -q "EXESUF=3D.exe" config-host.mak;
>        then make installer;
> -      version=3D"$(git describe --match v[0-9]*)";
> +      version=3D"$(git describe --match v[0-9]* 2>/dev/null || git rev-p=
arse --short HEAD)";
>        mv -v qemu-setup*.exe qemu-setup-${version}.exe;
>        fi
> =20


