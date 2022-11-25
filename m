Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063863828C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 03:53:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyOoT-0002jn-4V; Thu, 24 Nov 2022 21:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1oyOoR-0002jM-2A
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 21:51:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1oyOoP-0001HK-3V
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 21:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669344690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njS2lN9Uyc9m9YicIGnq5lOXckgM3NujrosCGwN+58o=;
 b=QCtYz5cVav9THqXyIjgPpuM/e06fOpCWXNAtucTzIzwMmb+s+TZASWP9ITjE81Rw3jXaBt
 QP1YhlhLZhk1RHpZA6IeEK3U8E1cM6AYyDygaINkccZiqe2OdAiADptR5rWjB3ufOChIFQ
 +DaXvMPu90BdlSYbdsgsHpc/32Bg81g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-dbPhQnYRP-y_NDWc4pbrAw-1; Thu, 24 Nov 2022 21:51:29 -0500
X-MC-Unique: dbPhQnYRP-y_NDWc4pbrAw-1
Received: by mail-qv1-f71.google.com with SMTP id
 mo15-20020a056214330f00b004b96d712bccso2705578qvb.22
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 18:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=njS2lN9Uyc9m9YicIGnq5lOXckgM3NujrosCGwN+58o=;
 b=pNXPu2IqIAltXXjvjLIQUj+HOJGimqsIfUnccsE3HQKia1SPJqfXxnob+caUDP4DIi
 SWIATfWgS4UGyjNAD3N3HJ8GOYGxQ07smWgudfPbCsJ1AcnpRXGMLGO3I5X/QcMEMdbY
 W+WGJFWXLIfDEs4OEB6V8jbS3kmeY40to7wll2J6+pRDjJDaxkxY8eMQWgMFSe4+FlTO
 6EbP0z2AKL5HDxtK7B9+C5ISRDegocV//64ypbYshA5KdeRJl1TlgHfVqfpR1aRzo+Dp
 i/Og4PnBXRULrCCgleaYbl8aTm89lxCMlyl/vQJuDr+j2v6kjBJT4P7nsqp8Kuf8rW4i
 A3HA==
X-Gm-Message-State: ANoB5pkfvJs+ThSwF/Ei0Kxlq+bUXQdfaLHg3O4zkGszo7j2/hR0M0vM
 vCad6zm/oce9JdRs8sJ1qa0kHr8nlU7SS3eTIlXgxM3fF0kSdz8R2pFrHLw4vT2C1VluOQIXDXr
 BH8r4GNY7reawAeOi5QZ/CRoOUQAb6294c18HXbt45BPAFudSixXowrJuFQP7OZP4
X-Received: by 2002:ae9:d846:0:b0:6ec:5332:6ebd with SMTP id
 u67-20020ae9d846000000b006ec53326ebdmr32354337qkf.0.1669344688425; 
 Thu, 24 Nov 2022 18:51:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Wl0nHsLXF2Bq++KYrqmBFva1CDWRPxFHDsjZMSyX6RLZQz3CPZZJ7MbVQroxQHkXB0Mmlng==
X-Received: by 2002:ae9:d846:0:b0:6ec:5332:6ebd with SMTP id
 u67-20020ae9d846000000b006ec53326ebdmr32354323qkf.0.1669344688115; 
 Thu, 24 Nov 2022 18:51:28 -0800 (PST)
Received: from [10.0.0.96] ([24.225.241.171]) by smtp.gmail.com with ESMTPSA id
 w21-20020a05620a445500b006fa4ac86bfbsm1990766qkp.55.2022.11.24.18.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 18:51:27 -0800 (PST)
Message-ID: <637e49c1-62b9-d797-00e8-d77059b7bce3@redhat.com>
Date: Thu, 24 Nov 2022 21:51:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] SecurityPkg: check return value of
 GetEfiGlobalVariable2() in DxeImageVerificationHandler()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, philmd@linaro.com, stefanha@redhat.com
References: <20221125023211.1700925-1-jmaloy@redhat.com>
From: Jon Maloy <jmaloy@redhat.com>
In-Reply-To: <20221125023211.1700925-1-jmaloy@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Please ignore this one.  Sent to the wrong list.
///jon

On 11/24/22 21:32, Jon Maloy wrote:
> Fixes: CVE-2019-14560
>
> GetEfiGlobalVariable2() is used in some instances when looking up the
> SecureBoot UEFI variable. The API can fail in certain circumstances,
> for example, if AllocatePool() fails or if gRT->GetVariable() fails.
> In the case of secure boot checks, it is critical that this return value
> is checked. if an attacker can cause the API to fail, it would currently
> constitute a secure boot bypass.
>
> This return value check is missing in the function DxeImageVerificationHandler(),
> so we add it here.
>
> This commit is almost identical to one suggested by Jian J Wang <jian.j.wang@intel.com>
> on 2019-09-09, but that one was for some reason never posted to the edk2-devel
> list. We now make a new attempt to get it reviewed and applied.
>
> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
> ---
>   .../DxeImageVerificationLib.c                 | 39 +++++++++++--------
>   1 file changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
> index 66e2f5eaa3..6c58b71d37 100644
> --- a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
> +++ b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
> @@ -1686,6 +1686,7 @@ DxeImageVerificationHandler (
>     RETURN_STATUS                 PeCoffStatus;
>     EFI_STATUS                    HashStatus;
>     EFI_STATUS                    DbStatus;
> +  EFI_STATUS                    SecBootStatus;
>     BOOLEAN                       IsFound;
>   
>     SignatureList     = NULL;
> @@ -1742,23 +1743,29 @@ DxeImageVerificationHandler (
>       CpuDeadLoop ();
>     }
>   
> -  GetEfiGlobalVariable2 (EFI_SECURE_BOOT_MODE_NAME, (VOID **)&SecureBoot, NULL);
> -  //
> -  // Skip verification if SecureBoot variable doesn't exist.
> -  //
> -  if (SecureBoot == NULL) {
> -    return EFI_SUCCESS;
> -  }
> -
> -  //
> -  // Skip verification if SecureBoot is disabled but not AuditMode
> -  //
> -  if (*SecureBoot == SECURE_BOOT_MODE_DISABLE) {
> -    FreePool (SecureBoot);
> -    return EFI_SUCCESS;
> -  }
> +  SecBootStatus = GetEfiGlobalVariable2 (EFI_SECURE_BOOT_MODE_NAME, (VOID **)&SecureBoot, NULL);
> +  if (!EFI_ERROR (SecBootStatus)) {
> +    if (SecureBoot == NULL) {
> +      //
> +      // Skip verification if SecureBoot variable doesn't exist.
> +      //
> +      return EFI_SUCCESS;
> +    } else {
> +      //
> +      // Skip verification if SecureBoot is disabled but not AuditMode
> +      //
> +      if (*SecureBoot == SECURE_BOOT_MODE_DISABLE) {
> +        FreePool (SecureBoot);
> +        return EFI_SUCCESS;
> +      }
> +      FreePool (SecureBoot);
> +    }
> +  } else {
> +    //
> +    // Assume SecureBoot enabled in the case of error.
> +    //
> +   }
>   
> -  FreePool (SecureBoot);
>   
>     //
>     // Read the Dos header.


