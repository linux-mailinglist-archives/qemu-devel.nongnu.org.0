Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52DE3E22F9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 07:40:45 +0200 (CEST)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBsb6-0006pm-RQ
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 01:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBsZu-00063H-HM
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBsZt-0002mv-3b
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628228368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OjQYVpBHNRFuaoIwKUe//A534R5DlbTVEgVWmu1JQA=;
 b=X2Clf1rxP9Z5oJhDUvhjk0VArhUzcU9xwk9fJyuCwnyHUXuzaudaSOcDLj4mEV2jcnHDRv
 4II3ukh/b9E18G1OJUEKQgjCIyRbB92ZDH31hX3a9pSHvV/mRMvSTlqMWgE/SXHTL7iIRl
 jpY02pYwFUTqAEZe0TSXWMXbxBNgfbw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189--_ceLAtSNqm6lRPG8z5T5g-1; Fri, 06 Aug 2021 01:39:26 -0400
X-MC-Unique: -_ceLAtSNqm6lRPG8z5T5g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k13-20020a05600c1c8db029025018ac4f7dso2080386wms.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 22:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/OjQYVpBHNRFuaoIwKUe//A534R5DlbTVEgVWmu1JQA=;
 b=rvAN5Bj3yM9xoKBZI+7UCX2acBnwZSEt3AcFlcKHopy0I7nVfCILF0TvJO9/izOG0r
 NQ4UVEETTN2yvWPpmQSpwXi0hR2pGPTn1Onk0OEw562301f0K8nxK4b8fWTrpVLkD2hP
 jkGRLM5r0XGWHYruH0TICTfP9HK7AuSUA6zCQaiooKhGbnljm9hZVybJ+Dm09qErbyvW
 2CvnYC/gXw6g6RSA/Pa8vGtZqM0vdpRtmP3qP2hxmh/JshRYhDbwzzkerok/cKrwlJji
 eImJqhXESWz11aPheEpcvg1LAAXio8ZwuvfQGTh3CGybkYPG8XZiz2VwJnyXMUs3/HW2
 fCuw==
X-Gm-Message-State: AOAM531uJdycOokW9YPWEYlqbV5iCYWHQ/VCVaDCpIgFjxAP4BDj3TyR
 EMjgVBCNFtpWnPiPGoY7qSH32jYOznX7IzFQFlrEB+lpURtAWTgXDj9fUGzIUGj7SC9nHPElu8+
 slN3tDfoX2kmR/Lg=
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr8640937wre.403.1628228365631; 
 Thu, 05 Aug 2021 22:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLLM/KewxYxjqkvQf2OiENV3+ut0gmB4E2lhEJFf7ELwtMEop9/+y9zOTgJMm8f+at0t/F+w==
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr8640919wre.403.1628228365419; 
 Thu, 05 Aug 2021 22:39:25 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id l5sm9597152wrc.90.2021.08.05.22.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 22:39:24 -0700 (PDT)
Subject: Re: [PATCH v1 01/12] s390x/tcg: wrap address for RRBE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-2-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e81f83f4-f283-d103-24fd-71090c2315dc@redhat.com>
Date: Fri, 6 Aug 2021 07:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Let's wrap the address just like for SSKE and ISKE.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/tcg/mem_helper.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 21a4de4067..e0befd0f03 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -2223,11 +2223,12 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
>   uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
>   {
>       MachineState *ms = MACHINE(qdev_get_machine());
> +    uint64_t addr = wrap_address(env, r2);
>       static S390SKeysState *ss;
>       static S390SKeysClass *skeyclass;
>       uint8_t re, key;
>   
> -    if (r2 > ms->ram_size) {
> +    if (addr > ms->ram_size) {
>           return 0;
>       }
>   
> @@ -2236,14 +2237,14 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
>           skeyclass = S390_SKEYS_GET_CLASS(ss);
>       }
>   
> -    if (skeyclass->get_skeys(ss, r2 / TARGET_PAGE_SIZE, 1, &key)) {
> +    if (skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key)) {
>           return 0;
>       }
>   
>       re = key & (SK_R | SK_C);
>       key &= ~SK_R;
>   
> -    if (skeyclass->set_skeys(ss, r2 / TARGET_PAGE_SIZE, 1, &key)) {
> +    if (skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key)) {
>           return 0;
>       }

That's certainly the right thing to do!

Reviewed-by: Thomas Huth <thuth@redhat.com>


