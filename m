Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543963E2387
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:51:42 +0200 (CEST)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBthl-0006tN-Df
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBtgV-000625-8v
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBtgS-00059L-Rw
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628232620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dwh3X9hudVU6TnJR79BFNStZyVnDhAjh9esje1W4ocw=;
 b=a7lQzArFNUyosSHkUdJrpr5CoiSqFWUK2PG/x4j4Nt6aiYNlYpoGJGCheGdQom0UcicuTP
 nUnvWKfhsAUVUWZta3brcK+ZQBZwchMzIZppL5BbgWW5jwyF1ZXUuYaz6TKRfR6sdzYcXG
 T4bBlJtI4RJNGRmwol0cl3H7FEdF+Ng=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-S8usAxRhN-aVxaVw9r5Yyg-1; Fri, 06 Aug 2021 02:50:18 -0400
X-MC-Unique: S8usAxRhN-aVxaVw9r5Yyg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so3548789wml.5
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 23:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dwh3X9hudVU6TnJR79BFNStZyVnDhAjh9esje1W4ocw=;
 b=HYhEwWV2WdGXY1u2jLhfy84vjwQHyTvq9eCO40vdln58KQ2L5bj1DpWK+TdwA4W4jV
 I8Xq+yO0qmqGMtmEV/Dmsb1I9kzXJ11jBDIfHicE8YQoeKu8yTnCV7u4lSSNmCGIBtGd
 h5II63v+KF+XHZDWQlGL9tXmbJ+rCsfBuuuXGsVZ8fk6vXGwFhSv6MTwnH+FBTj3dckr
 Vhb0F0CeuuC3g1kVfswGtvbUrg7pJrdLoY+jLvwif7egkofsBuE4uOmu1BzqTVOR+x4m
 38rEDibXOdA8ibz+GBvd3BHRPTWLUyqIDzoOGgBVNfhhA9iEaI5MnjOW09bZ9HW6E9Bf
 r6HQ==
X-Gm-Message-State: AOAM530wmR4VcrJkU+4LGL611RxYvOS6KaIzI4POHzr9W8Qbd+c3nS5l
 eItBTpZ1nbJCDPi8T1Ji5TpLoKkziK4ZkkAXuO3ZAuevyTaRvZkgR3KR+RQIUP1Eg9jkmJJDI8h
 enBHbGk74LW62/I0=
X-Received: by 2002:a05:600c:2244:: with SMTP id
 a4mr13892733wmm.175.1628232617332; 
 Thu, 05 Aug 2021 23:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM67PhXKOfdDBJW7nySKtIPWqluy84DkhmGnV1lex68uV0wRlKh8+SYdGGkZxWouTQE4V/sw==
X-Received: by 2002:a05:600c:2244:: with SMTP id
 a4mr13892711wmm.175.1628232617142; 
 Thu, 05 Aug 2021 23:50:17 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id n186sm13123451wme.40.2021.08.05.23.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 23:50:16 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-4-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 03/12] s390x/tcg: convert real to absolute address for
 RRBE, SSKE and ISKE
Message-ID: <33c1f057-fd79-d15f-e8d5-2d261fbd1255@redhat.com>
Date: Fri, 6 Aug 2021 08:50:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 17.27, David Hildenbrand wrote:
> For RRBE, SSKE, and ISKE, we're dealing with real addresses, so we have to
> convert to an absolute address first.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/tcg/mem_helper.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 3c0820dd74..dd506d8d17 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -2177,6 +2177,7 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
>       uint64_t addr = wrap_address(env, r2);
>       uint8_t key;
>   
> +    addr = mmu_real2abs(env, addr);

Ack.

>       if (addr > ms->ram_size) {
>           return 0;
>       }
> @@ -2201,6 +2202,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
>       uint64_t addr = wrap_address(env, r2);
>       uint8_t key;
>   
> +    addr = mmu_real2abs(env, addr);

According to the PoP:

"When the enhanced-DAT facility 1 is not installed, or
  when the facility is installed but the multiple-block
  control is zero, general register R 2 contains a real
  address. When the enhanced-DAT facility 1 is
  installed and the multiple-block control is one, gen-
  eral register R 2 contains an absolute address."

Don't we have to take that into consideration here, too?

>       if (addr > ms->ram_size) {
>           return;
>       }
> @@ -2228,6 +2230,7 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
>       static S390SKeysClass *skeyclass;
>       uint8_t re, key;
>   
> +    addr = mmu_real2abs(env, addr);
>       if (addr > ms->ram_size) {
>           return 0;
>       }

Ack for rrbe.

  Thomas



