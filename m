Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BD249CE96
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:35:19 +0100 (CET)
Received: from localhost ([::1]:33746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkKA-0007KV-65
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:35:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nCkFG-0005di-9O
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:30:02 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:60395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nCkFD-0002Pw-VO
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=dUory0NfL3fkksNfLXR6Pp2gpf99gii2+Ep2biHDMJg=; b=m9XpGp9ibWop2RruQmKyoMQzda
 3YrwOiyvDreXa6FjYfS8gU1+wdui7kAI4aANxSrRv3U9NxCNKZ1/2da6osQfONmVBvFjxoMOnb+aL
 vv6ofORTqj53UEi01FD2kAx96GjH9dsOMhFwrwSPicZiP0pvLb5Bg6RtA81xPbcjxf3t7u5vnkkse
 h4oVX3/Grxql0C2qlK06g6MZyPZvXy2nUghndd2oTkrG03fYuH84xxoUsW574W7atz2OxI6so+wHE
 j+N0fuMy8VkjqSqZU28ovLdkIuusX6F/E09+0KF/9kW2kuXkewutN6vs1fYRBMFK7d8SPwCNsVAag
 24VhLzuqz5F2NpG1H5TGLMma9sQjVDR4n3zl6zoqLk+2CadJF86aowdkvXRxTzCbot0J97ISqkyUa
 FdJqXoyxTzutcohGVqzhLaruToCG6kmF8GzlIjDtfOiqzheABQ/pIzK1sNdUwvXP8up/pI1UQuICY
 rv3mmcTzwPlgDGNVBMh4dTcf5cguZV7tK/LM+Z9YAZPNd0oapzXISqfZDUzxztp+BlVqLTs+wg+X2
 1mpV3fjMeG7sfrULvbgNXoto23NhmA+IuykryNqDNN8b1vU3QDH1wUtzr/nG7UnQt/bo1ti9xpvyW
 e0o9gG2LFJUDPkudyaGFb9p6DeHcC/hC4hgAkoI2M=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] tests/9pfs: fix mkdir() being called twice
Date: Wed, 26 Jan 2022 16:29:56 +0100
Message-ID: <3078906.zAPlkE88UT@silver>
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

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



