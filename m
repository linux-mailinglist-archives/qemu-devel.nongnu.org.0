Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E363E9F7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:44:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dIH-0000xm-IW; Thu, 01 Dec 2022 01:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0dID-0000xb-4z
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:43:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0dIB-0004ei-0g
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669877009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usj/xA8nAbVirHEidSfC3c+FNTcoMVn+cMoIdT8TQ8o=;
 b=JK8TURKzplkqfYXGvZ8VCscAnmw+K2ycIuTlDzvXG4sqTqdJeELo1n1BW2pobDbdUkXUzt
 nUnFWWLEu/LHRWEKQc3tTWT7bjwq6uh1KleO6EkP5rJEzsf9f5P6kSWkdt+6w7tzz1ZAnO
 2uI7P99qNPEElZiRnw9+bkBiFPp10f0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-q12ZELduNqiML7nou354GA-1; Thu, 01 Dec 2022 01:43:28 -0500
X-MC-Unique: q12ZELduNqiML7nou354GA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p2-20020adfaa02000000b00241d7fb17d7so125106wrd.5
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 22:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=usj/xA8nAbVirHEidSfC3c+FNTcoMVn+cMoIdT8TQ8o=;
 b=aIpn7IDCF05F6wpFZXcn7M4cRG+MTcLXYuNfXVKUIbwPcMytJN73oQzlQzA0+EB+rm
 KGdQS0NOD38tsv51huvSHNFXO45oDQMTF1LYw53ewRaTAlVbwyT/QDV5fXAvoY/zWL6G
 g6NqzJiNJuuZTvK7ilUwMFyWKKZgwdVGj/Gm+n9u5ybpT35c/7kg9v6pW6rrN1Hm3Z2P
 JyyxHsWeKcs/4TP35vOVN0h9tVE3s96VONxUjyO88BpDhqgwHLqC16SyRgr5bSDZYO+h
 7W6tFUeVuFFt5xu3LL34z9UtjWbt6YtxuJcJloNjnjgxU1BksNHj8Jzy7WjWPqqYLaCA
 4SYQ==
X-Gm-Message-State: ANoB5pk24+dMS8WP3r81E9zJ2/xT+dIl/pmjpIVlD4Zpl2iFQPOEue8e
 Z3w1biHprj9SDSowbc7B2HJpwUxzhJbWvygEmE5l6Z23ub83zdY5iUV71ExRvtDn4c+Yyze9lCv
 Sp0Ok2n6zbMUeXMQ=
X-Received: by 2002:adf:f8cf:0:b0:241:c99f:8564 with SMTP id
 f15-20020adff8cf000000b00241c99f8564mr34626306wrq.277.1669877007384; 
 Wed, 30 Nov 2022 22:43:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7facXfWd71dslJxNw5rioceJMfBkG+8X4dsMrsf8Rx3RdVH3Y5uTowHy9xndWq56yJO/GQEQ==
X-Received: by 2002:adf:f8cf:0:b0:241:c99f:8564 with SMTP id
 f15-20020adff8cf000000b00241c99f8564mr34626297wrq.277.1669877007192; 
 Wed, 30 Nov 2022 22:43:27 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056000129000b002421ce6a275sm3446785wrx.114.2022.11.30.22.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 22:43:26 -0800 (PST)
Message-ID: <b500f723-4d03-fb42-c2a5-67599d518010@redhat.com>
Date: Thu, 1 Dec 2022 07:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] target/i386: allow MMX instructions with CR4.OSFXSR=0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221130141917.29667-1-pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221130141917.29667-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30/11/2022 15.19, Paolo Bonzini wrote:
> MMX state is saved/restored by FSAVE/FRSTOR so the instructions are
> not illegal opcodes even if CR4.OSFXSR=0.  Make sure that validate_vex
> takes into account the prefix and only checks HF_OSFXSR_MASK in the
> presence of an SSE instruction.
> 
> Fixes: 20581aadec5e ("target/i386: validate VEX prefixes via the instructions' exception classes", 2022-10-18)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1350
> Reported-by: Helge Konetzka (@hejko on gitlab.com)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
> index e4878b967f0e..80c579164ff2 100644
> --- a/target/i386/tcg/decode-new.c.inc
> +++ b/target/i386/tcg/decode-new.c.inc
> @@ -1488,7 +1488,8 @@ static bool validate_vex(DisasContext *s, X86DecodedInsn *decode)
>               if (!(s->flags & HF_AVX_EN_MASK)) {
>                   goto illegal;
>               }
> -        } else {
> +        } else if (e->special != X86_SPECIAL_MMX ||
> +                   (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA))) {
>               if (!(s->flags & HF_OSFXSR_MASK)) {
>                   goto illegal;
>               }

This fixes the MicroSnow image, indeed, thus:

Tested-by: Thomas Huth <thuth@redhat.com>

Should this patch still be included in QEMU 7.2 ? ... since it fixes a 
regression?


