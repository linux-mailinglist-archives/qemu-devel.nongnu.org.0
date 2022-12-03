Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5C8641522
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 10:02:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1OP9-0006gz-V1; Sat, 03 Dec 2022 04:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1OOz-0006gf-78
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:01:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1OOx-00075f-IK
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670058098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wN3FHjBo2Ln/zZhXvSKicDfPOZ0a6g1aM7rCxB+fRE=;
 b=bDP+Zk9zcYdx0Z1phvrU07ypbfZAiGJ89tsm1jKC+zdaqJHdPJ5Z5MCD0nUospNpBfFRLZ
 jS5I0gqDC1D6pCLyFdYNUvMTxI0qlz0/PoO37hm/n4HRnR9m5Zq2Og9KYQepljivkkLDFx
 aSbPosr9HPBTuu7FekXszj0x4AQYDgc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-C03N_4r0N76pxVQrL_GuLw-1; Sat, 03 Dec 2022 04:01:32 -0500
X-MC-Unique: C03N_4r0N76pxVQrL_GuLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B3291C0515C;
 Sat,  3 Dec 2022 09:01:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C38C2166B2A;
 Sat,  3 Dec 2022 09:01:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C7F1F21E6921; Sat,  3 Dec 2022 10:01:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Eric Blake <eblake@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 02/11] softmmu/dirtylimit: Add parameter check for
 hmp "set_vcpu_dirty_limit"
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <cover.1669047366.git.huangy81@chinatelecom.cn>
 <56f207f3f962da7d90772cce1e724d50ba415d79.1669047366.git.huangy81@chinatelecom.cn>
Date: Sat, 03 Dec 2022 10:01:28 +0100
In-Reply-To: <56f207f3f962da7d90772cce1e724d50ba415d79.1669047366.git.huangy81@chinatelecom.cn>
 (huangy's message of "Mon, 21 Nov 2022 11:26:34 -0500")
Message-ID: <87bkokq2s7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
> dirty_rate paraemter of hmp command "set_vcpu_dirty_limit" is invalid
> if less than 0, so add parameter check for it.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  softmmu/dirtylimit.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 940d238..c42eddd 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -515,6 +515,11 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const QD=
ict *qdict)
   void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
   {
       int64_t dirty_rate =3D qdict_get_int(qdict, "dirty_rate");
>      int64_t cpu_index =3D qdict_get_try_int(qdict, "cpu_index", -1);
>      Error *err =3D NULL;
>=20=20
> +    if (dirty_rate < 0) {
> +        monitor_printf(mon, "invalid dirty page limit %ld\n", dirty_rate=
);

Here, you use monitor_printf() to report an error, and ...

> +        return;
> +    }
> +
>      qmp_set_vcpu_dirty_limit(!!(cpu_index !=3D -1), cpu_index, dirty_rat=
e, &err);
>      if (err) {
>          hmp_handle_error(mon, err);

... here you use hmp_handle_error().  Suggest to use the latter
consistently.

           return;
       }

       monitor_printf(mon, "[Please use 'info vcpu_dirty_limit' to query "
                      "dirty limit for virtual CPU]\n");

This prints unsolicited help how to read the setting every time you
change it.  We don't that.  Please delete.

   }

Together, the function could look like this:

void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
{
    int64_t dirty_rate =3D qdict_get_int(qdict, "dirty_rate");
    int64_t cpu_index =3D qdict_get_try_int(qdict, "cpu_index", -1);
    Error *err =3D NULL;

    if (dirty_rate < 0) {
        error_setg(&err, "invalid dirty page limit %ld", dirty_rate);
        goto out;
    }

    qmp_set_vcpu_dirty_limit(!!(cpu_index !=3D -1), cpu_index, dirty_rate, =
&err);

out:
    hmp_handle_error(mon, err);
}


