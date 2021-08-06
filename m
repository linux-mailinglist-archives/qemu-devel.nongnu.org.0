Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AB83E2430
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:33:58 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBuMf-000853-Ce
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBuLZ-00073p-Pm
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBuLY-0008Na-CQ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628235167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKd2Kox4c8vbFsaeJdA49twpf4BNzMGjLVo/+5u5Cxo=;
 b=h9xWv7EpH2AtdHGiqxs6HrFPiIkDNvSpA3kfbfwNkTLuNhmqkNcdkWtNF0vQvZqjJcC7VB
 b4mn1Q/eIyhoXUFkirw4CWDy4Xa0gtLVqdYB2LpBtLJFc/nXCSb5X7yZd9/JN2507obA0W
 J8f+tMq6BuPwVwuSHTpnJvKTpG6KwME=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-2I6ZWRfcMyyQ5udfajEYUw-1; Fri, 06 Aug 2021 03:32:46 -0400
X-MC-Unique: 2I6ZWRfcMyyQ5udfajEYUw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j16-20020a5d44900000b02901549fdfd4fcso2870506wrq.6
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CKd2Kox4c8vbFsaeJdA49twpf4BNzMGjLVo/+5u5Cxo=;
 b=S6Fz2WzVnd4HkJYbZfZRt3lIMzeLh7KeZtW0f8v/CcuWQ7jtETDG8FoQpeaPJaELkP
 wJOZ8LkiVzfvsIJEV71Mcoo2yzprg8n5Id9bnqsOVpRwX+Lopy8wYzbdRJXjCJo5rqsV
 Me+StRsUAN2gA6RxfWYaDPdKhHFOxrGVdxI+n//HUX0Jsc1IV+SaHSukXsWFQbSqBsH7
 nI3Xr6QkM/sYwEn3I9jljznadH0Yu0TOOvCV8ZsR3oSYegaCx0bwCu7sfhPw+LkA4AMj
 sBdsr/pu52igjHJDQrRcMuIldaARwlusHhA0gwQimv66t2es9ZpjFiL/1Kd+1MnzaeU8
 NnFA==
X-Gm-Message-State: AOAM533/oa6qItMHsEmoiax/EsNElhwhwzEA2EQKG+1ZBpCVS1uVNISc
 MIy4LHHpsfZt6hDc5nv1/sH44z/RQkWtrJPf/F5+myl7HB41L1UNpBPJZIOnu1O5PSGhBezfa0a
 +qm597cDSmGMaO0s=
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr1746007wmh.56.1628235165398;
 Fri, 06 Aug 2021 00:32:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUOCF4z7kj0HwvBQCBxAuWurd30g0FKpyye7/QUdUEnG4RxQ6tBZpzVFyT/vC7iAbuLoy9WQ==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr1745985wmh.56.1628235165233;
 Fri, 06 Aug 2021 00:32:45 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id o34sm11054109wms.10.2021.08.06.00.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 00:32:44 -0700 (PDT)
Subject: Re: [PATCH v1 06/12] s390x/mmu_helper: fixup mmu_translate()
 documentation
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-7-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b8422a0d-0e85-fd78-7a26-a11ee5cc5885@redhat.com>
Date: Fri, 6 Aug 2021 09:32:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-7-david@redhat.com>
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
> Looks like we forgot to adjust documentation of one parameter.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/mmu_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
> index 167f1b1455..ca25dadb5b 100644
> --- a/target/s390x/mmu_helper.c
> +++ b/target/s390x/mmu_helper.c
> @@ -374,7 +374,8 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
>    * @param asc    address space control (one of the PSW_ASC_* modes)
>    * @param raddr  the translated address is stored to this pointer
>    * @param flags  the PAGE_READ/WRITE/EXEC flags are stored to this pointer
> - * @param exc    true = inject a program check if a fault occurred
> + * @param tec    the translation exception code if stored to this pointer if
> + *               there is an exception to raise
>    * @return       0 = success, != 0, the exception to raise
>    */
>   int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


