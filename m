Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9A40B613
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:40:25 +0200 (CEST)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQCPv-0003or-Al
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCMx-000384-AJ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCMt-00026X-D9
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631641032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/+VAxbZiz+nGzfr657Ny3Pp3wCNn95R94knAKYluEg=;
 b=JM4z4qKGJE2pD2OwrsMvnnwuWLXz3pbFC5Iy3ix+nYmonQ5Uq5Ahy4NUdv2Ay/MINyqe0T
 z/AgnMOtOjOCcuW1JqqCEUybjKrH26BbGJFCOdk7zjvDPivoSNdFEGW/kr6egBZxn2uDyD
 e2LzqekyOfns5uXYevenVEds8z2VqsU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-Tn57BJgRMtulsvl56u0kAg-1; Tue, 14 Sep 2021 13:37:10 -0400
X-MC-Unique: Tn57BJgRMtulsvl56u0kAg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so70428wma.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=a/+VAxbZiz+nGzfr657Ny3Pp3wCNn95R94knAKYluEg=;
 b=E1NhwpOJc48+QHH7qvSsnPnKzJ/X1UcqVIUw1pb+Ow9T3Zsrhw5jYD2mMf6X/i9pyN
 7dz4q1gGgLZpFInd6Jzp8EWTY0HgqZqh/csqH1BYodjKDCFh1+Y//JVySTQyEcGV+o7h
 xcg8EcROVtF1phsngXqZE/UgfopiA42nU/SBJwEz8mXEbMuqvDTvuQSSv0gAaxEOrmWb
 sc9zZo3FZWYtVbnppz2UM5lVfva0Oa63mcJo61Ay2tPR4s/VCJ70njK2LvSxPoYL1FgV
 IJqfZbXXBsT08JiXgyOABy0fY4aSCww6Ww1wVaDcfXb/p8aSxxR9qdKcUMeGxktnadvR
 r3sQ==
X-Gm-Message-State: AOAM530piT5XhBsGHvUzYerAUld0vVePC+z5GkZaJ9iCRamiJBnaa0r8
 Qhn+pbLKMCRJYvic1OKTWQ5ZRkqxaYpi/QjHZIelTtlEZYazMxTus64HFLBrMTRR8JKiQs4IA9j
 UFPmBvoH7SkJzH6NJeuBaQnpSVElCi9laIDMcxPSDGpJmHhL8iJL6TGrhx7c0k3g=
X-Received: by 2002:adf:e384:: with SMTP id e4mr422838wrm.64.1631641029663;
 Tue, 14 Sep 2021 10:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVqpm+jvBiFyKuQPP4Msh1Qlt1L1JrwWGZF9DunVrBi8uE6cfgp1KOJjxWAn3WtZlb3Oxcdg==
X-Received: by 2002:adf:e384:: with SMTP id e4mr422808wrm.64.1631641029335;
 Tue, 14 Sep 2021 10:37:09 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 a25sm1750215wmj.34.2021.09.14.10.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:37:08 -0700 (PDT)
Subject: Re: [PATCH v4 09/16] tcg/s390x: Implement andc, orc, abs, neg, not
 vector operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-10-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <9afed294-615b-2cf8-256d-5d4910b25a0e@redhat.com>
