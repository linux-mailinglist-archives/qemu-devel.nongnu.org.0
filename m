Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3192F7D2E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:52:42 +0100 (CET)
Received: from localhost ([::1]:36620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PWr-0006YT-74
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l0P6O-000119-Ef
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:25:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l0P6A-0004SV-Id
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610717105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OqVraxmBxo/QEMnN9aS1B5uOZPCcZuh8wG8HP5EzsXo=;
 b=blpOKwzbzXyUaBOzFm5zcEDK3kOzHbMtMtnqcTFPypymiOLk8a0t4vf8OwbQhHq2Ay/zGJ
 rftA+qMXXGRQDXKGo2ZNGxoDM6tMpa+mOIo9Ew+upkcCb9IgfKmrvAryNAigjD0TBpGKku
 9k8tIZfV/ok1/5IY4lBmVvuhorNFUYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-ptmG1eohN56WS8l6Cr87RQ-1; Fri, 15 Jan 2021 08:25:04 -0500
X-MC-Unique: ptmG1eohN56WS8l6Cr87RQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15EBACE665;
 Fri, 15 Jan 2021 13:25:02 +0000 (UTC)
Received: from gondolin (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22FF06F44C;
 Fri, 15 Jan 2021 13:24:27 +0000 (UTC)
Date: Fri, 15 Jan 2021 14:24:25 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 08/13] confidential guest support: Move SEV
 initialization into arch specific code
Message-ID: <20210115142425.540b6126.cohuck@redhat.com>
In-Reply-To: <20210113235811.1909610-9-david@gibson.dropbear.id.au>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-9-david@gibson.dropbear.id.au>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

On Thu, 14 Jan 2021 10:58:06 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> While we've abstracted some (potential) differences between mechanisms for
> securing guest memory, the initialization is still specific to SEV.  Given
> that, move it into x86's kvm_arch_init() code, rather than the generic
> kvm_init() code.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  accel/kvm/kvm-all.c   | 14 --------------
>  accel/kvm/sev-stub.c  |  4 ++--
>  target/i386/kvm/kvm.c | 12 ++++++++++++
>  target/i386/sev.c     |  7 ++++++-
>  4 files changed, 20 insertions(+), 17 deletions(-)
> 

(...)

> @@ -2135,6 +2136,17 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      uint64_t shadow_mem;
>      int ret;
>      struct utsname utsname;
> +    Error *local_err = NULL;
> +
> +    /*
> +     * if memory encryption object is specified then initialize the
> +     * memory encryption context (no-op otherwise)
> +     */
> +    ret = sev_kvm_init(ms->cgs, &local_err);

Maybe still leave a comment here, as the code will still need to be
modified to handle non-SEV x86 mechanisms?

> +    if (ret < 0) {
> +        error_report_err(local_err);
> +        return ret;
> +    }
>  
>      if (!kvm_check_extension(s, KVM_CAP_IRQ_ROUTING)) {
>          error_report("kvm: KVM_CAP_IRQ_ROUTING not supported by KVM");
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 3d94635397..aa79cacabe 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -664,13 +664,18 @@ sev_vm_state_change(void *opaque, int running, RunState state)
>  
>  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>  {
> -    SevGuestState *sev = SEV_GUEST(cgs);
> +    SevGuestState *sev
> +        = (SevGuestState *)object_dynamic_cast(OBJECT(cgs), TYPE_SEV_GUEST);

This looks a bit ugly; maybe we want the generic code to generate a
separate version of the cast macro that doesn't assert? Just cosmetics,
though.

>      char *devname;
>      int ret, fw_error;
>      uint32_t ebx;
>      uint32_t host_cbitpos;
>      struct sev_user_data_status status = {};
>  
> +    if (!sev) {
> +        return 0;
> +    }
> +
>      ret = ram_block_discard_disable(true);
>      if (ret) {
>          error_report("%s: cannot disable RAM discard", __func__);

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


