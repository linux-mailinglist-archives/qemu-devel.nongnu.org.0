Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D66F642A6F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:33:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CVq-0007VJ-L0; Mon, 05 Dec 2022 09:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p2CVn-0007UE-Kn
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:32:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p2CVk-0006kK-2n
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670250717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbrWUHjWox3YmjrAmTOKtEJVzDyUeBsbJXqCmjNi7TQ=;
 b=bcirFRrPd0cE1mrcF/Q2qf4ISExZoIOYkGTPb6aPms3PGqDrKDRnZj4Y7jUTHjJrQq2ZB6
 xDNgHYYi1370Esio3QDUfXTVDYoWW3fQG+2jaSoDThhZrjNXwlK/HZBW1nEZsXjnaWtWNP
 nkScng2/KfCesgKCEX/G7Y2sd+MJ7u0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-2W3CMjUjMi6GIBHUtowpfQ-1; Mon, 05 Dec 2022 09:31:55 -0500
X-MC-Unique: 2W3CMjUjMi6GIBHUtowpfQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 i205-20020a1c3bd6000000b003d1d8d7f266so1078959wma.7
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 06:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gbrWUHjWox3YmjrAmTOKtEJVzDyUeBsbJXqCmjNi7TQ=;
 b=EGJgqNdttK3az8oLBZgs4ynypgag+W0yO25leWgcrPxaP5TZ8IvR2A/wKbueGH/Qr/
 wIad52F8y2o4b3q8HzvKWxoFCdIF1ex+8WVGVwmVotgu/YZhxWOECk5J1q+giwDqTCy6
 hw4X9vcIq+xs6wuks62pZiVvOlwXFnQF3akK6kKU8WZv4fG+VLY9ekjQ8MXmGZhrkWQj
 cZicPEtGeUdg9oBccnXUSOA88L1LwHl2nAx3OlAZFvs8KvC1F8L3ydqiaOfjhXOBoxD/
 +GppF9nRRYc3+t/HHvgLjhKFHrUO9xVorvJKd+JPy8zOy7Adr9ZZ91KT4sRRbeQXFdfj
 3iEA==
X-Gm-Message-State: ANoB5ple4M1bcO3cjGk5w9iTLtAZo2yCUXZ60KdX2loTGib4Alxk4Yqc
 wrHqCUZo1Wj0mKaQlcLqSDEe9czVVauBDiEMaripDwptAJ3s8X/hV6TFv1m4GNlYxv5mBxVMVHf
 OmoBI1wH0OBo8QOs=
X-Received: by 2002:a05:600c:2108:b0:3cf:aae0:802a with SMTP id
 u8-20020a05600c210800b003cfaae0802amr51146839wml.112.1670250714630; 
 Mon, 05 Dec 2022 06:31:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6uBZflMg2bQf9A3int+95OjELUMyZt/tcuna2AFemV7vglvJiUsph13yLUSx5ibkHK6oJ3VA==
X-Received: by 2002:a05:600c:2108:b0:3cf:aae0:802a with SMTP id
 u8-20020a05600c210800b003cfaae0802amr51146806wml.112.1670250714321; 
 Mon, 05 Dec 2022 06:31:54 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:fe00:a7c9:b0d6:909d:124a?
 (p200300cbc701fe00a7c9b0d6909d124a.dip0.t-ipconnect.de.
 [2003:cb:c701:fe00:a7c9:b0d6:909d:124a])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d4402000000b00226dba960b4sm14171799wrq.3.2022.12.05.06.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 06:31:53 -0800 (PST)
Message-ID: <7b530181-3cd9-24c8-541a-86502d41693e@redhat.com>
Date: Mon, 5 Dec 2022 15:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0] target/s390x/tcg/mem_helper: Test the right bits
 in psw_key_valid()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221205142043.95185-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221205142043.95185-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05.12.22 15:20, Thomas Huth wrote:
> The PSW key mask is a 16 bit field, and the psw_key variable is
> in the range from 0 to 15, so it does not make sense to use
> "0x80 >> psw_key" for testing the bits here. We should use 0x8000
> instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Found by code inspection (Linux likely does not use these PSW key masks
>   yet, otherwise we might have noticed earlier)
> 
>   target/s390x/tcg/mem_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 9542fad59b..cb82cd1c1d 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -51,7 +51,7 @@ static inline bool psw_key_valid(CPUS390XState *env, uint8_t psw_key)
>   
>       if (env->psw.mask & PSW_MASK_PSTATE) {
>           /* PSW key has range 0..15, it is valid if the bit is 1 in the PKM */
> -        return pkm & (0x80 >> psw_key);
> +        return pkm & (0x8000 >> psw_key);
>       }
>       return true;
>   }

I assume a Fixes tag might be applicable (I remember I added that once).

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


