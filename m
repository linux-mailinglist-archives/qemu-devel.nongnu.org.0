Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD53986BC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:43:13 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOLA-0007tJ-DN
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loOK0-0006T5-75
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:42:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loOJy-0000uS-EP
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622630517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CIuIXfXDYqBXND7Pf5FRli2L8rZcgzQ+taZAVuDZ23M=;
 b=Oh4/hG/iAbmWer26TmXimnWVUjXB9F/zoFJk3DU94VWxlwm7ifB1vVL5FDS+mShsbJm1//
 QEc43qelF8nbFYg6QPPye9QU40PJbpIW6VRluTEZJGroERoG2xd765YQkWNq9sEYedJz14
 GaK7SvcajiWV76i6kEPVlJ9zrr9Km+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-IxcpqwyDNMaXtE0VNWdBNw-1; Wed, 02 Jun 2021 06:41:56 -0400
X-MC-Unique: IxcpqwyDNMaXtE0VNWdBNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8CE801B15;
 Wed,  2 Jun 2021 10:41:54 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A4AC5C648;
 Wed,  2 Jun 2021 10:41:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v4 10/14] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
In-Reply-To: <20210524025256.22252-10-acho@suse.com>
Organization: Red Hat GmbH
References: <20210524025256.22252-1-acho@suse.com>
 <20210524025256.22252-10-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 02 Jun 2021 12:41:53 +0200
Message-ID: <87v96wpmz2.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: thuth@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, cfontana@suse.de,
 pbonzini@redhat.com, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> this will allow to remove the kvm stubs.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  target/s390x/diag.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index c17a2498a7..8405f69df0 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -20,6 +20,7 @@
>  #include "hw/s390x/ipl.h"
>  #include "hw/s390x/s390-virtio-ccw.h"
>  #include "hw/s390x/pv.h"
> +#include "sysemu/kvm.h"
>  #include "kvm_s390x.h"
>  
>  int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
> @@ -168,7 +169,7 @@ out:
>              return;
>          }
>  
> -        if (kvm_s390_get_hpage_1m()) {
> +        if (kvm_enabled() && kvm_s390_get_hpage_1m()) {

I was wondering whether a better option would be to create some kind of
has_huge_page_backing() function that uses kvm_enabled(), but this seems
to be the only call site for kvm_s390_get_hpage_1m(), so I'm not sure
whether it would be worth it.

>              error_report("Protected VMs can currently not be backed with "
>                           "huge pages");
>              env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;


