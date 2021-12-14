Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BFC474B1E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 19:44:44 +0100 (CET)
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxCn5-0005Uj-59
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 13:44:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxCiW-00048A-Og
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:40:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxCiT-0007AS-OO
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639507196;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JU00oIpOXwagYYToGQd9Zjh+yui2eVZdttbGtuW/SSY=;
 b=IT6EdXIy738XzBmQ7BHCuq48O6CbmRBZMys4TXMnHB/tgvz+bvgqn4v+L4eWoFTGSeybsK
 su5CleDWjZx+oDn1sHiEo5U4p4GFdSrEA18Y/7vWaUTpDGZgMfB6DDHEwO4+3JXHFi0rqd
 nghdSw2dzyPwejvac6I2aeL6NxYwMQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-GSBmsc4UNEuAKjs1oQX0-Q-1; Tue, 14 Dec 2021 13:39:44 -0500
X-MC-Unique: GSBmsc4UNEuAKjs1oQX0-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C76BD100C66F;
 Tue, 14 Dec 2021 18:39:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BFC878C2E;
 Tue, 14 Dec 2021 18:39:40 +0000 (UTC)
Date: Tue, 14 Dec 2021 18:39:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] docs: Add measurement calculation details to
 amd-memory-encryption.txt
Message-ID: <Ybjk6XJUNIyC/LX5@redhat.com>
References: <20211214135910.2732101-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211214135910.2732101-1-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 01:59:10PM +0000, Dov Murik wrote:
> Add a section explaining how the Guest Owner should calculate the
> expected guest launch measurement for SEV and SEV-ES.
> 
> Also update the name and link to the SEV API Spec document.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/amd-memory-encryption.txt | 50 +++++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index ffca382b5f..f97727482f 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -43,7 +43,7 @@ The guest policy is passed as plaintext. A hypervisor may choose to read it,
>  but should not modify it (any modification of the policy bits will result
>  in bad measurement). The guest policy is a 4-byte data structure containing
>  several flags that restricts what can be done on a running SEV guest.
> -See KM Spec section 3 and 6.2 for more details.
> +See SEV API Spec [1] section 3 and 6.2 for more details.
>  
>  The guest policy can be provided via the 'policy' property (see below)
>  
> @@ -88,7 +88,7 @@ expects.
>  LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
>  context.
>  
> -See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
> +See SEV API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
>  complete flow chart.
>  
>  To launch a SEV guest
> @@ -113,6 +113,45 @@ a SEV-ES guest:
>   - Requires in-kernel irqchip - the burden is placed on the hypervisor to
>     manage booting APs.
>  
> +Calculating expected guest launch measurement
> +---------------------------------------------
> +In order to verify the guest launch measurement, The Guest Owner must compute
> +it in the exact same way as it is calculated by the AMD-SP.  SEV API Spec [1]
> +section 6.5.1 describes the AMD-SP operations:
> +
> +    GCTX.LD is finalized, producing the hash digest of all plaintext data
> +    imported into the guest.
> +
> +    The launch measurement is calculated as:
> +
> +    HMAC(0x04 || API_MAJOR || API_MINOR || BUILD || GCTX.POLICY || GCTX.LD || MNONCE; GCTX.TIK)
> +
> +    where "||" represents concatenation.
> +
> +The values of API_MAJOR, API_MINOR, BUILD, and GCTX.POLICY can be obtained
> +from the 'query-sev' qmp command.
> +
> +The value of MNONCE is part of the response of 'query-sev-launch-measure': it
> +is the last 16 bytes of the base64-decoded data field (see SEV API Spec [1]
> +section 6.5.2 Table 52: LAUNCH_MEASURE Measurement Buffer).
> +
> +The value of GCTX.LD is SHA256(firmware_blob || kernel_hashes_blob || vmsas_blob),
> +where:
> +
> +* firmware_blob is the content of the entire firmware flash file (for example,
> +  OVMF.fd).

Lets add a caveat that the firmware flash should be built to be stateless
ie that it is not secure to attempt to measure a guest where the firmware
uses an NVRAM store.

> +* if kernel is used, and kernel-hashes=on, then kernel_hashes_blob is the
> +  content of PaddedSevHashTable (including the zero padding), which itself
> +  includes the hashes of kernel, initrd, and cmdline that are passed to the
> +  guest.  The PaddedSevHashTable struct is defined in target/i386/sev.c .
> +* if SEV-ES is enabled (policy & 0x4 != 0), vmsas_blob is the concatenation of
> +  all VMSAs of the guest vcpus.  Each VMSA is 4096 bytes long; its content is
> +  defined inside Linux kernel code as struct vmcb_save_area, or in AMD APM
> +  Volume 2 [2] Table B-2: VMCB Layout, State Save Area.

Is there any practical guidance we can give apps on the way the VMSAs
can be expected to be initialized ? eg can they assume essentially
all fields in vmcb_save_area are 0 initialized except for certain
ones ? Is initialization likely to vary at all across KVM or EDK2
vesions or something ?

> +
> +If kernel hashes are not used, or SEV-ES is disabled, use empty blobs for
> +kernel_hashes_blob and vmsas_blob as needed.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


