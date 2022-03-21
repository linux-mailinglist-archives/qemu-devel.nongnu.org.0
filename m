Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E04E2552
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:37:15 +0100 (CET)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWGLa-00063i-Hd
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:37:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWGK4-0004Xo-Sf
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWGK1-0000I1-Dt
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647862536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2HMSJoyMFjRZbXt3LPyYeph87Y8cNkFnCECwP4hzYE=;
 b=EDOmpUYjdMQ+JDW8MlMiixX18PqeTiFU1SIBSqrR+f9No/eHGLeJ7GInopHYjfxlfo1vfK
 KWgmcP0MjidNI+7yh9v8zqs4FOlyKuXcMA6UdMEHXo4cJfG2In54xzAoe3tbROzWd9W092
 C3XMK9XogSfRyp7QV1g+sAJPBIEP/W8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-rYBHo4brMTePicrJ22NkAg-1; Mon, 21 Mar 2022 07:35:35 -0400
X-MC-Unique: rYBHo4brMTePicrJ22NkAg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r9-20020a1c4409000000b0038c15a1ed8cso8134365wma.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 04:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=F2HMSJoyMFjRZbXt3LPyYeph87Y8cNkFnCECwP4hzYE=;
 b=vXQrsn6VTuE3QEawsnRnEaV9kqwBIigxhlP8RD/C1TpnqFls2UY9R/Y/IVHRsP41ht
 uZKfBEXZv5CMQNlpeY/v1WSoVaASvFaERhGalyhTH0mbAKQBnK2EwYlrFg/ZYKpa22VO
 3EgYx31Y3WU+zwJ/gqtziw/t2EWUFYYQYg++X35zv0ylMkX3z25AvtibvCx5uc1BHZMV
 x3HLSgZVBUj4uZkgssl2jdbNkSg3XUZ3FFYif2f+Kjmr415sxHKEeLTiUQyM8ZV007cX
 x85A4hJwntRsAGC6utQVypJMosX3TcODk0L8rnGk9SMr/k8s+J3q88BPbrYHsa8EmdY1
 rxMA==
X-Gm-Message-State: AOAM531+hPJIdYbh/3vdsRw9jU3SFIarns7saxdDgFEjquUQMThHRBxB
 Nej265y2jIEBzQ/1rF4PhxPFVD9/vWpWyDOkCsKddaWxT5ewyf0GTbPhJO9whjKK8AnGOHiwih9
 lLH6eJ4fkzHfYF0k=
X-Received: by 2002:a5d:51c5:0:b0:203:decf:8fbf with SMTP id
 n5-20020a5d51c5000000b00203decf8fbfmr17646845wrv.440.1647862529575; 
 Mon, 21 Mar 2022 04:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNmdT0l1AkIAut6IMd+9BTnp58XvnCQ0YUUA4NX9hLaFvfHknXYdbNEbycNI7Qwhw1tylUCQ==
X-Received: by 2002:a5d:51c5:0:b0:203:decf:8fbf with SMTP id
 n5-20020a5d51c5000000b00203decf8fbfmr17646821wrv.440.1647862529340; 
 Mon, 21 Mar 2022 04:35:29 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 i5-20020adfaac5000000b00203fd04bf86sm7068656wrc.66.2022.03.21.04.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 04:35:28 -0700 (PDT)
Message-ID: <ec84c578-1518-26e1-b1a9-082f1eeed2dc@redhat.com>
Date: Mon, 21 Mar 2022 12:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-7-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 06/11] target/s390x: vxeh2: vector {load, store}
 elements reversed
In-Reply-To: <20220308015358.188499-7-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Message-Id: <20220307020327.3003-5-dmiller423@gmail.com>
> [rth: Use new hswap and wswap tcg expanders.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate_vx.c.inc | 84 +++++++++++++++++++++++++++++
>  target/s390x/tcg/insn-data.def      |  4 ++
>  2 files changed, 88 insertions(+)
> 
> diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
> index a5283ef2f8..ac807122a3 100644
> --- a/target/s390x/tcg/translate_vx.c.inc
> +++ b/target/s390x/tcg/translate_vx.c.inc
> @@ -492,6 +492,46 @@ static DisasJumpType op_vlei(DisasContext *s, DisasOps *o)
>      return DISAS_NEXT;
>  }
>  
> +static DisasJumpType op_vler(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = get_field(s, m3);

TCGv_i64 t0, t1;

> +
> +    if (es < ES_16 || es > ES_64) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    TCGv_i64 t0 = tcg_temp_new_i64();
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +
> +    /* Begin with the two doublewords swapped... */
> +    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
> +    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> +    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
> +
> +    /* ... then swap smaller elements within the doublewords as required. */
> +    switch (es) {
> +    case MO_16:
> +        tcg_gen_hswap_i64(t1, t1);
> +        tcg_gen_hswap_i64(t0, t0);
> +        break;
> +    case MO_32:
> +        tcg_gen_wswap_i64(t1, t1);
> +        tcg_gen_wswap_i64(t0, t0);
> +        break;
> +    case MO_64:
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
> +    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    return DISAS_NEXT;
> +}
> +
>  static DisasJumpType op_vlgv(DisasContext *s, DisasOps *o)
>  {
>      const uint8_t es = get_field(s, m4);
> @@ -976,6 +1016,50 @@ static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
>      return DISAS_NEXT;
>  }
>  
> +static DisasJumpType op_vster(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = get_field(s, m3);
> +    TCGv_i64 t0, t1;
> +
> +    if (es < ES_16 || es > ES_64) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    /* Probe write access before actually modifying memory */
> +    gen_helper_probe_write_access(cpu_env, o->addr1, tcg_constant_i64(16));

We have to free the tcg_constant_i64() IIRC.

> +
> +    /* Begin with the two doublewords swapped... */
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +    read_vec_element_i64(t1,  get_field(s, v1), 0, ES_64);
> +    read_vec_element_i64(t0,  get_field(s, v1), 1, ES_64);
> +

apart from that LGTM

-- 
Thanks,

David / dhildenb


