Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D3F517352
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 17:54:25 +0200 (CEST)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlYNT-0001VK-WB
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 11:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nlYM7-0000PY-6S
 for qemu-devel@nongnu.org; Mon, 02 May 2022 11:52:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nlYM4-0004oN-6b
 for qemu-devel@nongnu.org; Mon, 02 May 2022 11:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651506774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOYfFzIEKyoY0iUE0GWz+GyP/ZtaVRJEmDfjXWbrhms=;
 b=dBHZ0I5GqIt4NBBh+IRS8sZ2dicHTYe/PE1srrVY9vbPAF0bOehkaLSADrvA1apCBcPuxm
 iev3EiCL0VZKXoWroCZ5giuAkbLq8nnyZtXGw2UKpVnQcniAdJ7BJ+Ekzt0dyqDkFKeh7z
 IRCVbhXGloTIWKF0tCodJvC1WGJ54t0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-bMcNTkaQOy-nJxi5I_jEBQ-1; Mon, 02 May 2022 11:52:53 -0400
X-MC-Unique: bMcNTkaQOy-nJxi5I_jEBQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 l5-20020a170902ec0500b0015cf1cfa4eeso6709180pld.17
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 08:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qOYfFzIEKyoY0iUE0GWz+GyP/ZtaVRJEmDfjXWbrhms=;
 b=D9AsYYN8o/F6ZnABKRnG/58JvLSZSlCJMiRSGn2BbMtW9U0A2tECKk2HzAiqns5kt5
 6MqVX91CmbsBr5DOrpsaQGm3SjO+QkBGeBXoKYNeTj1z0CpsAGeTblmOLMsskgVi52iK
 NiElqRVOXZszJAdu1QGVtpr7iJHbPRMHCzxEaN9Fh1iE5vM5NsJzYK5KVvRYEUHJxCGO
 X0ED+G/kg98Y6brF0ylQ2f51rqTQbNoixHhyQOV1AOWN4TD02U0ixDybPMLpHufTonvn
 4jTPRREAdssL1B+PvHSOqFe62YUcKYpQEpmxR7XKBh7Xe9gHI/EJjJrgrYSEoy6Ff4WB
 RidQ==
X-Gm-Message-State: AOAM533jjS/L9KLd7wPtYIzdVdb1mI8yo9tz+2EI3ymyUqXBy3kJLDQM
 /orZVNj98firuxYdGAA2c7DxDGoMjZXe2oyP4X/INRCOJkCHvbOPKDGTAFHXkDvrgzxb3nL4VK2
 A5pQAOobpA1LyKMk=
X-Received: by 2002:a17:90b:17c3:b0:1dc:3f12:1dbc with SMTP id
 me3-20020a17090b17c300b001dc3f121dbcmr10125026pjb.169.1651506772471; 
 Mon, 02 May 2022 08:52:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0s1I508nMt14lp8PcE/KIHe58cQmNyD/SPqWyzsBph663JzmCPtCu7xNuM9HZJBFhEWmEWQ==
X-Received: by 2002:a17:90b:17c3:b0:1dc:3f12:1dbc with SMTP id
 me3-20020a17090b17c300b001dc3f121dbcmr10124994pjb.169.1651506772169; 
 Mon, 02 May 2022 08:52:52 -0700 (PDT)
Received: from [10.10.69.234] ([8.34.116.185])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dd5ad0f8dsm4072174pfo.76.2022.05.02.08.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 08:52:51 -0700 (PDT)
Message-ID: <85dffe1d-a6d2-9e93-749b-29febb0b6dc5@redhat.com>
Date: Mon, 2 May 2022 17:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 00/13] s390x/tcg: Implement Vector-Enhancements
 Facility 2
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 David Miller <dmiller423@gmail.com>
References: <20220428094708.84835-1-david@redhat.com>
 <97f9be15-4ccd-505b-a35e-8d95823df03a@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <97f9be15-4ccd-505b-a35e-8d95823df03a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.05.22 09:20, Thomas Huth wrote:
> On 28/04/2022 11.46, David Hildenbrand wrote:
>> Implement Vector-Enhancements Facility 2 for s390x
>>
>> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
>>
>> implements:
>>      VECTOR LOAD ELEMENTS REVERSED               (VLER)
>>      VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
>>      VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
>>      VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
>>      VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
>>      VECTOR STORE ELEMENTS REVERSED              (VSTER)
>>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
>>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
>>      VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
>>      VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
>>      VECTOR STRING SEARCH                        (VSTRS)
>>
>>      modifies:
>>      VECTOR FP CONVERT FROM FIXED                (VCFPS)
>>      VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
>>      VECTOR FP CONVERT TO FIXED                  (VCSFP)
>>      VECTOR FP CONVERT TO LOGICAL                (VCLFP)
>>      VECTOR SHIFT LEFT                           (VSL)
>>      VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
>>      VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
> 
> Thanks, queued to my s390x-next branch now:
> 
>   https://gitlab.com/thuth/qemu/-/commits/s390x-next/
>
Thanks for fixing up. At this point I would have suggested to exclude
the tests for now.

-- 
Thanks,

David / dhildenb


