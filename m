Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FA73E1A76
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:35:12 +0200 (CEST)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBhGx-0001VC-8W
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBhFv-0000Px-R8
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBhFt-0000e2-4v
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628184844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0kisS5DDkzp5/B45BHdX5fmNUZs0nCqoDZkGflhwIA=;
 b=Ec0h0pdHqHpZjQhwPnB8ftH0NfP5H7CbxxldCRVxwgVmZ4yT0p0RGR67prLoljg+5od+cq
 M4V/jmX+aH15UsCnDbV7A6eaFdby2hxNRD5Q5wFVTZmN6iSTSOw3mXoxIFb98T+l3crA6Q
 uvTsEzBGyhaHgG3f/vAvtRNMaq9sw/Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251--EA5LxSLORqcZAKk9mzo5A-1; Thu, 05 Aug 2021 13:34:00 -0400
X-MC-Unique: -EA5LxSLORqcZAKk9mzo5A-1
Received: by mail-wr1-f71.google.com with SMTP id
 w1-20020adf8bc10000b0290154bed98988so885557wra.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 10:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Q0kisS5DDkzp5/B45BHdX5fmNUZs0nCqoDZkGflhwIA=;
 b=nAY+aVtRCazOh0qleYBgp1iXmeGVVTGfUeTdn3keRdCUBW18Dbrh05uYEjCuRTgFcp
 mMdJEAj7ST4n4jvqo38cigteIhf+gfjdaRVHrFgO6XEhIdN3cXHMjpTxCdIRvqn5TcW/
 y9cOUNyW/vKL4oUysFhM5ZqNeT3+vF2Xn/wqls/wVfArPu9toB85g4b5T+ZrPw6QRJk5
 4M9W5CABaMm3HCvf3CdOKp95DOfpX3+bVU0Ygci5hff5ib/RxmyHopcFBILABp+9W4f9
 PDPopa0+d8hHN07VoKtQwwqKGp9vzQ/JRjzxJKUsO6tKrt+NB8I5/9Dr3/BA3RZ7xtG5
 kE9w==
X-Gm-Message-State: AOAM530AccNgFsfVBfdP6atcUGDpv60uHftZGVoqm1DkPXx8KK6T9eDx
 wRu20JFwPXAV+jTyRE9EDLHWaRVYYETJMo8MScluK10692OfWlTpDr15BHGw5oFUwRpDVzvmbDO
 tnkPpX/B0by6EcNw=
X-Received: by 2002:a1c:9d4a:: with SMTP id g71mr6149349wme.116.1628184839745; 
 Thu, 05 Aug 2021 10:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEBXc9JfPNZ4xwS1vkRD+sWc+UlUehPdxGSmZqmbq4k6bwW8pEHfwGxEENuZ05NohWc9dGRA==
X-Received: by 2002:a1c:9d4a:: with SMTP id g71mr6149329wme.116.1628184839574; 
 Thu, 05 Aug 2021 10:33:59 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c630b.dip0.t-ipconnect.de. [91.12.99.11])
 by smtp.gmail.com with ESMTPSA id
 w1sm9589626wmc.19.2021.08.05.10.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 10:33:59 -0700 (PDT)
Subject: Re: [PATCH v1 04/12] s390x/tcg: check for addressing exceptions for
 for RRBE, SSKE and ISKE
To: qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-5-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5d6e4ef6-ef73-ddaf-3fec-0a750468fc38@redhat.com>
Date: Thu, 5 Aug 2021 19:33:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-5-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>   void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
>   {
> -    MachineState *ms = MACHINE(qdev_get_machine());
>       static S390SKeysState *ss;
>       static S390SKeysClass *skeyclass;
>       uint64_t addr = wrap_address(env, r2);
>       uint8_t key;
> +    int rc;
>   
>       addr = mmu_real2abs(env, addr);
> -    if (addr > ms->ram_size) {
> -        return;
> +    if (!mmu_absolute_addr_valid(addr, false)) {
> +        trigger_pgm_exception(env, PGM_ADDRESSING);
>       }
>   
>       if (unlikely(!ss)) {
> @@ -2213,7 +2216,11 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
>       }
>   
>       key = r1 & 0xfe;
> -    skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
> +    rc = skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
> +    if (rc) {
> +        trace_set_skeys_nonzero(rc);
> +        return 0;

^ this has to go.


-- 
Thanks,

David / dhildenb