Date: Tue, 14 Sep 2021 19:37:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626050307.2408505-10-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.06.21 07:03, Richard Henderson wrote:
> These logical and arithmetic operations are optional but trivial.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target-con-set.h |  1 +
>   tcg/s390x/tcg-target.h         | 10 +++++-----
>   tcg/s390x/tcg-target.c.inc     | 34 +++++++++++++++++++++++++++++++++-
>   3 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
> index ce9432cfe3..cb953896d5 100644
> --- a/tcg/s390x/tcg-target-con-set.h
> +++ b/tcg/s390x/tcg-target-con-set.h
> @@ -17,6 +17,7 @@ C_O0_I2(v, r)
>   C_O1_I1(r, L)
>   C_O1_I1(r, r)
>   C_O1_I1(v, r)
> +C_O1_I1(v, v)
>   C_O1_I1(v, vr)
>   C_O1_I2(r, 0, ri)
>   C_O1_I2(r, 0, rI)
> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
> index db54266da0..a3d4b5111f 100644
> --- a/tcg/s390x/tcg-target.h
> +++ b/tcg/s390x/tcg-target.h
> @@ -143,11 +143,11 @@ extern uint64_t s390_facilities[3];
>   #define TCG_TARGET_HAS_v128           HAVE_FACILITY(VECTOR)
>   #define TCG_TARGET_HAS_v256           0
>   
> -#define TCG_TARGET_HAS_andc_vec       0
> -#define TCG_TARGET_HAS_orc_vec        0
> -#define TCG_TARGET_HAS_not_vec        0
> -#define TCG_TARGET_HAS_neg_vec        0
> -#define TCG_TARGET_HAS_abs_vec        0
> +#define TCG_TARGET_HAS_andc_vec       1
> +#define TCG_TARGET_HAS_orc_vec        1
> +#define TCG_TARGET_HAS_not_vec        1
> +#define TCG_TARGET_HAS_neg_vec        1
> +#define TCG_TARGET_HAS_abs_vec        1
>   #define TCG_TARGET_HAS_roti_vec       0
>   #define TCG_TARGET_HAS_rots_vec       0
>   #define TCG_TARGET_HAS_rotv_vec       0
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index c0622daaa0..040690abe2 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -270,13 +270,18 @@ typedef enum S390Opcode {
>       VRIb_VGM    = 0xe746,
>       VRIc_VREP   = 0xe74d,
>   
> +    VRRa_VLC    = 0xe7de,
> +    VRRa_VLP    = 0xe7df,
>       VRRa_VLR    = 0xe756,
>       VRRc_VA     = 0xe7f3,
>       VRRc_VCEQ   = 0xe7f8,   /* we leave the m5 cs field 0 */
>       VRRc_VCH    = 0xe7fb,   /* " */
>       VRRc_VCHL   = 0xe7f9,   /* " */
>       VRRc_VN     = 0xe768,
> +    VRRc_VNC    = 0xe769,
> +    VRRc_VNO    = 0xe76b,
>       VRRc_VO     = 0xe76a,
> +    VRRc_VOC    = 0xe76f,

VOC requires the vector-enhancements facility 1.

>       VRRc_VS     = 0xe7f7,
>       VRRc_VX     = 0xe76d,
>       VRRf_VLVGP  = 0xe762,
> @@ -2637,6 +2642,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>           tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
>           break;
>   
> +    case INDEX_op_abs_vec:
> +        tcg_out_insn(s, VRRa, VLP, a0, a1, vece);
> +        break;
> +    case INDEX_op_neg_vec:
> +        tcg_out_insn(s, VRRa, VLC, a0, a1, vece);
> +        break;
> +    case INDEX_op_not_vec:
> +        tcg_out_insn(s, VRRc, VNO, a0, a1, a1, 0);
> +        break;
> +
>       case INDEX_op_add_vec:
>           tcg_out_insn(s, VRRc, VA, a0, a1, a2, vece);
>           break;
> @@ -2646,9 +2661,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>       case INDEX_op_and_vec:
>           tcg_out_insn(s, VRRc, VN, a0, a1, a2, 0);
>           break;
> +    case INDEX_op_andc_vec:
> +        tcg_out_insn(s, VRRc, VNC, a0, a1, a2, 0);
> +        break;
>       case INDEX_op_or_vec:
>           tcg_out_insn(s, VRRc, VO, a0, a1, a2, 0);
>           break;
> +    case INDEX_op_orc_vec:
> +        tcg_out_insn(s, VRRc, VOC, a0, a1, a2, 0);
> +        break;
>       case INDEX_op_xor_vec:
>           tcg_out_insn(s, VRRc, VX, a0, a1, a2, 0);
>           break;
> @@ -2679,10 +2700,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>   int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
>   {
>       switch (opc) {
> +    case INDEX_op_abs_vec:
>       case INDEX_op_add_vec:
> -    case INDEX_op_sub_vec:

Seems like an unrelated change that should have been performed in the 
introducing patch.


Apart from that:

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


