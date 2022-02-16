Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F74B83B9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:12:18 +0100 (CET)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGMD-0008N5-KE
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:12:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKGId-0006hS-1H
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:08:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKGIa-0005CA-3j
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645002509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alRUpPNwohL689AvpMAE1jAExmvjZtvRlaLfMcItR9s=;
 b=VG6vVmeazFAm97XQhaxrN9vJPVlkMiVZY0LIvagdOum4hJqjwcJvQ+eSwuCxKVAOc7gk8i
 pqGDwaruuiJzLk4/0y5UV72godhMS3nhxQStVUMWR1nzKjTKCR1N3BAKYQXzj7NkDgeqMD
 gYwOirVBxz2z9M76IEWHmelX4dbMAb0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-ETNyLO1SN1GenWpySfDJAw-1; Wed, 16 Feb 2022 04:08:23 -0500
X-MC-Unique: ETNyLO1SN1GenWpySfDJAw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v6-20020a1cac06000000b0037e37f1be7cso361695wme.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=alRUpPNwohL689AvpMAE1jAExmvjZtvRlaLfMcItR9s=;
 b=G7tpTd8pXlVFA7aB3/UZZrkquqkswmaoAzQYaLRvPS6NkKNyP/sWANtPX+tMNRyeVq
 i+6eDda+XD4BsopRi4s+c+0oD0h8k5P+8GLemne/1bVPrMLI2Q7N4mM0G3jvIEHjvnEf
 iP1/EFf6DgF6GHBNjeboImpZpvg5pa0hHBvx9bS78V0WwgmcvpVm9xaCyMObxmBOVnFZ
 01wNfBTnQidV1AV9G79OOydPuOHWzKdwDFP/Xsh3BrlgRUDS9AaJeRhFseHI9i+g/xMZ
 2BeAmsNXO7RQwY1mWSGVIlaxVs6DX+xdtc8j69PuleAAiAeWskQUR85bVG8srjFbAfby
 fB5Q==
X-Gm-Message-State: AOAM532RdjYCMeoXNEJYH51kri3oQX1Epqlf6QuKeCatq+NMmSwBnzGz
 DDsWeiU7eTO2JDCQfFOxDXMBgmyeDGNkTdwTyH1zoGm0T2QxwPWA3MvZQ2EpUAYNnBHSJHWRcw8
 KNe6KEMLdbi6z6bg=
X-Received: by 2002:a05:600c:3c8e:b0:350:5358:99bb with SMTP id
 bg14-20020a05600c3c8e00b00350535899bbmr638031wmb.13.1645002502373; 
 Wed, 16 Feb 2022 01:08:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/o0GcWnS9jZ5xd8utI922vaK4aKySCgqXipSQkxdiZ4U8qCnazQB4XiB4ukT+eJynb5xerg==
X-Received: by 2002:a05:600c:3c8e:b0:350:5358:99bb with SMTP id
 bg14-20020a05600c3c8e00b00350535899bbmr637986wmb.13.1645002501909; 
 Wed, 16 Feb 2022 01:08:21 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id a1sm16062275wri.36.2022.02.16.01.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:08:21 -0800 (PST)
Message-ID: <e767d54c-bb77-5527-4e95-c8d9bcc0d42f@redhat.com>
Date: Wed, 16 Feb 2022 10:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <25fcb9f9-4314-faca-a7e3-99fbbe0541d2@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 1/3] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
In-Reply-To: <25fcb9f9-4314-faca-a7e3-99fbbe0541d2@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.02.22 21:26, David Miller wrote:
> resolves: https://gitlab.com/qemu-project/qemu/-/issues/737
> implements:
> AND WITH COMPLEMENT   (NCRK, NCGRK)
> NAND                  (NNRK, NNGRK)
> NOT EXCLUSIVE OR      (NXRK, NXGRK)
> NOR                   (NORK, NOGRK)
> OR WITH COMPLEMENT    (OCRK, OCGRK)
> SELECT                (SELR, SELGR)
> SELECT HIGH           (SELFHR)
> MOVE RIGHT TO LEFT    (MVCRL)
> POPULATION COUNT      (POPCNT)

Unfortunately the patch can still not get applied because it's broken.
I strongly assume that either
* your mail sending client
* your MTA (Mail Transfer Agent)
messes with newlines in the patch and wraps long lines, corrupting the patch;

The mails are also not properly threaded.

I can spot:
  User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
  Thunderbird/91.5.0

Try sending mails with git send-email instead. Let me point out a couple of
cases that are broken in the patch as I received it, so you can check if
they are correct on the source.

> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> ---
>   target/s390x/gen-features.c    |  1 +
>   target/s390x/helper.h          |  1 +
>   target/s390x/tcg/insn-data.def | 30 ++++++++++++++++--
>   target/s390x/tcg/mem_helper.c  | 20 ++++++++++++
>   target/s390x/tcg/translate.c   | 56 +++++++++++++++++++++++++++++++++-
>   5 files changed, 104 insertions(+), 4 deletions(-)
> 
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 7cb1a6ec10..a3f30f69d9 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -740,6 +740,7 @@ static uint16_t qemu_LATEST[] = {
>    /* add all new definitions before this point */
>   static uint16_t qemu_MAX[] = {
> +    S390_FEAT_MISC_INSTRUCTION_EXT3,
>       /* generates a dependency warning, leave it out for now */
>       S390_FEAT_MSA_EXT_5,
>   };
> diff --git a/target/s390x/helper.h b/target/s390x/helper.h
> index 271b081e8c..69f69cf718 100644
> --- a/target/s390x/helper.h
> +++ b/target/s390x/helper.h
> @@ -4,6 +4,7 @@ DEF_HELPER_FLAGS_4(nc, TCG_CALL_NO_WG, i32, env, i32, 
> i64, i64)

^ this line was broken although it shouldn't have been. The hunk should be:

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 271b081e8c..69f69cf718 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -4,6 +4,7 @@ DEF_HELPER_FLAGS_4(nc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(oc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(xc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvc, TCG_CALL_NO_WG, void, env, i32, i64, i64)
+DEF_HELPER_FLAGS_4(mvcrl, TCG_CALL_NO_WG, void, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mvcin, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_3(mvcl, i32, env, i32, i32)
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def

>   DEF_HELPER_FLAGS_4(oc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
>   DEF_HELPER_FLAGS_4(xc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
>   DEF_HELPER_FLAGS_4(mvc, TCG_CALL_NO_WG, void, env, i32, i64, i64)
> +DEF_HELPER_FLAGS_4(mvcrl, TCG_CALL_NO_WG, void, env, i64, i64, i64)
>   DEF_HELPER_FLAGS_4(mvcin, TCG_CALL_NO_WG, void, env, i32, i64, i64)
>   DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
>   DEF_HELPER_3(mvcl, i32, env, i32, i32)
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index 1c3e115712..a64555f824 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -105,6 +105,9 @@
>       D(0xa507, NILL,    RI_a,  Z,   r1_o, i2_16u, r1, 0, andi, 0, 0x1000)
>       D(0x9400, NI,      SI,    Z,   la1, i2_8u, new, 0, ni, nz64, MO_UB)
>       D(0xeb54, NIY,     SIY,   LD,  la1, i2_8u, new, 0, ni, nz64, MO_UB)
> +/* AND WITH COMPLEMENT */
> +    C(0xb9f5, NCRK,    RRF_a, MIE3, r2, r3, new, r1_32, andc, nz32)
> +    C(0xb9e5, NCGRK,   RRF_a, MIE3, r2, r3, r1, 0, andc, nz64)

^ note that there is a newline in the code before /* BRANCH AND LINK */,
 but it's gone in your patch. The hunk should have been

@@ -105,6 +105,9 @@
     D(0xa507, NILL,    RI_a,  Z,   r1_o, i2_16u, r1, 0, andi, 0, 0x1000)
     D(0x9400, NI,      SI,    Z,   la1, i2_8u, new, 0, ni, nz64, MO_UB)
     D(0xeb54, NIY,     SIY,   LD,  la1, i2_8u, new, 0, ni, nz64, MO_UB)
+/* AND WITH COMPLEMENT */
+    C(0xb9f5, NCRK,    RRF_a, MIE3, r2, r3, new, r1_32, andc, nz32)
+    C(0xb9e5, NCGRK,   RRF_a, MIE3, r2, r3, r1, 0, andc, nz64)
 
 /* BRANCH AND LINK */
     C(0x0500, BALR,    RR_a,  Z,   0, r2_nz, r1, 0, bal, 0)


>    /* BRANCH AND LINK */
>       C(0x0500, BALR,    RR_a,  Z,   0, r2_nz, r1, 0, bal, 0)
> @@ -640,6 +643,8 @@
>       C(0xeb8e, MVCLU,   RSY_a, E2,  0, a2, 0, 0, mvclu, 0)
>   /* MOVE NUMERICS */
>       C(0xd100, MVN,     SS_a,  Z,   la1, a2, 0, 0, mvn, 0)
> +/* MOVE RIGHT TO LEFT */
> +    C(0xe50a, MVCRL,   SSE,  MIE3, la1, a2, 0, 0, mvcrl, 0)
>   /* MOVE PAGE */
>       C(0xb254, MVPG,    RRE,   Z,   0, 0, 0, 0, mvpg, 0)
>   /* MOVE STRING */
> @@ -707,6 +712,16 @@
>       F(0xed0f, MSEB,    RXF,   Z,   e1, m2_32u, new, e1, mseb, 0, IF_BFP)
>       F(0xed1f, MSDB,    RXF,   Z,   f1, m2_64, new, f1, msdb, 0, IF_BFP)
>   +/* NAND */

^ note the + is preceded by "   "

This hunk should have been

 /* MOVE STRING */
     C(0xb255, MVST,    RRE,   Z,   0, 0, 0, 0, mvst, 0)
+/* NAND */
+    C(0xb974, NNRK,    RRF_a, MIE3, r2, r3, new, r1_32, nand, nz32)
+    C(0xb964, NNGRK,   RRF_a, MIE3, r2, r3, r1, 0, nand, nz64)
+/* NOR */
+    C(0xb976, NORK,    RRF_a, MIE3, r2, r3, new, r1_32, nor, nz32)
+    C(0xb966, NOGRK,   RRF_a, MIE3, r2, r3, r1, 0, nor, nz64)
+/* NOT EXCLUSIVE OR */
+    C(0xb977, NXRK,    RRF_a, MIE3, r2, r3, new, r1_32, nxor, nz32)
+    C(0xb967, NXGRK,   RRF_a, MIE3, r2, r3, r1, 0, nxor, nz64)
+
 /* MOVE WITH OPTIONAL SPECIFICATION */

[..]

>   {
> -    gen_helper_popcnt(o->out, o->in2);
> +    const uint8_t m3 = get_field(s, m3);
> +
> +    if ((m3 & 1) && s390_has_feat(S390_FEAT_MISC_INSTRUCTION_EXT3)) {
> +        tcg_gen_ctpop_i64(o->out, o->in2);
> +    }
> +    else {

This should not be your patch workflow fault: "} else {"


-- 
Thanks,

David / dhildenb


