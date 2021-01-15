Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6212F7BF2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:09:04 +0100 (CET)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Oqe-0005rx-1M
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l0Ood-0004vo-2S
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:06:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l0OoY-0005jN-Pm
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RgqdN+rsOdyuFDjY8gpWUfMmwO4sA4LEjA6hTey4zU=;
 b=IbRDtWE7TEukDqB7dCpw4phpisk80fTdN88+jZA/bmxePGw/69AH1S1CZyPu3MUc64+c6a
 J4UB3MxZ2m0u0iA0uNDJaN/vojEOCO9E845TCX0QtSXpNSNxZjm1MJAqIqR7gbC+ga8yyI
 NSL+4jefoXDbyZuJ/FKdcsIVzR/mFD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-MzPZa4NFPPysRj78_viMng-1; Fri, 15 Jan 2021 08:06:47 -0500
X-MC-Unique: MzPZa4NFPPysRj78_viMng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 458898144E0;
 Fri, 15 Jan 2021 13:06:44 +0000 (UTC)
Received: from gondolin (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0ECC1000320;
 Fri, 15 Jan 2021 13:06:31 +0000 (UTC)
Date: Fri, 15 Jan 2021 14:06:29 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 05/13] confidential guest support: Rework the
 "memory-encryption" property
Message-ID: <20210115140629.46816ea3.cohuck@redhat.com>
In-Reply-To: <20210113235811.1909610-6-david@gibson.dropbear.id.au>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-6-david@gibson.dropbear.id.au>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, pragyansri.pathi@intel.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 10:58:03 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> Currently the "memory-encryption" property is only looked at once we
> get to kvm_init().  Although protection of guest memory from the
> hypervisor isn't something that could really ever work with TCG, it's
> not conceptually tied to the KVM accelerator.
> 
> In addition, the way the string property is resolved to an object is
> almost identical to how a QOM link property is handled.
> 
> So, create a new "confidential-guest-support" link property which sets
> this QOM interface link directly in the machine.  For compatibility we
> keep the "memory-encryption" property, but now implemented in terms of
> the new property.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>  accel/kvm/kvm-all.c  |  5 +++--
>  accel/kvm/sev-stub.c |  5 +++--
>  hw/core/machine.c    | 43 +++++++++++++++++++++++++++++++++++++------
>  include/hw/boards.h  |  2 +-
>  include/sysemu/sev.h |  2 +-
>  target/i386/sev.c    | 32 ++------------------------------
>  6 files changed, 47 insertions(+), 42 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


