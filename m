Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D304F1115
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 10:38:24 +0200 (CEST)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbIEB-0004Iz-IP
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 04:38:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nbICU-0003Dr-7q
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nbICN-0008NC-7e
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649061385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgrAC1NKnC3BFTCqCRp2A2umBN4PXJVgCpQmG0mmFNk=;
 b=GHZQC67E6OfUxrkbqRJO+OtWyRVB3ifgxidI8EWnXLOZtCU0zwRnEBwqUjD6/IO4t+5Lb1
 8LbzSMg1tS3/tnrEIrbgMhnhaolbr1XOfqz+HqFlXzfqNYNWo3i/luFcBwkGFGf+nrEFgb
 IKIo0sqrk/aGJPdUdygkih7Mcvs4Hx0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-VUq7AiQJPRmQV1E2rhiFMQ-1; Mon, 04 Apr 2022 04:36:24 -0400
X-MC-Unique: VUq7AiQJPRmQV1E2rhiFMQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 g4-20020adfa484000000b002061151874eso317467wrb.21
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 01:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mgrAC1NKnC3BFTCqCRp2A2umBN4PXJVgCpQmG0mmFNk=;
 b=bZ/NphU2sfNriJ4BxSm3dmXiesB3c7BKHH99M7+r3U2qOKn+GOdt9QM+w05OYtc3gZ
 8iQ2tj3kWnzTLdJTQYgDNydISz0gCZVjn8GanFyqNej+3a2mRl8cu/KvVEtmbYZRGtTy
 ePWliz0Z3fxKOlGUQ0e0Gf2qjltFz29Xk1xCSTscp8Qbe5GreAB04SatRdc3R0IztigN
 +gjpjC4x+jD69rkdKmIk22if+wOduc4tXuv9f364m3MqLSC0DPPIf+VS5dAkCq/ogEn4
 QDW+yBJx2+Jac67KA8BtA7TEo1t5P7/nd3gF/IIlJ+bx+a9tR2heUnQggDD1jOtyoCPp
 E8BQ==
X-Gm-Message-State: AOAM531iQ8mGOhFYZe21/4vkS6RGplccaxeDJ9pUyJYoudUIqdQRrWdH
 5dCkofqMDnfbTHl3MouKJzAHaJ3tY9eQXWKU0i4mYoAs/BhB0bK9NvgfASBjspY62lWm6Mh/E7n
 Bmf/fYrvzQpJempc=
X-Received: by 2002:adf:f009:0:b0:206:946:b97e with SMTP id
 j9-20020adff009000000b002060946b97emr6623606wro.588.1649061383266; 
 Mon, 04 Apr 2022 01:36:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjOI1ejUflTs0dDprNHGOisW27zGIcxOTGrJDDfLXqIKXx5M48tAhi2gqE0gm41phirVyyeg==
X-Received: by 2002:adf:f009:0:b0:206:946:b97e with SMTP id
 j9-20020adff009000000b002060946b97emr6623600wro.588.1649061383052; 
 Mon, 04 Apr 2022 01:36:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4100:c220:ede7:17d4:6ff4?
 (p200300cbc7044100c220ede717d46ff4.dip0.t-ipconnect.de.
 [2003:cb:c704:4100:c220:ede7:17d4:6ff4])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a7bcb84000000b00389efb7a5b4sm16437383wmi.17.2022.04.04.01.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 01:36:22 -0700 (PDT)
Message-ID: <f849e9b8-31af-84bc-a93b-0d6c5414a577@redhat.com>
Date: Mon, 4 Apr 2022 10:36:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] target/s390x: Fix the accumulation of ccm in op_icm
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220401193659.332079-1-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220401193659.332079-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 21:36, Richard Henderson wrote:
> Coverity rightly reports that 0xff << pos can overflow.
> This would affect the ICMH instruction.
> 
> Fixes: Coverity CID 1487161
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 5acfc0ff9b..ea7baf0832 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -2622,7 +2622,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
>                  tcg_gen_qemu_ld8u(tmp, o->in2, get_mem_index(s));
>                  tcg_gen_addi_i64(o->in2, o->in2, 1);
>                  tcg_gen_deposit_i64(o->out, o->out, tmp, pos, 8);
> -                ccm |= 0xff << pos;
> +                ccm |= 0xffull << pos;
>              }
>              m3 = (m3 << 1) & 0xf;
>              pos -= 8;

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


