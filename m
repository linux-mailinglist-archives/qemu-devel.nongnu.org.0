Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FD456AC1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 08:15:33 +0100 (CET)
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mny7Q-0005mG-Bg
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 02:15:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnxu4-0001GJ-8P
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 02:01:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnxu0-0001ge-PS
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 02:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637305299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1u245dhDeOf1jbqK0nomOKNsxVwtY5ir+9zk9/7Ypxs=;
 b=FvaOpnvHU7HpIjkiidGwt8mE59MUb04b58i7og5i+LErPAXKXdO66IHvXaFvndheubctmb
 3gHeMmD1Lc8a0a4jnO6o2AkUEzDCzkBjhf9uV+uP920BSssBXvNHcMKkKotOIUoMuwql74
 kHYJY/gV95wu1fOVa4TdpxDNYFlj8Rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-109-hu_WUCLbPMexlmtgvZz8OA-1; Fri, 19 Nov 2021 02:01:36 -0500
X-MC-Unique: hu_WUCLbPMexlmtgvZz8OA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 032968799E0;
 Fri, 19 Nov 2021 07:01:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E334C6060F;
 Fri, 19 Nov 2021 07:01:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 642AF11380A7; Fri, 19 Nov 2021 08:01:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/5] hw/core: Remove use of QERR_UNSUPPORTED
References: <20211029230147.2465055-1-philmd@redhat.com>
 <20211029230147.2465055-2-philmd@redhat.com>
Date: Fri, 19 Nov 2021 08:01:32 +0100
In-Reply-To: <20211029230147.2465055-2-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 30 Oct 2021 01:01:43
 +0200")
Message-ID: <87a6i0sk6r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> QERR_UNSUPPORTED definition is obsolete since 2015 (commit
> 4629ed1e989, "qerror: Finally unused, clean up"). Replace it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/core/nmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/nmi.c b/hw/core/nmi.c
> index 481c4b3c7e5..b4b4a1ed286 100644
> --- a/hw/core/nmi.c
> +++ b/hw/core/nmi.c
> @@ -70,7 +70,7 @@ void nmi_monitor_handle(int cpu_index, Error **errp)
>      if (ns.handled) {
>          error_propagate(errp, ns.err);
>      } else {
> -        error_setg(errp, QERR_UNSUPPORTED);
> +        error_setg(errp, "This command is not currently supported");
>      }
>  }

I think this error message doesn't quite fit here.

We error out when the QOM composition tree does not contain an object
providing interface "nmi".  We don't tell the user, though.  This isn't
terrible, because the suitable objects are generally created by board
code, so whether the command works generally depends only on the machine
type.  Still, a bit more detail in the error message wouldn't hurt,
would it?  Say "machine does not support NMIs".


