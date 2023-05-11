Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB06FF9B5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 20:58:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxBSx-0000tB-Tx; Thu, 11 May 2023 14:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBSl-0000sh-H2
 for qemu-devel@nongnu.org; Thu, 11 May 2023 14:56:28 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBSj-00007Y-HG
 for qemu-devel@nongnu.org; Thu, 11 May 2023 14:56:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3078aa0b152so4379921f8f.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 11:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683831381; x=1686423381;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8vwtXQ5gBpUONrunUg4j5p/OghzliAA+tlPR192AjGA=;
 b=MO1k5RXZLVmIwJRNfI+3pcdAlSyBvwRQxJVYbBSn0KGar9865ubFq0+LxKa4jj7zpt
 PnlrtZA1CLnd6hpm8TD8WwT8k6tMq/SxgGMmQaYwganrJpmPoVYcq5MeAfAtTbJKX7BZ
 REdD4iIPm+maNJexuzLE4YZeXgtD3f3V3to60tnePobnM9aXS+Bbm9u2vf23PSVBCy6L
 zlau7UMVgVUNQciuDCqzT0UuEWydQS6HjdLa4mcVbc4BhmiSB/d/CINC5kQYGMisfzvr
 Q9cgCuwcAduSMhzEb3TpjUXKB3P/0gLyWFOQxPbjZkdtx9wsAaSY6lo8mKSC3+iFfbmL
 MABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683831381; x=1686423381;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8vwtXQ5gBpUONrunUg4j5p/OghzliAA+tlPR192AjGA=;
 b=QUj/gsGQip+0o5ZQChpNaHD6ucGj6ZqTdpzeWehYsde7fhQd6aZXMRc9xBif9kRvXT
 SMnARdu4/q90RwErbVAHFuR2OL0DadBVI4ES2jZ1Fr7dqW7ktB4z3vyNviRo/YCyW7NX
 puulEkFnqg3rcxq5gd5BvDja9UvfAIi4gK9wuKGQ7N0v9OcCXBxHtNWosuk2Cd72242n
 UPWxru69ZJjXdJ4u84RZR+jo0B2qtk/ZPiUmp0Z+7yzchxpyZWSUQiCJz6RNFqxvKYt8
 TjvfvkRFhWs1tfyWedQuUY4oxLbnzRSg75IDrEH3tQrEMEfOKg09KTpLiLZBx9M8NeHc
 5MCQ==
X-Gm-Message-State: AC+VfDyi6stIql0wK4jr9p2CVBeKepoxeGP+IvFYlRq/8bzJEwiDucl7
 tCin9RW4m2Yqw7gXiWeIX6OgsQ==
X-Google-Smtp-Source: ACHHUZ6SNWRNgkyR5zACqHPKVXwV2Llg+lriHcqzaR4CJJz4fFicYApKSzAHgj4ddMkDw1fRtfv4+A==
X-Received: by 2002:a5d:40cd:0:b0:2fb:aa2f:3e50 with SMTP id
 b13-20020a5d40cd000000b002fbaa2f3e50mr15890128wrq.59.1683831381668; 
 Thu, 11 May 2023 11:56:21 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a5d4104000000b00304832cd960sm21075253wrp.10.2023.05.11.11.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 11:56:21 -0700 (PDT)
Message-ID: <da6c03af-fb68-4d30-5a9d-42b86c9b102d@linaro.org>
Date: Thu, 11 May 2023 20:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/5] migration: Teach dirtyrate about
 qemu_target_page_size()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Leonardo Bras <leobras@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Andrei Gudkov <gudkov.andrei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
References: <20230511141208.17779-1-quintela@redhat.com>
 <20230511141208.17779-4-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230511141208.17779-4-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 11/5/23 16:12, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/dirtyrate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 38ea95af59..6706e3fe66 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -314,10 +314,10 @@ static void update_dirtyrate(uint64_t msec)
>   static uint32_t get_ramblock_vfn_hash(struct RamblockDirtyInfo *info,
>                                         uint64_t vfn)
>   {
> +    int page_size = qemu_target_page_size();

size_t? Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       uint32_t crc;
>   
> -    crc = crc32(0, (info->ramblock_addr +
> -                vfn * TARGET_PAGE_SIZE), TARGET_PAGE_SIZE);
> +    crc = crc32(0, info->ramblock_addr + vfn * page_size, page_size);
>   
>       trace_get_ramblock_vfn_hash(info->idstr, vfn, crc);
>       return crc;


