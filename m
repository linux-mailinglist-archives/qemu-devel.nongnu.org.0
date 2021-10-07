Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A9425AA1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:22:48 +0200 (CEST)
Received: from localhost ([::1]:35538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYY2Y-0000Rt-NM
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mYXzf-0007PC-0n
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 14:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mYXza-0004Ih-Mi
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 14:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633630780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=duXsvZZR8GcxkmRgG7lNaau59RNFIcCoAVPkvIh6Hh4=;
 b=JsNFd/DnD20mZxyatLxcq7Tx+NmC3POlCUWNXGkle3L1abtjyPh0eQDxvOyj+98IwnyDv+
 lw09R8i/b/vNagOvct/ENldPDcEfhc6dCYnG6VqXs+UA+p7OJsRgQ9c/SLfhuD+JRc9uBk
 EQeVDWBcJWAcZwHNdGf7GzabFX/GS2c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-bzNMMdQjPVKvFFQo0dSGGg-1; Thu, 07 Oct 2021 14:19:39 -0400
X-MC-Unique: bzNMMdQjPVKvFFQo0dSGGg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so5366201wrb.14
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 11:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=duXsvZZR8GcxkmRgG7lNaau59RNFIcCoAVPkvIh6Hh4=;
 b=WeQB1QTrZhiaGdxCLR9i2u56TRWlINYyFJvcZQ/q/yxdshbrpi5EnCT2QC1+RqVfv5
 mJitA77Kpdt+vuIsjRmRX/7Q/O67rhNzx8HtBQnoIvVvHlNiX7m1DlUDOwhyF/fbjBkQ
 Zfk72Yio/Qn7vxB7uMOmf/Q0yN2RIoBfsXJ40MhCcDAC/tSevbDQP8Bpm5TXI7XX0qR4
 Fp3l7VPo1a7f1FpnlhDbQCs82IszYL0ohGwLSuoFJuECXrVEGWtYjY7EbRFliE+F5ohJ
 VXwyaGrPolu6ONxXEOCWBTfbMP24yRgdE+qJ/fgZRZppNfaM8zEYRyvdTrk2iq0KE3MO
 KUwQ==
X-Gm-Message-State: AOAM530DZXNM90pFgxAkCyyd401uSbyXFzmMgIR7UH+tu2NNoTnRKMao
 xob1k3e9i7lYB3sY/LXH2U86MEMR6gDa0/f7a4exLgrA3+eg/u1kQUUe0ru+oo43PNo2TunU7vc
 oMucLwCJdkP8YKVk=
X-Received: by 2002:adf:a183:: with SMTP id u3mr7459096wru.330.1633630778197; 
 Thu, 07 Oct 2021 11:19:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0T2+f9/uy1i8izySuJj47RoTy3GDAW8x1CG50lQe+zwpUiRxp//4OGq9AwjLfY33TupJMAA==
X-Received: by 2002:adf:a183:: with SMTP id u3mr7459073wru.330.1633630777965; 
 Thu, 07 Oct 2021 11:19:37 -0700 (PDT)
Received: from thuth.remote.csb (p549bb2bd.dip0.t-ipconnect.de.
 [84.155.178.189])
 by smtp.gmail.com with ESMTPSA id k8sm138810wmr.32.2021.10.07.11.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 11:19:37 -0700 (PDT)
Subject: Re: [PATCH 19/24] configure: remove obsolete Solaris ar check
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-14-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <792f22e8-4d60-34ce-c3fd-c9574f85b7bf@redhat.com>
Date: Thu, 7 Oct 2021 20:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007130829.632254-14-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michele Denber <denber@mindspring.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/2021 15.08, Paolo Bonzini wrote:
> Meson already has its own logic to find the "ar" binary, so remove the
> Solaris specific check.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 15 ---------------
>   1 file changed, 15 deletions(-)
> 
> diff --git a/configure b/configure
> index 016814d23b..2091844ad6 100755
> --- a/configure
> +++ b/configure
> @@ -2284,21 +2284,6 @@ EOF
>     fi
>   fi
>   
> -#########################################
> -# Solaris specific configure tool chain decisions
> -
> -if test "$solaris" = "yes" ; then
> -  if has ar; then
> -    :
> -  else
> -    if test -f /usr/ccs/bin/ar ; then
> -      error_exit "No path includes ar" \
> -          "Add /usr/ccs/bin to your path and rerun configure"
> -    fi
> -    error_exit "No path includes ar"
> -  fi
> -fi

Reviewed-by: Thomas Huth <thuth@redhat.com>


