Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630224257DF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:25:02 +0200 (CEST)
Received: from localhost ([::1]:55890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWCb-0000av-Fm
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW9s-0004Jt-N3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW9q-00077k-GM
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9lH9cFNuBWcVmka5xEUL5skSGU5C6UzDU5mPeoZKBE=;
 b=h/Lr7cYnK8WVMktl1ywnEIUhq9ESFNqSmAWaq+U68q/edz5haRW6lFFgm6kXM8lOrPMvhO
 KWHeVKTfkFRleuiOza2I9fdZNjxBDt0EzltLYIcjhcS676HKoQAwHxwdE2LHcgpI2GHhvh
 i4aPUNNn3OdXA0lcOIefpz1OQt0JYvw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-b6WAHE9ZP_6XzZdyCo7iog-1; Thu, 07 Oct 2021 12:22:08 -0400
X-MC-Unique: b6WAHE9ZP_6XzZdyCo7iog-1
Received: by mail-wr1-f71.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so4951679wrb.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q9lH9cFNuBWcVmka5xEUL5skSGU5C6UzDU5mPeoZKBE=;
 b=5knPDOlbNyRN2VHVI7nuQqQjgy7FnoA8FLiJ7ivZ3x9XdFHEmBmCXYw2MaqS+y9AsW
 gquFGdrfpeJ3QjfuxdvdymUcXMk01keq6NUajdY/jzKfvCcTAPf3q56/FsFC+dk4iBTw
 qenPIIfE5HdVCpo9bdpvykuzf//1zGnmDINTIRWpxidzrm9bMk+YSxiEMB824Kw5sl0Y
 xjXrN5UO3mCpA0VM6z5C1k6+VMhzqcKFcjLbgGzKUr2cHHwnTfPGl2VLBHkpz/4JUEaX
 +i1psXG5wizUOK4/HQGFetrrbXgu3kpRYqXRTrkqmS3s+o9ZN314U93yzgqhD1yKLIvt
 QCHw==
X-Gm-Message-State: AOAM531q4mNAa/4+b9UizgRjK3nr1/g/INgFDMQcG1dCyVAqKpC8YBrQ
 rMCXkrdHYBeEog9wmvWsyWePM4fmVTvJUhdoYTNYWzRa9YUbB8o+e2PdnERo3PRtXT2aHJI6gZ5
 aSMpJhCK7zFjQB+27CLGGFhzJG3QjEltEhbem9njje5zKif59ayLu1PhthM9vEJHe
X-Received: by 2002:adf:8b06:: with SMTP id n6mr6739279wra.5.1633623727309;
 Thu, 07 Oct 2021 09:22:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyFF9mQQo5Huyt4EQlO2ZEwdftVtY00KvMdp2QMVfFJvMJsW31Ru+/BQgVVb1U2yU97TTvAQ==
X-Received: by 2002:adf:8b06:: with SMTP id n6mr6739236wra.5.1633623727040;
 Thu, 07 Oct 2021 09:22:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id q204sm7239988wme.10.2021.10.07.09.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 09:22:06 -0700 (PDT)
Message-ID: <fc4d2cba-3900-c5bc-deb4-592b17cc121f@redhat.com>
Date: Thu, 7 Oct 2021 18:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 23/23] MAINTAINERS: Cover SEV-related files with
 X86/KVM section
To: qemu-devel@nongnu.org
References: <20211007161716.453984-1-philmd@redhat.com>
 <20211007161716.453984-24-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211007161716.453984-24-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 18:17, Philippe Mathieu-Daudé wrote:
> Complete the x86/KVM section with SEV-related files.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..a49555d94d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -417,7 +417,9 @@ M: Paolo Bonzini <pbonzini@redhat.com>
>  M: Marcelo Tosatti <mtosatti@redhat.com>
>  L: kvm@vger.kernel.org
>  S: Supported
> +F: docs/amd-memory-encryption.txt

BTW maybe this one should be renamed docs/system/i386/sev.txt?

>  F: target/i386/kvm/
> +F: target/i386/sev*
>  F: scripts/kvm/vmxcap
>  
>  Guest CPU Cores (other accelerators)
> 


