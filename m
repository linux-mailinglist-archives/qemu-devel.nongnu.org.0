Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4B3690FE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 13:19:45 +0200 (CEST)
Received: from localhost ([::1]:60440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtqa-0004AN-UY
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 07:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZtnS-0001kx-2z
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZtnQ-0005lO-Eu
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619176587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CYBXSh++dXYQKdckxnuInQQcS2DSDviGcN/PxN6qLck=;
 b=JluQ2raoWGttzKZtybgpG3LIDY/cvHL+RCsfvHDtbJM5y0zyFZlPitZ+/CC24PamXu2G4w
 z03yusnPM6MXdY//KMmuyLnRHpfN+g06znRFqi2da2ofpdPgCt/R3+jUnDpest/ZnTHaxl
 STT+F7g9xJrQDVkf/cHI+DntBEbcFB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-ktFZQQHtMVOdv0lE0y_ZFQ-1; Fri, 23 Apr 2021 07:16:26 -0400
X-MC-Unique: ktFZQQHtMVOdv0lE0y_ZFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 311B018397A5;
 Fri, 23 Apr 2021 11:16:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E368F10074E1;
 Fri, 23 Apr 2021 11:16:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 82CEE113525D; Fri, 23 Apr 2021 13:16:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 15/15] hmp: Print "reserve" property of memory
 backends with "info memdev"
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-16-david@redhat.com>
Date: Fri, 23 Apr 2021 13:16:07 +0200
In-Reply-To: <20210421122624.12292-16-david@redhat.com> (David Hildenbrand's
 message of "Wed, 21 Apr 2021 14:26:24 +0200")
Message-ID: <87wnstgsjs.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> Let's print the new property.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/machine-hmp-cmds.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index 004a92b3d6..9bedc77bb4 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -112,6 +112,8 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict=
)
>                         m->value->prealloc ? "true" : "false");
>          monitor_printf(mon, "  share: %s\n",
>                         m->value->share ? "true" : "false");
> +        monitor_printf(mon, "  reserve: %s\n",
> +                       m->value->reserve ? "true" : "false");
>          monitor_printf(mon, "  policy: %s\n",
>                         HostMemPolicy_str(m->value->policy));
>          visit_complete(v, &str);

Reviewed-by: Markus Armbruster <armbru@redhat.com>


