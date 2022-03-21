Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05B34E251B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:17:38 +0100 (CET)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWG2b-000368-Fx
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:17:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWG13-0002Ek-Om
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:16:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWG10-00041N-HT
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647861357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1wroDxfvB+wg4sqCB1WdubKZtAt2N8RZZFRSWpUMCs=;
 b=YO62crnnH/sBCU/PhIv6yVpgUAGYeDo7BFrhPRfySou6FsVbV/TYxbFdtBMhEUu2ofoovk
 rfrR2nxIFH6iJEBWdVYO7mpQpsZwKKtCtpMSIhJKUk6JW6O63vt8QCC2dVNhvVbd9pXMgh
 YY7Z/zFxfPS+XQdi/OT42XIttneR0H4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-P1emVhlcNrKoxb57hiOAJg-1; Mon, 21 Mar 2022 07:15:56 -0400
X-MC-Unique: P1emVhlcNrKoxb57hiOAJg-1
Received: by mail-wr1-f71.google.com with SMTP id
 p16-20020adfc390000000b00204006989c2so621073wrf.5
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 04:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=V1wroDxfvB+wg4sqCB1WdubKZtAt2N8RZZFRSWpUMCs=;
 b=rAAKq+Yxp2ud1gNmPP0I9oKn2VpaqF7ljatyRiqdh0pXckId95AX/6ByW8SHnFQ/OK
 3X6uihHE3vYj++/I6X/v+DJ4rSz44d0ihjBVUSme5fske7FFNfwPJXfX7F7EPS7mcd9p
 g8YFCwE75cuZhrOgwlLQtws+F/5ao4pZVVkw94fCBSRJD++Dg3aT1BtFyOkUOPadBpWf
 bQGgNAAKN6J1bwo20/Ex8zPUdGYP8wE9EVgqmWZyLgqx+ApywHDkvRl3aKZsbSgFkTR4
 q/qW7ycYZ9KCWWbMxtpV9DctwYX2PK0aBT6UYHuoyd+i0o8E3uQX/6O1SRvQ5Ma1iYbL
 NQEw==
X-Gm-Message-State: AOAM530Au9xQf2yzr6itxS39srNz7ZInz8KCybMRBh91ZzC2EWmpowNl
 dbIMkr20xcHa69Wz4fn5dAkPgqt6Scb5+FBUQVUPAos7XmoJ0fqDwz4lbUOimBm6i/JYWcNKlJ3
 jBRXBmDQDrmVxv00=
X-Received: by 2002:a05:600c:3d98:b0:38c:829e:5d47 with SMTP id
 bi24-20020a05600c3d9800b0038c829e5d47mr16370018wmb.47.1647861354863; 
 Mon, 21 Mar 2022 04:15:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeRveOCCZaxY7uNihllfQrNdjnI2YyvfSjXN42JIKIjw5f6/JiaRyfk5c77NQHKkluPaDh3w==
X-Received: by 2002:a05:600c:3d98:b0:38c:829e:5d47 with SMTP id
 bi24-20020a05600c3d9800b0038c829e5d47mr16369989wmb.47.1647861354513; 
 Mon, 21 Mar 2022 04:15:54 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a5d4dc4000000b001d8e67e5214sm13246974wru.48.2022.03.21.04.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 04:15:54 -0700 (PDT)
Message-ID: <93302366-470f-2684-c788-d5eb9e0f861e@redhat.com>
Date: Mon, 21 Mar 2022 12:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-5-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 04/11] target/s390x: vxeh2: Update for changes to
 vector shifts
