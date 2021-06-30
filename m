Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0573B8630
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:23:21 +0200 (CEST)
Received: from localhost ([::1]:40340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyc3c-0005A4-C1
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lyc2D-0004Qt-M2
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lyc2A-0006Nd-Fg
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625066509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eiPewPa3xxQsPN+zNX1qj+v6D4IiYAl+GNlFFAYjFxU=;
 b=MMU7/uhVZp7f928UsHzO7OqEE6qX1ZH+MgE9wbp92RtSA/2E9hyBHsNS0NzbfeNFwQOxML
 DiQcbmGe0YGAIW845oB5WlGMRZaLvnzuAElNFGGU/SJImJA4vNskPZ0QXTr9BfJAGmf+Gr
 FMukURKnud17N13mgKcIbuBUQSFtdUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-QcZd7JbpMXaBe1RhfHu5JA-1; Wed, 30 Jun 2021 11:21:47 -0400
X-MC-Unique: QcZd7JbpMXaBe1RhfHu5JA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81DF85074F;
 Wed, 30 Jun 2021 15:21:46 +0000 (UTC)
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E925C5C1A3;
 Wed, 30 Jun 2021 15:21:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v6 10/13] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
In-Reply-To: <20210629141931.4489-11-acho@suse.com>
Organization: Red Hat GmbH
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-11-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 30 Jun 2021 17:21:44 +0200
Message-ID: <87fswzl6nr.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: cfontana@suse.com, Claudio Fontana <cfontana@suse.de>, acho@suse.com,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

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

I think I asked before whether we should introduce a
s390_huge_page_backing() wrapper (which might be overkill)... any
opinions on that? I'm not really opposed to this patch here, either.

>              error_report("Protected VMs can currently not be backed with "
>                           "huge pages");
>              env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;


