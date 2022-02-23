Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A14C1ADC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:22:58 +0100 (CET)
Received: from localhost ([::1]:42740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwHw-0007dS-FA
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:22:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMwFp-0006KR-Nl
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:20:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMwFl-0004Nw-47
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645640439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbreC3iHKH//UqxxnLi19XmWNDUJrFhwSZ+XFZ1nv4Y=;
 b=YC26a5WQELP1CRK0Awqkk87YUWMp+nDR+rcDfC9N9RCHD4vigczT/B69J9sG0Se5XtHCmR
 +B0F1CKujM0YpQc3l9c7mXX4JA/pUpuxa5E9I5u6KSetFJH8qbYCQIZeibT1B9g60cFHJM
 GpiXpRoT227d6uj5riisn9G0XDPcEtg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-zcgqwY14Po-yxATXASzfxA-1; Wed, 23 Feb 2022 13:20:21 -0500
X-MC-Unique: zcgqwY14Po-yxATXASzfxA-1
Received: by mail-wm1-f70.google.com with SMTP id
 187-20020a1c19c4000000b0037cc0d56524so1473913wmz.2
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 10:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VbreC3iHKH//UqxxnLi19XmWNDUJrFhwSZ+XFZ1nv4Y=;
 b=emEYzYeKGCIcoe0W8+7jt9ZIRirpay0ec0zBCUWvma6ZsylSQ5O1A13034j1yOmM5g
 /zoHTFYNTr9BusizwcyXR77hyxtZRymHrriOXvhs3yvoSYEoXL7Pl9jpZjPUxFkEBuza
 Hy0cSpIHuzWofdyXL594LzXCi+O8CXPRT4osrK/d31NWBz89uxbq839eUaT2WKl3CLOb
 iaORVuMy6Eo3chA0sa0uD9U1UEN43vi8W4oH0Dxof928o2mYgk/CE7iICvZGSTMPaIS5
 Som2CNGhfdXVCUh+oCAuWvpGnt5dkEFkC6LtWBMz/fcN1DXKb0ECg7w/dqqCoHqxaoA4
 P/tA==
X-Gm-Message-State: AOAM533rRTqN2U0nwtoYgmJc5jGnc8DPPuSZGOpyG0Bi4LhTNRqudJCO
 EQWUHHUNd5oxnl2f7IPJWYSwXF/78xcXcxCb6HNZ3Jo2vgmcn2p/kKZtq3JHV00KICILbKcdK64
 DGLYyf/X1vIn3BX4=
X-Received: by 2002:a1c:a78b:0:b0:380:683a:d01c with SMTP id
 q133-20020a1ca78b000000b00380683ad01cmr775151wme.8.1645640420351; 
 Wed, 23 Feb 2022 10:20:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMeNS6kYHA50wisiThdMVO1SWSREZzAfLwb1yVRwxOCy8JjglN7/VQioc2KTo94LideR6qPg==
X-Received: by 2002:a1c:a78b:0:b0:380:683a:d01c with SMTP id
 q133-20020a1ca78b000000b00380683ad01cmr775127wme.8.1645640420052; 
 Wed, 23 Feb 2022 10:20:20 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m9sm230020wmq.40.2022.02.23.10.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 10:20:19 -0800 (PST)
Date: Wed, 23 Feb 2022 18:20:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v3] docs/system/i386: Add measurement calculation details
 to amd-memory-encryption
Message-ID: <YhZ64Vmvsymz3wKS@work-vm>
References: <20220217110059.2320497-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220217110059.2320497-1-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dov Murik (dovmurik@linux.ibm.com) wrote:
> Add a section explaining how the Guest Owner should calculate the
> expected guest launch measurement for SEV and SEV-ES.
> 
> Also update the name and links to the SEV API Spec document.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> 

