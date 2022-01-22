Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C3D496E04
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 21:47:41 +0100 (CET)
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBNIS-0007kv-40
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 15:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nBNH2-000735-1N
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 15:46:12 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nBNH0-0008RY-04
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 15:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=m1KDl88NAJhlFo8x99LVm1hZJQHIQTo+IIBEY9ICSXI=; b=ZHXfI6yI/LlJVqhyB1FrTsNfci
 XjkP5domR6pu2KZiINL+Fi4SiCj/0SEGh/QlrNiO+xuWaUmhO+BXu3fzrbYllhqcIR0A5ML3O9hgM
 smeO9NDMB/K2Bkp7mAgLb6q6EfRtVDCq/I7AZ8mm2/oOQhBRHbo/WSZ9AXmGPwcSYKO446WQ3FD6f
 FXyQd0YAxgBeRvwo7QgpnGlIFZTyx/7BOUaGlaRTf3hCz5LrvQfh783FT5SPwFHuN9jkodzFsX2AE
 Fymmht8c2LM7UQ0cKME1tmeBpU4y9LIAF4w8MrrxML9tM3E68xpxhxFKVJdyPp8elv/toUuZjSFkG
 GaOu/o0MvgEIGEh8uRLXwSswjuT8KLpmjV5jLpCktWk5eS6rsc/21F4B/VVYuB3ZSsK7yGw3KUlWL
 /K46aQM6Xq5MlyoRViGKdWyO6mdu5YPzGXlqAm6d0XJ0u1oil2zIa3cQskOUWC1jfZo7XF4CynETI
 EQ/BjKPwbY3H9JYyPXIQltsNwv5a+AFL+qnGwJunnIioJ79+/1m2Ui7uyVFvU+S/ItDu/87a/fllZ
 m2SzIonLv8PJH3grGm74TpIx9MqM/jIoJMOV+u4tr0YblCOBujLf5DF+Cc5IdhFStnmpMZ1fLqUW6
 03hK5FKQNMUqZTky20IdYcOw+ioSuSEb6KSmriwQs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Daniel P =?ISO-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] tests/9pfs: fix mkdir() being called twice
Date: Sat, 22 Jan 2022 21:45:59 +0100
Message-ID: <2748625.kGWvO52o2P@silver>
In-Reply-To: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
References: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Samstag, 22. Januar 2022 20:12:16 CET Christian Schoenebeck wrote:
> The 9p test cases use mkdtemp() to create a temporary directory for
> running the 'local' 9p tests with real files/dirs. Unlike mktemp()
> which only generates a unique file name, mkdtemp() also creates the
> directory, therefore the subsequent mkdir() was wrong and caused
> errors on some systems.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Fixes: 136b7af2 (tests/9pfs: fix test dir for parallel tests)
> Reported-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/832
> ---
>  tests/qtest/libqos/virtio-9p.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
>=20
> diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9=
p.c
> index b4e1143288..ef96ef006a 100644
> --- a/tests/qtest/libqos/virtio-9p.c
> +++ b/tests/qtest/libqos/virtio-9p.c
> @@ -37,31 +37,19 @@ static char *concat_path(const char* a, const char* b)
>      return g_build_filename(a, b, NULL);
>  }
>=20
> -static void init_local_test_path(void)
> +void virtio_9p_create_local_test_dir(void)
>  {
> +    struct stat st;
>      char *pwd =3D g_get_current_dir();
>      char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX");
> +
>      local_test_path =3D mkdtemp(template);
>      if (!local_test_path) {
>          g_test_message("mkdtemp('%s') failed: %s", template,
> strerror(errno)); }
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
>=20

Somebody being picky might argue that the cleanup changes above might be sp=
lit=20
as separate patch ...

>      g_assert(local_test_path !=3D NULL);
> -    res =3D mkdir(local_test_path, 0777);
> -    if (res < 0) {
> -        g_test_message("mkdir('%s') failed: %s", local_test_path,
> -                       strerror(errno));
> -    }

=2E.. from the actual fix being this.

If somebody cares, I'll send a v2.

>=20
>      /* ensure test directory exists now ... */
>      g_assert(stat(local_test_path, &st) =3D=3D 0);

Best regards,
Christian Schoenebeck



