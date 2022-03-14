Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3264D8093
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 12:20:09 +0100 (CET)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTikB-0004tI-Mf
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 07:20:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nTih5-0002cH-19
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 07:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nTih2-00017E-B3
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 07:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647256611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxxYWNf2fyJs+Y04jg1tSmQShezS+gkiydiMQP8mkxI=;
 b=EC3QERx2PpmKaH5rS0bmrLuDISshaEJA+jrTldL/PRkFYeM77/U5AsBciyB8B+o5jz/f4o
 p4O5o25lhcPuaQAxA8ZU3dn0rMz94WwMPU/Rc9hNgOY95j0KloBV4M2jDOX1TMDl6C5ax4
 OSS3OzjLtCRW13ZzBgzOj2B3d2v3ns0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-iKkZWaQDNYetd-PcOY_Gig-1; Mon, 14 Mar 2022 07:16:48 -0400
X-MC-Unique: iKkZWaQDNYetd-PcOY_Gig-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A13029ABA3C;
 Mon, 14 Mar 2022 11:16:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13D16469E5E;
 Mon, 14 Mar 2022 11:16:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DBC2121E66C8; Mon, 14 Mar 2022 12:16:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 06/16] use g_new0 instead of g_malloc0
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <20220314093203.1420404-7-pbonzini@redhat.com>
Date: Mon, 14 Mar 2022 12:16:46 +0100
In-Reply-To: <20220314093203.1420404-7-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 14 Mar 2022 10:31:53 +0100")
Message-ID: <875yog238h.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Casting to/from void* must be explicit in C++.  g_new0 takes care of that.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/timer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index 88ef114689..ee071e07d1 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -520,7 +520,7 @@ static inline QEMUTimer *timer_new_full(QEMUTimerListGroup *timer_list_group,
>                                          int scale, int attributes,
>                                          QEMUTimerCB *cb, void *opaque)
>  {
> -    QEMUTimer *ts = g_malloc0(sizeof(QEMUTimer));
> +    QEMUTimer *ts = g_new0(QEMUTimer, 1);
>      timer_init_full(ts, timer_list_group, type, scale, attributes, cb, opaque);
>      return ts;
>  }

Looks like a rerun of commit b45c03f585's Coccinelle script is due.
I'll take care of it.


