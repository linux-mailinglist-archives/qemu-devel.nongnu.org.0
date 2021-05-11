Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49FA37A452
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:09:08 +0200 (CEST)
Received: from localhost ([::1]:36112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPK7-0000fL-Un
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPHF-0006Im-OP
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPHE-0006mD-5B
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620727567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTQHwOFlyLThQvdEnOPF84qcaC7Lsgin1JOwxI9S2PQ=;
 b=H1EF0pKAIMMDgdCbI2peO3cfD2G98iOvLoV5XMlYFbHZaqlFZAIp1hAhWWnL6SCcEka/a6
 QmyWmiPEyc1BGlEh9NUaHUyZcgv0CX7H79JnlYzmcPxn1NftdqbhuE6T9SYX+YrQMcH7C/
 GLAvMuT78RKDFitSx8U0aKg/KEB+Aao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-NmgrRBu4PeqMqdAh4pfkHQ-1; Tue, 11 May 2021 06:06:05 -0400
X-MC-Unique: NmgrRBu4PeqMqdAh4pfkHQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r10-20020a05600c2c4ab029014b601975e1so573572wmg.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QTQHwOFlyLThQvdEnOPF84qcaC7Lsgin1JOwxI9S2PQ=;
 b=jWSxdGSfU2iX7Q+UGEFuaYIcIkaUSukuH7yP5OemLkUEmE2CxsGKWUW0S7hl+aPinS
 XCOlaZ0N1mRDZ5gv1E99JlJdOuCNXdMzrIozYkNAnLv+YMEPKP0QV8BwfMG/jaq2qf9Q
 +e2K3mCXzbulSMUeKPulUZDBDUuomzDR/vxVCtaQaOQp4oEb65YsrcnBsEKyqCLJv5Qn
 iBCJJ5i3JoTqebG1J92zpCy76cOuPrjpoi8CA/OU2Ngq9zaqWJtFE1LGxAGCWYJ9mYVe
 wv6t1qnVHCD7T86hf6CmPLiXbUWO71+C+4zsyFvxWCg9Uzp/b8DxtgVlIi5wtIrIRpDF
 iYQQ==
X-Gm-Message-State: AOAM530NLR0+VHMd0JJjW2CWY/BlNl2WVdmb+jmf97Gmr8l6rKv4Jw8T
 98n3L4muPpfyuoFlN7JNKNH26rBwrZmqfTk05V/y2KTd3GhrQxX5Ob9xYo74bbflC5ba2dciPXi
 ce+7ogIoMg06Jfik=
X-Received: by 2002:a05:600c:2315:: with SMTP id
 21mr31320327wmo.39.1620727564505; 
 Tue, 11 May 2021 03:06:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9I86NGijLjoBVT62wLFCPaSep3T3ghFiWiZUUSKrYm+dpALhh72NdnVkh0PWg1RygFPPiEg==
X-Received: by 2002:a05:600c:2315:: with SMTP id
 21mr31320311wmo.39.1620727564334; 
 Tue, 11 May 2021 03:06:04 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 m7sm26523477wrv.35.2021.05.11.03.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 03:06:04 -0700 (PDT)
Subject: Re: [PATCH 08/72] softfloat: Use float_raise in more places
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-9-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e55aaa9e-c528-0996-17b4-04817e07729a@redhat.com>
Date: Tue, 11 May 2021 12:06:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-9-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.05.21 03:46, Richard Henderson wrote:
> We have been somewhat inconsistent about when to use
> float_raise and when to or in the bit by hand.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 87 +++++++++++++++++++++++++------------------------
>   1 file changed, 44 insertions(+), 43 deletions(-)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


