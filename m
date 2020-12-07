Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772EF2D17B2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:42:05 +0100 (CET)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKWS-0005BL-I3
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmKTf-0003U8-PP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:39:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmKTW-0000eO-S0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607362741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hRxmrir5Ccvm68ZS2AvctjmenQaPq5wwsuyn16Y8JWE=;
 b=awDQ7SdVZulD/TsUNkQ3RdGXpVWEou8v6vLLCDLoJlVx0KAcOo1wIqvsOSSnjpHrBnNlF4
 6nRXfBvn9cNxXrUkd7M1otbPsHcJG1Ww+bZbC2DfrZsCixgo8xMlSNFXNAFDbaQzT9sVbP
 JCOGNPb4vTLA6ZzIFyrcqFRujfcLkxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-Bc2Iy0Y_ODePXN6vDUPmUg-1; Mon, 07 Dec 2020 12:38:56 -0500
X-MC-Unique: Bc2Iy0Y_ODePXN6vDUPmUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8917858181;
 Mon,  7 Dec 2020 17:38:54 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D66960BE2;
 Mon,  7 Dec 2020 17:38:50 +0000 (UTC)
Date: Mon, 7 Dec 2020 12:38:49 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH for-6.0] accel: Wire accel to /machine
Message-ID: <20201207173849.GC1289986@habkost.net>
References: <20201207084621.23876-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
In-Reply-To: <20201207084621.23876-1-r.bolshakov@yadro.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 libvir-list@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 11:46:22AM +0300, Roman Bolshakov wrote:
> There's no generic way to query current accel and its properties via QOM
> because there's no link between an accel and current machine.
> 
> The change adds the link, i.e. if HVF is enabled the following will be
> available in QOM:
> 
>   (qemu) qom-get /machine/accel type
>   "hvf-accel"
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
> 
> Hi,
> 
> this is a follow up patch that deprecates earlier series [1].
> 

Is there a reference to the reasoning for dropping the earlier
approach?  Your previous approach seems preferable.

> An outstanding issue is whether management applications can rely on the
> value of /machine/accel/type and output of qom-list-types command [2][3]
> to get current and present accels?
> 
> i.e. would it be ok if libvirt assumes that everything up to the first
> dash in the accel type is the name of the accel (as specified via -M
> accel=ACCEL flag) when it performs QEMU probing?

There are two big assumption libvirt would need to make:
1) That /machine/accel is a stable path that will never change;
2) That the accel name => QOM type naming rules will never change.

Item #1 is unlikely to change, but having the freedom to change
#2 would be useful for future refactoring (like the idea
mentioned at [4]).

The main issue, however, is having those assumptions not being
documented anywhere.  A documented QMP interface is better than a
undocumented `qom-get`-based interface.

                            * * *

This patch is still a good idea, though.  Even if it is just for
debugging or for having clearer object ownership rules, having
the accel object as part of the QOM tree is useful.  So this has
my:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

but we need a commit message that doesn't make people think the
`qom-get` command above will always work.

> 
> Also, Eduardo and Claudio earlier had ideas to provide cpu-specific
> accel subclasses [4][5].
> 
> 1. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03944.html
> 2. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg04212.html
> 3. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg07062.html
> 4. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06513.html
> 5. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06741.html
> 
> Thanks,
> Roman
> 
>  accel/accel.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/accel.c b/accel/accel.c
> index cb555e3b06..45c5bf87b1 100644
> --- a/accel/accel.c
> +++ b/accel/accel.c
> @@ -56,10 +56,11 @@ int accel_init_machine(AccelState *accel, MachineState *ms)
>      if (ret < 0) {
>          ms->accelerator = NULL;
>          *(acc->allowed) = false;
> -        object_unref(OBJECT(accel));
>      } else {
>          object_set_accelerator_compat_props(acc->compat_props);
> +        object_property_add_child(OBJECT(ms), "accel", OBJECT(accel));
>      }
> +    object_unref(OBJECT(accel));
>      return ret;
>  }
>  
> -- 
> 2.29.2
> 

-- 
Eduardo


