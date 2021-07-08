Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F793BF73D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:07:01 +0200 (CEST)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Pzo-0006LZ-8d
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1PyG-0004q1-6b
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:05:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1PyC-0006cl-Nq
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625735117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DqhDBGN4F/miH0tLh0G8/MsyZYpqyZiR0+D3CDpG3NM=;
 b=RqJq5Bk1a48+UipB2P+ZlyKbTIYTvNqSCfu/HNCXqccNzvNdu2D7Ri10v318XVmyMLJ1Yf
 1PTlX7xk6HB7Vx3mZXnxLYpRLNusR97Q6vS5r6cBNkwLy20/T5Bibhrblr2BlHPY2PJwdZ
 jtme6tg3O5RNQfmJoHt1jitbKHfL9xo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-txhvNRi5MhiCwrb0m87rSg-1; Thu, 08 Jul 2021 05:05:16 -0400
X-MC-Unique: txhvNRi5MhiCwrb0m87rSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ABC08018A7;
 Thu,  8 Jul 2021 09:05:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CC151002D71;
 Thu,  8 Jul 2021 09:05:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EAD861132B52; Thu,  8 Jul 2021 11:05:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl: fix leak of qdict_crumple return value
References: <20210707121545.361829-1-pbonzini@redhat.com>
Date: Thu, 08 Jul 2021 11:05:13 +0200
In-Reply-To: <20210707121545.361829-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 7 Jul 2021 14:15:44 +0200")
Message-ID: <87k0m19nw6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Coverity reports that qemu_parse_config_group is returning without
> unrefing the "crumpled" dictionary in case its top level item is a
> list.  But actually the contract with qemu_record_config_group is
> the same as for qemu_parse_config_group itself: if those function
> need to stash the dictionary they get, they have to take a reference
> themselves (currently this is never the case for either function).
> Therefore, just add an unconditional qobject_unref(crumpled) to
> qemu_parse_config_group.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Do we want

  Fixes: c0d4aa82f895af67cbf7772324e05605e22b4162

here?

> ---
>  softmmu/vl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 2004d57108..7b54ddf6f4 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2196,9 +2196,10 @@ static void qemu_parse_config_group(const char *group, QDict *qdict,
>      if (qobject_type(crumpled) != QTYPE_QDICT) {
>          assert(qobject_type(crumpled) == QTYPE_QLIST);
>          error_setg(errp, "Lists cannot be at top level of a configuration section");
> -        return;
> +    } else {
> +        qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
>      }
> -    qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
> +    qobject_unref(crumpled);
>  }
>  
>  static void qemu_read_default_config_file(Error **errp)

Minimally invasive fix, but the result is a bit awkward.  Possibly
neater:

       if (qobject_type(crumpled) == QTYPE_QLIST) {
           error_setg(errp,
                      "Lists cannot be at top level of a configuration section");
       } else {
           assert(qobject_type(crumpled) == QTYPE_QDICT);
           qemu_record_config_group(group, qobject_to(QDict, crumpled),
                                    false, errp);
       }
       qobject_unref(crumpled);

Regardless:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


