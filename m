Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE264FEA0E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 00:08:34 +0200 (CEST)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neOga-00020v-Ht
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 18:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1neOeH-0001IO-0h
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 18:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1neOeA-0006ho-TG
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 18:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649801161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ih8LCdDbtsrcAw8/dUyabMeA7HRUFHtNbdkG9QHTt2k=;
 b=B2ISxW5USQqAfPq/4QLB62JtXkEQf/IAKkTF1nwajOCgSqHrWu1tPm+ZWf5Om706M9pgPq
 UlPLRpFuLJ14/34dlkNym94Xyq4w4fqx/5TJJrPYcvYVSCCIRCvE0RFLKTh3UxuBX1kapS
 iiy9Lve3yrHnxF7HzGPV0Oq2ft7X2ds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-HJA-kdD9M-WdpvmDrQfMQg-1; Tue, 12 Apr 2022 18:05:59 -0400
X-MC-Unique: HJA-kdD9M-WdpvmDrQfMQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5150F811E76
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 22:05:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0864C111D3C8;
 Tue, 12 Apr 2022 22:05:54 +0000 (UTC)
Date: Tue, 12 Apr 2022 17:05:53 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.1 1/8] nbd: actually implement reply_possible
 safeguard
Message-ID: <20220412220553.dheyqpxfgkjkjtqv@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220412194204.350889-2-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-6-a115bf
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 12, 2022 at 09:41:57PM +0200, Paolo Bonzini wrote:
> The .reply_possible field of s->requests is never set to false.  This is
> not a big problem as it is only a safeguard to detect protocol errors,
> but fix it anyway.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 567872ac53..6a5e410e5f 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -454,15 +454,16 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
>              nbd_channel_error(s, -EINVAL);
>              return -EINVAL;
>          }
> -        if (s->reply.handle == handle) {
> -            /* We are done */
> -            return 0;
> -        }
>          ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
>          if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].reply_possible) {
>              nbd_channel_error(s, -EINVAL);
>              return -EINVAL;
>          }
> +        s->requests[ind2].reply_possible = nbd_reply_is_structured(&s->reply);

If the reply is simple (not structured), then we expect no further
replies, so this sets things to false.  But if the reply is
structured, the answer depends on NBD_REPLY_FLAG_DONE, as in:

s->requests[ind2].reply_possible =
  nbd_reply_is_structured(&s->reply) &&
  (s->reply.structured.flags & NBD_REPLY_FLAG_DONE);

> +        if (s->reply.handle == handle) {
> +            /* We are done */
> +            return 0;
> +        }
>          nbd_recv_coroutine_wake_one(&s->requests[ind2]);
>      }
>  }

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


