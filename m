Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF02F7ADF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:56:18 +0100 (CET)
Received: from localhost ([::1]:32988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OeH-00069j-OW
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l0Ocp-0005b6-Bw
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 07:54:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l0Ocn-0000C1-Do
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 07:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610715284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3464aNY1pSNVMl9kXj2bqfBR/O9eQZd6QX4BTIBIyk=;
 b=D86eI3LZEFTiLtg/8gLTPuaYfbiFyIOfSNT5OfeeARUAghg1FraN2t+zIUjU35xgcn+g9s
 f4jTHw4kL69H/GrNKb5x+/bVmY7++DpU8StSw5QlS43KPnwWYYerOGEVFDMPvuVSJM56DL
 Vp/rMMokVEuMEVN6zDEKjUHKhu95iGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-vabXa1jcOJCjssgG9Fnheg-1; Fri, 15 Jan 2021 07:54:41 -0500
X-MC-Unique: vabXa1jcOJCjssgG9Fnheg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FCD4DF8A4;
 Fri, 15 Jan 2021 12:54:38 +0000 (UTC)
Received: from gondolin (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40EAE60CCE;
 Fri, 15 Jan 2021 12:54:27 +0000 (UTC)
Date: Fri, 15 Jan 2021 13:54:25 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 03/13] sev: Remove false abstraction of flash encryption
Message-ID: <20210115135425.7fd94aed.cohuck@redhat.com>
In-Reply-To: <20210113235811.1909610-4-david@gibson.dropbear.id.au>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-4-david@gibson.dropbear.id.au>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, 14 Jan 2021 10:58:01 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> When AMD's SEV memory encryption is in use, flash memory banks (which are
> initialed by pc_system_flash_map()) need to be encrypted with the guest's
> key, so that the guest can read them.
> 
> That's abstracted via the kvm_memcrypt_encrypt_data() callback in the KVM
> state.. except, that it doesn't really abstract much at all.
> 
> For starters, the only called is in code specific to the 'pc' family of

s/called/call site/

> machine types, so it's obviously specific to those and to x86 to begin
> with.  But it makes a bunch of further assumptions that need not be true
> about an arbitrary confidential guest system based on memory encryption,
> let alone one based on other mechanisms:
> 
>  * it assumes that the flash memory is defined to be encrypted with the
>    guest key, rather than being shared with hypervisor
>  * it assumes that that hypervisor has some mechanism to encrypt data into
>    the guest, even though it can't decrypt it out, since that's the whole
>    point
>  * the interface assumes that this encrypt can be done in place, which
>    implies that the hypervisor can write into a confidential guests's
>    memory, even if what it writes isn't meaningful
> 
> So really, this "abstraction" is actually pretty specific to the way SEV
> works.  So, this patch removes it and instead has the PC flash
> initialization code call into a SEV specific callback.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  accel/kvm/kvm-all.c    | 31 ++-----------------------------
>  accel/kvm/sev-stub.c   |  9 ++-------
>  accel/stubs/kvm-stub.c | 10 ----------
>  hw/i386/pc_sysfw.c     | 17 ++++++-----------
>  include/sysemu/kvm.h   | 16 ----------------
>  include/sysemu/sev.h   |  4 ++--
>  target/i386/sev-stub.c |  5 +++++
>  target/i386/sev.c      | 24 ++++++++++++++----------
>  8 files changed, 31 insertions(+), 85 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


