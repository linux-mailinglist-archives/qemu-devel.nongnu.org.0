Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B424D3B8E57
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 09:45:53 +0200 (CEST)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyrOS-0001B8-QL
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 03:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyrMz-0000D7-12
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyrMw-0001LX-BO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625125457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXrW9jouQqw2/mF22oe9yT9hkXEcjjOL6bHmJkJ5SCY=;
 b=i4X1QdA/0fV2Qb66NQmtH9I0YFM9dH0wZCY57PE0EXc4CWPBhW8vVV0+ZyPqWT/puequdD
 ZsFr4hUu3SkiYymsGbJBvI+feC2nqMtAU01jb6iZsXLg2vxDwe5I3r4GCNY3KSZxtfB1N/
 k4q0LhAaefYXVzewNG0VJzv5M2M9LKU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-HO3FzYwfOeWt1qQxMUMLiQ-1; Thu, 01 Jul 2021 03:44:15 -0400
X-MC-Unique: HO3FzYwfOeWt1qQxMUMLiQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 k1-20020adfe8c10000b0290124c5f1d4dbso2184187wrn.0
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 00:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YXrW9jouQqw2/mF22oe9yT9hkXEcjjOL6bHmJkJ5SCY=;
 b=hkOI4fwNikAWp/5NIHkqTUD5cXlJKO29XXnLneInafEQbsnHIw+MgLVg39Uby4qaV6
 vjSiRE/e1CaCOIboShUL3K60AaxOOqTKgYglbC9lAeNhxukv97fK1VmR1XOw79y1iyr4
 ERJT4Lt4l+U2Ri4eeXelh/Q5JGXWh3mrmR1GdFI7EmIKLABtFsv7tObvAO+lT2r1spQ/
 CGZbAx49poS8ATFpDD5q4FY1GyF+zlEGNyCbtBGOGZuFQzs5h6G/l3k1J6FK+NF8hJF9
 PVV9w9U/i62A7DBB4hcwqtgcXrGiSy/UnVdKxW+A4niXIWC/az2dFHGwuceBX32jflYv
 1pwg==
X-Gm-Message-State: AOAM531yf7tutj1S3pfiMcOzEpCX6PSGsneUlJVvrdqoZuON60hYNFOG
 FL5tPnsExM1bnHCdeNCrRZXQ/PFcRcfdehlbJeKvZpAD+QWHGquicLBt0KZzuTS7gY6l81XVe6H
 J2HgmqleYuI6PwcEf1LM1nDJUCFIkcVdnkmV4QW31hxxQa+TU81X5+4CplUw/NAI=
X-Received: by 2002:adf:c511:: with SMTP id q17mr33083269wrf.60.1625125454701; 
 Thu, 01 Jul 2021 00:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzim3VW/uMC2Wkhp/kx6OvgD99fZ0wkSjqU6i4k3CW7ewU1hDcJ2FbK7YRSoGN3NHjbeJJX4A==
X-Received: by 2002:adf:c511:: with SMTP id q17mr33083238wrf.60.1625125454479; 
 Thu, 01 Jul 2021 00:44:14 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bca.dip0.t-ipconnect.de. [79.242.59.202])
 by smtp.gmail.com with ESMTPSA id u9sm22410663wmq.41.2021.07.01.00.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 00:44:14 -0700 (PDT)
Subject: Re: [PATCH v2 23/28] target/s390x: Remove use_exit_tb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-24-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <51e4cc33-3b59-83f5-4b7b-21046b069019@redhat.com>
Date: Thu, 1 Jul 2021 09:44:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630183226.3290849-24-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.06.21 20:32, Richard Henderson wrote:
> We have not needed to end a TB for I/O since ba3e7926691
> ("icount: clean up cpu_can_io at the entry to the block").
> 
> In use_goto_tb, the check for singlestep_enabled is in the
> generic translator_use_goto_tb.  In s390x_tr_tb_stop, the
> check for singlestep_enabled is in the preceeding do_debug test.

s/preceeding/preceding/

> 
> Which leaves only FLAG_MASK_PER: fold that test alone into
> the two callers of use_exit tb.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/translate.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index 117a890ecd..4742f59ca9 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -685,16 +685,9 @@ static void gen_op_calc_cc(DisasContext *s)
>       set_cc_static(s);
>   }
>   
> -static bool use_exit_tb(DisasContext *s)
> -{
> -    return s->base.singlestep_enabled ||
> -            (tb_cflags(s->base.tb) & CF_LAST_IO) ||
> -            (s->base.tb->flags & FLAG_MASK_PER);
> -}
> -
>   static bool use_goto_tb(DisasContext *s, uint64_t dest)
>   {
> -    if (unlikely(use_exit_tb(s))) {
> +    if (unlikely(s->base.tb->flags & FLAG_MASK_PER)) {
>           return false;
>       }
>       return translator_use_goto_tb(&s->base, dest);
> @@ -6634,7 +6627,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>           /* Exit the TB, either by raising a debug exception or by return.  */
>           if (dc->do_debug) {
>               gen_exception(EXCP_DEBUG);
> -        } else if (use_exit_tb(dc) ||
> +        } else if ((dc->base.tb->flags & FLAG_MASK_PER) ||
>                      dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
>               tcg_gen_exit_tb(NULL, 0);
>           } else {
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


