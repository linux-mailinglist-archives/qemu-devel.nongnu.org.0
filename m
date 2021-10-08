Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C0E426F67
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 19:16:49 +0200 (CEST)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYtUG-0004Oo-DS
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 13:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYtS8-0002t6-CA
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 13:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYtS6-0002Aw-Sc
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 13:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633713271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGLzhyyYie3jvBbYIQgFKfXNCYzD5u56oHGuVeVvEdc=;
 b=DFtOUafNwVpktMwG1Vueu1f/wIzcs/zUHcpesEVf3n+OH2pHR8XHq4RP39j/AEhV+dhIYN
 8f9m16/rGngFLY0PwZgl4O7uoGa+XPxyr2kanOh/+WfHajlUXgYuMcrEx/PAF2hUpZE0nr
 azaXmvYezdIrNuGlKD/cw/T/WOHTJZc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-iZs-CU-yM2eYWGjfFg-taA-1; Fri, 08 Oct 2021 13:14:10 -0400
X-MC-Unique: iZs-CU-yM2eYWGjfFg-taA-1
Received: by mail-ed1-f69.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so9813881edi.19
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 10:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TGLzhyyYie3jvBbYIQgFKfXNCYzD5u56oHGuVeVvEdc=;
 b=meFTvEnOUiSufw71dWh6Kuurua3IGGom0RWsVI2JW//sXB+9lmfZndPdJ/FuQG+sWt
 T2c91QDQMBLcxF4nzQ2oSsFXY7jUdzcwBEtFv0RWSQii4x/mYo6y93a1y5M8PQKXQ0xn
 AyHa1AUpN1cQPIFWvewCH8pfvkPNWF+X7o4dAz+tNhO5Kesqt6za11lM2CSPZ6o9yspC
 cveH7IXnghO/8Mr8ZuNGk2gMA7YKGsbyQbouCPVfmO7/lXOqkMALELnrwCUphaijoBXw
 qddBxULcNAzDesy2MICkj1q2KZAyU3r87QPxX5SQTC3HhgAY1gzigAWNjtg3DtD07zMJ
 +F/w==
X-Gm-Message-State: AOAM531red3PAGrz+MOsY68xTHds8/RCWwBH8voQQ9w56NyQjesv/BRh
 N4rg1dZ/ZOxoKRIL/8450nnRYfehvdZU4r4SH+uUtwD6nPjeqytz0eF2owxTYUWhuXkBiMVmcXA
 tCiTTzXfIvOjxE18=
X-Received: by 2002:a17:906:838c:: with SMTP id
 p12mr5517174ejx.181.1633713249145; 
 Fri, 08 Oct 2021 10:14:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSGWFqIncot+atkO3/1zb+P176MTHvtdrIi81QQKyuPXnlJxYfoZWWxUJbcAfvjo41QHku1Q==
X-Received: by 2002:a17:906:838c:: with SMTP id
 p12mr5517147ejx.181.1633713248943; 
 Fri, 08 Oct 2021 10:14:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id r19sm1266105edt.54.2021.10.08.10.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 10:14:08 -0700 (PDT)
Message-ID: <8847ccd3-f2a5-4834-afba-d27bd735d359@redhat.com>
Date: Fri, 8 Oct 2021 19:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] tests: tcg: Fix PVH test with binutils 2.36+
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <5ab2a54c262c61f64c22dbb49ade3e2db8a740bb.1633708346.git.crobinso@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <5ab2a54c262c61f64c22dbb49ade3e2db8a740bb.1633708346.git.crobinso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/21 18:21, Cole Robinson wrote:
> binutils started adding a .note.gnu.property ELF section which
> makes the PVH test fail:
> 
>    TEST    hello on x86_64
> qemu-system-x86_64: Error loading uncompressed kernel without PVH ELF Note
> 
> Discard .note.gnu* while keeping the PVH .note bits intact.
> 
> This also strips the build-id note, so drop the related comment.
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>   tests/tcg/x86_64/system/kernel.ld | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/x86_64/system/kernel.ld b/tests/tcg/x86_64/system/kernel.ld
> index 49c12b04ae..ca5d6bd850 100644
> --- a/tests/tcg/x86_64/system/kernel.ld
> +++ b/tests/tcg/x86_64/system/kernel.ld
> @@ -16,7 +16,10 @@ SECTIONS {
>   		*(.rodata)
>   	} :text
>   
> -        /* Keep build ID and PVH notes in same section */
> +        /DISCARD/ : {
> +                *(.note.gnu*)
> +        }
> +
>           .notes :  {
>                  *(.note.*)
>           } :note
> 

Queued, thanks.

Paolo


