Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B7264F42B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Iko-00059j-Pb; Fri, 16 Dec 2022 17:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p6IkL-00054G-JI; Fri, 16 Dec 2022 17:00:01 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p6IkJ-0003kD-7y; Fri, 16 Dec 2022 17:00:00 -0500
Received: from smtpclient.apple
 (dynamic-077-009-092-114.77.9.pool.telefonica.de [77.9.92.114])
 by csgraf.de (Postfix) with ESMTPSA id 539B26080182;
 Fri, 16 Dec 2022 22:59:50 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexander Graf <agraf@csgraf.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
Date: Fri, 16 Dec 2022 22:59:39 +0100
Message-Id: <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
References: <20221216212944.28229-2-farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
In-Reply-To: <20221216212944.28229-2-farosas@suse.de>
To: Fabiano Rosas <farosas@suse.de>
X-Mailer: iPhone Mail (20C65)
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
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

Hi Claudio,

If the PSCI implementation becomes TCG only, can we also move to a tcg accel=
 directory? It slowly gets super confusing to keep track of which files are s=
upposed to be generic target code and which ones TCG specific.

Alex

> Am 16.12.2022 um 22:37 schrieb Fabiano Rosas <farosas@suse.de>:
>=20
> =EF=BB=BFFrom: Claudio Fontana <cfontana@suse.de>
>=20
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> Originally from:
> [RFC v14 09/80] target/arm: only build psci for TCG
> https://lore.kernel.org/r/20210416162824.25131-10-cfontana@suse.de
> ---
> target/arm/meson.build | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index 87e911b27f..26e425418f 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -61,10 +61,13 @@ arm_softmmu_ss.add(files(
>   'arm-powerctl.c',
>   'machine.c',
>   'monitor.c',
> -  'psci.c',
>   'ptw.c',
> ))
>=20
> +arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'psci.c',
> +))
> +
> subdir('hvf')
>=20
> target_arch +=3D {'arm': arm_ss}
> --=20
> 2.35.3
>=20

