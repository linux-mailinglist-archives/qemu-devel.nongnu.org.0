Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332405EDBE1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:37:16 +0200 (CEST)
Received: from localhost ([::1]:41154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVNL-0006Ln-9b
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odSR6-0000Qu-Qw
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odSR3-0001gt-CZ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664353732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZG43oi9gHFs2PpZMRpCC6ygJH+a8dCLTjNpCRwNreQ=;
 b=WtBfmb5gerZaB8dCyR30Ea8+DR5FruVTOiRrPHN17r2gDL+eGij/+RTPnxjoV8SCgS83eB
 4JrymARJzVi21u3clLgD+5VOtyfc0WAq6pR4AqmbYiCdSI94n7B483XoK1IVj6ft91ey/T
 qFBRgJSMSm7BKp3zSjhuu8zyLmcVmis=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-vpDmN4lQNRqwkuNVMbKgFw-1; Wed, 28 Sep 2022 04:28:08 -0400
X-MC-Unique: vpDmN4lQNRqwkuNVMbKgFw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 696D3858F17;
 Wed, 28 Sep 2022 08:28:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32F5A492B1F;
 Wed, 28 Sep 2022 08:28:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D8E0C21E691D; Wed, 28 Sep 2022 10:28:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 5/5] accel: abort if we fail to load the accelerator
 plugin
References: <20220927133825.32631-1-cfontana@suse.de>
 <20220927133825.32631-6-cfontana@suse.de>
Date: Wed, 28 Sep 2022 10:28:06 +0200
In-Reply-To: <20220927133825.32631-6-cfontana@suse.de> (Claudio Fontana's
 message of "Tue, 27 Sep 2022 15:38:25 +0200")
Message-ID: <875yh7299l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Claudio Fontana <cfontana@suse.de> writes:

> if QEMU is configured with modules enabled, it is possible that the
> load of an accelerator module will fail.
> Abort in this case, relying on module_object_class_by_name to report
> the specific load error if any.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> [claudio: changed abort() to exit(1)]
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  accel/accel-softmmu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
> index 67276e4f52..f9cdafb148 100644
> --- a/accel/accel-softmmu.c
> +++ b/accel/accel-softmmu.c
> @@ -66,6 +66,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
>  {
>      const char *ac_name;
>      char *ops_name;
> +    ObjectClass *oc;
>      AccelOpsClass *ops;
>=20=20
>      ac_name =3D object_class_get_name(OBJECT_CLASS(ac));
> @@ -73,8 +74,13 @@ void accel_init_ops_interfaces(AccelClass *ac)
>=20=20
>      ops_name =3D g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
>      ops =3D ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
> +    oc =3D module_object_class_by_name(ops_name);
> +    if (!oc) {
> +        error_report("fatal: could not load module for type '%s'", ops_n=
ame);

I'm not sure the additional error message is worth it.

> +        exit(1);

Commit message claims we abort, but we don't, we terminate
unsuccessfully.  Easy enough to fix :)

> +    }
>      g_free(ops_name);
> -
> +    ops =3D ACCEL_OPS_CLASS(oc);
>      /*
>       * all accelerators need to define ops, providing at least a mandato=
ry
>       * non-NULL create_vcpu_thread operation.

With the commit message corrected:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