In-Reply-To: <20220308015358.188499-5-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:53, Richard Henderson wrote:
> From: David Miller <dmiller423@gmail.com>
> 
> Prior to vector enhancements 2, the shift count was supposed to be equal
> for each byte lest the result be unpredictable, which allowed us to assume
> that the shift count was the same, and optimize accordingly.
> 
> With vector enhancements 2, the shift count is allowed to be different
> for each byte, and we must cope with that.
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Message-Id: <20220307020327.3003-4-dmiller423@gmail.com>
> [rth: Split out of larger patch; simplify shift/merge code.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/helper.h               |  3 ++
>  target/s390x/tcg/vec_int_helper.c   | 58 ++++++++++++++++++++++
>  target/s390x/tcg/translate_vx.c.inc | 77 ++++++++++++-----------------
>  target/s390x/tcg/insn-data.def      | 12 ++---
>  4 files changed, 99 insertions(+), 51 deletions(-)
> 
> diff --git a/target/s390x/helper.h b/target/s390x/helper.h
> index 7412130883..bf33d86f74 100644
> --- a/target/s390x/helper.h
> +++ b/target/s390x/helper.h
> @@ -203,8 +203,11 @@ DEF_HELPER_FLAGS_3(gvec_vpopct16, TCG_CALL_NO_RWG, void, ptr, cptr, i32)
>  DEF_HELPER_FLAGS_4(gvec_verim8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
>  DEF_HELPER_FLAGS_4(gvec_verim16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
>  DEF_HELPER_FLAGS_4(gvec_vsl, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
> +DEF_HELPER_FLAGS_4(gvec_vsl_ve2, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
>  DEF_HELPER_FLAGS_4(gvec_vsra, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
> +DEF_HELPER_FLAGS_4(gvec_vsra_ve2, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
>  DEF_HELPER_FLAGS_4(gvec_vsrl, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
> +DEF_HELPER_FLAGS_4(gvec_vsrl_ve2, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
>  DEF_HELPER_FLAGS_4(gvec_vscbi8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
>  DEF_HELPER_FLAGS_4(gvec_vscbi16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
>  DEF_HELPER_4(gvec_vtm, void, ptr, cptr, env, i32)
> diff --git a/target/s390x/tcg/vec_int_helper.c b/target/s390x/tcg/vec_int_helper.c
> index 5561b3ed90..a881d5d267 100644
> --- a/target/s390x/tcg/vec_int_helper.c
> +++ b/target/s390x/tcg/vec_int_helper.c
> @@ -540,18 +540,76 @@ void HELPER(gvec_vsl)(void *v1, const void *v2, uint64_t count,
>      s390_vec_shl(v1, v2, count);
>  }
>  
> +void HELPER(gvec_vsl_ve2)(void *v1, const void *v2, const void *v3,
> +                          uint32_t desc)
> +{
> +    S390Vector tmp;
> +    uint32_t sh, e0, e1 = 0;

int i;

> +
> +    for (int i = 15; i >= 0; --i, e1 = e0 << 24) {

I'd only do "e1 = e0" here and do the shift for the rol32 ...

> +        e0 = s390_vec_read_element8(v2, i);
> +        sh = s390_vec_read_element8(v3, i) & 7;
> +
> +        s390_vec_write_element8(&tmp, i, rol32(e0 | e1, sh));

... here

s390_vec_write_element8(&tmp, i, rol32(e0 | e1 << 24, sh));

> +    }
> +
> +    *(S390Vector *)v1 = tmp;
> +}
> +
>  void HELPER(gvec_vsra)(void *v1, const void *v2, uint64_t count,
>                         uint32_t desc)
>  {
>      s390_vec_sar(v1, v2, count);
>  }
>  
> +void HELPER(gvec_vsra_ve2)(void *v1, const void *v2, const void *v3,
> +                           uint32_t desc)
> +{
> +    S390Vector tmp;
> +    uint32_t sh, e0, e1;
> +    int i = 0;
> +
> +    e0 = s390_vec_read_element8(v2, 0);
> +    e1 = -(e0 >> 7) << 8;
> +
> +    for (;;) {
> +        sh = s390_vec_read_element8(v3, i) & 7;
> +
> +        s390_vec_write_element8(&tmp, i, (e0 | e1) >> sh);
> +
> +        if (++i >= 16) {
> +            break;
> +        }
> +
> +        e1 = e0 << 8;
> +        e0 = s390_vec_read_element8(v2, i);
> +    }

Can't we use the following that resembles the other helpers or am I
missing something?

S390Vector tmp;
uint32_t sh, e0, e1 = 0;

/* Byte 0 is special only. */
e0 = (int32_t)(int8_t)s390_vec_read_element8(v2, i);
sh = s390_vec_read_element8(v3, i) & 7;
s390_vec_write_element8(&tmp, i, e0 >> sh);

e1 = e0;
for (int i = 1; i < 16; ++i, e1 = e0) {
	e0 = s390_vec_read_element8(v2, i);
	sh = s390_vec_read_element8(v3, i) & 7;
	s390_vec_write_element8(&tmp, i, (e0 | e1 << 8) >> sh);
}

*(S390Vector *)v1 = tmp;


> +
> +    *(S390Vector *)v1 = tmp;
> +}
> +
>  void HELPER(gvec_vsrl)(void *v1, const void *v2, uint64_t count,
>                         uint32_t desc)
>  {
>      s390_vec_shr(v1, v2, count);
>  }
>  
> +void HELPER(gvec_vsrl_ve2)(void *v1, const void *v2, const void *v3,
> +                           uint32_t desc)
> +{
> +    S390Vector tmp;
> +    uint32_t sh, e0, e1 = 0;
> +
> +    for (int i = 0; i < 16; ++i, e1 = e0 << 8) {

Dito, I'd do the shift below ...

> +        e0 = s390_vec_read_element8(v2, i);
> +        sh = s390_vec_read_element8(v3, i) & 7;
> +
> +        s390_vec_write_element8(&tmp, i, (e0 | e1) >> sh);

s390_vec_write_element8(&tmp, i, (e0 | e1 << 8) >> sh);

> +    }
> +
> +    *(S390Vector *)v1 = tmp;
> +}
> +
>  #define DEF_VSCBI(BITS)                                                        \
>  void HELPER(gvec_vscbi##BITS)(void *v1, const void *v2, const void *v3,        \
>                                uint32_t desc)                                   \
> diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
> index d514e8b218..967f6213d8 100644
> --- a/target/s390x/tcg/translate_vx.c.inc
> +++ b/target/s390x/tcg/translate_vx.c.inc
> @@ -2018,21 +2018,42 @@ static DisasJumpType op_ves(DisasContext *s, DisasOps *o)
>      return DISAS_NEXT;
>  }
>  
> +static DisasJumpType gen_vsh_bit_byte(DisasContext *s, DisasOps *o,
> +                                      gen_helper_gvec_2i *gen,
> +                                      gen_helper_gvec_3 *gen_ve2)
> +{
> +    bool byte = s->insn->data;

Nit: I'd have called this "by_byte".


-- 
Thanks,

David / dhildenb


