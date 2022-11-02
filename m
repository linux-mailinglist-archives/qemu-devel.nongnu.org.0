Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E62616039
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 10:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqAN9-0007zQ-8K; Wed, 02 Nov 2022 05:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oqAN6-0007zC-1l
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oqAN3-0000zU-Jx
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667382556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eleipb/PWtaDvF2CW90Qtb/55U7evbsDL47jItEz3Ds=;
 b=Y5iEgcM/eUy5AOnb+VSu2dBkOPyk1C0dAVkyX2U7ih37RSwphwiU5id0+kTa+Ea2Yw9oFZ
 ZJu7kVrnQPg22+5uxOngl5GK8imgU3QBJpV74f05UPQBI+boJNHWUvRouvAZ3vSJBEp2bA
 Ft0nutRPNlKehnLiZKubl1ybC8bWbQ8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58-Ep_SBj0yPvqzs633_vKkvA-1; Wed, 02 Nov 2022 05:49:15 -0400
X-MC-Unique: Ep_SBj0yPvqzs633_vKkvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so873842wma.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 02:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eleipb/PWtaDvF2CW90Qtb/55U7evbsDL47jItEz3Ds=;
 b=4UD+jyXcnv2XppE6X6VDAcg4rDEnMyq18n/CPOFMKfsnkjUTnTYWfx22bWU2u6K/Xg
 QpF3sbDPAOTNm3BC88jtJA8cMj8expQ3ZjqSSEZ98AfyBEv+LIMyY77sB6CSBmorGmM3
 6e/fYlLdmZZzkP5NIEvgbaEQjX8XB6aNhsDAe7REDnasZabH5rjJ3X/lQ/M52IHx+9kD
 QVcax+Mo/G8tef6nBrxEBzdlrIAs/AxRamSS6OfMeb+lO4Xm8sXqpMBJlKLStnFN4aKF
 YSS4EiOV4w+iVAgrGZrAGtDZdQIk0fgJUbLvlmRpUIbyeEszfQ0zybCXgUvhlBi7IbxE
 DhOA==
X-Gm-Message-State: ACrzQf3eHZzfIt4daK3RzhlM2hnYhF/XzAQVSkKzdo4SNSHV+h6sFPcj
 qyqde3YeVfKq2/eDrT86WByZo2K7WHPic+DDpGluyEghhcfsVRM3vcF0gEvVXCEdMXH3PEfiEQo
 SZwKfxxkjInHe7bs=
X-Received: by 2002:a5d:65cf:0:b0:236:9119:be3 with SMTP id
 e15-20020a5d65cf000000b0023691190be3mr14144464wrw.602.1667382554033; 
 Wed, 02 Nov 2022 02:49:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4aQWXYNeKPBXLyzeVpSP/B/pJekXOGyFWuogw1VEBbC6u/9EN4OFS5sFZcIBF+dmqS5+Rpuw==
X-Received: by 2002:a5d:65cf:0:b0:236:9119:be3 with SMTP id
 e15-20020a5d65cf000000b0023691190be3mr14144444wrw.602.1667382553698; 
 Wed, 02 Nov 2022 02:49:13 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:f100:af38:1d1f:66f4:48c7?
 (p200300cbc705f100af381d1f66f448c7.dip0.t-ipconnect.de.
 [2003:cb:c705:f100:af38:1d1f:66f4:48c7])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b003c6b874a0dfsm1655060wmo.14.2022.11.02.02.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:49:13 -0700 (PDT)
Message-ID: <b02aec81-7de0-63a9-0786-7280f51ada5b@redhat.com>
Date: Wed, 2 Nov 2022 10:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] s390x/tcg: Fix LDER instruction format
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20221102094304.2585676-1-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221102094304.2585676-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02.11.22 10:43, Ilya Leoshkevich wrote:
> It's RRE, not RXE.
> 
> Found by running valgrind's none/tests/s390x/bfp-2.
> 
> Fixes: 86b59624c4aa ("s390x/tcg: Implement LOAD LENGTHENED short HFP to long HFP")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/tcg/insn-data.def | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index 26523746d64..6028472c323 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -606,7 +606,7 @@
>       F(0xed04, LDEB,    RXE,   Z,   0, m2_32u, new, f1, ldeb, 0, IF_BFP)
>       F(0xed05, LXDB,    RXE,   Z,   0, m2_64, new_x, x1, lxdb, 0, IF_BFP)
>       F(0xed06, LXEB,    RXE,   Z,   0, m2_32u, new_x, x1, lxeb, 0, IF_BFP)
> -    F(0xb324, LDER,    RXE,   Z,   0, e2, new, f1, lde, 0, IF_AFP1)
> +    F(0xb324, LDER,    RRE,   Z,   0, e2, new, f1, lde, 0, IF_AFP1)
>       F(0xed24, LDE,     RXE,   Z,   0, m2_32u, new, f1, lde, 0, IF_AFP1)
>   /* LOAD ROUNDED */
>       F(0xb344, LEDBR,   RRF_e, Z,   0, f2, new, e1, ledb, 0, IF_BFP)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


