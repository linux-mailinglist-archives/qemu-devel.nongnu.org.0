Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565AA49B7E4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:47:13 +0100 (CET)
Received: from localhost ([::1]:41500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCO2K-0003q7-EA
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCNpV-0001oD-Df
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:33:58 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:34004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCNpS-0001yu-RX
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:33:57 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-5rbOv-n9Ou2_Dv-jez6fyw-1; Tue, 25 Jan 2022 10:33:50 -0500
X-MC-Unique: 5rbOv-n9Ou2_Dv-jez6fyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18F43100C61B;
 Tue, 25 Jan 2022 15:33:49 +0000 (UTC)
Received: from bahia (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCB6984A28;
 Tue, 25 Jan 2022 15:33:47 +0000 (UTC)
Date: Tue, 25 Jan 2022 16:33:46 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] tests/9pfs: fix mkdir() being called twice
Message-ID: <20220125163346.4cb345ce@bahia>
In-Reply-To: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
References: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 22 Jan 2022 20:12:16 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> The 9p test cases use mkdtemp() to create a temporary directory for
> running the 'local' 9p tests with real files/dirs. Unlike mktemp()
> which only generates a unique file name, mkdtemp() also creates the
> directory, therefore the subsequent mkdir() was wrong and caused
> errors on some systems.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Fixes: 136b7af2 (tests/9pfs: fix test dir for parallel tests)
> Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/832
> ---

Reviewed-by: Greg Kurz <Greg Kurz <groug@kaod.org>

Unrelated, the template pointer is leaked. It looks like g_autofree would
help here. I'll post a follow-up to fix that.

>  tests/qtest/libqos/virtio-9p.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
>=20
> diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9=
p.c
> index b4e1143288..ef96ef006a 100644
> --- a/tests/qtest/libqos/virtio-9p.c
> +++ b/tests/qtest/libqos/virtio-9p.c
> @@ -37,31 +37,19 @@ static char *concat_path(const char* a, const char* b=
)
>      return g_build_filename(a, b, NULL);
>  }
> =20
> -static void init_local_test_path(void)
> +void virtio_9p_create_local_test_dir(void)
>  {
> +    struct stat st;
>      char *pwd =3D g_get_current_dir();
>      char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX");
> +
>      local_test_path =3D mkdtemp(template);
>      if (!local_test_path) {
>          g_test_message("mkdtemp('%s') failed: %s", template, strerror(er=
rno));
>      }
> -    g_assert(local_test_path);
>      g_free(pwd);
> -}
> -
> -void virtio_9p_create_local_test_dir(void)
> -{
> -    struct stat st;
> -    int res;
> -
> -    init_local_test_path();
> =20
>      g_assert(local_test_path !=3D NULL);
> -    res =3D mkdir(local_test_path, 0777);
> -    if (res < 0) {
> -        g_test_message("mkdir('%s') failed: %s", local_test_path,
> -                       strerror(errno));
> -    }
> =20
>      /* ensure test directory exists now ... */
>      g_assert(stat(local_test_path, &st) =3D=3D 0);


