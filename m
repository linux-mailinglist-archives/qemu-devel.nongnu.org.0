Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CC76EB41B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:00:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppyn2-0008O4-DA; Fri, 21 Apr 2023 17:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppyn0-0008Nu-MN
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:59:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppymz-0007Xz-7D
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682114372;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITDVvjSe3itaqEqFKQtWgHHSK4sUiHTLWZAURcz8dlQ=;
 b=iOsTpodzN9cXHvC5ghclQSGOcI68TDkdFuGZbkTTfuBkyqP30FB10C9UA6bSpTb9X616d1
 AxNpWSurQDbgFkCegENu1I7MDuW7F4/+khlLI2x/G2pARmrrD5nl9/FqK8oNTNeazf57Zt
 CDrzb+IFcA0+gCZvnijyYXNc08ZEEDc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-ZLLHPT8uOeODpybdellTtA-1; Fri, 21 Apr 2023 17:59:31 -0400
X-MC-Unique: ZLLHPT8uOeODpybdellTtA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2ff4bc7a770so1230037f8f.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 14:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114369; x=1684706369;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ITDVvjSe3itaqEqFKQtWgHHSK4sUiHTLWZAURcz8dlQ=;
 b=EiY2U8qrOVweEfyhznBz3PVLJZKQLX+NM51PaUsoExaHVuY/cfuvZ1ByVm6lILDv5W
 EOGswwiHinhl5UYnRRgS8gOneiE7RX5FODAaoTwFabqJ+6nsW0yE5wbnng2WcxakhNGq
 aH2P5gn/sWJb90TpOk6L5EpFbpQVYa/IRXJGFHdTfLL5tMelQjx2LRA4IZzhbqUXQich
 KZVjWmSxqNN+cPkC+ErNIvES65/OBo59CnBWwsZNhZUZueizl2obCZwR2YxHpWoK271J
 +SBUhM8PWu8oIRysalv23BaYmbbP5d7m91QgolwzM8RApLsvCy/L1Ln+XoGTrFYI6tuI
 txpg==
X-Gm-Message-State: AAQBX9fve/IBjfVCLjTcxLU+yDnUeDh3eKCP3DztpryZ4ppl4rRb5hF1
 XFdJ4gfqPn1J0f8M2qV4C3UW7jzKPWn0YsjqJ7UAk71zpWpVRRdMgxiF5UBmcQb3s+NYOIlQnUU
 9rGpBn8fCuHrJKBI=
X-Received: by 2002:adf:eacc:0:b0:2f4:867e:efaa with SMTP id
 o12-20020adfeacc000000b002f4867eefaamr5206263wrn.53.1682114369031; 
 Fri, 21 Apr 2023 14:59:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z32Oxv8D2VrQF64SqfPrZkCk/u9rMb2PEkREraD2pd+pyGMnAnhlrt19uKtBfrJRyrXZy45Q==
X-Received: by 2002:adf:eacc:0:b0:2f4:867e:efaa with SMTP id
 o12-20020adfeacc000000b002f4867eefaamr5206253wrn.53.1682114368751; 
 Fri, 21 Apr 2023 14:59:28 -0700 (PDT)
Received: from redhat.com ([31.4.212.142]) by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b003f1733feb3dsm9321581wms.0.2023.04.21.14.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 14:59:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Zhang Chen <chen.zhang@intel.com>,  Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [PATCH v2 3/6] tests/qtest: capture RESUME events during migration
In-Reply-To: <20230421171411.566300-4-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Fri, 21 Apr 2023 18:14:08
 +0100")
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-4-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 21 Apr 2023 23:59:25 +0200
Message-ID: <87leikgama.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> When running migration tests we monitor for a STOP event so we can skip
> redundant waits. This will be needed for the RESUME event too shortly.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

i.e. it is better that what we have now.

But


> diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-help=
ers.c
> index f6f3c6680f..61396335cc 100644
> --- a/tests/qtest/migration-helpers.c
> +++ b/tests/qtest/migration-helpers.c
> @@ -24,14 +24,20 @@
>  #define MIGRATION_STATUS_WAIT_TIMEOUT 120
>=20=20
>  bool got_stop;
> +bool got_resume;
>=20=20
> -static void check_stop_event(QTestState *who)
> +static void check_events(QTestState *who)
>  {
>      QDict *event =3D qtest_qmp_event_ref(who, "STOP");
>      if (event) {
>          got_stop =3D true;
>          qobject_unref(event);
>      }
> +    event =3D qtest_qmp_event_ref(who, "RESUME");
> +    if (event) {
> +        got_resume =3D true;
> +        qobject_unref(event);
> +    }
>  }

What happens if we receive the events in the order RESUME/STOP (I mean
in the big scheme of things, not that it makes sense in this particular
case).

QDict *qtest_qmp_event_ref(QTestState *s, const char *event)
{
    while (s->pending_events) {

        GList *first =3D s->pending_events;
        QDict *response =3D (QDict *)first->data;

        s->pending_events =3D g_list_delete_link(s->pending_events, first);

        if (!strcmp(qdict_get_str(response, "event"), event)) {
            return response;
        }
        qobject_unref(response);
    }
    return NULL;
}

if we don't found the event that we are searching for, we just drop it.
Does this makes sense if we are searching only for more than one event?

Later, Juan.