Thanks; my guess is we're going to need to document the expected VMSA
values at some point.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
> v2:
> - Explain that firmware must be built without NVRAM store.
> 
> v3:
> - rstify
> ---
>  docs/system/i386/amd-memory-encryption.rst | 54 ++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/i386/amd-memory-encryption.rst b/docs/system/i386/amd-memory-encryption.rst
> index 215946f813..dcf4add0e7 100644
> --- a/docs/system/i386/amd-memory-encryption.rst
> +++ b/docs/system/i386/amd-memory-encryption.rst
> @@ -47,7 +47,7 @@ The guest policy is passed as plaintext. A hypervisor may choose to read it,
>  but should not modify it (any modification of the policy bits will result
>  in bad measurement). The guest policy is a 4-byte data structure containing
>  several flags that restricts what can be done on a running SEV guest.
> -See KM Spec section 3 and 6.2 for more details.
> +See SEV API Spec ([SEVAPI]_) section 3 and 6.2 for more details.
>  
>  The guest policy can be provided via the ``policy`` property::
>  
> @@ -92,7 +92,7 @@ expects.
>  ``LAUNCH_FINISH`` finalizes the guest launch and destroys the cryptographic
>  context.
>  
> -See SEV KM API Spec ([SEVKM]_) 'Launching a guest' usage flow (Appendix A) for the
> +See SEV API Spec ([SEVAPI]_) 'Launching a guest' usage flow (Appendix A) for the
>  complete flow chart.
>  
>  To launch a SEV guest::
> @@ -118,6 +118,49 @@ a SEV-ES guest:
>   - Requires in-kernel irqchip - the burden is placed on the hypervisor to
>     manage booting APs.
>  
> +Calculating expected guest launch measurement
> +---------------------------------------------
> +
> +In order to verify the guest launch measurement, The Guest Owner must compute
> +it in the exact same way as it is calculated by the AMD-SP.  SEV API Spec
> +([SEVAPI]_) section 6.5.1 describes the AMD-SP operations:
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
> +from the ``query-sev`` qmp command.
> +
> +The value of MNONCE is part of the response of ``query-sev-launch-measure``: it
> +is the last 16 bytes of the base64-decoded data field (see SEV API Spec
> +([SEVAPI]_) section 6.5.2 Table 52: LAUNCH_MEASURE Measurement Buffer).
> +
> +The value of GCTX.LD is
> +``SHA256(firmware_blob || kernel_hashes_blob || vmsas_blob)``, where:
> +
> +* ``firmware_blob`` is the content of the entire firmware flash file (for
> +  example, ``OVMF.fd``).  Note that you must build a stateless firmware file
> +  which doesn't use an NVRAM store, because the NVRAM area is not measured, and
> +  therefore it is not secure to use a firmware which uses state from an NVRAM
> +  store.
> +* if kernel is used, and ``kernel-hashes=on``, then ``kernel_hashes_blob`` is
> +  the content of PaddedSevHashTable (including the zero padding), which itself
> +  includes the hashes of kernel, initrd, and cmdline that are passed to the
> +  guest.  The PaddedSevHashTable struct is defined in ``target/i386/sev.c``.
> +* if SEV-ES is enabled (``policy & 0x4 != 0``), ``vmsas_blob`` is the
> +  concatenation of all VMSAs of the guest vcpus.  Each VMSA is 4096 bytes long;
> +  its content is defined inside Linux kernel code as ``struct vmcb_save_area``,
> +  or in AMD APM Volume 2 ([APMVOL2]_) Table B-2: VMCB Layout, State Save Area.
> +
> +If kernel hashes are not used, or SEV-ES is disabled, use empty blobs for
> +``kernel_hashes_blob`` and ``vmsas_blob`` as needed.
> +
>  Debugging
>  ---------
>  
> @@ -142,8 +185,11 @@ References
>  `AMD Memory Encryption whitepaper
>  <https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf>`_
>  
> -.. [SEVKM] `Secure Encrypted Virtualization Key Management
> -   <http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Specification.pdf>`_
> +.. [SEVAPI] `Secure Encrypted Virtualization API
> +   <https://www.amd.com/system/files/TechDocs/55766_SEV-KM_API_Specification.pdf>`_
> +
> +.. [APMVOL2] `AMD64 Architecture Programmer's Manual Volume 2: System Programming
> +   <https://www.amd.com/system/files/TechDocs/24593.pdf>`_
>  
>  KVM Forum slides:
>  
> 
> base-commit: c13b8e9973635f34f3ce4356af27a311c993729c
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


