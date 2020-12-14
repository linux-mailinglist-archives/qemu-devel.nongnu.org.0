Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C92D9DA6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:28:43 +0100 (CET)
Received: from localhost ([::1]:57412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koreM-0002OT-Ru
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1korZ0-0004k3-SU
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1korYx-000144-PU
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607966582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZIQmqdC7+zH2YkfI8yaUxzLNmpQ3Ic1mn8OsF5AYibw=;
 b=MIZstzWqRPN44G1b6LE1xvh8AO0gjp8inNokUK45B9OZRqm26SlZxqmQJQ9pkFCHRRhQYA
 RH+fjRHRC9WlYXVoRzNS9Vj2y85pDzrSyzCwa13a9TPF7kBuH50CM4IdvqDJjzPqGu9LKa
 dZPxACwf7m4Mf9j42Yb8AjPrmIJUNX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-Zn_ZHwp8MJWyj9502nlsyQ-1; Mon, 14 Dec 2020 12:22:58 -0500
X-MC-Unique: Zn_ZHwp8MJWyj9502nlsyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF54B80ED8B;
 Mon, 14 Dec 2020 17:22:56 +0000 (UTC)
Received: from gondolin (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB62A5D6AB;
 Mon, 14 Dec 2020 17:22:43 +0000 (UTC)
Date: Mon, 14 Dec 2020 18:22:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20201214182240.2abd85eb.cohuck@redhat.com>
In-Reply-To: <20201204054415.579042-12-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-12-david@gibson.dropbear.id.au>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, berrange@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  4 Dec 2020 16:44:13 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> We haven't yet implemented the fairly involved handshaking that will be
> needed to migrate PEF protected guests.  For now, just use a migration
> blocker so we get a meaningful error if someone attempts this (this is the
> same approach used by AMD SEV).
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/ppc/pef.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
> index 3ae3059cfe..edc3e744ba 100644
> --- a/hw/ppc/pef.c
> +++ b/hw/ppc/pef.c
> @@ -38,7 +38,11 @@ struct PefGuestState {
>  };
>  
>  #ifdef CONFIG_KVM
> +static Error *pef_mig_blocker;
> +
>  static int kvmppc_svm_init(Error **errp)

This looks weird?

> +
> +int kvmppc_svm_init(SecurableGuestMemory *sgm, Error **errp)
>  {
>      if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURABLE_GUEST)) {
>          error_setg(errp,
> @@ -54,6 +58,11 @@ static int kvmppc_svm_init(Error **errp)
>          }
>      }
>  
> +    /* add migration blocker */
> +    error_setg(&pef_mig_blocker, "PEF: Migration is not implemented");
> +    /* NB: This can fail if --only-migratable is used */
> +    migrate_add_blocker(pef_mig_blocker, &error_fatal);

Just so that I understand: is PEF something that is enabled by the host
(and the guest is either secured or doesn't start), or is it using a
model like s390x PV where the guest initiates the transition into
secured mode?

Asking because s390x adds the migration blocker only when the
transition is actually happening (i.e. guests that do not transition
into secure mode remain migratable.) This has the side effect that you
might be able to start a machine with --only-migratable that
transitions into a non-migratable machine via a guest action, if I'm
not mistaken. Without the new object, I don't see a way to block with
--only-migratable; with it, we should be able to do that. Not sure what
the desirable behaviour is here.

> +
>      return 0;
>  }
>  


