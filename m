Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BDC55BB28
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:38:31 +0200 (CEST)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rks-0008Ky-MB
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o5ra4-0003Rw-61
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o5ra0-0003n2-4A
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656347234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpNUbvUuLGXgcvaQ4NF2y3L+LPZEUEHC4LqEAjaRmDc=;
 b=NYxAp/yzxwqSZwHIc1LjRIpAdlYQVximS7/FM3QPseLOWqW0FJYkIh7q5oY/53lETdjCmX
 Y8SpNiU65AdjM9RwGyWxvDo5BP6i9yi7V8H5uc5X8VdtheAlAAKO6KLnbUomWnTbU4ieMx
 iHDgAe8D25APAbIkmQilMyJCb/ZFAh0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-83jUE8UvOxagFD5v4A1tMQ-1; Mon, 27 Jun 2022 12:27:13 -0400
X-MC-Unique: 83jUE8UvOxagFD5v4A1tMQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h125-20020a1c2183000000b003a03a8475c6so3283717wmh.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 09:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xpNUbvUuLGXgcvaQ4NF2y3L+LPZEUEHC4LqEAjaRmDc=;
 b=5oEPJ7WtDjaMTg39U37UNi9QnvbcmbZnT+/Sc3RCl9rva3CBUshSD4jdReWaei2lZ4
 lB/TduptS0iaMFVHL1tdQvPPSYFHKcPrDznkUGyLoWAWhV/eaGJP6jB5EdwnrIzT73gW
 WN3NqjU7KTpdchBO7AbxuzvtqK1oTUS1HHbgT8o2Wfuo640fTwKgGJKY11mrYhhkQm4l
 hQ5LWElJ1E1DtVKC8UgiQ2UNPwQ6MBFL2DU5dj+iMFN1b43GrOe9CKVo9Fl+vFcKq5uR
 MNL2TNcSpPiziR+n+J0U+MPQXIjctwd/EtX2P8hzpBF88kesXaq+bsVsyQuPELKoCm1/
 LhbQ==
X-Gm-Message-State: AJIora/VKZ/82fO+w59k1VVfIeMvVx+dW1zkWqqIHGqvyXJCYHWk/UPq
 V1io2vkVzgryAHyUvd53GBkdP0Yfv/13tNwnmCmZPiW375kd1OTcUEbrA4Eff7BPFUy4lU2aizb
 tTvJUHqmRW7SMpvE=
X-Received: by 2002:a5d:584c:0:b0:21c:1395:f0c4 with SMTP id
 i12-20020a5d584c000000b0021c1395f0c4mr5665767wrf.24.1656347232246; 
 Mon, 27 Jun 2022 09:27:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1soGSIUvxyLTx6eBFcueiS49CyP0YyZ8hdsPol4CoB837fAB8rp8SDgsR+VsvDMgzvZgfZIKA==
X-Received: by 2002:a5d:584c:0:b0:21c:1395:f0c4 with SMTP id
 i12-20020a5d584c000000b0021c1395f0c4mr5665752wrf.24.1656347231936; 
 Mon, 27 Jun 2022 09:27:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:d100:dd9:b2f7:f126:11c2?
 (p200300cbc708d1000dd9b2f7f12611c2.dip0.t-ipconnect.de.
 [2003:cb:c708:d100:dd9:b2f7:f126:11c2])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a05600c4e5100b003a04e900552sm1665497wmq.1.2022.06.27.09.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 09:27:11 -0700 (PDT)
Message-ID: <bb5c26f1-5b78-8abe-48ba-72cb78597d05@redhat.com>
Date: Mon, 27 Jun 2022 18:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] target/s390x/tcg: SPX: check validity of new prefix
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20220627131251.2832076-1-scgl@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220627131251.2832076-1-scgl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.06.22 15:12, Janis Schoetterl-Glausch wrote:
> According to the architecture, SET PREFIX must try to access the new
> prefix area and recognize an addressing exception if the area is not
> accessible.
> For qemu this check prevents a crash in cpu_map_lowcore after an
> inaccessible prefix area has been set.

I don't think that's possible. Our memory increments are 1 MiB and one
would have to cross a 1~MiB range with the second page to trigger that.
IIRC that's impossible with SPX address alignment requirements?


> 
> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
> 
> 
> Is there a stricter check to see if the memory is accessible?
> 
> 
>  target/s390x/tcg/misc_helper.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
> index aab9c47747..c8447b36fc 100644
> --- a/target/s390x/tcg/misc_helper.c
> +++ b/target/s390x/tcg/misc_helper.c
> @@ -158,6 +158,10 @@ void HELPER(spx)(CPUS390XState *env, uint64_t a1)
>      if (prefix == old_prefix) {
>          return;
>      }
> +    if (!mmu_absolute_addr_valid(prefix, true) ||
> +        !mmu_absolute_addr_valid(prefix + TARGET_PAGE_SIZE, true)) {
> +        tcg_s390_program_interrupt(env, PGM_ADDRESSING, GETPC());
> +    }
>  
>      env->psa = prefix;
>      HELPER_LOG("prefix: %#x\n", prefix);
> 
> base-commit: 3a821c52e1a30ecd9a436f2c67cc66b5628c829f


-- 
Thanks,

David / dhildenb


