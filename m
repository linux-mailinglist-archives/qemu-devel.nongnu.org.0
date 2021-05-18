Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2757038764C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:18:42 +0200 (CEST)
Received: from localhost ([::1]:33188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwoD-0000Uc-8L
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwYL-0000SC-TC
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwYJ-00045i-QW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ik30k76mRAL/BZWQzJp3c7b0qJwxXGO3oDzarUzuFmY=;
 b=Bc8TJVm08X9SIFkaA1I/F7y0wS6xU6g4GP1pIlVYg4a9o8C9t2NBRXU4ZaRVa2z0VEQrpz
 ixWE6dWM8dTMe+/k3SeAOlIuH1aP+kXNLPpecVryVXm6iVqbEgAuXHdIFL0eDqftJkuzbU
 gWrrOK8a/DTZz2oYV3x3OnuQRJwflIE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-ZYc-0MYCMrKC9mVeUPEIUQ-1; Tue, 18 May 2021 06:02:13 -0400
X-MC-Unique: ZYc-0MYCMrKC9mVeUPEIUQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 n25-20020a170906b319b02903d4dc1bc46cso2182739ejz.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ik30k76mRAL/BZWQzJp3c7b0qJwxXGO3oDzarUzuFmY=;
 b=QDmAZA9SOoQ0YbUSO4rO1JG/oF3eXJQvkNDCMI51i83OI+KVWB9V5ZV1nSE+Zw1rsu
 +l7zIv28K2T0LCx10h7Gvu9NMI8e3TzCLA8ol3vgVzdjRKhxg3jC9WEb1PkCsTsCpJEy
 gLx68/2dITrUFbJ/jLrSOpTOeii0GqSYsvLOysCK1IjHu94RYjgG7EqqXPzRD0N/8KGt
 wvoYZMPAHSppQ3d6kKqx6tAVigHKJ4BURtm67xN5mfNWoyMv8LN5UhLzEiur0alvxkVO
 NwPoFKvvDqYDyeqOAQi6x5AWSAwCgQxK08p14NCJDqzn1v3H0XS91W0aa9jA1OFC9cRo
 iHdw==
X-Gm-Message-State: AOAM532pAkAuqtUxjrxWMmm7b8gnAV3Y4Y+7gxiCCaN9AgLoBloFrFnF
 vns+S4O5TM9iMUGDBbTrymbix6pYccLjYDPMXaR8M7ZeKrnLUqOl5OP1IPT1Pid/d1Q1OyCSfEY
 oSpRAlhALCwMJiHk=
X-Received: by 2002:a50:ef15:: with SMTP id m21mr5926616eds.226.1621332132444; 
 Tue, 18 May 2021 03:02:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPMYziWjsMEu1WaTnWeBd33rfbwCunGwyuzuqKYpfQXGRD6RSzN1pWucBczjj2/2LK5Cg1fA==
X-Received: by 2002:a50:ef15:: with SMTP id m21mr5926597eds.226.1621332132329; 
 Tue, 18 May 2021 03:02:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n17sm12519796eds.72.2021.05.18.03.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:02:11 -0700 (PDT)
Subject: Re: [PATCH v2 45/50] target/i386: Exit tb after wrmsr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-46-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a2125bf9-3c60-e227-2ba8-32378cd92d8f@redhat.com>
Date: Tue, 18 May 2021 12:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-46-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: cfontana@suse.de, qemu-stable <qemu-stable@nongnu.org>, f4bug@amsat.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> At minimum, wrmsr can change efer, which affects HF_LMA.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 2aa2410336..6eeaa3a98b 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -7260,6 +7260,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   gen_helper_rdmsr(cpu_env);
>               } else {
>                   gen_helper_wrmsr(cpu_env);
> +                gen_jmp_im(s, s->pc - s->cs_base);
> +                gen_eob(s);
>               }
>           }
>           break;
> 

Cc: qemu-stable@nongnu.org
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


