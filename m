Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F2642832
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 13:16:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2ANi-0002kG-8A; Mon, 05 Dec 2022 07:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p2ANZ-0002jq-GQ
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:15:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p2ANX-0007P6-Tf
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670242522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KXkeRe4USePCwTTnEYXD7RjNUXHcG+ZYumb4twr4sU=;
 b=Uc8TrEzmLXJV/RIzQNeElEnH5fYBxogBToeZdXqEjx9It426EdrgevejVeXFjV7r6lVgS6
 +cFDQwdlbQt4jSbKGJoHWR4TlSTUT2JZxFtLUYTlsu7Xetkr2c+wJO/0TGh9oqjrDF5unz
 Li+ez9PQIgMUqlF/whsYyGTGJMcLZ2w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-538-ov4gaawiNum-68Lavv9FCg-1; Mon, 05 Dec 2022 07:15:21 -0500
X-MC-Unique: ov4gaawiNum-68Lavv9FCg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d4-20020adfa404000000b002421ca8cb07so2221985wra.2
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 04:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8KXkeRe4USePCwTTnEYXD7RjNUXHcG+ZYumb4twr4sU=;
 b=HM9hm2tXh+FieQnPqUV39Tzm5CQ5Vgm1UFFisInPJwUtOkB0qj9h2RCI/+0YECIthj
 EFnLfEvKApR2VjpMos4HZQeh+lBJ8NyyBb7Nr7LXULnsowf6D6+nFg25bKrqNNFhQXKJ
 n7uZR3oz6asxw82HvQ03q8hrYakKasWQIPsAboLaJJMa6kzCZ9NbhWrCE7VvjG9IxwAK
 9B7n6xe0AzDLYaMzPKUbDBGD1haaw/t5CjK1uNVw/d82IzcXDquXYeL9OdKrwvMIZTrY
 Ua/tGiPECgCVBeWjMmBXcw+VSCX1pxDBH3QyZKEzDTg1eXYn6nU2nMBCfQaR+prOGWP9
 V6Ow==
X-Gm-Message-State: ANoB5pmdAF4BKHTYrg1hhFx2GLGg0GtOK8sR/SBqSGFFLgeekGsu8OM7
 ZgMhFrsD7Uf7epA/vmbDFO6zvqXqIYGFUegAnYiABvNR0kCS4tc/C1IqmQFTE4zmyw/xtFPggzG
 jxq6xjtT3cblFJEY=
X-Received: by 2002:a05:600c:a14:b0:3c7:a5:6113 with SMTP id
 z20-20020a05600c0a1400b003c700a56113mr49768935wmp.129.1670242519849; 
 Mon, 05 Dec 2022 04:15:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf77YXY0Ka2b4X+Fn67jVOkFNnMH2kWYgUnK5DHh4orusnOqLreeNcVpJo4TDyXWVDz28glIqQ==
X-Received: by 2002:a05:600c:a14:b0:3c7:a5:6113 with SMTP id
 z20-20020a05600c0a1400b003c700a56113mr49768916wmp.129.1670242519494; 
 Mon, 05 Dec 2022 04:15:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:fe00:a7c9:b0d6:909d:124a?
 (p200300cbc701fe00a7c9b0d6909d124a.dip0.t-ipconnect.de.
 [2003:cb:c701:fe00:a7c9:b0d6:909d:124a])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d634c000000b00241e8d00b79sm17462258wrw.54.2022.12.05.04.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 04:15:19 -0800 (PST)
Message-ID: <60e325da-3d6e-cf46-f73d-9777778ef081@redhat.com>
Date: Mon, 5 Dec 2022 13:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] memory: dump HPA and access type of ramblocks
Content-Language: en-US
To: Ted Chen <znscnchen@gmail.com>, pbonzini@redhat.com, peterx@redhat.com,
 philmd@linaro.org
Cc: qemu-devel@nongnu.org
References: <20221205120712.269013-1-znscnchen@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221205120712.269013-1-znscnchen@gmail.com>
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

On 05.12.22 13:07, Ted Chen wrote:
> It's convenient to dump HVA and RW/RO status of a ramblock in "info ramblock"
> for debug purpose.
> 
> Before:
>              Offset               Used              Total
> 0x0000000000000000 0x0000000400000000 0x0000000400000000
> 
> After:
>              Offset               Used              Total                HVA  RO
> 0x0000000000000000 0x0000000400000000 0x0000000400000000 0x00007f12ebe00000  rw
> 
> Signed-off-by: Ted Chen <znscnchen@gmail.com>
> ---
>   softmmu/physmem.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 1b606a3002..fed4dfb72c 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1316,15 +1316,21 @@ GString *ram_block_format(void)
>       GString *buf = g_string_new("");
>   
>       RCU_READ_LOCK_GUARD();
> -    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s\n",
> -                           "Block Name", "PSize", "Offset", "Used", "Total");
> +    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s %18s %3s\n",
> +                           "Block Name", "PSize", "Offset", "Used", "Total",
> +                           "HVA", "RO");
> +
>       RAMBLOCK_FOREACH(block) {
>           psize = size_to_str(block->page_size);
>           g_string_append_printf(buf, "%24s %8s  0x%016" PRIx64 " 0x%016" PRIx64
> -                               " 0x%016" PRIx64 "\n", block->idstr, psize,
> +                               " 0x%016" PRIx64 " 0x%016" PRIx64 " %3s\n",
> +                               block->idstr, psize,
>                                  (uint64_t)block->offset,
>                                  (uint64_t)block->used_length,
> -                               (uint64_t)block->max_length);
> +                               (uint64_t)block->max_length,
> +                               (uint64_t)block->host,
> +                               block->mr->readonly ? "ro" : "rw");
> +
>           g_free(psize);
>       }
>   

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


