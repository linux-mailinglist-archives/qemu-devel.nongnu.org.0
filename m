Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109F654753
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:38:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SKE-0005WE-Vv; Thu, 22 Dec 2022 15:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p8SK2-0005QP-9v
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:47 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p8SK0-0002Q9-PC
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:46 -0500
Received: from smtpclient.apple (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id EB8C5CED22;
 Thu, 22 Dec 2022 21:37:43 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v3 02/10] libvhost-user: Replace typeof with __typeof__
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <2196cf80-5f59-37a5-1efe-7e4ff9767109@redhat.com>
Date: Thu, 22 Dec 2022 21:37:43 +0100
Cc: qemu devel list <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, xieyongji@bytedance.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B9079E64-A3F3-4E29-B4AC-1665B1762B45@holtmann.org>
References: <cover.1671628158.git.marcel@holtmann.org>
 <79297841f1aad83d85297afef99369004d9d19a4.1671628158.git.marcel@holtmann.org>
 <2196cf80-5f59-37a5-1efe-7e4ff9767109@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Paolo,

>> Strictly speaking only -std=3Dgnu99 support the usage of typeof and =
for
>> easier inclusion in external projects, it is better to use =
__typeof__.
>>   CC       libvhost-user.o
>> libvhost-user.c: In function =E2=80=98vu_log_queue_fill=E2=80=99:
>> libvhost-user.c:86:13: error: implicit declaration of function =
=E2=80=98typeof=E2=80=99 [-Werror=3Dimplicit-function-declaration]
>>    86 |             typeof(x) _min1 =3D (x);              \
>>       |             ^~~~~~
>> Changing these two users of typeof makes the compiler happy and no =
extra
>> flags or pragmas need to be provided.
>> Signed-off-by: Marcel Holtmann<marcel@holtmann.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9<philmd@linaro.org>
>=20
> The build system uses "c_std=3Dgnu99".  If you are extracting =
libvhost-user and not using its build files, you need to add --std=3Dgnu99=
 yourself when compiling.
>=20
> If you really don't want to do that, as long as it's just a couple =
underscores that's fine I guess, but mixed declarations and code are =
going to reappear sooner or later.  Please add a patch like this:
>=20
> diff --git a/subprojects/libvhost-user/meson.build =
b/subprojects/libvhost-user/meson.build
> index 39825d9404ae..5deecbfe377d 100644
> --- a/subprojects/libvhost-user/meson.build
> +++ b/subprojects/libvhost-user/meson.build
> @@ -1,6 +1,13 @@
> project('libvhost-user', 'c',
>         license: 'GPL-2.0-or-later',
> -        default_options: ['c_std=3Dgnu99'])
> +        default_options: ['warning_level=3D1', 'c_std=3Dgnu99'])
> +
> +cc =3D meson.get_compiler('c')
> +add_project_arguments(cc.get_supported_arguments(
> +  '-Wsign-compare',
> +  '-Wdeclaration-after-statement',
> +  '-Wstrict-aliasing'),
> +  native: false, language: 'c')

good idea. I included that in v4 patchset.

Regards

Marcel


