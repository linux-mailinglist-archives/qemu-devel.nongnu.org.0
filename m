Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E927221E58
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 10:30:19 +0200 (CEST)
Received: from localhost ([::1]:57312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvzHW-00024w-N0
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 04:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvzGb-0001eA-HJ
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 04:29:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56119
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvzGZ-0002SR-Tw
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 04:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594888158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWgWGJ8sb5IGX1L/+KliMrGaBtjM3xrXpleSeNR/RuM=;
 b=TLszIxizKoabwuEI7nvfE36CQActb0sUb7KuH8JcyDg8RQXyU5x5QgwbA6lC73jTjim2Kk
 GvZE68vXoGlM/H1ReSDtCk0SMbY4roVPkAogxvh+0/uWZW0JvqC+RalNdwIU38u1iJXxDG
 oDz9xctWBL3azc8PVWe5/CNbk87K7wY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-oGKrPemwMtSdVwI1G_bQSQ-1; Thu, 16 Jul 2020 04:29:16 -0400
X-MC-Unique: oGKrPemwMtSdVwI1G_bQSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1876680183C
 for <qemu-devel@nongnu.org>; Thu, 16 Jul 2020 08:29:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9D43710A0;
 Thu, 16 Jul 2020 08:29:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 658D111385E0; Thu, 16 Jul 2020 10:29:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 1/5] hw/core/qdev-properties: Simplify
 get_reserved_region()
References: <20200715175835.27744-1-philmd@redhat.com>
 <20200715175835.27744-2-philmd@redhat.com>
Date: Thu, 16 Jul 2020 10:29:14 +0200
In-Reply-To: <20200715175835.27744-2-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 15 Jul 2020 19:58:31
 +0200")
Message-ID: <87o8ofrhgl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 19:36:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Use the safer g_strdup_printf() over snprintf() + abort().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/core/qdev-properties.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 098298c78e..d5f5aa150b 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -581,13 +581,10 @@ static void get_reserved_region(Object *obj, Visito=
r *v, const char *name,
>      DeviceState *dev =3D DEVICE(obj);
>      Property *prop =3D opaque;
>      ReservedRegion *rr =3D qdev_get_prop_ptr(dev, prop);
> -    char buffer[64];
> -    char *p =3D buffer;
> -    int rc;
> +    g_autofree char *p;
> =20
> -    rc =3D snprintf(buffer, sizeof(buffer), "0x%"PRIx64":0x%"PRIx64":%u"=
,
> -                  rr->low, rr->high, rr->type);
> -    assert(rc < sizeof(buffer));
> +    p =3D g_strdup_printf("0x%"PRIx64":0x%"PRIx64":%u",
> +                        rr->low, rr->high, rr->type);
> =20
>      visit_type_str(v, name, &p, errp);
>  }

I don't buy "safer" (the old code is already safe).  I could buy
"simpler".

It's also less efficient, but that shouldn't matter in a property
getter.


