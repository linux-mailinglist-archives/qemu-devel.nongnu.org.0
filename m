Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3E13E2607
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 10:25:51 +0200 (CEST)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBvAs-0005GI-2d
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 04:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBv9b-0003ZD-1s
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:24:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBv9W-0002E2-Kn
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628238266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3qiuznrgZDwt71VahG9N+jE/zwOQlSH3AzkndOJp9c=;
 b=MzQInfkdoZCvKHoEW24b2bKkNx1bvuRszK+dsWwwRx0jCX1nihlaQGJeejXkMNc+Xj1Phg
 KlfFGOm6PcNoLU2+RGUE86bEwf1EUpAveRZfgM1g+JL28ymsp1d78lEZDLlyQEUrZoQyFf
 86px1TMS7dzqHJtzalNW0qwXqel6sqE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-hF2U1qR7O-ST97Rw3eGUuA-1; Fri, 06 Aug 2021 04:24:24 -0400
X-MC-Unique: hF2U1qR7O-ST97Rw3eGUuA-1
Received: by mail-wm1-f69.google.com with SMTP id
 132-20020a1c018a0000b029025005348905so2197234wmb.7
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 01:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y3qiuznrgZDwt71VahG9N+jE/zwOQlSH3AzkndOJp9c=;
 b=sFKWT4viknowrkqtgIXBdHNLesWR0UTMjCoPqRpnttRVb5RIV89P0RxNR6/LdzKP7+
 zA3nRtsCFZXaZVAbLei7ZXbINm6Uk4l2wzrn1OGHkggR+/UjYeUrI3Jbvsw/KFbzF/Ai
 +F93nUH7fO3IM9swBN7VDiuJR80p1HZBepvE0umvSy9gZriYyrv02ePLany3GkRVZiPU
 UkmXApk+MFuBNajDqjTwIWS5JfkeT8Asre6HdIGiCPg1fdfQa7iRaMEVplZh3azqjqpR
 tP/iVmIgZfrWad230XPr2QwscO4s3anGCXxKz4J6gxf2sXHp2j1gZBdZKjeEoejb4fg5
 780w==
X-Gm-Message-State: AOAM533b4/e5mnQiZn5CqFN4FPSq0GqY4NEj3qEcEZZLvG7a85Zz45lh
 GnHps1calaKEtoDabU+hxX+uaEhfcO0+S8gRobH8NHUV01QDJ+M3G40Q3EZl3+xYHrr9x0+T0gk
 aTjjFGoOrw+y8BJY=
X-Received: by 2002:a1c:7dd1:: with SMTP id y200mr1988230wmc.83.1628238263790; 
 Fri, 06 Aug 2021 01:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJV4D4QEe/BZTcrthdSrck8tgQTNuxLT4qtHT5iMe6frxl4iCk0syVbdWbYjGgXee+05C+tA==
X-Received: by 2002:a1c:7dd1:: with SMTP id y200mr1988209wmc.83.1628238263510; 
 Fri, 06 Aug 2021 01:24:23 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id t15sm8365269wrw.48.2021.08.06.01.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:24:23 -0700 (PDT)
Subject: Re: [PATCH v1 08/12] s390x/mmu_helper: avoid setting the storage key
 if nothing changed
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-9-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cbe8d0d1-f77d-f500-ff83-b4937adc26f0@redhat.com>
Date: Fri, 6 Aug 2021 10:24:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-9-david@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 05/08/2021 17.28, David Hildenbrand wrote:
> Avoid setting the key if nothing changed.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/mmu_helper.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
> index 36ab4e9c81..0c2c39a970 100644
> --- a/target/s390x/mmu_helper.c
> +++ b/target/s390x/mmu_helper.c
> @@ -301,7 +301,7 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
>   {
>       static S390SKeysClass *skeyclass;
>       static S390SKeysState *ss;
> -    uint8_t key;
> +    uint8_t key, old_key;
>       int rc;
>   
>       /*
> @@ -337,6 +337,7 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
>           trace_get_skeys_nonzero(rc);
>           return;
>       }
> +    old_key = key;
>   
>       switch (rw) {
>       case MMU_DATA_LOAD:
> @@ -360,9 +361,11 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
>       /* Any store/fetch sets the reference bit */
>       key |= SK_R;
>   
> -    rc = skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
> -    if (rc) {
> -        trace_set_skeys_nonzero(rc);
> +    if (key != old_key) {
> +        rc = skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
> +        if (rc) {
> +            trace_set_skeys_nonzero(rc);
> +        }
>       }
>   }
>   
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


