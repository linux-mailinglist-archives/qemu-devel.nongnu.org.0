Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BEE6A0D39
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:42:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDjh-0003tu-F6; Thu, 23 Feb 2023 10:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVDjf-0003sa-JP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:42:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVDje-0007Y0-3P
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677166936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lryqtoi9kh4TElrlW23sYG/Tq/mjqxDg7fz7Tt0q534=;
 b=JMa/t7ogynNXx8OiFHzhgz2qLTqBQnNElM3m+c2Q6XBp/NM/+YxBVbcXBvtlq15apiLKZl
 1UHoPywUWmIBw0f8v3dB3LnsKKFXX8bwiyRrtkwQ+BUGPWMVV7jft5XTLxYZ/YytEf8pua
 wpz+J1agJ/YTRN1iVeQIkhOKwzAmeRE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-XT2M0A4CMHiqdkgAwv2cAQ-1; Thu, 23 Feb 2023 10:42:13 -0500
X-MC-Unique: XT2M0A4CMHiqdkgAwv2cAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14E4F1C05EA2;
 Thu, 23 Feb 2023 15:42:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5683C15BAD;
 Thu, 23 Feb 2023 15:42:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B919121E6A1F; Thu, 23 Feb 2023 16:42:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,  qemu-block@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>
Subject: Re: [RFC PATCH 5/5] hw/ppc/pnv_bmc: Simplify pnv_bmc_find()
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-6-philmd@linaro.org>
Date: Thu, 23 Feb 2023 16:42:11 +0100
In-Reply-To: <20230216122524.67212-6-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 16 Feb 2023 13:25:24
 +0100")
Message-ID: <871qmgs818.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> ForeachArgs::name is only used once as TYPE_IPMI_BMC.
> Since the penultimate commit, object_child_foreach_recursive()'s
> handler takes an Error* argument and return a boolean.
> We can directly pass ForeachArgs::obj as context, removing the
> ForeachArgs structure.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> RFC: please double-check...
>
>  hw/ppc/pnv_bmc.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 05acc88a55..566284469f 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -278,36 +278,29 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>      return IPMI_BMC(obj);
>  }
>=20=20
> -typedef struct ForeachArgs {
> -    const char *name;
> -    Object *obj;
> -} ForeachArgs;
> -
>  static bool bmc_find(Object *child, void *opaque, Error **errp)
>  {
> -    ForeachArgs *args =3D opaque;
> +    Object **obj =3D opaque;
>=20=20
> -    if (object_dynamic_cast(child, args->name)) {
> -        if (args->obj) {
> -            return false;
> +    if (object_dynamic_cast(child, TYPE_IPMI_BMC)) {
> +        if (*obj) {
> +            return true;

Looks like you're changing return false to return true.  Intendional?

>          }
> -        args->obj =3D child;
> +        *obj =3D child;
>      }
>      return true;
>  }
>=20=20
>  IPMIBmc *pnv_bmc_find(Error **errp)
>  {
> -    ForeachArgs args =3D { TYPE_IPMI_BMC, NULL };
> -    int ret;
> +    Object *obj =3D NULL;
>=20=20
> -    ret =3D object_child_foreach_recursive(object_get_root(), bmc_find,
> -                                         &args, NULL);
> -    if (ret) {
> +    if (!object_child_foreach_recursive(object_get_root(), bmc_find, &ob=
j,
> +                                        NULL)) {
>          error_setg(errp, "machine should have only one BMC device. "
>                     "Use '-nodefaults'");
>          return NULL;
>      }
>=20=20
> -    return args.obj ? IPMI_BMC(args.obj) : NULL;
> +    return IPMI_BMC(obj);
>  }


