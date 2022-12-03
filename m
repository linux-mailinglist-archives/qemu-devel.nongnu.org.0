Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7B64152B
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 10:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1OYL-0000to-I5; Sat, 03 Dec 2022 04:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1OYI-0000s4-QN
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1OYG-0004WY-KA
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670058675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XY4TCSA9udErV95JNrgPwFhJXHKSG9YAWZQN/gbhurU=;
 b=B7RDZIKn4OyB6F5ymg6wyH6aS1y1uazEDIu2i518o5tkgN+OnUvkNGl5rAilGtkv+8AxKf
 5PVL5addNM0PdCZO3BI8J5WoAoVJBId1aMO2qAzHMfiplUCKGIz5ioFJcv1LYbGufGvZFb
 3U4VD3FeeE+WCKGdlno6kC0ig6EcCrA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-wBQYrwaiNGi6UkP7iSZuBA-1; Sat, 03 Dec 2022 04:11:10 -0500
X-MC-Unique: wBQYrwaiNGi6UkP7iSZuBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A6EE101A528;
 Sat,  3 Dec 2022 09:11:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BFA22166B2A;
 Sat,  3 Dec 2022 09:11:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 22B3121E6921; Sat,  3 Dec 2022 10:11:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Eric Blake <eblake@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/11] qapi/migration: Introduce
 x-vcpu-dirty-limit-period parameter
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <cover.1669047366.git.huangy81@chinatelecom.cn>
 <9e6d5e0ab54c82c8b42a3b318249320fb20e3a44.1669047366.git.huangy81@chinatelecom.cn>
Date: Sat, 03 Dec 2022 10:11:07 +0100
In-Reply-To: <9e6d5e0ab54c82c8b42a3b318249320fb20e3a44.1669047366.git.huangy81@chinatelecom.cn>
 (huangy's message of "Mon, 21 Nov 2022 11:26:36 -0500")
Message-ID: <87zgc4onro.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Introduce "x-vcpu-dirty-limit-period" migration experimental
> parameter, which is in the range of 1 to 1000ms and used to
> make dirtyrate calculation period configurable.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  migration/migration.c | 26 ++++++++++++++++++++++++++
>  monitor/hmp-cmds.c    |  8 ++++++++
>  qapi/migration.json   | 34 +++++++++++++++++++++++++++-------
>  3 files changed, 61 insertions(+), 7 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 739bb68..701267c 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -116,6 +116,8 @@
>  #define DEFAULT_MIGRATE_ANNOUNCE_ROUNDS    5
>  #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
>=20=20
> +#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     500     /* ms */
> +
>  static NotifierList migration_state_notifiers =3D
>      NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
>=20=20
> @@ -963,6 +965,9 @@ MigrationParameters *qmp_query_migrate_parameters(Err=
or **errp)
>                         s->parameters.block_bitmap_mapping);
>      }
>=20=20
> +    params->has_x_vcpu_dirty_limit_period =3D true;
> +    params->x_vcpu_dirty_limit_period =3D s->parameters.x_vcpu_dirty_lim=
it_period;
> +
>      return params;
>  }
>=20=20
> @@ -1564,6 +1569,15 @@ static bool migrate_params_check(MigrationParamete=
rs *params, Error **errp)
>      }
>  #endif
>=20=20
> +    if (params->has_x_vcpu_dirty_limit_period &&
> +        (params->x_vcpu_dirty_limit_period < 1 ||
> +         params->x_vcpu_dirty_limit_period > 1000)) {
> +        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
> +                   "x_vcpu_dirty_limit_period",
> +                   "is invalid, it must be in the range of 1 to 1000 ms"=
);

Two mistakes:

1. The parameter is called "x-vcpu-dirty-limit-period".

2. The error message is bad:

    (qemu) migrate_set_parameter x-vcpu-dirty-limit-period 100000
    Error: Parameter 'x_vcpu_dirty_limit_period' expects is invalid, it mus=
t be in the range of 1 to 1000 ms

   Use something like

           error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                      "x-vcpu-dirty-limit-period",
                      "a value between 1 and 1000");

Always, always, always test your error paths!

> +        return false;
> +    }
> +
>      return true;
>  }
>=20=20

[...]


