Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B748C80E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:17:54 +0100 (CET)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gJs-0002gv-U1
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7foO-0000xe-QL
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:45:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7foK-0005wA-R9
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642002315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TdxdNclfeaKpiAKBHKFQ313w39WGGsyWhXmNBtcek/k=;
 b=VFvmzRF64qi/rWz34CZaWAUuSYSnOvQ600M8hE4RxvHAtE24NEURzl6XXYjPyl2n93OU/J
 gMD/+UxR9jb62w7MvrNyLP+u/GetKjYd5QOlGsrHJr5003ZQCK/ZYx/8Vgj4nZqk1rd8+b
 qy5S9PBlL4e94v/wfIry5CaJIDO144g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-v6FZF4qbNP246LBUn302GQ-1; Wed, 12 Jan 2022 10:45:14 -0500
X-MC-Unique: v6FZF4qbNP246LBUn302GQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c8-20020a05640227c800b003fdc1684cdeso2621115ede.12
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=TdxdNclfeaKpiAKBHKFQ313w39WGGsyWhXmNBtcek/k=;
 b=rt3cQLpIv1ySqbPPOXyX5r55wrM6o+ZfCgg4pBs/JiJr8hMpdLv7FRYAxOQLHy6VMQ
 /Gn0eBzXZbX421pxPYyvfGUTWVgiqwH8CZt5tB1+37UcvpnB8EB3Iz7icQWaxeoevcJF
 UEtNSBPbAb6M3t2zw5Yco8+sRtIC2a92h9fVDxxvzdX8Kz9mLQvJP1pJJiFylH1ocGEt
 qHjBFuClyFOXY1rGM0/EyhUjbbK7TG5Qq9KLEwFPe3MMBl7A6OVpmbaGlnV2FcQgKZJL
 b0OQc5909oC1ytKRdgyiSE+/i8B3TROLqC3gP1bmCuGKHrb2TLZP0eGLsD45ObGeGNgv
 fAXw==
X-Gm-Message-State: AOAM530xgzsnvPrfAU1no/FRk5/w9GLT+H9h+mR0VFFXyGZKKaGo0H0D
 uibv1nd48IKDwWJs4zorm5NNN+dSqw6EIfVSuqDk96mGQf0WkPsIiilnG7yFhOCOfGA8PmnZZnE
 ALUQmim/0DqSt+wE=
X-Received: by 2002:a17:907:d11:: with SMTP id
 gn17mr269754ejc.252.1642002313199; 
 Wed, 12 Jan 2022 07:45:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIX+FeQuLSxd+cTzgHpWYHz51Q6TsXMp7jpuK4TlbffxJ9vgOcj9DEF9NCEAU1TRN3qFQG+Q==
X-Received: by 2002:a17:907:d11:: with SMTP id
 gn17mr269740ejc.252.1642002312982; 
 Wed, 12 Jan 2022 07:45:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id w17sm64925edr.68.2022.01.12.07.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 07:45:12 -0800 (PST)
Message-ID: <c9544f5c-545a-8edf-dac6-a960aa00d4dd@redhat.com>
Date: Wed, 12 Jan 2022 16:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
 <20220112043948.224405-4-iii@linux.ibm.com>
 <08948b31-0729-5463-829f-35fb444cf82d@redhat.com>
 <add9d2da455bf9b07cf77c942e95183f5bf6f090.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 3/5] target/s390x: Fix cc_calc_sla_64() missing
 overflows
In-Reply-To: <add9d2da455bf9b07cf77c942e95183f5bf6f090.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> If the sign is false, the shifted bits (mask) have to be 0.
>> If the sign bit is true, the shifted bits (mask) have to be set.
> 
> IIUC this logic handles sign bit + "shift - 1" bits. So if the last
> shifted bit is different, the overflow is not detected.

Ah, right, because of the - 1ULL ...

[...]

>> This looks like some black magic :)
> 
> Yeah, I felt this way too, but didn't come up with anything better and
> just left a comment warning not to simplify.
> 

I wonder if all we want is

const uint64_t sign = 1ULL << 63;
uint64_t mask = (-1ULL << (63 - shift)) & ~sign;

For shift =
*  0: 0000000...0b
*  1: 0100000...0b
*  2: 0110000...0b
* 63: 0111111...1b

Seems to survive your tests.

-- 
Thanks,

David / dhildenb


