Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2196F4044
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:39:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmSP-0006Dv-TJ; Tue, 02 May 2023 05:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ptmSN-0006DY-MX
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ptmSL-0002Mn-TS
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683020276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18HikUdO/0dyOynTJ/Z6qUj63wBzj5/UyBu24GH100s=;
 b=TFhFbcM79mEG31kY1/7Ri6DhCigctrRLbLdAquLUWjixQ9JSYjQ6YXm2Kygk10mIHB7VxK
 TqUl/oDviN1phfAszOFjcpyEJJQIzVjbcjpqMRHIexWYn5u3U0/169PtQFOS6ylV2nFaqA
 NCxQUTj5PZjhmCRvkuhU4E364OoE08s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-dFEu1NBVMCCw2yuexNwt1A-1; Tue, 02 May 2023 05:37:54 -0400
X-MC-Unique: dFEu1NBVMCCw2yuexNwt1A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f336ecf58cso8435665e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 02:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683020273; x=1685612273;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=18HikUdO/0dyOynTJ/Z6qUj63wBzj5/UyBu24GH100s=;
 b=EwuLLQkBL56yim1WIQfrcMkyYB2GhrB2SDRwaGb7cQM//JSOtmk7+cRJYqKbq2CMtN
 iiMjF64iK5Ud4piWt2KeXtEj7AAa1SW0PXl3F+32nUJNz1OSskK3iFNu4k+9ET4vGHyc
 QGR9GENF84UURILRLZzeCk9KvMXF1ktb9NlCn8QmU0y/WOjcpLNOO56Dgf7onlebWWO3
 TMCz+owVoKUgTheDsskmZwGMGCpJPjQJEnqsU6vq8q+yZ6KYOOZAJr9u+kQxjS4uOi86
 Gd+jtBPT8cjdNrIXiMMgFzi5whcAj06J+onpVYpfjHd4FuJGwIQsl+5Iy7qUcaVrJ+wn
 kxWA==
X-Gm-Message-State: AC+VfDxIOK9RoAKORoWi35wH095jIz+2/smxfGrALFuGeuaoVVWpwgvS
 BXeVfpxUwOlYUIlxCkp+JUsTcXEpzCPpepL8hmW/TnUFPbyxLxdzm0juss7FV6YWPO8e8bMgOwy
 BGfIvaT+NpU5HYJ0=
X-Received: by 2002:a05:600c:cb:b0:3f1:7144:5e32 with SMTP id
 u11-20020a05600c00cb00b003f171445e32mr11634996wmm.35.1683020273724; 
 Tue, 02 May 2023 02:37:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ41/8TSzKvjX84rN4UileOUk7sZB0Ri/SWaDbvG/jw605oYiNP8wMCBItwpdbpb9Sd9HBJaZw==
X-Received: by 2002:a05:600c:cb:b0:3f1:7144:5e32 with SMTP id
 u11-20020a05600c00cb00b003f171445e32mr11634983wmm.35.1683020273427; 
 Tue, 02 May 2023 02:37:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:2400:6b79:2aa:9602:7016?
 (p200300cbc70024006b7902aa96027016.dip0.t-ipconnect.de.
 [2003:cb:c700:2400:6b79:2aa:9602:7016])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003f182cc55c4sm34746057wmj.12.2023.05.02.02.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 02:37:53 -0700 (PDT)
Message-ID: <c3099140-7be5-9d98-47df-a5279c04b418@redhat.com>
Date: Tue, 2 May 2023 11:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] pci: pci_add_option_rom(): improve style
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, den-plotnikov@yandex-team.ru,
 lersek@redhat.com, kraxel@redhat.com
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-2-vsementsov@yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230425161434.173022-2-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25.04.23 18:14, Vladimir Sementsov-Ogievskiy wrote:
> Fix over-80 lines and missing curly brackets for if-operators, which
> are required by QEMU coding style.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/pci.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index def5000e7b..4a61c8d24a 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2297,10 +2297,12 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>       char name[32];
>       const VMStateDescription *vmsd;
>   
> -    if (!pdev->romfile)
> +    if (!pdev->romfile) {
>           return;
> -    if (strlen(pdev->romfile) == 0)
> +    }
> +    if (strlen(pdev->romfile) == 0) {
>           return;
> +    }

Could be further simplified to

if (!pdev->romfile || !strlen(pdev->romfile)) {
	return;
}


Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


